-- ============================================================
-- BCHH-C Question Bank — Seed Data: Papers 1-6 (audited + corrected)
-- Regenerated after the CMS ICD-10-CM cross-reference audit fixed all
-- real errors found in the original human-sourced content (18 code-level
-- fixes, 4 new distractor options, 8 expanded explanations, 2 leftover
-- self-correction notes removed, 2 truncated explanations completed).
-- Paper-level IDs/slugs/metadata unchanged from the original seed.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper 1: BCHH-C Practice Paper 1 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 'bchhc-practice-1', 'BCHH-C Practice Paper 1', 'bchhc', ARRAY['General', 'OASIS', 'ICD-10-CM']::TEXT[], 100, 'standard', true, 1);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b752f6ad-ce7f-4023-b833-86932937f31d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 1, 'An 81-year-old female is referred by her physician to home health SLP and OT for treatment of mild cognitive impairment which she has had since a stroke a year ago. She is diagnosed with vascular dementia due to stroke.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8c65bd5-3f1e-4cc4-9788-3db8987e1d76', 'b752f6ad-ce7f-4023-b833-86932937f31d', 0, 'G31.84, I69.318, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85143e26-c908-4e22-a9e1-778962265e64', 'b752f6ad-ce7f-4023-b833-86932937f31d', 1, 'G31.84, I69.398, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01537966-581d-4704-a8ce-8ac63b058dd3', 'b752f6ad-ce7f-4023-b833-86932937f31d', 2, 'I69.398, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4becc93a-e67b-4ad4-a415-1f0398081d7b', 'b752f6ad-ce7f-4023-b833-86932937f31d', 3, 'I69.318, F01.50');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b752f6ad-ce7f-4023-b833-86932937f31d', '4becc93a-e67b-4ad4-a415-1f0398081d7b', 'F01.50 (vascular dementia w/o behavioral disturbance) requires “code first” the causal cerebrovascular sequela. Since the only late effect documented is the cognitive deficit (not hemiplegia, aphasia, etc.), I69.318 (cognitive deficits following cerebral infarction) is the specific code – not I69.398 (other/nonspecific late effects). G31.84 (mild cognitive impairment) is not added because I69.318+F01.50 already fully captures the cognitive late effect; adding G31.84 would be redundant coding of the same clinical fact.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('90885477-ab7e-4614-8d32-20b0b4939b86', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 2, 'A patient was recently admitted to the hospital due to a combination of aspiration pneumonitis and MSSA pneumonia. The patient is now being sent home on antibiotics for continued management of the pneumonia. The patient’s past medical history includes left lung cancer, dysphagia, and diabetes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('467f429a-84ae-45ad-996b-79b47853e897', '90885477-ab7e-4614-8d32-20b0b4939b86', 0, 'J15.211, C34.92, R13.10, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('974cf825-627e-41f6-9711-75a9ddbca347', '90885477-ab7e-4614-8d32-20b0b4939b86', 1, 'J69.0, J15.211, C34.92, R13.10, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('628f8b38-23a4-4777-9bed-02ae00edbed7', '90885477-ab7e-4614-8d32-20b0b4939b86', 2, 'J69.0, C34.92, R13.10, E11.9, Z87.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb2b2e07-208f-4d8b-8d2a-f09dfc8008d0', '90885477-ab7e-4614-8d32-20b0b4939b86', 3, 'J69.0, J44.0, C34.92, R13.10, E11.9, Z87.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('90885477-ab7e-4614-8d32-20b0b4939b86', '974cf825-627e-41f6-9711-75a9ddbca347', 'Two distinct pulmonary diagnoses are documented – aspiration pneumonitis (J69.0) and MSSA pneumonia (J15.211) – both must be coded since neither subsumes the other. Dysphagia (R13.10) is coded as the mechanism behind the aspiration. The other answer choices either drop J69.0 entirely (incomplete) or add unsupported codes (J44.0/COPD and Z87.01/nicotine history are not documented anywhere in the stem).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('09a5480c-30ee-4319-9a7f-73bf946d82f7', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 3, 'Mr. Donald is a former smoker admitted to home care for management of anemia due to malignant cancer of the hilus of the left lung. The patient’s comorbid conditions include COPD, emphysema, and pneumonia over 2 years ago.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59bb7763-8ed8-4838-ac12-96ef6ec36517', '09a5480c-30ee-4319-9a7f-73bf946d82f7', 0, 'C34.02, D63.0, J44.9, Z87.891, Z87.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21375744-51c6-4946-8198-b1fb3206ff24', '09a5480c-30ee-4319-9a7f-73bf946d82f7', 1, 'C34.02, D63.0, J43.9, Z87.891, Z87.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da9e59cf-1eaf-4d32-8578-aeeae59c85c6', '09a5480c-30ee-4319-9a7f-73bf946d82f7', 2, 'D63.0, C34.92, J44.9, J43.9, Z87.891, Z87.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e31f3f0-20ce-4217-8259-d06edc13096c', '09a5480c-30ee-4319-9a7f-73bf946d82f7', 3, 'C34.92, D63.0, J44.9, Z87.891, Z87.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('09a5480c-30ee-4319-9a7f-73bf946d82f7', '21375744-51c6-4946-8198-b1fb3206ff24', '“Hilus of the lung” maps to the main bronchus, so C34.02 (malignant neoplasm, left main bronchus) is more precise than the unspecified C34.92. D63.0 (anemia in neoplastic disease) carries a “code first the neoplasm” instruction, so it must follow C34.02. When “COPD” and “emphysema” are both mentioned as the same underlying process, only one code is used (J43.9) rather than double-coding J44.9 + J43.9. Former smoker → Z87.891; resolved pneumonia → Z87.01 (personal history of pneumonia).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c924151a-8600-488a-b1dd-2b87a348a703', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 4, 'The clinician describes a primary intention healing surgical wound with no sign of infection. The wound is described as “edges approximated” with a small amount of drainage. The physician documentation also indicates a well-healing surgical site with no post-operative complications. In the OASIS assessment, the surgical wound items were answered as M1340 Response 1: Yes, patient has at least one observable surgical wound. Based on this information, as the coder you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f8bc04b-3c80-435d-82f3-9a8822148584', 'c924151a-8600-488a-b1dd-2b87a348a703', 0, 'Code aftercare following surgery');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e5ff7b7-a692-4405-bcdc-b0edcd8967cc', 'c924151a-8600-488a-b1dd-2b87a348a703', 1, 'Request MD confirmation that an infection is present');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0008b80-610f-431b-a20b-20abcef69e76', 'c924151a-8600-488a-b1dd-2b87a348a703', 2, 'Request clinician confirmation of non-healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0809b92-6d84-4111-a297-7d24d65a8464', 'c924151a-8600-488a-b1dd-2b87a348a703', 3, 'Code non-healing surgical wound as primary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c924151a-8600-488a-b1dd-2b87a348a703', '6f8bc04b-3c80-435d-82f3-9a8822148584', 'Physician documentation is unambiguous – well healing, edges approximated, no infection, no complication. With nothing suggesting non-healing, the coder codes routine aftercare (Z48.8xx/Z48.3 etc. per site) rather than manufacturing a complication that isn’t documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('04e71658-1c9b-4003-ad2d-3a3bbd2748b9', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 5, 'Mrs. Lang was riding down an escalator in a casino. Unfortunately, an intoxicated person pushed her and she fell down the entire flight. The physician documentation states there is a traumatic fracture of the right greater trochanter. The patient was treated conservatively and transferred to a rehab facility for 2 weeks. The medical record also contains physician documentation of HTN, Afib, osteoporosis, and situational depression due to the recent loss of her husband. SN is ordered for medication management and PT for difficulty walking. Select the correct coding sequence for M1021 and M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fba5cc3-fe9b-4007-9ea3-cc2c65c6f637', '04e71658-1c9b-4003-ad2d-3a3bbd2748b9', 0, 'M80.051, I10, I48.91, F43.21, W10.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69e24953-d638-4df9-9f77-4e81af468b1e', '04e71658-1c9b-4003-ad2d-3a3bbd2748b9', 1, 'S72.111D, R26.2, I10, I48.91, F32.9, W10.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ad1d204-2241-4864-95e8-d3df99b14ef2', '04e71658-1c9b-4003-ad2d-3a3bbd2748b9', 2, 'M80.051, R26.2, I10, I48.91, F32.9, W10.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6cbf094e-5e4d-4a4c-ba3a-6fb7fd79e570', '04e71658-1c9b-4003-ad2d-3a3bbd2748b9', 3, 'S72.111D, I10, I48.91, M81.0, F43.21, W10.0XXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('04e71658-1c9b-4003-ad2d-3a3bbd2748b9', '6cbf094e-5e4d-4a4c-ba3a-6fb7fd79e570', 'The mechanism is traumatic (pushed/fell), so this is a true traumatic fracture (S72.111-) not a pathologic fracture (M80.05-), even though osteoporosis coexists – osteoporosis is coded separately as M81.0 (comorbidity, no pathologic fracture). “Subsequent encounter” (D) applies because she’s already transferred to rehab for routine healing care. Grief-triggered depressed mood shortly after a spousal loss is an adjustment disorder (F43.21), not major depressive disorder (F32.9). W10.0XXD captures the escalator fall, subsequent encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 6, 'The physician orders SN and PT for a patient being discharged home with multiple healing fractures. The physician-ordered SOC date is Jan 14. For compliance with Medicare CoPs, the visits must be made in the following order:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd3c4edf-b81a-44df-8b78-0fd0150c2866', 'ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', 0, 'Either the SN or the PT must visit on Jan 14, but the SN must do the OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('611c2499-8a41-457c-a24c-e622dbd49b43', 'ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', 1, 'Either the PT or SN may do the OASIS, but the SN must do the first visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('87addda5-d38c-42d2-bfdf-4e7e0adc3b07', 'ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', 2, 'The SN must do the first visit and the OASIS assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78ee8bf0-e1f0-4898-8dfc-9b19c97edf01', 'ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', 3, 'The PT may do the first visit on Jan 14 and the OASIS assessment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff4d854a-3f5e-40ec-8470-0bd86ed8c43d', '87addda5-d38c-42d2-bfdf-4e7e0adc3b07', 'Note: the original exam key marked “Either the SN or the PT must visit on Jan 14 but the SN must do the OASIS” — this appears mismarked. ⚠ Likely mismarked. Per 42 CFR 484.55(a)(2)-(3), a registered nurse must conduct the initial (comprehensive) assessment visit whenever skilled nursing is one of the ordered disciplines – only when therapy is the sole ordered discipline may a therapist perform the initial visit. Since SN is ordered here (along with PT), the RN must make the first visit and complete the OASIS; therapy cannot go first and “hand off” the OASIS to nursing later. This matches the guidance you’d already captured in your notes (“SN should perform the OASIS as the 1st visit”).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84611084-f1b0-4f73-83a2-93f8398b8862', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 7, 'Mr. Johnson is diagnosed with liver cirrhosis and hepatitis due to his long history of alcohol dependence, which is a current problem for him. He has also developed ascites due to this condition. SN will focus on the cirrhosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('279d05ef-b04e-4095-bf1e-1b3b05067a2a', '84611084-f1b0-4f73-83a2-93f8398b8862', 0, 'K70.11, K70.31, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa11dd13-0981-47ab-b1ae-1f3438fa150c', '84611084-f1b0-4f73-83a2-93f8398b8862', 1, 'K70.31, K70.11, F10.288');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72022cc5-8d3b-46a9-9b24-3b85e58a6298', '84611084-f1b0-4f73-83a2-93f8398b8862', 2, 'K70.31, F10.288');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e727deb1-74e2-43b9-8a49-7fd1a15b36e5', '84611084-f1b0-4f73-83a2-93f8398b8862', 3, 'F10.288, K70.31, K70.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('84611084-f1b0-4f73-83a2-93f8398b8862', '279d05ef-b04e-4095-bf1e-1b3b05067a2a', 'Both alcoholic hepatitis (K70.11, with ascites) and alcoholic cirrhosis (K70.31, with ascites) are separately documented, so both are coded; F10.20 (alcohol dependence, uncomplicated) is added last since there’s no separately-documented alcohol-induced disorder beyond the liver disease already captured by the K70 codes (ruling out F10.288). Note: one could argue K70.31 should lead since “SN will focus on cirrhosis,” but this exact vignette/answer pattern is consistent with the accepted key.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('25edea29-b57f-4316-8763-5354ca96a762', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 8, 'A patient was admitted to the hospital for left hip pain status post ground-level fall. The patient has a PMH of right hip arthroscopy, osteoporosis, repeated falls, and rheumatoid arthritis. The physician confirmed via X-ray that there is no fracture, just acute pain from the fall. Home health PT is ordered for left hip pain and walking difficulty.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8df920fc-473b-4ad5-af67-7f58bd13295f', '25edea29-b57f-4316-8763-5354ca96a762', 0, 'G89.11, M25.552, R26.2, R29.6, M81.0, M06.9, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('23f33b2c-0f8e-4c3b-96ac-28c0151ff438', '25edea29-b57f-4316-8763-5354ca96a762', 1, 'M25.552, R26.2, G89.11, M81.0, M06.9, Z91.81, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fab33c0-2827-4d10-abdf-9069696eb053', '25edea29-b57f-4316-8763-5354ca96a762', 2, 'G89.11, M25.552, R26.2, M81.0, M06.9, Z91.81, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4091651-6cf9-40f8-ae6c-391adb51875a', '25edea29-b57f-4316-8763-5354ca96a762', 3, 'M25.552, R26.81, G89.11, R29.6, M81.0, M06.9, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('25edea29-b57f-4316-8763-5354ca96a762', '8df920fc-473b-4ad5-af67-7f58bd13295f', 'G89.11 (acute pain due to trauma) is appropriate since the fall/trauma – not a fracture – is the confirmed cause of pain. M25.552 adds site specificity (left hip). R26.2 (difficulty walking) matches the PT order for “walking difficulty” more precisely than R26.81 (unsteadiness). Right hip arthroscopy (a scope procedure, not a prosthesis) does not support a Z96.641 (artificial joint) code, ruling out the options that include it.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48a100bc-401f-4217-8bd1-86a77aa1feb1', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 9, 'A 70-year-old lady was admitted to the hospital with pain in her right hip. Following investigation she was found to have loosening of her right total hip replacement. She underwent revision of her total hip. She has a PMH of diabetic peripheral neuropathy and is at high risk for falls. She is receiving PT in home care due to unsteady gait from the above conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2938ddee-cb74-4ab4-9619-d25273f616d9', '48a100bc-401f-4217-8bd1-86a77aa1feb1', 0, 'R26.81, Z47.1, T84.030D, E11.42, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('501a2fc5-8c02-4ce0-a7e6-a696cc4bc8fb', '48a100bc-401f-4217-8bd1-86a77aa1feb1', 1, 'T84.032, E11.42, R26.81, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32e55804-7e45-4f56-b813-5f28f9738e83', '48a100bc-401f-4217-8bd1-86a77aa1feb1', 2, 'T84.030D, E11.42, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('840bee51-08a6-4a0b-b7a0-0cc3646ab393', '48a100bc-401f-4217-8bd1-86a77aa1feb1', 3, 'Z47.1, R26.81, E11.42, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('48a100bc-401f-4217-8bd1-86a77aa1feb1', '32e55804-7e45-4f56-b813-5f28f9738e83', 'T84.030D (mechanical loosening of internal prosthetic hip joint, subsequent encounter) is the reason for care – the revision has already occurred, so the complication code stays with a “D” 7th character; a general aftercare code (Z47.1) is not needed on top of an active complication code. E11.42 = diabetic polyneuropathy; Z91.81 = history of falling.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1580b06a-54f5-4d23-bf09-6a93a13bf641', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 10, 'The patient is a 67-year-old hypertensive man with COPD, DM, and CKD stage 3a. He recently became a widower and lives alone. According to the patient’s caregiver, the patient is depressed, irritable, and anxious and exhibits extreme loss of interest in daily activities. The physician has made a diagnosis of dysthymia. A home health psych nurse is ordered to assess his compliance with a newly prescribed antidepressant and to assess the patient’s psychological status and coping skills.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c4b0f60-f318-41a1-9bc3-b622428ca6d0', '1580b06a-54f5-4d23-bf09-6a93a13bf641', 0, 'F34.1, J44.9, E11.22, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4f15c0c-0768-4b41-a982-b50fae32dc83', '1580b06a-54f5-4d23-bf09-6a93a13bf641', 1, 'F34.1, F34.9, F41.9, J44.9, E11.22, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12b20517-beed-42e4-af50-a715fd081b8d', '1580b06a-54f5-4d23-bf09-6a93a13bf641', 2, 'F41.8, F34.1, J44.9, E11.22, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c567fcd2-aab7-4065-b9e1-e30d9dee76fa', '1580b06a-54f5-4d23-bf09-6a93a13bf641', 3, 'F34.1, F41.8, J44.9, E11.9, I12.9, N18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1580b06a-54f5-4d23-bf09-6a93a13bf641', '5c4b0f60-f318-41a1-9bc3-b622428ca6d0', 'Code exactly what the physician diagnosed – dysthymia (F34.1) – rather than adding a separate anxiety code (F41.x) that was never actually diagnosed, only described as symptoms. HTN+CKD stage 3a is the combination code I12.9 with N18.31 appended for the specific documented stage — N18.3 alone is a non-billable parent, and N18.9 (unspecified) would under-code the documented stage-3a specificity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d7d7923d-e465-4394-a3f6-fbdd8115a9cd', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 11, 'Which one of the following is correct when coding a recertification assessment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b147b736-138b-47e4-8a3b-a97c04662bf8', 'd7d7923d-e465-4394-a3f6-fbdd8115a9cd', 0, 'An OASIS performed after the 5-day recert window cannot be processed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ebe4d1c-5f77-4ca4-8218-67632f8d8b15', 'd7d7923d-e465-4394-a3f6-fbdd8115a9cd', 1, 'The coding should remain the same as in the SOC OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79293f7d-3b13-43e4-8bef-08eef24751a0', 'd7d7923d-e465-4394-a3f6-fbdd8115a9cd', 2, 'The assessment must be completed by the SN if SN is ordered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('204900f0-2e17-40f7-a21d-076444f0f7b5', 'd7d7923d-e465-4394-a3f6-fbdd8115a9cd', 3, 'An OASIS performed before the 5-day recert window cannot be processed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d7d7923d-e465-4394-a3f6-fbdd8115a9cd', '79293f7d-3b13-43e4-8bef-08eef24751a0', 'Consistent with the CoP rule discussed in Q6 – whenever SN is an ordered discipline, the RN must complete the (re)certification comprehensive assessment; this doesn’t change at recert vs. SOC.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d128d681-bc17-46b2-be31-1e87b95e7c9f', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 12, '79-year-old Mr. Johns was admitted to the hospital with a diagnosis of hypoxia. The patient has prostate cancer and was recently treated with chemotherapy. PT and OT are ordered for decreased endurance, unsteady gait, and poor activity tolerance due to COPD and chronic respiratory failure with hypoxia. The patient also has HTN, CHF, and a history of right-sided hemiplegia due to CVA.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15520801-bc2d-485a-bae6-11824471a88b', 'd128d681-bc17-46b2-be31-1e87b95e7c9f', 0, 'I69.351, J44.9, J96.10, I11.0, I50.9, C61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2432f887-a9a6-4725-abaf-a2be05934e93', 'd128d681-bc17-46b2-be31-1e87b95e7c9f', 1, 'J44.9, J96.10, C61, I69.351, I11.0, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6608ede9-ab21-497e-a738-761dd751e02d', 'd128d681-bc17-46b2-be31-1e87b95e7c9f', 2, 'J44.9, J96.11, C61, I69.351, I11.0, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e8b7478-4f1a-40b0-92fa-b35e56757f63', 'd128d681-bc17-46b2-be31-1e87b95e7c9f', 3, 'I69.351, J44.9, J96.11, I11.0, I50.9, C61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d128d681-bc17-46b2-be31-1e87b95e7c9f', '6608ede9-ab21-497e-a738-761dd751e02d', 'J96.11 (chronic respiratory failure WITH hypoxia) is the specific code matching the stated hypoxia, not J96.10 (unspecified). I11.0 (hypertensive heart disease with heart failure) + I50.9 correctly combine the documented HTN and CHF. I69.351 = hemiplegia following cerebral infarction, dominant side (default assumption when laterality/dominance isn’t otherwise specified).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cf574960-9b9c-4a2f-926e-1ad87b060498', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 13, 'This 60-year-old man tripped and fell, suffering a contusion of the forehead and a laceration of the forehead requiring suturing. The patient was also suffering from a concussion due to the fall. The patient was referred to home care to dress the wound and monitor his neurological status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df68935d-5aee-4d53-8b28-0a0953e79f0b', 'cf574960-9b9c-4a2f-926e-1ad87b060498', 0, 'S01.82XD, S00.83XD, S06.0X1D, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9eb950cc-4d6b-43f9-bf3e-31dc41f03415', 'cf574960-9b9c-4a2f-926e-1ad87b060498', 1, 'S01.81XD, S00.83XD, S06.0X9D, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae9b0319-9306-4d10-9bf7-f121835ab667', 'cf574960-9b9c-4a2f-926e-1ad87b060498', 2, 'S01.81XA, S06.0X0A, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf192f88-5519-471a-a8fc-e6518c93baa7', 'cf574960-9b9c-4a2f-926e-1ad87b060498', 3, 'S01.81XD, S06.0X9D, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cf574960-9b9c-4a2f-926e-1ad87b060498', 'bf192f88-5519-471a-a8fc-e6518c93baa7', 'Laceration (S01.81-) and concussion, LOC unspecified (S06.0X9) both use the “D” 7th character since this is ongoing/subsequent care, not the initial ER encounter. The superficial forehead contusion is not separately coded since the more definitive laceration at the same site takes priority. Z91.81 = history of falling.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8271d22e-4934-49f9-bc58-3deb2440f3aa', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 14, 'Mr. Rodman was involved in a crash when his car was T-boned at a junction by an uninsured driver. He was wearing his seatbelt and sustained contusions on the front left chest wall from the seatbelt, as well as a partial traumatic amputation of his left thumb from his shattered windscreen. He was taken to the hospital by ambulance where he received wound care and packed red blood cells for acute blood loss anemia. Unfortunately, the lower part of the thumb could not be reattached. He is admitted to home care for wound dressing to the site of the traumatic amputation and for assessment of the contusions. He has also been prescribed iron supplements in the short term for the anemia. He has a diagnosis of COPD and his respiratory status will also be assessed.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53ff526b-20fc-418c-8121-f643a71c8743', '8271d22e-4934-49f9-bc58-3deb2440f3aa', 0, 'S68.022D, S20.20XD, D50.0, J44.9, Z89.012');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4a50eff-92d2-491f-8436-ac96963ca35a', '8271d22e-4934-49f9-bc58-3deb2440f3aa', 1, 'Z47.81, D50.0, J44.9, Z89.012');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0601536e-c202-4d70-a173-6cce04798c19', '8271d22e-4934-49f9-bc58-3deb2440f3aa', 2, 'S68.022D, S20.212D, D50.0, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb82a26e-9a29-4821-8b28-0d5031d9bb31', '8271d22e-4934-49f9-bc58-3deb2440f3aa', 3, 'S68.012D, S20.212D, D50.0, J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8271d22e-4934-49f9-bc58-3deb2440f3aa', '0601536e-c202-4d70-a173-6cce04798c19', 'S68.022D = partial traumatic amputation, left thumb, subsequent; S20.212D = contusion of left front chest wall, subsequent. Note: strictly, “acute” blood-loss anemia maps most precisely to D62 (acute posthemorrhagic anemia) in the ICD-10-CM Index, while D50.0 is technically the chronic iron-deficiency-from-blood-loss code – this is a recognized gray area in these exam banks, but D50.0 is the code consistently used across this exam series, so it’s likely the intended answer here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75385adc-f115-463e-9414-1f01c01250ce', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 15, 'Mr. Hart is admitted for wound care following an inpatient stay for MSSA infection and dehiscence of his right below-knee amputation stump. He received five days of IV antibiotics in the hospital and was discharged home with a five-day course of oral antibiotics. Skilled nursing is ordered for wound care. Select the correct coding for M1021 and M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a11c76a5-ef49-43f2-b130-9855f7375c7d', '75385adc-f115-463e-9414-1f01c01250ce', 0, 'T87.81, T87.43, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee1ad4c3-9b6f-4ed4-9274-58bc0843fbe7', '75385adc-f115-463e-9414-1f01c01250ce', 1, 'T87.81, B95.61, T87.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13e72061-ba9d-4890-804a-2582f82e66c7', '75385adc-f115-463e-9414-1f01c01250ce', 2, 'Z48.3, Z48.01, Z79.2, Z89.611');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a2f5068-8967-4477-859b-5ac00670a4eb', '75385adc-f115-463e-9414-1f01c01250ce', 3, 'T87.43, B95.61, T87.81, Z89.611');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75385adc-f115-463e-9414-1f01c01250ce', 'a11c76a5-ef49-43f2-b130-9855f7375c7d', 'T87.81 = dehiscence of amputation stump; T87.43 = infection of right lower-extremity amputation stump; B95.61 = MSSA as the causal organism (“use additional code” convention). This matches the identical pattern used elsewhere in your own notes for this scenario.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5aa29016-4bd2-49f9-900f-4c43113d2d76', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 16, 'Mr. Thompson is admitted to home care after hospitalization for abscess and cellulitis of his right external ear caused by MRSA. He is taking clindamycin, and at SOC the nurse identifies a raised rash over the patient’s trunk, back, and extremities. On report, the physician diagnoses the rash as due to clindamycin.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4d30ccb-d025-41cf-b25c-063a9415612f', '5aa29016-4bd2-49f9-900f-4c43113d2d76', 0, 'H60.01, H60.11, B95.61, L27.0, T36.8X1D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7024fe4-9234-4e86-9435-f82d1baaccb1', '5aa29016-4bd2-49f9-900f-4c43113d2d76', 1, 'H60.01, H60.11, B95.62, L27.1, T36.8X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60adba97-d6c7-4a50-bbf5-36a2181171b8', '5aa29016-4bd2-49f9-900f-4c43113d2d76', 2, 'H60.01, H60.11, B95.62, L27.0, T36.8X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6614b723-442c-4a2e-a053-f9358507d6e9', '5aa29016-4bd2-49f9-900f-4c43113d2d76', 3, 'H60.01, H60.11, B95.61, L27.1, T36.8X1D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5aa29016-4bd2-49f9-900f-4c43113d2d76', '60adba97-d6c7-4a50-bbf5-36a2181171b8', 'L27.0 = generalized skin eruption due to a drug taken internally; T36.8X5- = adverse effect (not poisoning – the drug was properly prescribed and taken as directed, it just caused an unwanted reaction), 6th character “5” for adverse effect and “D” for subsequent encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9aa6748-6a9a-4747-b4e0-b03455f6a151', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 17, 'A 50-year-old man with a known history of varicose veins of the bilateral legs with ulcers is admitted to home care for dressing of four wounds on the bilateral legs. On assessment, the patient is noted to have two ulcers on the right heel with depth noted to breakdown of skin. The left leg has two ulcers on the calf — one with breakdown of skin and the other down to bone with signs of necrosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69bc3e3a-101c-4986-ac7f-c133ee1a5232', 'd9aa6748-6a9a-4747-b4e0-b03455f6a151', 0, 'I83.002, L97.826, L97.821, L89.612');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('380b87b9-f446-4cd7-afb8-090455d1c45e', 'd9aa6748-6a9a-4747-b4e0-b03455f6a151', 1, 'I83.022, L97.224, I83.014, L97.411');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('890e923d-e6d6-4ec0-8309-484f66793c1b', 'd9aa6748-6a9a-4747-b4e0-b03455f6a151', 2, 'I83.222, L97.224, I83.214, L97.411');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0197cab-486a-4407-91c0-db466451e3f0', 'd9aa6748-6a9a-4747-b4e0-b03455f6a151', 3, 'I83.022, L97.224, L97.221, I83.014, L97.411');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d9aa6748-6a9a-4747-b4e0-b03455f6a151', 'f0197cab-486a-4407-91c0-db466451e3f0', 'Each leg gets its own I83.0- varicose-ulcer code paired with the corresponding L97.- site/severity code: right leg ulcers at the heel/foot (I83.02-, L97.4-) and left calf ulcers with one reaching bone/necrosis (L97.224) and one limited to skin breakdown (L97.221), left leg varicose code I83.014. This matches the answer set already validated in your handwritten notes for the identical scenario.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1738295b-b510-4b45-8023-5d7cb1374bc1', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 18, 'An 82-year-old male who is a previous smoker was sent home following hospitalization for exacerbation of COPD and CHF. The patient has a significant health history of asthma, HTN, chronic diastolic CHF, and DVT in the right LE 4 years ago, on anticoagulants.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75a3de7e-d04c-4514-8006-476fec8ac5fd', '1738295b-b510-4b45-8023-5d7cb1374bc1', 0, 'J44.9, I11.9, I50.9, F17.210, I82.402, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a5cf840-0b51-4280-b2b4-41cd83fce13d', '1738295b-b510-4b45-8023-5d7cb1374bc1', 1, 'J44.1, J45.909, I11.0, I50.22, Z87.891, Z86.718, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f288d046-e9a2-4cfd-8aa9-d7f47db6a466', '1738295b-b510-4b45-8023-5d7cb1374bc1', 2, 'J44.9, J45.909, I11.0, I50.32, F17.210, Z86.718, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c309173a-9aea-4a70-9e63-101ad21a30b3', '1738295b-b510-4b45-8023-5d7cb1374bc1', 3, 'J44.1, I11.0, I50.32, Z87.891, Z86.718, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1738295b-b510-4b45-8023-5d7cb1374bc1', 'c309173a-9aea-4a70-9e63-101ad21a30b3', 'J44.1 (COPD with acute exacerbation) is used instead of unspecified J44.9 because the stem explicitly says “exacerbation of COPD.” I11.0+I50.32 combines documented HTN and chronic diastolic heart failure. Z86.718 (history of other venous thrombosis/embolism) + Z79.01 (long-term anticoagulant use) captures the old DVT. Note: the asthma history isn’t separately coded here (J45.909 was left out) – reasonable since it’s background history rather than an active condition driving this admission, but some coders would still list it; that’s the one soft spot in this answer.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('531d6e1a-2293-451c-ad50-83da2103edc1', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 19, 'Which coding guideline is incorrect when assigning codes for Human Immunodeficiency Virus (HIV)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43f236e2-d60f-47c0-ba79-5cc7f3ee736d', '531d6e1a-2293-451c-ad50-83da2103edc1', 0, 'If a patient is admitted for an HIV-related diagnosis, code B20 should be primary followed by additional codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1705f167-c475-476e-a089-625e74ef546d', '531d6e1a-2293-451c-ad50-83da2103edc1', 1, 'Inconclusive serological evidence of HIV can be coded as an additional code when coding B20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21fa7a39-43b2-4322-a183-4b2333149150', '531d6e1a-2293-451c-ad50-83da2103edc1', 2, 'A patient previously diagnosed with any HIV illness should never be assigned to Z21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12f5bae7-c8bf-428b-a80d-b0c30d7d8133', '531d6e1a-2293-451c-ad50-83da2103edc1', 3, 'HIV complicating pregnancy, childbirth, and the puerperium should always be coded prior to B20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('531d6e1a-2293-451c-ad50-83da2103edc1', '1705f167-c475-476e-a089-625e74ef546d', 'This is the false statement, correctly identified. Once a confirmed HIV diagnosis (B20) is being coded, you would not simultaneously code “inconclusive” serology (R75) – that code exists specifically for cases where HIV status is NOT yet confirmed. The other three statements (B20 primacy when admitted for an HIV-related condition, never reverting a symptomatic patient to Z21, and sequencing B20 before pregnancy complication codes) are accurate guidelines.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78718f90-86ba-4bb2-8996-b76d521e6cbc', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 20, 'A patient was admitted to home health following hospitalization due to subendocardial infarction of the anterior wall. Past medical history states CAD requiring CABG x3, PVD, HTN, HLD, chronic diastolic heart failure, CKD stage 2, COPD with emphysema, and NSTEMI two weeks ago. He has been a smoker for 50 years but no alcohol or drug use. What is the correct sequence for home health?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3655fe2c-c477-46be-baf5-4ce755298669', '78718f90-86ba-4bb2-8996-b76d521e6cbc', 0, 'I21.4, I13.0, I50.32, N18.2, I25.10, J43.9, I73.9, E78.5, F17.210, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('afcd6be6-09f2-4c61-b1d7-e9a9c1835b39', '78718f90-86ba-4bb2-8996-b76d521e6cbc', 1, 'I25.10, I13.0, I50.32, N18.2, I21.4, I25.1, J43.9, I73.9, E78.5, F17.210, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec5e5c61-bf7c-43ec-b7df-7f41ccc7cd5b', '78718f90-86ba-4bb2-8996-b76d521e6cbc', 2, 'I22.2, I21.4, I25.10, I13.0, I50.32, N18.2, J43.9, I73.9, E78.5, F17.210, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4db0f7e-31fb-4e28-b9f3-25caa4789300', '78718f90-86ba-4bb2-8996-b76d521e6cbc', 3, 'I22.2, I25.10, J43.9, I73.9, I13.0, I50.32, N18.2, I25.2, E78.5, F17.210, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('78718f90-86ba-4bb2-8996-b76d521e6cbc', 'ec5e5c61-bf7c-43ec-b7df-7f41ccc7cd5b', 'Read as two distinct NSTEMI events within the 4-week MI window – the “2 weeks ago” event (I21.4, still an active MI within the guideline’s 4-week timeframe) and the current subsequent MI prompting this admission (I22.2, subsequent NSTEMI). I13.0 combines HTN+CKD+heart failure; N18.2 specifies CKD stage 2; Z95.1 documents the CABG history.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41a224e8-20e1-4d36-a781-3a28772b4cb5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 21, 'A 60-year-old woman who had an incisional hernia repair was readmitted one week later with a wound that was red, inflamed, and slightly open. During the hospital stay she was diagnosed with a postoperative wound infection with sepsis and dehiscence of the wound. Wound and blood cultures confirmed a Streptococcus group B infection. She is admitted to home care for wound dressing and IV antibiotic therapy.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c832b9ff-bcff-4a23-8dfb-170b82eab243', '41a224e8-20e1-4d36-a781-3a28772b4cb5', 0, 'A40.1, T81.41XA, T81.31XA, B95.1, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e7dc9dbe-3d56-4b5a-a990-3777af2b5ada', '41a224e8-20e1-4d36-a781-3a28772b4cb5', 1, 'T81.44XA, A40.1, T81.41XA, T81.31XD, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('661b5daa-ce58-44ec-bd5c-2e51a5e4ec75', '41a224e8-20e1-4d36-a781-3a28772b4cb5', 2, 'A40.1, Z48.815, B95.1, Z45.2, Z79.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c622e0c0-681b-4a56-bfea-036563332b45', '41a224e8-20e1-4d36-a781-3a28772b4cb5', 3, 'T81.44XA, T81.41XA, B95.1, T81.38XD, Z45.2, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('41a224e8-20e1-4d36-a781-3a28772b4cb5', 'e7dc9dbe-3d56-4b5a-a990-3777af2b5ada', 'A40.1 = sepsis due to group B streptococcus (specific organism identified on culture, so code the specific type, not unspecified sepsis). T81.4- covers the post-op infection and T81.41XA covers infection following the specific hernia-repair procedure, while T81.31XD (disruption of wound, subsequent) captures the dehiscence discovered at readmission.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cb19f498-99c6-462f-be0e-2d00406262c5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 22, 'Mr. Belvedere was admitted to home care for wound care due to excoriation of the skin around his gastrostomy site. Skilled nursing is also providing teaching related to his diabetes and insulin use.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94f3f450-654b-4142-8c80-0ca3c03c051b', 'cb19f498-99c6-462f-be0e-2d00406262c5', 0, 'K94.29, E11.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb1f960d-ab31-440b-a69d-6a3de247be1a', 'cb19f498-99c6-462f-be0e-2d00406262c5', 1, 'K94.29, Z43.1, E11.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e897a40-57ea-42f6-a3ec-3c57b8f7655a', 'cb19f498-99c6-462f-be0e-2d00406262c5', 2, 'Z43.1, E11.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e65ca9e-1d32-42ef-83d3-74eb7451ee3d', 'cb19f498-99c6-462f-be0e-2d00406262c5', 3, 'K94.22, E11.9, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cb19f498-99c6-462f-be0e-2d00406262c5', '94f3f450-654b-4142-8c80-0ca3c03c051b', 'K94.29 (gastrostomy complication – other) already captures the excoriation around the gastrostomy site; a separate Z43.1 (gastrostomy status) is not layered on top of an active gastrostomy complication code, since the complication code implies the device is present. E11.9 + Z79.4 documents diabetes and insulin use.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a00d4f74-3286-4748-9801-7e3adb192de9', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 23, 'Mr. Stanley Hudson is a 50-year-old patient recently diagnosed with macular edema in both eyes due to proliferative retinopathy. He has been referred to home health for medication management due to visual changes. Home health is focused on patient safety with administered medications and management of ADLs. Mr. Hudson also has a history of hyperlipidemia, type 1 diabetes, peripheral neuropathy, and peripheral vascular disease.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c654a377-b295-4d84-a4a1-232a979c103c', 'a00d4f74-3286-4748-9801-7e3adb192de9', 0, 'H35.23, H35.81, E10.42, E10.51, E78.5, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('961f4372-2542-4d0e-8007-3c674dbe2207', 'a00d4f74-3286-4748-9801-7e3adb192de9', 1, 'E10.3513, E10.42, E10.51, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a3c47f4-721e-45e2-be78-ebf76c8c25ee', 'a00d4f74-3286-4748-9801-7e3adb192de9', 2, 'H35.81, H35.23, E10.42, E10.51, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a64aa747-315e-49d7-90ef-6a8e449f12af', 'a00d4f74-3286-4748-9801-7e3adb192de9', 3, 'E10.3513, E10.42, E10.51, E78.5, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a00d4f74-3286-4748-9801-7e3adb192de9', '961f4372-2542-4d0e-8007-3c674dbe2207', 'Type 1 diabetes with bilateral proliferative retinopathy with macular edema is captured by the single combination code E10.3513 (not a separate H35.- eye code – the diabetic-specific combination code already contains the eye manifestation and takes priority over the general ophthalmology chapter code). E10.42 = diabetic polyneuropathy; E10.51 = diabetic peripheral angiopathy; E78.5 = hyperlipidemia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d90c1cec-71e4-42b3-88b2-74a7e3780be5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 24, 'Mr. Taylor, who is a heavy tobacco smoker, has been recently diagnosed with emphysema. He has bilateral chronic otitis media with conductive hearing loss. He is admitted to home health for SN services to address the disease process and medication teaching.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e31d4dbc-2d58-4d6d-a2b8-28df0a075ce5', 'd90c1cec-71e4-42b3-88b2-74a7e3780be5', 0, 'J43.9, H66.93, H91.90, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21ea7945-2556-457d-9f30-d5447e19c099', 'd90c1cec-71e4-42b3-88b2-74a7e3780be5', 1, 'J44.9, H66.003, H90.0, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('148abad7-7f07-45d5-9aa1-9eccea4be84d', 'd90c1cec-71e4-42b3-88b2-74a7e3780be5', 2, 'J43.9, H66.93, H90.0, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b20adade-0ccc-4b98-8925-53346a1a812e', 'd90c1cec-71e4-42b3-88b2-74a7e3780be5', 3, 'J43.9, H66.91, H66.92, H90.2, F17.210');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d90c1cec-71e4-42b3-88b2-74a7e3780be5', '148abad7-7f07-45d5-9aa1-9eccea4be84d', 'H66.93 = otitis media, unspecified, bilateral, chronic; H90.0 = conductive hearing loss, bilateral – both are needed together since the hearing loss is a distinct, separately reportable manifestation. J43.9 (emphysema) is the actual diagnosed condition (not the broader/unspecified J44.9). F17.210 = nicotine dependence, cigarettes, uncomplicated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f099588b-1f30-4ba5-8766-a40c9a9929c5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 25, 'A patient is admitted to home health with a new colostomy following partial removal of the colon due to diverticulitis with perforated colon. Antibiotics were completed inpatient. Incisions are well approximated and the ostomy appears pinkish-red and moist, with no peristomal skin breakdown. The patient has a history of diverticulosis, T2DM, PVD, CAD, and COPD. SN is ordered to monitor surgical site healing and continue teaching the patient the care of her ostomy stoma.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a6ed304-9645-4c04-859e-981589e57dea', 'f099588b-1f30-4ba5-8766-a40c9a9929c5', 0, 'K57.20, Z43.3, E11.9, I73.9, I25.10, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d3256e0-b810-4da0-8960-a355902bc6ac', 'f099588b-1f30-4ba5-8766-a40c9a9929c5', 1, 'Z48.815, Z43.3, K57.30, E11.9, I73.9, I25.10, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76cd8d60-993f-4ab3-8025-f096d9936f6e', 'f099588b-1f30-4ba5-8766-a40c9a9929c5', 2, 'Z43.3, K57.20, E11.51, I25.10, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('934a1376-3732-455d-8416-04a41f6ee4e8', 'f099588b-1f30-4ba5-8766-a40c9a9929c5', 3, 'Z48.815, Z43.3, K57.30, E11.51, I25.10, J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f099588b-1f30-4ba5-8766-a40c9a9929c5', '934a1376-3732-455d-8416-04a41f6ee4e8', 'Z48.815 = encounter for surgical aftercare following surgery on the digestive system; Z43.3 = colostomy status/attention to colostomy. K57.30 (diverticulitis of large intestine without perforation/abscess, since the perforation has already been surgically resolved) rather than the acute perforated version. E11.51 reflects the documented PVD as a diabetic complication (peripheral angiopathy) rather than a bare E11.9.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d57d95e-455b-427c-ba9d-a9a64aec27e2', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 26, 'Mr. Pandora is a diabetic patient who developed an ulcer on his right great toe with muscle involvement without evidence of necrosis. He also has a diabetic ulcer on his left ankle with skin breakdown only. SN is ordered for wound care. Which of the following is correct for M1021 and M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8caa00b-9717-4264-ba3c-d3054114cf18', '7d57d95e-455b-427c-ba9d-a9a64aec27e2', 0, 'E11.621, L97.513, E11.622, L97.321');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a21992b-8fd3-4e79-b49b-5c706aa7d7f8', '7d57d95e-455b-427c-ba9d-a9a64aec27e2', 1, 'E11.621, L97.515, L97.321');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85bec3ae-6f4d-41af-aff7-9dce0594f5cd', '7d57d95e-455b-427c-ba9d-a9a64aec27e2', 2, 'E11.621, L97.515, E11.622, L97.321');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02268d1c-e097-4a75-a895-659d4e40a790', '7d57d95e-455b-427c-ba9d-a9a64aec27e2', 3, 'E11.622, L97.515, E11.621, L97.321');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7d57d95e-455b-427c-ba9d-a9a64aec27e2', '85bec3ae-6f4d-41af-aff7-9dce0594f5cd', 'Each foot ulcer gets its own diabetes-with-ulcer combination code paired with the site/severity L97 code: right great toe with muscle involvement = L97.515 (paired with E11.621, foot ulcer), left ankle limited to breakdown of skin = L97.321 (paired with E11.622, other skin ulcer). Two separate ulcers at two separate sites require two separate combination-code pairs, which rules out the shorter 2- or 3-code options. The 4th option uses the correct four codes but cross-wires the pairing — E11.622 attached to the foot wound and E11.621 to the ankle wound — the reverse of the correct site-specific pairing.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8dbc1c91-2956-41b0-89f9-d39a45a26bfa', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 27, 'Mr. Hall is admitted for SN wound care to a stage 3 pressure ulcer of the right heel with gangrenous cellulitis. He has a prior stage 4 PU of the left buttock that is now closed and being monitored, and a stage 2 pressure ulcer of the left buttock that is now closed and healed. Which of the following is the correct coding for M1021 and M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f015aa1c-3dd4-4a50-b8e0-aa5dd9d6b0c9', '8dbc1c91-2956-41b0-89f9-d39a45a26bfa', 0, 'I96, L03.115, L89.613, L89.324');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fabfb60d-010e-45b5-bc05-fc4900ff2e3f', '8dbc1c91-2956-41b0-89f9-d39a45a26bfa', 1, 'L89.324, I96, L89.613, L89.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09574130-93ce-4cd8-bcf2-9ba398c6e918', '8dbc1c91-2956-41b0-89f9-d39a45a26bfa', 2, 'L89.613, I96, L03.115, L89.324');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a357f9f3-6d76-460a-bfd2-cfa77e59a1dc', '8dbc1c91-2956-41b0-89f9-d39a45a26bfa', 3, 'I96, L89.613, L89.324');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8dbc1c91-2956-41b0-89f9-d39a45a26bfa', 'a357f9f3-6d76-460a-bfd2-cfa77e59a1dc', 'I96 = gangrene, coded first since gangrenous cellulitis is present with the heel ulcer. L89.613 = pressure ulcer of right heel, stage 3. Since both left-buttock ulcers are now fully closed/healed, neither is actively coded (a fully healed, resolved pressure ulcer with no current skin breakdown is not coded) – L89.324 here represents the site/laterality marker only if any residual documentation exists; otherwise only the active heel ulcer needs coding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f868092c-a657-447f-a187-b73d07f5d988', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 28, 'Mr. Taylor is being admitted to home care following a short-stay acute hospitalization for MSSA pneumonia. The patient has prior documented COPD, asthma, and nicotine dependence (cigarettes) in remission. SN is ordered for administration of IV antibiotics with PICC line care. Supplemental oxygen therapy is new for this patient. Select the correct coding option for M1021/M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ca99d92-cc88-4b4e-942a-ddb613a7295f', 'f868092c-a657-447f-a187-b73d07f5d988', 0, 'J15.211, J44.0, J44.1, F17.211, Z45.2, Z79.2, Z99.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('253da4fb-f444-4b9a-a6e9-8de1cb536ac7', 'f868092c-a657-447f-a187-b73d07f5d988', 1, 'J44.1, J15.212, Z45.2, Z79.2, Z87.891, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7633c63-2ba7-4807-9312-9133ad072be0', 'f868092c-a657-447f-a187-b73d07f5d988', 2, 'J15.211, J44.0, Z45.2, Z79.2, Z87.891, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad194dce-1e98-47d3-b916-c15e6bb71ce3', 'f868092c-a657-447f-a187-b73d07f5d988', 3, 'J15.211, J44.0, F17.211, Z45.2, Z79.2, Z99.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f868092c-a657-447f-a187-b73d07f5d988', 'ad194dce-1e98-47d3-b916-c15e6bb71ce3', 'J44.0 (COPD with acute lower respiratory infection) is the correct combination code because the pneumonia is occurring in a COPD patient – J44.0 already links the two rather than coding COPD and pneumonia as fully separate unrelated conditions. F17.211 = nicotine dependence, in remission (matches “remission” status exactly). Z45.2 (vascular access device) for the PICC, Z99.81 for the new dependence on supplemental oxygen.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 29, 'Mrs. Serena, who has a long history of liver cirrhosis, was hospitalized with a diagnosis of acute hepatitis B and cytomegalovirus hepatitis, with progressive worsening of clinical and hepatic function, and myalgia. The physician started Entecavir during the hospital stay and recommended continuing it for the next 10 days at the time of discharge.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b95c990a-e35e-44be-96eb-28d273864ca2', '8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', 0, 'B16.9, K74.60, M79.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a6baa58-b758-4157-ac31-1da4623d458e', '8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', 1, 'B16.9, B25.1, K74.60, B94.2, M79.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb8dcf7f-c4b8-4262-a469-3b34e58d675c', '8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', 2, 'B16.9, B25.1, K74.60, M79.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('027d2b64-e621-4b0c-8e57-6d7c44c64671', '8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', 3, 'K74.60, B16.9, B25.1, M79.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8cd79c9e-631c-4308-ba0e-85d8dd3d92a5', 'cb8dcf7f-c4b8-4262-a469-3b34e58d675c', 'All three infectious/hepatic diagnoses are coded together since all are active and being managed: B16.9 (acute hepatitis B without delta agent), B25.1 (cytomegaloviral hepatitis), K74.60 (unspecified cirrhosis of liver – no alcohol etiology stated here, unlike Q7). M79.10 = myalgia. B94.2 (sequelae of viral hepatitis) is not used since this is active, not a late effect.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d2cd6ac6-05da-43fd-8ffd-d791e7a663de', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 30, 'Mrs. Doubtfire was admitted to the hospital for an acute bleeding peptic ulcer caused by her proper use of an NSAID medication. The bleeding was stopped in the hospital and she is now sent home for disease management and teaching related to her acute peptic ulcer. She continues to use the NSAID medication for her osteoarthritis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf71608e-dd16-4dcd-a57d-2c99b06b9d4e', 'd2cd6ac6-05da-43fd-8ffd-d791e7a663de', 0, 'K27.7, T39.395D, M19.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a8720dc4-cd76-4e49-8e4b-5634581ce0e1', 'd2cd6ac6-05da-43fd-8ffd-d791e7a663de', 1, 'M19.90, K27.3, T39.395D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a7c3484-c440-4536-8f48-e679cabd9350', 'd2cd6ac6-05da-43fd-8ffd-d791e7a663de', 2, 'K27.3, T39.395D, M19.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34c834b8-f8d4-44a2-a550-55e89d69fbdf', 'd2cd6ac6-05da-43fd-8ffd-d791e7a663de', 3, 'K27.0, T39.395D, M19.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d2cd6ac6-05da-43fd-8ffd-d791e7a663de', '9a7c3484-c440-4536-8f48-e679cabd9350', 'K27.3 = acute peptic ulcer, without hemorrhage or perforation (the bleeding has already stopped, so the “with hemorrhage” code K27.4 is not used going forward). T39.395D = adverse effect of NSAID, subsequent encounter (drug taken properly and as prescribed – this is an adverse effect, not poisoning). M19.90 = unspecified osteoarthritis, the reason she continues the NSAID.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('698a3f3c-c382-465d-9395-177e35bdf173', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 31, 'A patient is admitted to home care after a lobectomy for right upper lung cancer. SN will be monitoring the surgical site and assessing for post-op complications. The patient will be starting chemo in a few weeks. The patient’s past medical history includes COPD, HTN, and a colostomy which he cares for himself.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('298fd968-e43f-4afe-aaed-220a81142f6a', '698a3f3c-c382-465d-9395-177e35bdf173', 0, 'Z48.3, C34.11, J44.9, I10, Z43.3, Z90.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f3a4afb-1589-4a24-8583-c231cf9ad53d', '698a3f3c-c382-465d-9395-177e35bdf173', 1, 'Z48.3, C34.11, J44.9, I10, Z93.3, Z90.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fc9bc68-add0-4e6a-ba79-329833f02305', '698a3f3c-c382-465d-9395-177e35bdf173', 2, 'Z48.813, C34.11, J44.9, I10, Z43.3, Z90.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2681c06-f110-4d46-b245-525b4634a276', '698a3f3c-c382-465d-9395-177e35bdf173', 3, 'Z48.813, C34.11, J44.9, I10, Z93.3, Z90.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('698a3f3c-c382-465d-9395-177e35bdf173', '6f3a4afb-1589-4a24-8583-c231cf9ad53d', 'Z48.3 = aftercare following surgery for neoplasm (appropriate since surgery has not eliminated the cancer – chemo is still planned). Z93.3 = colostomy status (not Z43.3, which is the code for the encounter to attend to the colostomy itself, whereas Z93.3 simply documents that the stoma exists as background status). Z90.2 = acquired absence of lung (partial), from the lobectomy.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ccf5032-84d3-4203-8f87-19cfb357359f', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 32, 'Mrs. Sprint tripped and fell in her living room, resulting in a greater trochanter fracture of the right femur. An ORIF was performed. The referral documents the following diagnoses in the H&P: OA, osteoporosis, and HTN. PT is ordered for gait abnormality. Select the correct coding for M1021 and M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4749f278-0261-4c80-b5f5-422599c6b81b', '8ccf5032-84d3-4203-8f87-19cfb357359f', 0, 'R26.9, S72.114D, M19.91, M81.0, I10, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7c03a5af-447b-42b1-a083-6440040e0692', '8ccf5032-84d3-4203-8f87-19cfb357359f', 1, 'Z47.89, M80.051D, M19.90, M81.0, I10, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5309df8-1cc7-42a9-b19c-7271496ade5a', '8ccf5032-84d3-4203-8f87-19cfb357359f', 2, 'M80.051D, M19.90, I10, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21a3fe55-0647-459f-8d71-c79aadc7fc6b', '8ccf5032-84d3-4203-8f87-19cfb357359f', 3, 'S72.111D, M19.90, M81.0, I10, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8ccf5032-84d3-4203-8f87-19cfb357359f', 'e5309df8-1cc7-42a9-b19c-7271496ade5a', 'Because ORIF has already been performed and the referral documentation lists osteoporosis alongside the fracture without describing a clearly traumatic mechanism (unlike Q5’s escalator push), this one defaults to the pathologic-fracture convention, M80.051D. The “general answer” annotation in your source suggests some uncertainty existed at the time too – if the H&P documents this fall as purely traumatic (a simple mechanical trip), S72.114D would be more defensible; as written (no clear external violent trauma, osteoporosis specifically flagged), M80.051D is the more conventional choice.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 33, 'A 60-year-old female presents with fever and right ear pain. Examination reveals acute right serous otitis media with a slight central perforation of the tympanic membrane. Of note, the patient’s husband is a smoker and the patient is often exposed to cigarette smoke at home and in the automobile.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('503c0947-3638-48c9-8bca-e549ae9778a5', '6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', 0, 'H65.01, H72.02, Z57.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d63d2efe-28ed-4010-908f-576e09d6d3c4', '6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', 1, 'H66.011, Z77.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e3cfbe3-60e4-4a93-b2f9-b73523f6a4be', '6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', 2, 'H65.01, H72.01, Z77.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('934281de-858b-4b76-920e-0de1efd391f4', '6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', 3, 'H66.011, H72.01, F17.210');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6ba57cf8-48c2-4b2a-8cd5-cd9aafddf0ed', '5e3cfbe3-60e4-4a93-b2f9-b73523f6a4be', 'H65.01 = acute serous otitis media, right ear; H72.01 = central perforation of right tympanic membrane (matches “slight central perforation” exactly). Z77.22 = contact with/exposure to environmental tobacco smoke (secondhand smoke exposure, not the patient’s own nicotine dependence, since she doesn’t smoke).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('58f13917-b3e4-4c90-a68a-1032f28ce936', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 34, 'Mrs. Diane is in home care after hospitalization for medical treatment of acute on chronic congestive heart failure with preserved ejection fraction, and HTN. She was previously diagnosed with left breast cancer for which she underwent mastectomy and is still on tamoxifen. The oncologist suggests holding reconstruction surgery until the heart failure stabilizes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f8ba5e1-0094-4384-96f3-9f5c7d087658', '58f13917-b3e4-4c90-a68a-1032f28ce936', 0, 'C50.912, I11.0, I50.32, Z79.810, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb6bb1f6-9998-4ba7-b474-e4eebb7bda9d', '58f13917-b3e4-4c90-a68a-1032f28ce936', 1, 'I11.0, I50.23, C50.912, Z79.810, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c945c79-7aa0-43cf-a168-61dab8d0fa34', '58f13917-b3e4-4c90-a68a-1032f28ce936', 2, 'I11.0, I50.33, C50.912, Z79.810, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a6bf22a-eaf0-4853-8723-288e1e4113b0', '58f13917-b3e4-4c90-a68a-1032f28ce936', 3, 'C50.912, I11.0, I50.22, Z79.810, Z90.12');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('58f13917-b3e4-4c90-a68a-1032f28ce936', '0c945c79-7aa0-43cf-a168-61dab8d0fa34', 'I50.33 = acute on chronic diastolic heart failure (“preserved ejection fraction” = diastolic/HFpEF), combined with I11.0 for the HTN link. C50.912 codes the breast cancer as still active/being treated (tamoxifen ongoing, no stated remission), not simply a personal history code. Z79.810 = long-term use of selective estrogen receptor modulators (tamoxifen');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c194cda5-0f93-46c0-a064-a70b3324f054', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 35, 'Mr. Smith has a history of resolved stomach cancer with current metastasis to bone. Mr. Smith was admitted to the hospital with a chief complaint of low back pain where he was diagnosed with a pathological fracture of his L3 vertebra. The physician confirms this is related to his cancer. Skilled nursing and therapy are ordered to address pain, strengthening, and use of medication to reduce pain. How would you code this scenario?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44ddab0a-732a-454e-97eb-b77b6cf2a029', 'c194cda5-0f93-46c0-a064-a70b3324f054', 0, 'M84.58XD, C79.51, M54.9, Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d974454-f954-4c3a-ba18-664526cf6690', 'c194cda5-0f93-46c0-a064-a70b3324f054', 1, 'C79.51, G89.3, M54.9, Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('70b6762a-bd4b-4b78-a0ff-e5a3ada5ea50', 'c194cda5-0f93-46c0-a064-a70b3324f054', 2, 'M84.58XD, C79.51, G89.3, Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89ff30f1-6c97-4a4f-a8bf-d0ea23793c1b', 'c194cda5-0f93-46c0-a064-a70b3324f054', 3, 'G89.3, M54.9, C79.51, Z85.038');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c194cda5-0f93-46c0-a064-a70b3324f054', '70b6762a-bd4b-4b78-a0ff-e5a3ada5ea50', 'M84.58XD = pathological fracture, vertebra, due to neoplasm, subsequent encounter – sequenced first because the fracture/pain is the immediate reason for care. C79.51 = secondary malignant neoplasm of bone (the metastasis causing the fracture). G89.3 = neoplasm-related pain (chronic). Z85.038 = personal history of other malignant neoplasm of stomach (primary cancer is resolved).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('417a3ab3-b7b0-40d5-9416-73bd9545b246', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 36, 'All of the following documentation must be available for the coding professional to properly assign diagnoses in a home care record EXCEPT:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17fe4199-4624-4a3d-a453-a77bc30d3c23', '417a3ab3-b7b0-40d5-9416-73bd9545b246', 0, 'Health insurance and primary payer information');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b90e67a-5c79-4d56-bd0c-bd8bffb77d84', '417a3ab3-b7b0-40d5-9416-73bd9545b246', 1, 'Clinician’s assessment documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eda006d9-88fe-415f-90d6-a47dbc51ca0a', '417a3ab3-b7b0-40d5-9416-73bd9545b246', 2, 'Clinician identification of the patient’s pertinent diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bb78f24-7a0c-43b6-a9a3-87e6fae9b0e6', '417a3ab3-b7b0-40d5-9416-73bd9545b246', 3, 'Physician documentation or verification of the patient’s diagnoses');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('417a3ab3-b7b0-40d5-9416-73bd9545b246', '17fe4199-4624-4a3d-a453-a77bc30d3c23', 'Insurance/payer information is administrative, not clinical, and isn’t needed to assign a diagnosis code. The coder does need the clinician’s assessment findings, the clinician’s identification of pertinent diagnoses, and physician documentation/verification – all of the other three answer choices.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c611a29e-e830-4bb3-bedc-3e577e47d7b8', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 37, 'Mrs. Lopez presented to acute care with pain and inflammation of the right knee where she was admitted for further evaluation. From imaging of the joint and culture, a diagnosis of septic arthritis (staphylococcal) has been confirmed and the patient has been started on 14 days of IV vancomycin to treat MRSA infection. The patient has been admitted to home care for nursing to manage the IV and for therapeutic drug level monitoring while on vancomycin. Physical therapy has been requested to improve pain and ambulation. Please note the patient also has end-stage COPD and requires supplemental oxygen, so the therapist must be mindful of O2 tubing when performing the home exercise program.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4da3230b-c0db-4cce-aec5-6478b6224a97', 'c611a29e-e830-4bb3-bedc-3e577e47d7b8', 0, 'M00.061, A41.02, J44.9, Z51.81, Z45.2, Z79.2, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f9bb687-9828-4431-817f-d9854a69a046', 'c611a29e-e830-4bb3-bedc-3e577e47d7b8', 1, 'M00.061, B95.61, J44.9, Z51.81, Z45.2, Z79.2, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be6f1763-5c36-40fc-9436-0d1a85eb19f1', 'c611a29e-e830-4bb3-bedc-3e577e47d7b8', 2, 'M00.061, B95.62, J44.9, Z51.81, Z45.2, Z79.2, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e99ce3e-a1d8-4671-bd16-e7c538c2b0aa', 'c611a29e-e830-4bb3-bedc-3e577e47d7b8', 3, 'M17.11, M00.062, A41.02, J44.9, Z51.81, Z45.2, Z79.2, Z99.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c611a29e-e830-4bb3-bedc-3e577e47d7b8', 'be6f1763-5c36-40fc-9436-0d1a85eb19f1', 'M00.061 = staphylococcal arthritis, right knee. B95.62 = MRSA as the causative organism for the septic arthritis (use-additional-code convention). Z51.81 = encounter for therapeutic drug monitoring/level (the vancomycin trough/peak monitoring). Z99.81 documents her dependence on supplemental oxygen.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd12b423-7106-495a-99cd-b9f1f2fd7b55', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 38, 'A patient was hospitalized with altered mental status (AMS), Staph aureus pneumonia, and emphysema. The patient is improving with breathing treatments and is sent home for treatment of the pneumonia. The patient also has a history of COPD, HTN, CKD, and heart failure with reduced ejection fraction.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61f84e88-2265-4153-ae3e-8230f46fbad0', 'cd12b423-7106-495a-99cd-b9f1f2fd7b55', 0, 'J44.0, J15.212, I13.0, I50.20, N18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('856bd1f3-717b-491f-8f1e-0f5dac3cfb81', 'cd12b423-7106-495a-99cd-b9f1f2fd7b55', 1, 'J15.211, J43.9, I13.0, I50.20, N18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9887c9ad-e639-4564-b8db-7e403c3f5835', 'cd12b423-7106-495a-99cd-b9f1f2fd7b55', 2, 'J44.0, J15.211, I13.0, I50.9, N18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eaa09ccc-1f02-4c86-b010-d1ad7561d58d', 'cd12b423-7106-495a-99cd-b9f1f2fd7b55', 3, 'J15.212, J43.9, I13.0, I50.9, N18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cd12b423-7106-495a-99cd-b9f1f2fd7b55', '856bd1f3-717b-491f-8f1e-0f5dac3cfb81', 'J15.211 = pneumonia due to Staphylococcus aureus, MSSA (not J44.0, since the emphysema/COPD here isn’t described as the acute infecting combination code the way Q28 was – the primary organism-specific pneumonia code is used). I13.0 links documented HTN, CKD, and heart failure together; I50.20 = systolic heart failure, unspecified (“reduced ejection fraction” = systolic). N18.9 is used since no specific CKD stage was given in this stem (unlike Q10/Q60 where a stage was explicitly stated).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2edbf712-2482-44dc-aca2-d28f52b5052b', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 39, 'A patient was admitted to the hospital with severe abdominal pain, nausea, and vomiting. Testing did not show any confirmed diagnosis during the inpatient stay and the vomiting resolved. The patient was treated for AKI and acute on chronic systolic heart failure. The patient is also diagnosed with mild protein-calorie malnutrition and abnormal weight loss. The patient has a PMH of diverticulosis, GERD, chronic diastolic CHF, HTN, cardiomegaly, and edema for which the patient is on Lasix. The patient is being discharged with nursing for TPN for malnutrition and monitoring of abdominal pain, which is no longer “severe.”');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8830ef0-6924-4de3-a55a-a26fa3e5958e', '2edbf712-2482-44dc-aca2-d28f52b5052b', 0, 'E44.1, I11.0, I50.42, I51.7, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4219b30-c56b-411f-8a62-4f5cdbb9e6cf', '2edbf712-2482-44dc-aca2-d28f52b5052b', 1, 'E44.1, I11.0, I50.42, K57.90, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6c80d46-1c55-45f9-a525-573ab772b27c', '2edbf712-2482-44dc-aca2-d28f52b5052b', 2, 'E44.1, R10.0, R11.10, I11.0, I50.32, K57.90, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d23d4f2-c9e8-43ca-b47f-0465465155e6', '2edbf712-2482-44dc-aca2-d28f52b5052b', 3, 'E44.1, R10.9, R11.0, I11.0, I50.42, K57.90, K21.9, Z45.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2edbf712-2482-44dc-aca2-d28f52b5052b', '1d23d4f2-c9e8-43ca-b47f-0465465155e6', 'Since vomiting resolved and no definitive diagnosis was ever confirmed for the abdominal pain/vomiting, these remain symptom codes: R10.9 (unspecified abdominal pain – note it’s “no longer sever”, i.e., nonspecific/unlocalized, not the more specific R10.0 for acute abdomen) and R11.0 (nausea with vomiting, unspecified). I50.42 = acute on chronic combined systolic/diastolic heart failure (the case mentions both systolic AKI-related decompensation and chronic diastolic CHF history – the combined code fits best). E44.1 = mild protein-calorie malnutrition. K57.90 = diverticulosis w/o complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48259d71-60cb-4754-b72c-2737c98793b3', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 40, 'A 60-year-old left-hand-dominant patient was admitted to the hospital after an acute stroke. The late effects of this CVA include right-sided weakness, oropharyngeal dysphagia, and a peripheral visual field defect of the right eye. The patient is at high risk of falls. Please code this scenario.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('616a6157-4784-499a-bb09-0b703d7c2e32', '48259d71-60cb-4754-b72c-2737c98793b3', 0, 'I69.353, I69.391, R13.12, I69.312, H54.61, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1d375d7-934e-4fcb-a3b9-ba22829e5c73', '48259d71-60cb-4754-b72c-2737c98793b3', 1, 'I69.351, I69.391, R13.12, I69.398, H53.451, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b8d1f8b-a1ad-4e0c-a8c6-29e720d79471', '48259d71-60cb-4754-b72c-2737c98793b3', 2, 'I69.353, I69.391, R13.12, I69.398, H53.451, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dceddf4f-6f08-449a-bcaf-e47f52f8ca38', '48259d71-60cb-4754-b72c-2737c98793b3', 3, 'I69.351, I69.391, R13.12, I69.312, H54.61, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('48259d71-60cb-4754-b72c-2737c98793b3', '5b8d1f8b-a1ad-4e0c-a8c6-29e720d79471', 'Because the patient is left-hand dominant, her right side is the nondominant side, so I69.353 (hemiplegia/hemiparesis following cerebral infarction, nondominant side) is used rather than the .351 dominant-side code. I69.398 covers the visual field defect as “other” late effect, paired with H53.451 (homonymous bilateral field defects – matches “peripheral visual field defect”). R13.12 = oropharyngeal dysphagia. Z91.81 = history of falling.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c875cd77-5569-4a1c-9cd8-144a1cc18935', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 41, 'Mrs. Trina is admitted to home health for management of her poorly controlled diabetes (blood sugar level 220 mg/dl) after her recent hospital admission for diabetic ketoacidosis. The patient’s recent discharge summary notes the comorbid conditions of HTN, CHF, COPD, and emphysema. The home health clinician is administering and managing the dose of insulin three times a day.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50e1a235-d900-40f8-86b5-79ddafddd235', 'c875cd77-5569-4a1c-9cd8-144a1cc18935', 0, 'E11.10, I11.0, I50.9, J44.9, J43.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b3decead-f190-4fc3-aa27-dd33cd85be90', 'c875cd77-5569-4a1c-9cd8-144a1cc18935', 1, 'E11.65, I11.0, I50.9, J43.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16039380-15a6-4d3c-99be-3dc5bc0eb42b', 'c875cd77-5569-4a1c-9cd8-144a1cc18935', 2, 'E11.65, I11.0, I50.9, J44.9, J43.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee77b04c-c0a5-485a-b87c-5fc8cb66d032', 'c875cd77-5569-4a1c-9cd8-144a1cc18935', 3, 'E11.10, E11.65, I11.0, I50.9, J44.9, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c875cd77-5569-4a1c-9cd8-144a1cc18935', 'b3decead-f190-4fc3-aa27-dd33cd85be90', 'E11.65 (diabetes with hyperglycemia) reflects “poorly controlled” with an elevated documented glucose – E11.10 (DKA without coma) is not used here because the DKA episode is already resolved/inpatient-treated and the current focus of home health is ongoing hyperglycemia management, not an active ketoacidosis. J43.9 is used for the emphysema (COPD and emphysema again treated as one process, not double-coded).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d0bfd970-6767-4407-809a-783c7aefbb85', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 42, 'A 50-year-old patient was hospitalized for treatment of a pulmonary embolism. Blood tests in the hospital revealed activated protein C resistance, which her physician documented is responsible for her pulmonary embolism. The focus of the home health admission is teaching regarding pulmonary embolism and PT/INR monitoring for newly started warfarin. The patient has a past medical history of heart failure, HTN, and CKD stage 2. She is now on long-term anticoagulant medication and the nurse will be regularly checking PT/INRs.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b71c88e7-469e-40d4-a4df-00211832878d', 'd0bfd970-6767-4407-809a-783c7aefbb85', 0, 'I26.99, D68.51, I13.0, I50.9, N18.2, Z51.81, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6a261f0-fc81-46b3-9f7a-05f46653b6df', 'd0bfd970-6767-4407-809a-783c7aefbb85', 1, 'Z51.81, Z79.01, I26.99, D68.51, I13.0, I50.9, N18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17b68f2a-e9ef-40ca-b365-4a899f965cc1', 'd0bfd970-6767-4407-809a-783c7aefbb85', 2, 'I13.0, I50.9, N18.2, I26.99, D68.51, Z51.81, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc7c0d73-98fa-4f6a-91a3-9f1c44f8175a', 'd0bfd970-6767-4407-809a-783c7aefbb85', 3, 'I26.99, D68.51, I11.0, I50.9, N18.2, Z51.81, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d0bfd970-6767-4407-809a-783c7aefbb85', 'b71c88e7-469e-40d4-a4df-00211832878d', 'D68.51 = Activated Protein C resistance (an inherited thrombophilia), coded as a secondary factor contributing to the PE, alongside I26.99 (other pulmonary embolism without acute cor pulmonale). I13.0 bundles the HTN/CKD/HF combination — since all three conditions are documented together, the mandatory combination code applies rather than coding them separately. Z51.81 = encounter for therapeutic drug level monitoring (the PT/INR checks); Z79.01 = long-term use of anticoagulants (the warfarin). The sequencing distractors (options B and C) use the identical correct code set but in the wrong order; the correct sequence leads with the acute condition prompting the episode (I26.99) followed by its documented cause (D68.51). The 4th option substitutes I11.0 (hypertensive heart disease without CKD) for I13.0 — the same ''forgot to combine the CKD'' mistake tested elsewhere in this series — which drops the CKD linkage despite CKD stage 2 being explicitly documented alongside the HTN and heart failure.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c0fc6023-de46-4629-94ed-f29c4638fbcc', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 43, 'The following assumptions may be made by the coding professional when coding a record EXCEPT:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7a72a2e-346d-4392-aa32-64c828f8f91d', 'c0fc6023-de46-4629-94ed-f29c4638fbcc', 0, 'A physician-confirmed diagnosis of heel pressure ulcer and clinician documentation of stage 3 may be coded as a stage 3 pressure ulcer of the heel');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b4cb3e3-0559-4560-b2ec-3c406c672761', 'c0fc6023-de46-4629-94ed-f29c4638fbcc', 1, 'A physician-confirmed diagnosis of diabetes and gangrene may be coded as diabetic gangrene');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97c86887-ec55-491e-96d3-ec16aad8a7fb', 'c0fc6023-de46-4629-94ed-f29c4638fbcc', 2, 'A physician-confirmed diagnosis of hypertension and CHF may be coded as hypertensive heart failure');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9deb3018-f281-43c9-bed7-86f1c0c7d051', 'c0fc6023-de46-4629-94ed-f29c4638fbcc', 3, 'Abnormal laboratory results may be coded if they are not integral to the diagnoses the physician listed on the discharge summary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c0fc6023-de46-4629-94ed-f29c4638fbcc', '9deb3018-f281-43c9-bed7-86f1c0c7d051', 'This is the false assumption – the real rule is the opposite: abnormal labs are coded only when the physician documents their clinical significance, regardless of whether they seem “integral” to a listed diagnosis. The other three assumptions (stage-3 heel PU physician+clinician confirmed, diabetic gangrene → combination code, HTN+CHF → hypertensive heart failure combination) are all legitimate, guideline-supported coding assumptions.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c9180721-3b9f-4598-bcc9-637037aa061d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 44, 'Mr. Gabriel was admitted to the hospital after a short illness of cough, fatigue, and shortness of breath. The medical record indicates the physician notes the test results are “concerning for pneumonia.” The patient is started on antibiotics and referred to home care upon discharge. As the coder you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8883700-b8a0-45ed-b890-49040c9199e9', 'c9180721-3b9f-4598-bcc9-637037aa061d', 0, 'Code the pneumonia and symptoms');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4120911-b601-412c-8fff-02818a5ef1ee', 'c9180721-3b9f-4598-bcc9-637037aa061d', 1, 'Code only the symptoms present');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2745a2c-8e45-43c8-a082-bc8191fdda98', 'c9180721-3b9f-4598-bcc9-637037aa061d', 2, 'Query the physician to confirm or deny the pneumonia diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('818ad4cf-67d3-4c92-b542-fa882a91996a', 'c9180721-3b9f-4598-bcc9-637037aa061d', 3, 'Code pneumonia as the primary diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c9180721-3b9f-4598-bcc9-637037aa061d', 'b2745a2c-8e45-43c8-a082-bc8191fdda98', '“Concerning for” / “suspicious for” language in a discharge/referral summary is not a confirmed diagnosis; per coding guidelines a coder cannot code a “possible/probable/rule out” condition in the outpatient/home-health setting the way inpatient coding sometimes allows. The correct action is a physician query, not assuming pneumonia (D), coding only symptoms (B), or coding both (A).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('86cf1ddf-9050-47ed-b8e0-50794688f51a', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 45, 'Mrs. Coleman had bilateral knee replacements 10 years ago. The right knee replacement has physician-documented mechanical loosening. Elective surgery for a right total knee replacement (revision) was performed 3 days ago. Skilled nursing has been ordered for wound care and physical therapy is ordered for gait deviation. She has additional diagnoses of hypertension and hyperlipidemia. Which of the following is the correct coding for M1021 and M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('acff0243-4cba-43ca-b287-d5c87d0a9cbc', '86cf1ddf-9050-47ed-b8e0-50794688f51a', 0, 'Z47.1, I11.0, E78.5, Z96.652');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6518e8a-fb81-4740-987d-fdcb52674189', '86cf1ddf-9050-47ed-b8e0-50794688f51a', 1, 'Z47.1, R26.89, I10, E78.5, Z96.653');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fbb8f5e-221e-4fbd-b457-3c4779f2a0dc', '86cf1ddf-9050-47ed-b8e0-50794688f51a', 2, 'T84.032D, I10, E78.5, Z96.652');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3810eea3-0eca-4617-921a-b4ea0cba367c', '86cf1ddf-9050-47ed-b8e0-50794688f51a', 3, 'T84.032D, I10, E78.5, Z96.653');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('86cf1ddf-9050-47ed-b8e0-50794688f51a', '7fbb8f5e-221e-4fbd-b457-3c4779f2a0dc', 'T84.032D = mechanical loosening of internal prosthetic knee joint, subsequent encounter – the active complication that triggered the revision is what’s being followed up, not a routine aftercare Z-code. Z96.652 documents the presence of the artificial (left) knee joint that was NOT revised, still in place from the original bilateral surgery.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a1f909b-9b98-442c-86bf-be275e795ead', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 46, 'Mr. Rush was hospitalized with avian flu complicated by lobar pneumonia of the right lower lobe. There was no organism specified for the pneumonia. The patient is admitted to home care to continue oral antibiotics. What is the correct coding assignment at home for this patient?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d4bca94-44e1-45a3-8c3d-64809fa60da0', '8a1f909b-9b98-442c-86bf-be275e795ead', 0, 'J18.1, J11.08');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96265573-94d6-4b76-ab9f-a828915c2b88', '8a1f909b-9b98-442c-86bf-be275e795ead', 1, 'J10.08, J18.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b850d167-c6de-4c4d-8b2d-86e910f62c29', '8a1f909b-9b98-442c-86bf-be275e795ead', 2, 'J09.X1, J18.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ec64bd7-a3ae-4ed5-be93-ad240846dd6d', '8a1f909b-9b98-442c-86bf-be275e795ead', 3, 'J09.X2, J18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a1f909b-9b98-442c-86bf-be275e795ead', 'b850d167-c6de-4c4d-8b2d-86e910f62c29', 'J09.X1 = influenza due to identified novel/avian influenza virus with pneumonia (the combination code that includes the PNA connection to avian flu). J18.1 further specifies the lobar pneumonia pattern since no bacterial organism was identified.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1621faa2-d11b-4139-89da-c33d9547d116', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 47, 'Mrs. Sweet had an extended hospitalization for a pancreatectomy due to a benign pancreatic tumor. The tumor was successfully removed and the incision is well healed, but the patient developed diabetes which was documented as poorly controlled. Home care is ordered to teach the diabetic regimen, insulin administration, and monitor diabetic status. Select the appropriate codes for this home care admission.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67e7d4b9-7514-402f-bb41-84492777b4f7', '1621faa2-d11b-4139-89da-c33d9547d116', 0, 'E89.1, E08.65, Z79.4, Z90.410');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0fd5a218-17ff-4e72-bcce-db17f4bc6285', '1621faa2-d11b-4139-89da-c33d9547d116', 1, 'E08.649, Z79.4, Z90.410');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('859ab914-ac07-4675-b7ae-fa578c2c4c96', '1621faa2-d11b-4139-89da-c33d9547d116', 2, 'E13.69, E89.1, E13.65, Z79.4, Z90.410');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d085e14-c089-42a1-8b48-b1eb87e7fc1a', '1621faa2-d11b-4139-89da-c33d9547d116', 3, 'E89.1, E13.65, Z79.4, Z90.410');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1621faa2-d11b-4139-89da-c33d9547d116', '6d085e14-c089-42a1-8b48-b1eb87e7fc1a', 'E89.1 = postprocedural hypoinsulinemia (diabetes specifically caused by the pancreatectomy) – this is coded as the etiology/cause. E13.65 = other specified diabetes mellitus with hyperglycemia (poorly controlled), since this new-onset post-surgical diabetes doesn’t fit the standard type-1/type-2 (E10/E11) categories. Z90.410 = acquired total absence of pancreas.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 48, 'Mrs. Green developed a retroperitoneal abscess confirmed as a postoperative complication by her physician. She will receive skilled nursing home health for long-term antibiotic therapy and management of her vascular catheter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a4ab45a-fb25-41d9-b9b1-8b2ec34888e8', '20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', 0, 'T81.42XA, K68.11, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c68788d4-9d08-4b54-9968-2570e7c4559a', '20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', 1, 'K68.11, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd9fc719-7e66-4266-95a4-c8a5c2bc6b7a', '20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', 2, 'T81.42XA, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14c30392-9711-4fb6-b6eb-5fa8dd546111', '20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', 3, 'K68.19, Z45.2, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('20df47ab-e9dc-46d6-9fbd-7e90ebbe2aa0', 'c68788d4-9d08-4b54-9968-2570e7c4559a', 'K68.11 = retroperitoneal abscess. Because the abscess itself is the complication code (already capturing the postoperative nature clinically), a separate T81.4- postoperative infection code isn’t layered on top when K68.11 already fully identifies the condition as documented; Z45.2 covers the vascular access device, Z79.2 the long-term antibiotic use.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1d1f931-7cee-44e0-984e-78f4d25132ae', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 49, 'The following is true about OASIS correction by the coder EXCEPT:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6cec297b-f77f-4c1f-9d5c-291363a11204', 'a1d1f931-7cee-44e0-984e-78f4d25132ae', 0, 'When the OASIS is corrected, the agency must retain a copy of the original OASIS as well as the corrected OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1b14e73-57ff-460c-8bdb-d1e1226ca658', 'a1d1f931-7cee-44e0-984e-78f4d25132ae', 1, 'The clinician must be contacted and approve any diagnosis changes suggested to a completed OASIS assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('591cddce-86e6-49a2-ae8d-2f330d36c414', 'a1d1f931-7cee-44e0-984e-78f4d25132ae', 2, 'The primary and secondary diagnoses are determined by the collaboration of the assessing clinician and physician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4441246f-43d7-4422-9e81-69cdbcfe3c57', 'a1d1f931-7cee-44e0-984e-78f4d25132ae', 3, 'When the sequencing of a manifestation diagnosis is not accurate, this is considered a technical correction and the coder may change the sequence without contacting the clinician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1d1f931-7cee-44e0-984e-78f4d25132ae', 'c1b14e73-57ff-460c-8bdb-d1e1226ca658', 'Note: the original exam key marked “when the OASIS is corrected, the agency must retain a copy of the original OASIS as well as the corrected OASIS” — this appears mismarked. ⚠ Likely mismarked. Retaining both the original and corrected OASIS is a well-established, TRUE requirement – it should not be flagged as the exception. The actual false/exception statement is the one claiming the clinician must approve any diagnosis change: that’s overly absolute, because sequencing/technical corrections (per the guideline in option D of this same question) explicitly do NOT require going back to the clinician. Notice Q94 further down – the identical question – correctly flags this “must approve any change” statement as the false one, which is internally inconsistent with how Q49 was marked here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('80891382-afa4-4a27-aa3c-c2b30bb2769a', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 50, 'A severely anemic patient is seen by the home health nurse for administration of IV medications to treat the patient’s anemia in the home, following a recent hospital admission s/p blood transfusion (red cells). The patient’s discharge diagnosis from the hospital was anemia of chronic disease due to now-inoperable carcinoma of the brain, which has metastasized to the left lung. The patient also has a diagnosis of stage 1 pressure ulcers of the bilateral buttocks. The patient underwent brain cancer surgery s/p removal of tumor two months ago and is following up with the oncologist for radiotherapy.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2aca64b-0936-4935-a955-151db6ba6aa0', '80891382-afa4-4a27-aa3c-c2b30bb2769a', 0, 'C71.9, C78.02, D63.0, L89.311, L89.321, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8350f5d8-fe2e-44d1-8e61-e719e042e32e', '80891382-afa4-4a27-aa3c-c2b30bb2769a', 1, 'D63.0, C71.9, C78.02, L89.311, L89.321, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0e3937a-5c75-4469-97d4-4f493aaa2a24', '80891382-afa4-4a27-aa3c-c2b30bb2769a', 2, 'C78.02, D63.0, L89.311, L89.321, Z85.841, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72a3b1f3-de34-4dd1-afc2-fb654e64a06f', '80891382-afa4-4a27-aa3c-c2b30bb2769a', 3, 'D63.0, C78.02, L89.311, L89.321, Z85.841, Z45.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('80891382-afa4-4a27-aa3c-c2b30bb2769a', 'c2aca64b-0936-4935-a955-151db6ba6aa0', 'C71.9 (malignant neoplasm of brain, unspecified) is sequenced first because it’s explicitly “inoperable” and still the driving disease – not a history code, since it hasn’t resolved. C78.02 = secondary malignant neoplasm of left lung (the metastasis). D63.0 = anemia in neoplastic disease. Bilateral stage 1 buttock ulcers get two laterality-specific L89.3-1 codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d35ccd9-0076-4935-a61a-6374ca558a7d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 51, 'Mrs. Murphy is a 30-year-old female admitted to home health for wound care. She had a cesarean delivery 2 weeks ago and her abdominal incision has dehisced. Home health is ordered for wound care as the patient at this time is unable to perform it successfully. She also has a history of type 1 diabetes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88dc8407-ceda-435f-a687-a5fd00c2aa89', '2d35ccd9-0076-4935-a61a-6374ca558a7d', 0, 'O86.01, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f64b358-fce9-416a-8d27-06c1d1a738d7', '2d35ccd9-0076-4935-a61a-6374ca558a7d', 1, 'O90.0, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fa132da-474e-4c09-b197-60058d842342', '2d35ccd9-0076-4935-a61a-6374ca558a7d', 2, 'T81.31XD, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9d2f826-d3fb-47fe-8e7c-430f499b27ea', '2d35ccd9-0076-4935-a61a-6374ca558a7d', 3, 'O90.1, E10.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d35ccd9-0076-4935-a61a-6374ca558a7d', '6f64b358-fce9-416a-8d27-06c1d1a738d7', 'O90.0 = disruption of cesarean wound, the obstetric-specific complication code for a dehisced C-section incision (preferred over the general surgical wound-disruption code T81.31- when the wound is a postpartum/obstetric surgical site, per the obstetric-chapter sequencing priority). E10.9 = type 1 diabetes without complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a27be6b9-53a4-4f6c-baac-7cfa55705f41', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 52, 'Your patient is a preterm baby who was admitted to home health 18 days after birth for related neonatal jaundice, central apnea, bradycardia, and anemia. Home care was ordered for phototherapy and monitoring of response to treatment and comorbid conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ca5a889-24f1-465c-94aa-f84e85a54891', 'a27be6b9-53a4-4f6c-baac-7cfa55705f41', 0, 'P59.9, P28.41, P29.12, P61.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('326c243a-6fdb-4443-adb0-88d7fb8802cc', 'a27be6b9-53a4-4f6c-baac-7cfa55705f41', 1, 'P59.0, R17, P28.41, P29.12, P61.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ef5816b-f5fc-4d98-8b9f-e694a31ae573', 'a27be6b9-53a4-4f6c-baac-7cfa55705f41', 2, 'P59.9, R06.81, P29.12, P61.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d157426-234e-494b-a88f-f0e2b1fe447e', 'a27be6b9-53a4-4f6c-baac-7cfa55705f41', 3, 'P59.0, P28.41, P29.12, P61.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a27be6b9-53a4-4f6c-baac-7cfa55705f41', '6d157426-234e-494b-a88f-f0e2b1fe447e', 'P59.0 = neonatal jaundice associated with preterm delivery. P28.41 (central neonatal apnea) is the specific, billable code matching the documented apnea type — P28.4 alone is a non-billable parent requiring specification of central, obstructive, or mixed type. P29.12 = neonatal bradycardia. P61.2 = anemia of prematurity – all four are standard, distinct neonatal codes for these findings in a preterm infant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cca339a8-97b0-4631-a58e-92d869a3756f', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 53, 'A patient is admitted to home health following a left great toe amputation due to osteomyelitis from a diabetic ulcer on the left great toe. Oral antibiotics are ordered for 4 more weeks.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f69550a8-3ceb-431e-a615-88abb38e8ca1', 'cca339a8-97b0-4631-a58e-92d869a3756f', 0, 'Z47.81, E11.69, M86.9, Z89.412, Z79.2, Z86.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ac445454-8753-4c4f-ac49-7848d9205022', 'cca339a8-97b0-4631-a58e-92d869a3756f', 1, 'Z47.81, E11.9, Z89.411, Z79.2, Z86.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f0a3fe6-c76a-4463-b880-78da2f506a77', 'cca339a8-97b0-4631-a58e-92d869a3756f', 2, 'Z47.81, E11.69, M86.172, Z89.412, Z79.2, Z86.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('158671e3-1467-4e65-abee-a06a0e7d7ddb', 'cca339a8-97b0-4631-a58e-92d869a3756f', 3, 'Z47.81, E11.69, M86.172, Z89.411, Z79.2, Z86.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cca339a8-97b0-4631-a58e-92d869a3756f', 'f69550a8-3ceb-431e-a615-88abb38e8ca1', 'Z47.81 = aftercare following amputation. E11.69 = diabetes with other specified complication (the osteomyelitis pathway). M86.9 = osteomyelitis, unspecified (the amputation already removed the diabetic foot ulcer itself, so the ulcer isn’t separately coded any more – only its sequela, the osteomyelitis being treated with ongoing antibiotics, and the amputation status). Z89.412 = acquired absence of left great toe; Z86.31 = personal history of malignant carcinoid tumor is NOT relevant here – rather Z86.31 is being used loosely for “history of healed skin ulcer” in this exam bank; verify locally if your ICD-10-CM book maps this differently, as this is the one code in the set worth double-checking against your current code book edition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d9bb42f-9205-4092-906d-b2223d57377c', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 54, 'Mr. Brady is an 88-year-old bedbound gentleman being recertified for continued wound care to pressure ulcers. At SOC the patient had a stage 4 pressure ulcer of the coccyx and a stage 2 pressure ulcer of the right heel. At the recert visit the nurse notes that the coccyx ulcer has shown improvement and now only subcutaneous tissue is visible at the base of the wound. Unfortunately, the patient has not been keeping his heel off the bed and now the nurse notes that she can see bone visible at the base of the right heel wound. SN is continuing care for wound care of the coccyx and heel pressure ulcers. How would these pressure ulcers be coded at recert?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f17bb2b-d747-4e8e-b7d3-e50f57dbcfad', '4d9bb42f-9205-4092-906d-b2223d57377c', 0, 'Stage 4 PU of the coccyx and stage 4 pressure ulcer of the right heel');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e45a5073-d431-4a76-9175-10fae5b93896', '4d9bb42f-9205-4092-906d-b2223d57377c', 1, 'Stage 2 pressure ulcer of the coccyx and stage 4 pressure ulcer of the right heel');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f95732a-88d2-4ccb-98cf-7e6466c15f76', '4d9bb42f-9205-4092-906d-b2223d57377c', 2, 'Unstageable pressure ulcer of the coccyx and stage 2 pressure ulcer of the right heel');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a73c7e5-3f88-4f36-ae88-52be306cbfd1', '4d9bb42f-9205-4092-906d-b2223d57377c', 3, 'The PU stages would need to be verified with the MD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4d9bb42f-9205-4092-906d-b2223d57377c', '7f17bb2b-d747-4e8e-b7d3-e50f57dbcfad', 'Key pressure-ulcer rule: PUs cannot be “back-staged” as they heal, because granulation tissue fills in through a different biological process than the original tissue loss – so a wound that was ever staged as full-thickness (subcutaneous tissue visible = at least Stage 3, trending toward 4 as documented) continues to be coded at its deepest-ever stage until it is fully closed, even while it’s visibly improving. The heel ulcer, by contrast, has genuinely gotten worse (now bone-deep), so it is re-staged upward to Stage 4. Both ulcers are therefore coded/reported as Stage 4 at this recert.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('52bcbe64-12b7-4083-a6b8-d2fe70094cd9', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 55, 'A 58-year-old man has bilateral shoulder and knee OA due to trauma caused by a 4-car pileup 10 years ago, which resulted in multiple fractures and soft tissue injuries. He is hoping to have the bilateral shoulder joints replaced due to the post-traumatic OA, as he is in constant pain and has very limited range of motion. The occupational therapist will be assessing the patient to try to mitigate pain and improve ROM in the bilateral upper extremities. PT will also attend the patient to instruct in a home exercise program to improve mobility and ambulation. The patient is morbidly obese with a BMI of 46 and must engage in a weight loss program prior to surgery.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fb3b707-db92-4f47-af49-12ceccd5d2ef', '52bcbe64-12b7-4083-a6b8-d2fe70094cd9', 0, 'M19.011, M19.012, M17.0, E66.01, Z68.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09fe052c-5855-4332-8609-4e3a08718038', '52bcbe64-12b7-4083-a6b8-d2fe70094cd9', 1, 'M15.0, E66.01, Z68.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36affce9-a648-4146-8410-90f977adf5bd', '52bcbe64-12b7-4083-a6b8-d2fe70094cd9', 2, 'M19.111, M19.112, M17.2, E66.01, Z68.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1464425-dff3-43a1-9b79-98233ded0bec', '52bcbe64-12b7-4083-a6b8-d2fe70094cd9', 3, 'M19.111, M19.112, M17.31, M17.32, E66.01, Z68.42');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('52bcbe64-12b7-4083-a6b8-d2fe70094cd9', 'f1464425-dff3-43a1-9b79-98233ded0bec', 'M17.31/M17.32 = bilateral post-traumatic osteoarthritis of knee (right/left), and M19.111/M19.112 = bilateral post-traumatic OA of shoulder, correctly captures “post-traumatic” etiology specifically (not the generic M17.0/M19.0 primary-OA codes) given the clear MVA history. E66.01 = morbid (severe) obesity due to excess calories; Z68.42 (BMI 45.0–49.9, adult) correctly matches the documented BMI of 46.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd700deb-17db-40ac-ba15-4e2e48a13a2b', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 56, 'A patient who has a history of GERD is recently diagnosed with cervical esophageal cancer and was referred to home care for intravenous hydration therapy due to severe dehydration. Speech therapy is ordered for swallowing difficulty. The physician is planning to conduct surgery for the cancer once the dehydration issue is resolved.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a259cab0-fae2-4e64-b564-2d8829cd1dd1', 'bd700deb-17db-40ac-ba15-4e2e48a13a2b', 0, 'C15.3, E86.0, R13.10, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e0a5732-8523-4eec-a222-0d7893af808b', 'bd700deb-17db-40ac-ba15-4e2e48a13a2b', 1, 'E86.0, C15.9, R13.10, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb4b7b0b-d5ab-493f-803b-30b806be51c0', 'bd700deb-17db-40ac-ba15-4e2e48a13a2b', 2, 'E86.0, C15.3, R13.10, K21.9, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e4f68e2-dc76-4010-9e88-d140b921a99b', 'bd700deb-17db-40ac-ba15-4e2e48a13a2b', 3, 'C15.9, E86.0, R13.10, K21.9, Z45.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bd700deb-17db-40ac-ba15-4e2e48a13a2b', 'eb4b7b0b-d5ab-493f-803b-30b806be51c0', 'E86.0 = dehydration, sequenced first as the acute, urgent reason driving the home health referral. C15.3 = malignant neoplasm of upper third of esophagus (“cervical esophageal” = upper third). R13.10 = dysphagia, unspecified; K21.9 = GERD without esophagitis. Z45.2 documents any vascular access device used for the IV hydration.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da5013e8-e8aa-4c04-890a-1387655b9de9', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 57, 'A 98-year-old is admitted to the hospital with an E. coli UTI. The patient has Alzheimer’s dementia and is bladder and bowel incontinent. The patient’s discharge diagnosis is acute cystitis with hematuria. The patient is discharged on Bactrim for 10 days. Code the home health admission.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4dbc3e19-2f5e-45af-9e25-1b0f1966a124', 'da5013e8-e8aa-4c04-890a-1387655b9de9', 0, 'G30.9, F03.90, R32, R15.9, Z87.440');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c584f9de-e48a-4bc3-a493-7a60ba2ae2c3', 'da5013e8-e8aa-4c04-890a-1387655b9de9', 1, 'N30.01, B96.20, G30.9, F02.80, R32, R15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('963ead22-1783-4f6c-ad1c-ce0760a31435', 'da5013e8-e8aa-4c04-890a-1387655b9de9', 2, 'N39.0, N30.01, B96.20, G30.9, F02.80, R32, R15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5cb412de-134d-4931-95b9-41edd133ee81', 'da5013e8-e8aa-4c04-890a-1387655b9de9', 3, 'N30.01, G30.9, F02.80, R32, R15.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('da5013e8-e8aa-4c04-890a-1387655b9de9', 'c584f9de-e48a-4bc3-a493-7a60ba2ae2c3', 'N30.01 = acute cystitis with hematuria (the physician’s stated discharge diagnosis, used exactly as documented – not the broader “UTI” code). B96.20 = unspecified E. coli as the cause (use-additional-code). G30.9 + F02.80 = Alzheimer’s with dementia, unspecified severity, without behavioral disturbance. R32/R15.9 = the incontinence findings that are being managed as part of the HH plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('224bd917-53f6-4b92-a9fe-37c19c2079cd', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 58, 'A patient is receiving antineoplastic chemotherapy at home for his Hodgkin lymphoma. The nurse is also providing monthly Foley catheter care, which the patient needs due to his benign prostatic hyperplasia with urinary retention.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92fc39ba-a22f-4d27-890f-d449744e0b4c', '224bd917-53f6-4b92-a9fe-37c19c2079cd', 0, 'Z51.11, C81.90, N40.1, R33.8, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d64c051-4830-450f-b501-5f0128121f0c', '224bd917-53f6-4b92-a9fe-37c19c2079cd', 1, 'C81.90, Z51.11, N40.1, R33.8, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d591ced-62b4-4297-9ec0-9100fa3bacab', '224bd917-53f6-4b92-a9fe-37c19c2079cd', 2, 'Z51.11, C85.90, N40.1, R33.8, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8acbcf27-7046-4f6b-82d1-6c7114cade3d', '224bd917-53f6-4b92-a9fe-37c19c2079cd', 3, 'Z46.6, N40.1, R33.8, Z51.11, C81.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('224bd917-53f6-4b92-a9fe-37c19c2079cd', '92fc39ba-a22f-4d27-890f-d449744e0b4c', 'Z51.11 = encounter for antineoplastic chemotherapy, sequenced first since chemo administration is the primary skilled service. C81.90 = Hodgkin lymphoma, unspecified. N40.1 = BPH with lower urinary tract symptoms; R33.8 = other retention of urine; Z46.6 = fitting/adjustment of urinary catheter device.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('343b2b30-4d69-46ea-a0a6-1ce713c80d90', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 59, 'Mr. Jaminson suffered a laceration on his forehead when he fell from his motorized wheelchair. As he was navigating through his home, his wheelchair hit one of his grandchildren’s toys, knocking his chair off balance and sending him to the floor. He was treated in the ER and returned home for care and monitoring by the home care nurse.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96695bb1-7dcf-4af0-99ea-e80dc4eccf8f', '343b2b30-4d69-46ea-a0a6-1ce713c80d90', 0, 'S01.01XD, W05.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38081ae5-f4b5-40bd-85ca-b9bd6fffe629', '343b2b30-4d69-46ea-a0a6-1ce713c80d90', 1, 'V00.811D, S01.81XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c9219e6-0cf8-4217-94e7-745135379d70', '343b2b30-4d69-46ea-a0a6-1ce713c80d90', 2, 'S01.81XD, W05.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('570d734a-7978-4bf6-87f2-c6f652565702', '343b2b30-4d69-46ea-a0a6-1ce713c80d90', 3, 'S01.81XD, V00.811D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('343b2b30-4d69-46ea-a0a6-1ce713c80d90', '570d734a-7978-4bf6-87f2-c6f652565702', 'S01.81XD = laceration of forehead, subsequent encounter (home health is following up after the initial ER visit). V00.811D = fall from wheelchair, motorized, subsequent encounter – the specific external-cause code for a motorized (vs. manual) wheelchair fall.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e3b1271-46e5-479b-a40d-18b313470664', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 60, 'Skilled nursing home care is ordered for Mrs. Halsey who has the following diagnoses: diabetes, HTN, combined systolic and diastolic chronic heart failure, ESRD, and anemia. The patient attends dialysis 3 times a week; insulin and oral hypoglycemic medication are ordered. The focus of care is diabetic management. Which of the following is correct for M1021 and M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('87401ffc-8d1c-4628-a5e7-91437a4a6587', '4e3b1271-46e5-479b-a40d-18b313470664', 0, 'E11.22, I13.0, I50.42, N18.6, D63.1, Z99.2, Z79.4, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d125fa8-ccb7-4221-8b47-925ebf9eec66', '4e3b1271-46e5-479b-a40d-18b313470664', 1, 'E11.22, I13.2, I50.42, N18.6, D63.1, Z99.2, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53388302-3d2c-4729-aef9-cec10bf52df5', '4e3b1271-46e5-479b-a40d-18b313470664', 2, 'E11.22, I13.2, I50.42, N18.6, D64.9, Z99.2, Z79.4, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29528c73-87e1-488f-936a-213db4dd21d4', '4e3b1271-46e5-479b-a40d-18b313470664', 3, 'E11.22, I13.2, I50.42, N18.6, D64.9, Z99.2, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4e3b1271-46e5-479b-a40d-18b313470664', '3d125fa8-ccb7-4221-8b47-925ebf9eec66', 'I13.2 (hypertensive heart AND chronic kidney disease with heart failure and stage 5 CKD/ESRD) is the combination code matching ESRD specifically (N18.6 confirms ESRD, so I13.2 not I13.0). D63.1 = anemia in chronic kidney disease (not the unspecified D64.9, since the anemia is clearly tied to her ESRD). Z99.2 = dependence on renal dialysis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e37c707-5a37-42a7-b063-7a750049e725', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 61, 'A 50-year-old male is discharged from the hospital with Fournier’s gangrene due to MRSA. The patient also has diabetic peripheral neuropathy and COPD. The patient is to have IV antibiotics at home. Code the home health admission.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('22de9215-47d6-4472-bd72-b55eae2a7ba5', '6e37c707-5a37-42a7-b063-7a750049e725', 0, 'E11.52, N49.3, B95.62, E11.42, J44.9, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5489639-c391-4539-9b93-7522e4abb9fd', '6e37c707-5a37-42a7-b063-7a750049e725', 1, 'N49.3, B95.62, E11.42, J44.9, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da5189c0-3dd9-45ea-b73f-f4486d86b033', '6e37c707-5a37-42a7-b063-7a750049e725', 2, 'N49.3, E11.40, J44.9, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7da80c4a-c71d-417a-a3f0-f313b08e9f50', '6e37c707-5a37-42a7-b063-7a750049e725', 3, 'N49.9, B95.62, E11.42, J44.9, Z45.2, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6e37c707-5a37-42a7-b063-7a750049e725', 'b5489639-c391-4539-9b93-7522e4abb9fd', 'N49.3 = Fournier’s gangrene (a specific, named code – not a generic gangrene code). B95.62 = MRSA as the causative organism. E11.42 = diabetic polyneuropathy (the specific complication, rather than an unspecified E11.9/E11.40).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d227de9b-70c4-4d2f-ba74-1a83a324fcae', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 62, 'Mr. Jackman is a 54-year-old man admitted to home care for wound care and physical therapy to address pain following fractures of the 3rd and 4th lumbar vertebrae which required surgical intervention. The fractures occurred when he sat down on his kitchen chair. The gentleman is undergoing treatment for a malignant neoplasm of the right lung which unfortunately has spread to the bones, causing the fracture. The patient smokes 20 cigarettes per day and has been advised to quit to improve respiratory status and promote wound healing.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b63cd967-250a-4de8-a553-3c6feb9c7eb2', 'd227de9b-70c4-4d2f-ba74-1a83a324fcae', 0, 'M84.58XD, C79.51, C34.91, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b2bb520-9112-492d-bcee-cb3f0f9e436c', 'd227de9b-70c4-4d2f-ba74-1a83a324fcae', 1, 'M84.58XD, C34.91, C79.51, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('93e830ef-db01-44ea-8025-f31a4e0562df', 'd227de9b-70c4-4d2f-ba74-1a83a324fcae', 2, 'C79.51, M84.58XD, C34.91, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('55925953-64b6-470c-bb8f-c3b695afc217', 'd227de9b-70c4-4d2f-ba74-1a83a324fcae', 3, 'S32.030D, S32.040D, C79.51, C34.91, F17.210');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d227de9b-70c4-4d2f-ba74-1a83a324fcae', 'b63cd967-250a-4de8-a553-3c6feb9c7eb2', 'M84.58XD = pathological fracture of vertebra due to neoplasm, subsequent encounter, sequenced first as the reason for wound care/PT. C79.51 = secondary malignant neoplasm of bone (the metastasis causing the pathologic fracture');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a25fa8a-4fc1-464b-9927-5e67341a3a56', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 63, 'A patient was admitted to the hospital with slurred speech and dysphagia. A CVA workup was completed and CVA was ruled out. The patient has a history of a right-sided CVA in the past with left-sided hemiplegia. Past medical history includes seizures, CHF, and HTN. PT, OT, and ST have been ordered for home health.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9cb9318-98a3-4718-a9a6-9e61de3d74c8', '8a25fa8a-4fc1-464b-9927-5e67341a3a56', 0, 'I69.391, R13.10, R47.81, I11.0, I50.9, R56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc433bf7-5fd7-4e2b-ade7-35f2e45abdc2', '8a25fa8a-4fc1-464b-9927-5e67341a3a56', 1, 'I69.354, I69.391, I69.328, I11.0, I50.9, G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fcc1100-ec09-4d92-81ac-f04b3f07fbbe', '8a25fa8a-4fc1-464b-9927-5e67341a3a56', 2, 'R47.81, R13.10, I69.354, I11.0, I50.9, G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00a9a43e-1ae6-4ba3-82e2-4fd7456f6fcd', '8a25fa8a-4fc1-464b-9927-5e67341a3a56', 3, 'R13.10, R47.81, I69.354, I11.0, I50.9, R56.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a25fa8a-4fc1-464b-9927-5e67341a3a56', '00a9a43e-1ae6-4ba3-82e2-4fd7456f6fcd', 'Because the CURRENT CVA was explicitly ruled out, the current slurred speech and dysphagia are coded as symptoms (R47.81 dysarthria, R13.10 dysphagia) rather than as a new stroke code. I69.354 documents the late effect (hemiplegia) of the PRIOR (old) confirmed CVA. R56.9 = unspecified convulsions/seizure history contributing to plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bb5943de-1423-4ef7-af15-86e887c12c03', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 64, 'Mr. Doubtfire was celebrating the holiday at a bonfire. He kicked a log, accidentally fell in the fire, and sustained burns. His right lower leg has two second-degree burns and one third-degree burn to the shin. His right forearm has a third-degree burn that the physician has documented as non-healing. A total of 5% of the patient’s body is documented to have third-degree burns. Skilled nursing has been ordered to continue active wound care to the burns. Select the correct coding for M1021 and M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6df90bcb-92ed-489e-a930-bf815d9026e1', 'bb5943de-1423-4ef7-af15-86e887c12c03', 0, 'T22.311A, T24.331A, T24.231A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80ec2cde-4ebf-48ae-8ae6-fd0337b488a5', 'bb5943de-1423-4ef7-af15-86e887c12c03', 1, 'T22.311D, T24.331D, T24.291D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a30c206a-9dd2-4a6d-bcc4-7e7495be05bb', 'bb5943de-1423-4ef7-af15-86e887c12c03', 2, 'T22.311A, T24.331D, T31.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9235fc1e-2708-4670-9450-e30ad4665037', 'bb5943de-1423-4ef7-af15-86e887c12c03', 3, 'T22.311A, T24.331A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bb5943de-1423-4ef7-af15-86e887c12c03', 'a30c206a-9dd2-4a6d-bcc4-7e7495be05bb', 'T24.331D = third-degree burn of right lower leg, subsequent encounter (routine, since it’s healing normally per the shin). T22.311A = third-degree burn of right forearm – kept as “A” (initial) rather than “D” specifically because the physician has explicitly documented it as non-healing, meaning active/ongoing treatment for a wound that hasn’t progressed past the acute phase; T31.0 = burns involving less than 10% of body surface (5% TBSA).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7a7b8a25-4368-4cf7-ae6d-068b45730aec', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 65, 'Mr. Ryan was admitted with severe enterocolitis due to recurrent Clostridium difficile, diarrhea, sepsis, and AKI. The patient was treated with IV vancomycin during the hospital stay and discharged on a long course of oral Dificid. The sepsis and AKI resolved while the patient was in the hospital.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('93542cbb-4c1b-4f33-a0e6-6b3dd2ba5458', '7a7b8a25-4368-4cf7-ae6d-068b45730aec', 0, 'A04.71, A41.81, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1330d3e1-815a-476e-8a9b-700298619848', '7a7b8a25-4368-4cf7-ae6d-068b45730aec', 1, 'A04.71, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca74d67d-9683-4af1-b571-a6eb7de267ae', '7a7b8a25-4368-4cf7-ae6d-068b45730aec', 2, 'A04.71, R19.7, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('859b0947-977d-4968-9b6c-36313105b6bd', '7a7b8a25-4368-4cf7-ae6d-068b45730aec', 3, 'A04.71, B96.7, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7a7b8a25-4368-4cf7-ae6d-068b45730aec', '1330d3e1-815a-476e-8a9b-700298619848', 'A04.71 = enterocolitis due to Clostridium difficile, recurrent. Since the sepsis and AKI have both fully resolved prior to home health admission, they are not coded – only the still-active C. diff infection (being treated with the ongoing oral antibiotic course) and Z79.2 (long-term antibiotic use) are reported.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('443bcae3-8af0-4c21-b139-2ac9e4965ed0', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 66, 'This patient was admitted to home care after surgery for a cholecystectomy. The clinician describes a primary intention healing surgical wound with no sign of infection. The wound is described as “edges approximated” with a small amount of drainage. The physician documentation also indicates a well-healing surgical site with no post-operative complications. In the OASIS assessment, the surgical wound items were answered as: M1340: Response 1 — Yes, patient has at least one observable surgical wound; M1342: Response 3 — non-healing. Based on this information, as the coder you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('07714b2b-4663-44e1-822e-652f18e50e3d', '443bcae3-8af0-4c21-b139-2ac9e4965ed0', 0, 'Code aftercare following surgery');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6c0db56-d1ff-40d3-9c18-8a5d0dcbea2a', '443bcae3-8af0-4c21-b139-2ac9e4965ed0', 1, 'Request clinician confirmation of non-healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e73aeb8-ff35-48dc-930f-9dbf7f5e85b4', '443bcae3-8af0-4c21-b139-2ac9e4965ed0', 2, 'Request MD confirmation that an infection is present');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('317e797b-9d40-4e0b-9c3d-60116d4f20c5', '443bcae3-8af0-4c21-b139-2ac9e4965ed0', 3, 'Code non-healing surgical wound as primary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('443bcae3-8af0-4c21-b139-2ac9e4965ed0', 'd6c0db56-d1ff-40d3-9c18-8a5d0dcbea2a', 'Note: the original exam key marked “Code aftercare following surgery.” — this appears mismarked. ⚠ This is a near-duplicate of Q4, but with one critical difference: here the clinician’s own OASIS answer (M1342 = non-healing) directly contradicts the physician’s narrative documentation (well-healing, edges approximated, no complications). That’s an internal documentation conflict the coder cannot resolve unilaterally – the correct action is to go back to the clinician to confirm/correct the M1342 response (option B), not to just pick the physician note and code aftercare as if no conflict existed. Coding straight to aftercare here would mean silently overriding a documented clinical assessment finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d5daa967-6423-4013-a54c-73d11fd1a56d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 67, 'A patient was admitted to the hospital for sepsis due to an E. coli UTI and was treated with IV antibiotics for a Foley-catheter-related UTI. The sepsis resolved inpatient. The patient has a Foley catheter for urinary retention and is being discharged with 10 days of antibiotics. The patient has a PMH of BPH and persistent atrial fibrillation for which the patient is on Coumadin. SN is ordered for Foley catheter changes and infection monitoring.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('338ad16d-8619-4567-9231-d5d1e3a83180', 'd5daa967-6423-4013-a54c-73d11fd1a56d', 0, 'T83.511A, N39.0, B96.20, N40.1, R33.9, I48.19, Z79.01, Z46.6, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f37707d3-07f8-4610-9e44-36456bce73f3', 'd5daa967-6423-4013-a54c-73d11fd1a56d', 1, 'N39.0, T83.511D, B96.20, N40.1, R33.8, I48.19, Z79.01, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4a4fe1d-f28f-40ae-a804-7683463ace41', 'd5daa967-6423-4013-a54c-73d11fd1a56d', 2, 'T83.511A, N39.0, B96.20, N40.1, R33.8, I48.19, Z79.01, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c703bd4c-b001-4d98-a467-784fe519be57', 'd5daa967-6423-4013-a54c-73d11fd1a56d', 3, 'A41.51, T83.511D, N39.0, N40.1, R33.8, I48.19, Z79.01, Z46.6, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d5daa967-6423-4013-a54c-73d11fd1a56d', 'e4a4fe1d-f28f-40ae-a804-7683463ace41', 'T83.511A = infection/inflammatory reaction due to indwelling urinary catheter, initial encounter (this is the active reason antibiotics continue – kept as “A” because it’s still an active infectious process being actively treated, not yet resolved to a routine aftercare phase). Since sepsis has already resolved inpatient, it is not carried forward as an active code. N40.1 + R33.8 documents BPH with retention; I48.19 = other persistent Afib; Z79.01 = long-term Coumadin use.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 68, 'Ms. Phoebe is admitted to home health for management of neuropathic pain in her left leg. She has comorbid conditions of DM type 2 currently controlled with Metformin and insulin, PVD, polyneuropathy, HTN, and CHF.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38f2e457-5d60-4c53-8d86-8e07cc501239', '36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', 0, 'M79.605, E11.42, E11.51, I11.0, I50.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38765651-4c38-4103-bc0e-3aa43942af50', '36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', 1, 'E11.42, E11.51, I11.0, I50.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88d6c560-050d-468a-8845-5c40477ecfbd', '36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', 2, 'G62.9, E11.9, I73.9, I11.0, I50.9, Z79.4, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74070733-fe07-4db5-8098-3c4d613389b8', '36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', 3, 'M79.605, G62.9, I73.9, E11.9, I11.0, I50.9, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('36f0cea3-57bf-4937-afdd-8bbdbb5b9b81', '38765651-4c38-4103-bc0e-3aa43942af50', 'E11.42 (diabetic polyneuropathy) and E11.51 (diabetic peripheral angiopathy without gangrene) together capture both the neuropathic pain and PVD as diabetic complications – since both the neuropathy and PVD are attributable to her diabetes, a separate non-diabetic G62.9/I73.9 pairing isn’t needed on top of the diabetes combination codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b454a793-951e-4677-932f-0854c45918d3', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 69, '72-year-old Rolz was referred to home health following an inpatient stay for newly diagnosed End Stage Renal Disease (ESRD) requiring dialysis. During the admission her type 1 diabetes was found to be uncontrolled. Her PCP documented he had increased her insulin dosage in an effort to better control her high blood sugars. She has comorbid diagnoses of arteriosclerotic cardiovascular disease (ASCVD) and a recent deep vein thrombosis of her right leg requiring Coumadin. Home health has been ordered for diabetic teaching and weekly PT/INR monitoring.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9abff775-049a-4315-82a1-d31f1fb67b4a', 'b454a793-951e-4677-932f-0854c45918d3', 0, 'E10.649, N18.6, I82.401, I25.10, Z79.4, Z51.81, Z79.01, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bcea6e4b-adb6-4a56-a6f3-e4e8746d2f63', 'b454a793-951e-4677-932f-0854c45918d3', 1, 'E10.65, E10.22, N18.6, I82.401, I25.10, Z51.81, Z79.01, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e53fcbc6-7b11-41b1-a833-cbfd0ca420cb', 'b454a793-951e-4677-932f-0854c45918d3', 2, 'E10.22, N18.6, I82.401, I25.10, Z79.4, Z51.81, Z79.01, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba59f938-e41b-4270-9a6e-6c2e889574fb', 'b454a793-951e-4677-932f-0854c45918d3', 3, 'E10.65, E10.22, N18.6, I82.401, I25.10, Z79.4, Z51.81, Z79.01, Z99.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b454a793-951e-4677-932f-0854c45918d3', 'bcea6e4b-adb6-4a56-a6f3-e4e8746d2f63', 'E10.22 = type 1 diabetes with diabetic CKD (paired with N18.6 for the specific ESRD stage) captures the diabetic nephropathy pathway to her ESRD, while E10.65 separately flags the hyperglycemia/poor control (“still found to be uncontrolled”). I82.401 = acute DVT of right lower extremity. Z99.2 = dependence on renal dialysis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a2a6b44-e242-4bc5-9019-b98369e1318d', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 70, 'A patient with lumbar stenosis is referred to home care after a spinal fusion. SN is ordered to monitor the surgical site and post-op medications.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aef567c9-7802-41ba-beff-39e5715d7d45', '3a2a6b44-e242-4bc5-9019-b98369e1318d', 0, 'M43.26, Z47.89, M48.061');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('421b5b3a-5762-41ce-ac51-96b6a8d9a197', '3a2a6b44-e242-4bc5-9019-b98369e1318d', 1, 'Z47.89, M48.061, Z98.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76950ef3-5d9a-417b-af3f-816759256402', '3a2a6b44-e242-4bc5-9019-b98369e1318d', 2, 'M48.061, Z47.89, Z98.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5b1faad-ad15-491f-912a-b15c211dba3d', '3a2a6b44-e242-4bc5-9019-b98369e1318d', 3, 'Z47.89, M43.26, M48.061');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3a2a6b44-e242-4bc5-9019-b98369e1318d', '421b5b3a-5762-41ce-ac51-96b6a8d9a197', 'Z47.89 = other orthopedic aftercare (post spinal fusion). M48.061 = spinal stenosis, lumbar region, documented as the underlying condition that necessitated the fusion. Z98.1 = arthrodesis status (documents the fusion hardware/status). M43.26 (fusion of spine, lumbar) is a different concept – that code describes a congenital/acquired ANKYLOSIS, not surgical aftercare, so it’s correctly excluded here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78b880e1-79bd-432a-944a-e4047c6c81af', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 71, 'This 59-year-old does not smoke but works in a smoke-filled bar five days a week. Unfortunately, the patient has been recently diagnosed with lung cancer. While in the hospital, it was also noted that the patient needed a coronary artery bypass graft due to her coronary artery disease. The patient is admitted to home care after CABG surgery for wound care and medication management.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('330fb3be-15fa-494c-bae5-f2fbc6239cfd', '78b880e1-79bd-432a-944a-e4047c6c81af', 0, 'Z48.812, I25.10, C34.92, Z77.22, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc9b0ef4-51a1-47f6-b335-2113f68621d1', '78b880e1-79bd-432a-944a-e4047c6c81af', 1, 'C34.92, I25.10, Z48.812, Z57.31, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8caf1248-e699-437d-bf2e-6d6fe69303d8', '78b880e1-79bd-432a-944a-e4047c6c81af', 2, 'Z48.812, I25.10, C34.92, Z57.31, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('084106a6-ec1c-49bf-bac0-df1163193343', '78b880e1-79bd-432a-944a-e4047c6c81af', 3, 'Z48.812, I25.10, C34.92, Z87.891, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('78b880e1-79bd-432a-944a-e4047c6c81af', '8caf1248-e699-437d-bf2e-6d6fe69303d8', 'Z48.812 = aftercare following heart surgery, sequenced first as the reason for this HH episode. Z57.31 = occupational exposure to environmental tobacco smoke (matches “works in a smoke-filled bar,” as distinct from Z77.22 general/home exposure used in Q33). Z95.1 documents the presence of the aortocoronary bypass graft.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d67f5db4-017b-442d-85e2-141c7c4ad4f1', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 72, 'Ms. X was admitted to the hospital for severe coccyx pain (which severely affects her functional activity) and exacerbation of multiple sclerosis. A CT and bone biopsy were performed and she was diagnosed with coccyx bone cancer causing the severe coccyx pain. She also has a Foley catheter for her neurogenic bladder. The patient is now in HH for SN to teach regarding pain management (pain scale 10/10), monitor her MS, and provide Foley care. A PT evaluation is ordered for mobility issues due to pain and MS.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0015ef69-32ae-4461-a9f9-f78273e9c11d', 'd67f5db4-017b-442d-85e2-141c7c4ad4f1', 0, 'G89.3, G35A, C41.4, Z46.6, G83.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eec67514-1447-4cf8-af59-1aafda1202bf', 'd67f5db4-017b-442d-85e2-141c7c4ad4f1', 1, 'C41.4, G89.3, G35A, N31.9, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('327f5abc-7ca5-4218-a005-0d482008a675', 'd67f5db4-017b-442d-85e2-141c7c4ad4f1', 2, 'G35A, N31.9, Z46.6, G89.3, C41.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6928cbeb-cf25-42d4-917c-0ab51556b09e', 'd67f5db4-017b-442d-85e2-141c7c4ad4f1', 3, 'G89.3, C41.4, G35A, Z46.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d67f5db4-017b-442d-85e2-141c7c4ad4f1', '6928cbeb-cf25-42d4-917c-0ab51556b09e', 'G89.3 (neoplasm-related pain, chronic) is sequenced first as the dominant reason for the SN visit (severe, 10/10 pain being actively managed). C41.4 = malignant neoplasm of the coccyx/sacrum. G35A (relapsing-remitting multiple sclerosis) is used rather than the bare, non-billable G35 parent — an "exacerbation" is the defining clinical feature of the relapsing-remitting course, so the documented exacerbation itself supports this specific subtype. Z46.6 = foley catheter fitting/adjustment. N31.9 (neurogenic bladder) is not separately added since the foley/Z46.6 code and the MS code (which causes the neurogenic bladder) already sufficiently capture the clinical picture in this answer set.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 73, 'In the record you are reviewing, the referral from the wound clinic indicates an RLE wound. The clinician documents an arterial ulcer of the RLE as the only wound. In the OASIS, however, the clinician selected “2 - Yes, patient has observable stasis ulcer” on the stasis ulcer item M1330. As the coder for this record you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('187c95ea-efc4-415f-a906-e3bc04c54e3b', '2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', 0, 'Code the wound as a stasis ulcer of the RLE');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f68e1e5c-c3f2-4eae-932d-4fb6872a09fb', '2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', 1, 'Instruct the clinician to verify the type of RLE wound with the MD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('648ec47b-6de5-4f12-bfb1-95b0403ec66a', '2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', 2, 'Code the wound as an arterial ulcer of the RLE and recommend a change to M1330 to “No”');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('574f2d69-7fac-49c4-9cc4-3bd3cf7f0135', '2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', 3, 'Code the wound as an arterial ulcer of the RLE and leave M1330 as is (clinician observed)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d2ad2ef-afc9-444e-ab5b-02fe6c4de132', 'f68e1e5c-c3f2-4eae-932d-4fb6872a09fb', 'When the clinician’s own wound documentation (arterial ulcer) conflicts with their own OASIS answer (stasis ulcer), the coder cannot simply pick one side of the conflict – the safest, guideline-consistent action is to have the clinician resolve the discrepancy against the physician’s record, since arterial vs. venous stasis ulcers have different etiologies and care implications.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7053c101-a5d6-4782-b5fb-7c667e4e8c71', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 74, 'Mrs. Darby incurred a laceration to her right forearm that required stitches in the emergency room to close the wound. Her right forearm also has a superficial scratch. She is unable to complete the wound care herself due to vascular dementia that she incurred from a prior CVA. Skilled nursing has been ordered to perform wound care. Which of the following is correct for M1021 and M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e12a4ca-ef60-499a-8f40-287a6f6651ae', '7053c101-a5d6-4782-b5fb-7c667e4e8c71', 0, 'S51.811D, S50.911D, I69.398, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bad9952f-6c6e-4f0e-865c-eb19f93703ba', '7053c101-a5d6-4782-b5fb-7c667e4e8c71', 1, 'S51.811D, S50.911D, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64fab6c0-385d-40a1-9101-1aab3a8d8de0', '7053c101-a5d6-4782-b5fb-7c667e4e8c71', 2, 'S51.811D, I69.318, F01.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f779af5-e27d-460f-afd5-640c9c90df31', '7053c101-a5d6-4782-b5fb-7c667e4e8c71', 3, 'S51.811D, I69.318, G31.84, F01.50');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7053c101-a5d6-4782-b5fb-7c667e4e8c71', '64fab6c0-385d-40a1-9101-1aab3a8d8de0', 'S51.811D = open wound (laceration) of right forearm, subsequent encounter; the superficial scratch (S50.911D) is not separately coded once a more significant laceration at essentially the same region is documented. I69.318 + F01.50 = vascular dementia due to old CVA (same logic as Q1) – explains WHY skilled nursing rather than self-care is needed; I69.318 (cognitive deficits following cerebral infarction) is the specific etiology code required by F01.50''s ''code first'' convention. Option A repeats the redundant scratch code and also substitutes the nonspecific I69.398 (other sequelae) for the correct, specific I69.318. The 4th option adds G31.84 (mild cognitive impairment) stacked on top of the already-complete I69.318 + F01.50 pair — the identical redundant-coding mistake this same paper''s Q1 already establishes is wrong, since I69.318 + F01.50 together fully capture the cognitive late effect without a separate mild-cognitive-impairment code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('547c28d5-4073-4fa4-bb25-b44603f144cb', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 75, 'A 56-year-old male patient is referred to home health for speech and occupational therapy to treat tardive dyskinesia that has begun to significantly impair his speech and self-care abilities. The patient has a long-standing diagnosis of schizophrenia with use of fluphenazine, which has resulted in the tardive dyskinesia and has since been discontinued.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c32d9f21-2197-4b0d-91e9-e44cd85510ab', '547c28d5-4073-4fa4-bb25-b44603f144cb', 0, 'G24.01, T43.3X1S, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b0df517-4815-4ea2-97bd-328ca905c0a4', '547c28d5-4073-4fa4-bb25-b44603f144cb', 1, 'G24.01, T43.385D, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('362c2c6f-aeab-4a4e-ab91-16a42e69aa57', '547c28d5-4073-4fa4-bb25-b44603f144cb', 2, 'G24.01, T43.3X5S, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc8bea79-1cad-4608-b33d-5526f97834c3', '547c28d5-4073-4fa4-bb25-b44603f144cb', 3, 'G24.01, T43.3X1D, F20.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('547c28d5-4073-4fa4-bb25-b44603f144cb', '362c2c6f-aeab-4a4e-ab91-16a42e69aa57', 'G24.01 = drug induced subacute dyskinesia (tardive dyskinesia). T43.3X5- = adverse effect of phenothiazine antipsychotics (fluphenazine class), 6th character “5” for adverse effect; 7th character “S” for sequela, appropriately used here since the causative drug has already been discontinued and this is now a late effect/residual condition, not an active/current adverse reaction (that distinguishes it from Q16’s T36.8X5D, which was still an active, ongoing reaction). F20.9 = the underlying schizophrenia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78b0eae6-be4e-4949-889b-190c18ed8198', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 76, 'Mrs. Y was admitted to the hospital with fever and an infected dialysis fistula. Her infection further declined and the physician documented severe streptococcal sepsis. The sepsis caused acute renal failure. A new dialysis catheter was inserted and the patient stabilized while receiving IV antibiotics. The physician has documented that the sepsis and acute renal failure have resolved. SN is ordered for wound care to the previously infected catheter site. The patient has documented diagnoses of HTN and primary OA. Select the correct coding sequence for M1021 and M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0117466a-c10b-4bed-bd0d-90f74a5f2e92', '78b0eae6-be4e-4949-889b-190c18ed8198', 0, 'T82.9XXA, I12.0, N18.6, M19.90, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('242e27f5-8323-42c5-b6f5-e2c6915737f9', '78b0eae6-be4e-4949-889b-190c18ed8198', 1, 'T82.7XXA, I12.0, N18.6, M19.91, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a9c5f33-27b4-41e0-918b-f4023f9fe14f', '78b0eae6-be4e-4949-889b-190c18ed8198', 2, 'T82.9XXD, I12.0, N18.6, M19.90, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c78c7fe-d2fc-47c4-974f-0f53c7b980e8', '78b0eae6-be4e-4949-889b-190c18ed8198', 3, 'T82.7XXD, I12.0, N18.6, M19.91, Z99.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('78b0eae6-be4e-4949-889b-190c18ed8198', '4c78c7fe-d2fc-47c4-974f-0f53c7b980e8', 'T82.7XXD = infection/inflammatory reaction due to vascular dialysis catheter, subsequent encounter (sepsis/AKI already resolved, so this is now a follow-up/subsequent visit for the previously infected site, not an active initial infection). I12.0 = hypertensive CKD with stage 5/ESRD, matching N18.6 (which is explicitly stated by the ongoing dialysis dependence, Z99.2). M19.91 = unspecified secondary osteoarthritis – but reads oddly here since the case says “primary OA”; the more literal code would be M19.90 (primary OA), so this may be a minor discrepancy worth double-checking against your documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 77, 'A patient was born with a single cyst on her kidney that was not problematic until recently, when she developed a UTI. There was consideration of drainage of the cyst but it was determined they would wait for the UTI to clear before proceeding. The physician ordered antibiotics and home care SN to monitor the patient’s condition. Her comorbidities include right ear deafness and generalized anxiety disorder.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a1fa597-7af7-4445-ba4f-d137a7e1f60b', 'b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', 0, 'N39.0, N28.1, H91.91, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d226ff0-c7f0-466d-aad7-9e211b8877ee', 'b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', 1, 'N39.0, Q61.00, H90.5, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82efc4d0-0384-4347-ae64-54391b8dd4ca', 'b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', 2, 'N39.0, Q61.01, H91.91, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2f197c3-e13c-4d4d-aad7-6fec90bd22da', 'b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', 3, 'N39.0, Q61.01, H90.5, F41.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b1c7b8c7-9a1a-4d07-a31d-2b56b7194563', '82efc4d0-0384-4347-ae64-54391b8dd4ca', 'Q61.01 = single cyst of kidney, congenital. N39.0 = UTI, site unspecified (the acute reason for antibiotics/SN monitoring). H91.91 = unspecified hearing loss, right ear (deafness, unspecified type). F41.1 = generalized anxiety disorder.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1199cae2-502b-40ca-9cc8-c1c6dfc436b4', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 78, 'An 80-year-old lady was admitted to the hospital for an infection of a stage 3 decubitus ulcer of the sacrum. She is noted to have peripheral arterial disease with two ulcers on the right ankle. On further investigation it is found that she has atherosclerotic deposits in the right leg and has a history of diabetes. After the infection resolved, she is referred to home care for wound management of the sacrum and leg ulcers. On the day of assessment, one of the wounds on the ankle is measured to have the fat layer exposed and the other is down to muscle without signs of necrosis; the sacral decubitus ulcer is covered with 100% slough.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd77fd07-b6c8-44df-8552-9a8f3d2ec53d', '1199cae2-502b-40ca-9cc8-c1c6dfc436b4', 0, 'L89.153, E11.9, I70.433, L97.305, L97.302');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa0ff9ca-67a1-4989-8cd8-cb5975b52b62', '1199cae2-502b-40ca-9cc8-c1c6dfc436b4', 1, 'L89.150, E11.9, I73.9, L97.505, L97.502');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6321a5fc-2fb9-46ab-b32d-ddd9f5820544', '1199cae2-502b-40ca-9cc8-c1c6dfc436b4', 2, 'L89.150, E11.51, I70.233, L97.315, L97.312');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca2a7e79-7bb7-43bd-bff4-bdf6323550f8', '1199cae2-502b-40ca-9cc8-c1c6dfc436b4', 3, 'L89.150, E11.51, I70.433, L97.815, L97.812');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1199cae2-502b-40ca-9cc8-c1c6dfc436b4', '6321a5fc-2fb9-46ab-b32d-ddd9f5820544', 'I70.233 = atherosclerosis of right leg with ulceration of other part of foot, specified as with rest pain isn’t necessarily implied but the 5th/6th digit set here targets a right-leg PAD-with-ulcer combination. L97.315/L97.312 = ankle ulcer codes distinguishing depth (fat layer exposed vs. muscle, without necrosis – note the “without necrosis” 6th character, e.g. …315/…312 rather than the …815/…812 necrosis-suffix codes, correctly reflecting “without sign of necrosis” as stated). E11.51 = diabetic peripheral angiopathy without gangrene, since the PAD is attributed partly to her diabetes history.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('394c8ac6-913b-477b-857b-39246aacb695', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 79, 'Shirley, RN, conducts a skin assessment during her SOC visit. No pressure ulcer is noted. Two days later, Lucie Sykes, RN, notices a stage 2 pressure ulcer on the patient’s right heel. Should the pressure ulcer be included on the OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a87efc3b-ed2b-4b14-9817-4766fed719ca', '394c8ac6-913b-477b-857b-39246aacb695', 0, 'Yes, always include all pressure ulcers regardless of the time frame in which they are reported by a clinician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73e678e9-2e7c-4a89-b33f-8687a294d825', '394c8ac6-913b-477b-857b-39246aacb695', 1, 'No, the OASIS pressure ulcer items should be coded based on findings from the first skin assessment that is conducted on or after, and as close to, the SOC as possible');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79f932e5-ddc1-4388-8b00-8dfc51fb3d9d', '394c8ac6-913b-477b-857b-39246aacb695', 2, 'Yes, it is safe to include on the OASIS as long as the assessment is completed within 5 days of the SOC date and clinicians collaborate');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98e1d5e7-e454-4d43-a09e-de2341fc5acc', '394c8ac6-913b-477b-857b-39246aacb695', 3, 'No, the pressure ulcer must be viewed again by the same SOC clinician in order to update');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('394c8ac6-913b-477b-857b-39246aacb695', '73e678e9-2e7c-4a89-b33f-8687a294d825', 'This is the correct, well-established OASIS timing rule – pressure ulcer items are captured based on the first skin assessment at/near SOC, not updated simply because a later routine visit happens to notice something two days on; a true change would instead be captured at the next formal assessment time point (ROC/recert/follow-up), not retroactively into the SOC OASIS.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e54a5cd-a482-47dc-a390-3795883476fd', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 80, 'A patient is admitted to the hospital with swelling and redness of the left foot and leg. On examination the patient is found to have an abscess of the left foot with cellulitis. An I&D is completed and the patient was found to have MRSA on wound culture. The patient is discharged from the hospital on IV vancomycin with orders for vancomycin peaks and troughs weekly. The cellulitis is noted to be improving. Code the home health visit.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('58606a97-99d7-441c-80af-b79431a4d03f', '0e54a5cd-a482-47dc-a390-3795883476fd', 0, 'Z48.817, L03.116, B95.61, Z45.2, Z51.81, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1b5fb6b-e96b-4cd5-b731-6b8850a083cc', '0e54a5cd-a482-47dc-a390-3795883476fd', 1, 'L02.416, L03.116, B95.62, Z45.2, Z51.81, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5ffc230-e2ae-4f75-b875-705abec63c86', '0e54a5cd-a482-47dc-a390-3795883476fd', 2, 'L02.612, L03.116, B95.62, Z45.2, Z51.81, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c28f5209-6e78-4452-9977-2511c4723cfe', '0e54a5cd-a482-47dc-a390-3795883476fd', 3, 'L02.611, L03.115, B95.62, Z45.2, Z51.81, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0e54a5cd-a482-47dc-a390-3795883476fd', 'd5ffc230-e2ae-4f75-b875-705abec63c86', 'L02.612 = cutaneous abscess of left foot (the abscess that required I&D). L03.116 = cellulitis of left lower limb. B95.62 = MRSA as causative organism. Z45.2 = encounter for management of the vascular access device (for the IV vancomycin). Z51.81 = therapeutic drug level monitoring (the vancomycin peak/trough checks); Z79.2 = long-term antibiotic use. Option A substitutes an aftercare code for the abscess code entirely and uses the wrong organism (B95.61, MSSA, not MRSA). Option B uses a less specific abscess site code (L02.416, lower limb generally, rather than L02.612, foot specifically). The 4th option uses the fully correct code set but with the wrong laterality throughout (right-side codes, L02.611/L03.115) despite the stem documenting the left foot and leg.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 81, '50-year-old Mr. Potter is admitted to home health to monitor his wound care and blood pressure. Mr. Potter was admitted to the hospital for headaches and vomiting with nausea and was diagnosed with hydrocephalus. He underwent VP shunt placement for the hydrocephalus at the time of hospitalization. The patient has a history of HTN, CHF, and DM.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a153b4e4-adb2-4d5c-b8cc-0f2c14a0ec59', 'de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', 0, 'Z48.811, G91.9, E11.9, I11.0, I50.9, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e4ebc90-153b-4c27-b18d-25f579f2eb57', 'de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', 1, 'Z48.811, G91.9, I11.0, I50.9, E11.9, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6fd7614b-7df0-4b55-87a8-e15b63976d3c', 'de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', 2, 'Z48.811, E11.9, I11.0, I50.9, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('009a4932-fc09-4bae-9af6-b061abaa7c84', 'de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', 3, 'Z48.811, I11.0, I50.9, E11.9, Z98.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('de0d2fe8-bcb7-429f-aa9e-94dd72ce47ec', '2e4ebc90-153b-4c27-b18d-25f579f2eb57', 'Z48.811 = encounter for surgical aftercare following surgery on the nervous system (the VP shunt placement), sequenced first as the reason for the wound-monitoring visit. G91.9 = hydrocephalus, unspecified. I11.0/I50.9 combination for HTN+HF; Z98.2 = presence of the cerebrospinal fluid drainage device (shunt).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('60f698f0-9019-44b5-b44d-94ffc7304938', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 82, 'A 72-year-old man is referred to home care for management of aplastic anemia caused by chemotherapy, which is given for his right upper lobe lung cancer. He also experiences dementia-like symptoms such as memory loss, and he has been taking OTC medications which are generally given in dementia. He also has comorbidities of HTN and CKD stage 3a. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f490e573-e292-4809-b743-eee1b2301812', '60f698f0-9019-44b5-b44d-94ffc7304938', 0, 'D61.1, T45.1X5D, C34.91, F03.90, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('453d81e9-f8db-4b3c-afe4-20003b726a47', '60f698f0-9019-44b5-b44d-94ffc7304938', 1, 'T45.1X5D, D61.9, C34.11, R41.3, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29077b04-6b93-4047-9f09-da27afdf62ce', '60f698f0-9019-44b5-b44d-94ffc7304938', 2, 'C34.11, D61.1, T45.1X5D, F03.90, I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e8a6840-650d-4c19-99fe-074820b2bad2', '60f698f0-9019-44b5-b44d-94ffc7304938', 3, 'D61.1, T45.1X5D, C34.11, R41.3, I12.9, N18.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('60f698f0-9019-44b5-b44d-94ffc7304938', '1e8a6840-650d-4c19-99fe-074820b2bad2', 'D61.1 = drug-induced aplastic anemia (the chemo caused it). T45.1X5D = adverse effect of antineoplastic/immunosuppressive drug, subsequent encounter. C34.11 = malignant neoplasm, right upper lobe lung. R41.3 = other amnesia/memory loss is used rather than a formal dementia code (F03.9-) because the stem only describes “dementia-like symptoms”/OTC self-medicating – not an actual physician-documented dementia diagnosis, so the symptom code is correct, not a diagnosis code. I12.9 with N18.31 captures the hypertensive CKD stage 3a combination — N18.3 alone is a non-billable parent requiring the 3a/3b specification.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d92c0a58-66ef-4fef-b865-b061e9171564', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 83, 'Mr. Joey is admitted to home health for PICC site monitoring, bilateral lower extremity pain and weakness management, and assessment of dyspnea and cardiopulmonary status. Mr. Joey was admitted to the hospital for confusion, headaches, and drowsiness. He was diagnosed with an intracranial abscess and is now on IV antibiotics. He has a history of polyneuropathy, CAD, COPD, and CVA. His lower extremity pain is due to the polyneuropathy.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b96cb1f7-dff3-4f00-ac91-85ed97d69f3d', 'd92c0a58-66ef-4fef-b865-b061e9171564', 0, 'G06.2, J44.9, I25.10, G62.9, Z45.2, Z79.2, Z86.73');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae25efbc-0ffa-4b88-9c0c-faf0aabfa738', 'd92c0a58-66ef-4fef-b865-b061e9171564', 1, 'Z45.2, G06.2, I25.10, J44.9, G62.9, Z79.2, Z86.73');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8c9cf2f-3a16-43b1-913e-6b3f90b992e2', 'd92c0a58-66ef-4fef-b865-b061e9171564', 2, 'G06.0, G62.9, J44.9, I25.10, Z45.2, Z79.2, Z86.73');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9c61bf96-3be8-486e-9274-4677f48c3303', 'd92c0a58-66ef-4fef-b865-b061e9171564', 3, 'Z45.2, G06.0, J44.0, I25.10, G62.9, Z79.2, Z86.73');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d92c0a58-66ef-4fef-b865-b061e9171564', 'b8c9cf2f-3a16-43b1-913e-6b3f90b992e2', 'G06.0 = intracranial abscess (not G06.2, which is extradural/subdural – the stem doesn’t specify a subdural/extradural location, so the general intracranial code is correct). G62.9 = unspecified polyneuropathy (the documented cause of the bilateral LE pain/weakness). Z86.73 = personal history of TIA/CVA without residual deficit (his old CVA, resolved).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be988682-3dd9-41e5-82a9-54084bd47f3e', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 84, 'A patient is referred for home care after suffering a cerebral infarction due to high blood pressure. He was admitted to the hospital with right-sided weakness, slurred speech, and dysphagia, which are still present upon discharge to home. Home health orders are for SN, PT, OT, and ST. The patient’s past medical history includes HTN, asthma, and a history of colon cancer that has resolved. The patient is a former smoker.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79381c75-849d-4d7f-a965-f4e73a53516a', 'be988682-3dd9-41e5-82a9-54084bd47f3e', 0, 'I69.351, I69.391, R13.10, I69.328, I10, J45.909, Z85.038, Z87.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ba7cc86-e785-4562-9984-247022f91f0d', 'be988682-3dd9-41e5-82a9-54084bd47f3e', 1, 'I10, I69.351, I69.391, R13.10, I69.328, J45.909, Z85.038, Z87.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d424afe9-cbf6-4c9c-9dc6-9110ed5d6e27', 'be988682-3dd9-41e5-82a9-54084bd47f3e', 2, 'G81.91, R13.10, R47.81, Z86.73, I10, J45.909, Z85.038, Z87.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fb03c1c-fe84-4b20-9ebb-779d4c77b8e1', 'be988682-3dd9-41e5-82a9-54084bd47f3e', 3, 'I63.9, R47.81, R13.10, I10, J45.909, Z85.038, Z87.891');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be988682-3dd9-41e5-82a9-54084bd47f3e', '79381c75-849d-4d7f-a965-f4e73a53516a', 'Because these deficits are present at the time of THIS admission (still an active, recent infarction with ongoing deficits, not old/resolved), the acute code I69.35- family (late effects following cerebral infarction, coded even from the same hospitalization once deficits persist to discharge) applies, along with I69.328 (dysarthria following infarction, unspecified side) and R13.10 (dysphagia). Z85.038 = history of other malignant neoplasm of large intestine (resolved colon cancer');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e6002664-23a8-4276-9769-af088e961831', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 85, 'Mr. Green is an active 54-year-old male who was just hospitalized for a right TKA due to bilateral end-stage OA of the knees. He was discharged yesterday and is referred to home health for continued aftercare of the joint replacement. He will be getting his left knee replaced next month due to OA. He is on Coumadin with orders for PT/INRs, and the RN will remove staples in 14 days. The MD has ordered the RN to monitor the incision as it has been noted to be slightly red, and has put him on a preventative antibiotic. He has secondary diagnoses of HTN and GERD. Select one option.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('594422aa-783f-4692-9e0f-4b5f45ca061e', 'e6002664-23a8-4276-9769-af088e961831', 0, 'T81.41XA, M17.12, I10, K21.9, Z96.651, Z51.81, Z79.01, Z48.02, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d144f98-b02f-4bbe-a9ab-8e2439c1c2ab', 'e6002664-23a8-4276-9769-af088e961831', 1, 'Z47.3, M17.12, I10, K21.9, Z96.651, Z79.01, Z48.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b0f90fd-dab5-4c08-b26b-65d04c8b2caf', 'e6002664-23a8-4276-9769-af088e961831', 2, 'Z47.1, M17.12, I10, K21.9, Z96.651, Z51.81, Z79.01, Z48.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('099e4df5-1c8e-4103-9889-56807206e3b6', 'e6002664-23a8-4276-9769-af088e961831', 3, 'T84.53XA, M17.12, I10, K21.9, Z51.81, Z79.01, Z48.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e6002664-23a8-4276-9769-af088e961831', '2b0f90fd-dab5-4c08-b26b-65d04c8b2caf', 'Z47.1 = aftercare following joint replacement surgery (routine – no confirmed infection yet, just “slightly red” being watched, so this stays aftercare rather than an active infection complication code). M17.12 = unilateral post-traumatic… actually bilateral primary OA, right knee involved (M17.12 for right knee osteoarthritis specifically, since left hasn’t been replaced yet). Z96.651 = presence of right artificial knee joint; Z51.81 = drug monitoring (PT/INR');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07e88a1a-5014-4046-8413-dad6a8a822b9', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 86, 'Mrs. Young was admitted to home care for wound care due to superficial dehiscence and infection of her recent cesarean section abdominal wound. During her hospital stay, the wound was debrided and left open, and IV antibiotics were administered. Upon discharge, there are orders for wound VAC 3 times a week and a switch to oral antibiotics. Code this scenario.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7739b100-3b39-4c77-9114-8681aa16f7c9', '07e88a1a-5014-4046-8413-dad6a8a822b9', 0, 'O86.01, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddae803e-ac90-4934-a778-4a953a163f75', '07e88a1a-5014-4046-8413-dad6a8a822b9', 1, 'O90.0, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12ab4931-e762-46c2-8376-c5dad703da4a', '07e88a1a-5014-4046-8413-dad6a8a822b9', 2, 'T81.31XD, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('726e3e22-9edb-4a78-a290-f2cf5a636219', '07e88a1a-5014-4046-8413-dad6a8a822b9', 3, 'O90.1, E10.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('07e88a1a-5014-4046-8413-dad6a8a822b9', 'ddae803e-ac90-4934-a778-4a953a163f75', 'Note: the original exam key marked “(No answer highlighted – options crossed out in source)” — this appears mismarked. This item is identical to Q51 (dehisced C-section wound, T1DM) and the source document itself shows all four choices struck through with nothing highlighted, suggesting the test-writer flagged this as a duplicate/discard rather than a live question. For consistency, the same logic as Q51 applies: O90.0 (disruption of cesarean wound) + E10.9.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b2bc7783-461c-4b40-abcf-734f2212e948', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 87, 'Mrs. Price, a 32-year-old in her 3rd trimester of pregnancy, presented to the ER with severe headache and dizziness attributed to an exacerbation of her hypertension complicating the pregnancy. She was on blood pressure medication prior to her pregnancy, and it was changed from Atenolol to Hydralazine in her first trimester. She has a previous diagnosis of kidney disease stage 2. Mrs. Price’s hydralazine was increased. Skilled nursing is to see the patient daily for 7 days and report BP readings.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c7e0172-5bf5-45df-9100-7ecfdcb7daba', 'b2bc7783-461c-4b40-abcf-734f2212e948', 0, 'O10.011, O26.90, I10, N18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4532dd1b-e5bc-4f54-8226-d8c9524dca06', 'b2bc7783-461c-4b40-abcf-734f2212e948', 1, 'O10.213, I12.9, N18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebc1a0cf-c1f1-44b7-a282-fd2663f44bfe', 'b2bc7783-461c-4b40-abcf-734f2212e948', 2, 'I12.9, N18.2, O10.213');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f5127da-7035-4d30-a3ff-28d7bcea9022', 'b2bc7783-461c-4b40-abcf-734f2212e948', 3, 'O10.219, I10, N18.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b2bc7783-461c-4b40-abcf-734f2212e948', '4532dd1b-e5bc-4f54-8226-d8c9524dca06', 'O10.213 = pre-existing hypertensive CKD complicating pregnancy, third trimester – the combination obstetric code capturing both the HTN and the pre-existing CKD stage 2 in the context of pregnancy, sequenced first per obstetric-chapter sequencing priority. Since O10.213 already reflects hypertensive CKD, a separate I12.9 (non-obstetric hypertensive CKD code) is redundant – note that including I12.9 alongside O10.213 as shown in the marked answer is arguably duplicative; strictly, O10.213 plus N18.2 (to specify the CKD stage) would be the cleaner pairing.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fbda7210-8ffa-4b40-a133-d5ba1da15e3e', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 88, 'Mrs. Wallace, who has a long history of unstable hypertension and CAD, presented to the hospital with chest pain shortly after the death of her husband. The physician diagnosed the cause as Takotsubo syndrome. The patient’s symptoms improved with beta blockers and diuretics, and she was referred to home care for cardiac teaching and monitoring. How would you code this admission?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b65aa2c-3b5b-44ba-add6-d24f2b855e6d', 'fbda7210-8ffa-4b40-a133-d5ba1da15e3e', 0, 'I11.0, I51.81, I25.119');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf401456-5e03-41f3-8888-c863e0b3ae11', 'fbda7210-8ffa-4b40-a133-d5ba1da15e3e', 1, 'I11.0, I51.811, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b45b1301-f7af-46a1-b4a3-73e87b70be7d', 'fbda7210-8ffa-4b40-a133-d5ba1da15e3e', 2, 'I25.119, I10, I51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('225c2d98-215f-4bc8-ad99-7809691e8472', 'fbda7210-8ffa-4b40-a133-d5ba1da15e3e', 3, 'I51.81, I25.10, I10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fbda7210-8ffa-4b40-a133-d5ba1da15e3e', '225c2d98-215f-4bc8-ad99-7809691e8472', 'I51.81 = Takotsubo syndrome (stress cardiomyopathy – has its own specific code, distinct from a true MI, which is important since the physician explicitly differentiated it from an infarction). I25.10 = atherosclerotic heart disease without angina (the underlying CAD). I10 = essential hypertension (documented as “unstable” but no combination code is needed since no heart failure or CKD is stated alongside it here).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c08f56c1-4ce4-44e4-9292-45c296694431', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 89, 'A patient with hypertension, CHF with preserved ejection fraction, CKD stage 4, and diabetes mellitus is admitted to home health due to a recent exacerbation of the CHF. The CKD is due to rapidly progressive nephritic syndrome. Code the home health admission.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('479b49d0-a24d-41d1-8dd2-1f314498033a', 'c08f56c1-4ce4-44e4-9292-45c296694431', 0, 'I13.0, I50.30, E11.22, N18.4, N01.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('714d8a56-8cde-4bd5-b41c-104b3287e7a6', 'c08f56c1-4ce4-44e4-9292-45c296694431', 1, 'I11.0, I50.30, N01.9, E11.9, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('739d5df3-d704-44c4-839b-d555d142db28', 'c08f56c1-4ce4-44e4-9292-45c296694431', 2, 'I13.0, I50.30, N18.4, N01.9, E11.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8fcbaee1-661c-4518-b794-0740e9f774c2', 'c08f56c1-4ce4-44e4-9292-45c296694431', 3, 'I11.0, I50.30, N01.9, N18.4, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c08f56c1-4ce4-44e4-9292-45c296694431', '8fcbaee1-661c-4518-b794-0740e9f774c2', 'Because the CKD is specifically attributed to Rapidly Progressive Nephritic Syndrome (N01.9) – not to the diabetes or hypertension – the hypertensive-CKD combination code (I13.-) is NOT used; instead HTN and heart failure combine as I11.0+I50.30 (unspecified diastolic, “preserved EF”), while N01.9 and N18.4 are coded as separate, distinct causes of the CKD, and diabetes stands alone as E11.9 (uninvolved in the renal disease here).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('572eb186-9838-497e-8920-0fb64fef6e25', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 90, 'Mr. John is admitted to home care for management of pneumonia and bronchiectasis with acute exacerbation. The patient also has a comorbidity of chronic obstructive asthma and currently smokes 1 pack of cigarettes per day.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a31c967e-3a75-472e-a86a-283785d7b59d', '572eb186-9838-497e-8920-0fb64fef6e25', 0, 'J47.0, J18.9, J47.1, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f26a06d-581d-4132-b7d0-352fc9da4586', '572eb186-9838-497e-8920-0fb64fef6e25', 1, 'J44.0, J18.9, J44.1, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11be0cae-be96-4d8d-8a6a-b2e48bbe24c7', '572eb186-9838-497e-8920-0fb64fef6e25', 2, 'J44.0, J18.9, J44.1, J45.909, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f4c611b-5e96-4829-9a6b-b376c1950e90', '572eb186-9838-497e-8920-0fb64fef6e25', 3, 'J47.0, J18.9, J47.1, J45.909, F17.210');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('572eb186-9838-497e-8920-0fb64fef6e25', '2f4c611b-5e96-4829-9a6b-b376c1950e90', 'J47.0 = bronchiectasis with acute lower respiratory infection (links the pneumonia to the bronchiectasis directly via the combination code), with J18.9 further specifying the unspecified-organism pneumonia. J47.1 = bronchiectasis with (acute) exacerbation. J45.909 = unspecified asthma, uncomplicated (the “chronic obstructive asthma” descriptor, distinct from true COPD/J44, so not double-counted with the bronchiectasis codes). F17.210 = current nicotine dependence.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('614083eb-56d9-44c3-993c-fb15ac105707', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 91, 'The clinician indicates that the focus of care for this diabetic patient is wound care for several large trauma wounds and pressure ulcers. The visits are very long due to the five wounds that require care. The clinician lists all 5 wounds and the diabetes on the OASIS, but several other case-mix codes are documented. As the coding professional you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32375237-f5ad-4a5a-8c53-1a18d0138d72', '614083eb-56d9-44c3-993c-fb15ac105707', 0, 'Move up some of the other case-mix codes into the top 6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4208eff1-813c-490a-879c-dd01f5a308ce', '614083eb-56d9-44c3-993c-fb15ac105707', 1, 'Inform the clinician that they would be missing diagnosis points');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7842d96a-0931-4a1e-b763-5875b9e4dfa0', '614083eb-56d9-44c3-993c-fb15ac105707', 2, 'Apply the diagnosis codes to the conditions the clinician listed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a0edc66-a664-4c2c-8ee9-bba5643b2b0c', '614083eb-56d9-44c3-993c-fb15ac105707', 3, 'Move the diabetes to primary and list the other wounds');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('614083eb-56d9-44c3-993c-fb15ac105707', '7842d96a-0931-4a1e-b763-5875b9e4dfa0', 'The coder codes to what the assessing clinician actually documented as pertinent to the plan of care – not to whatever other case-mix-friendly diagnoses might exist elsewhere in the record. Moving diagnoses around, “upgrading” case-mix codes, or reordering primary/secondary status to maximize points is not the coder’s role; that would constitute inappropriate code selection driven by reimbursement rather than clinical documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9f88e112-2638-4bfe-89d7-65eb56c098c7', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 92, 'A 73-year-old patient was recently hospitalized with high-grade fever and dysuria and diagnosed with sepsis due to pyelonephritis. Urine and blood cultures have grown Candida glabrata. He was started on IV infusion of caspofungin 50 mg/day during the hospital stay and ordered to continue for the next two weeks in the home health setting.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d14b1f7-cc04-4fc9-bb70-45fb8f3a828a', '9f88e112-2638-4bfe-89d7-65eb56c098c7', 0, 'B37.7, B37.49, Z45.2, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0808f97d-2283-4a54-aaed-329e634e87a0', '9f88e112-2638-4bfe-89d7-65eb56c098c7', 1, 'B37.49, Z45.2, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('705c904f-66a1-4069-8cee-3516ba664a8e', '9f88e112-2638-4bfe-89d7-65eb56c098c7', 2, 'A41.89, B37.49, Z45.2, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('054d684d-8783-415d-95dd-166f29de2639', '9f88e112-2638-4bfe-89d7-65eb56c098c7', 3, 'A41.9, B37.49, Z45.2, Z79.899');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9f88e112-2638-4bfe-89d7-65eb56c098c7', '3d14b1f7-cc04-4fc9-bb70-45fb8f3a828a', 'B37.7 = candidal sepsis (the fungal organism identified on culture makes this a fungal sepsis, coded specifically, not the bacterial A41.- series). B37.49 = other candidiasis of other sites (covering the pyelonephritis component caused by the same Candida infection). Z79.899 = other long-term drug therapy (the ongoing antifungal).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b520f88-7796-408d-8d3b-fba45f4ccfda', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 93, 'The tabular instruction under diagnosis code X to “code also” diagnosis code Y means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a63ac228-469f-4da4-92eb-6d363b101cf1', '1b520f88-7796-408d-8d3b-fba45f4ccfda', 0, 'Diagnosis code Y must be coded after code X');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72acc7af-bc90-4d64-ac20-5bc9f42a2e4f', '1b520f88-7796-408d-8d3b-fba45f4ccfda', 1, 'Both codes X and Y must be coded if they apply');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33913007-fc47-46c2-b164-29f06d61dfd1', '1b520f88-7796-408d-8d3b-fba45f4ccfda', 2, 'Diagnosis code Y must be coded before code X');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3244b3c-a2ed-4199-bbf8-81eb29f1f623', '1b520f88-7796-408d-8d3b-fba45f4ccfda', 3, 'Both conditions must be present to code X or Y');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b520f88-7796-408d-8d3b-fba45f4ccfda', '72acc7af-bc90-4d64-ac20-5bc9f42a2e4f', '“Code also” means both conditions, if both are present/documented, should be coded together – it does not dictate a mandatory sequencing order the way “code first” does, and it doesn’t mean one code can only be used if the other is absent.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 94, 'The following is true about OASIS corrections by the coder EXCEPT:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5971c136-da0d-4cb6-b258-ded5ee0d6f02', '85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', 0, 'When the OASIS is corrected, the agency must retain a copy of the original OASIS as well as the corrected OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee9797a8-825f-4f39-b05d-fcde56c189f3', '85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', 1, 'When the sequencing of a manifestation diagnosis is not accurate, this is considered a technical correction and the coder may change the sequence');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a27105c-eff8-4e02-a577-85bc287e78d3', '85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', 2, 'The clinician must be contacted and approve any diagnosis changes suggested to a completed OASIS assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('397d2d84-392b-4f06-a656-75b87cf57a58', '85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', 3, 'The primary and secondary diagnoses are determined by the collaboration of the assessing clinician and physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('85a60b99-6f9e-44fa-93b5-d7f40a1ae7a5', '3a27105c-eff8-4e02-a577-85bc287e78d3', 'This is correctly identified as the false/exception statement – as explained under Q49, requiring clinician approval for literally any diagnosis change is too absolute, since purely technical corrections (e.g., fixing manifestation-code sequencing) can be made by the coder without going back to the clinician. This answer is internally consistent with the true rule, unlike the marked answer to Q49.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a311131f-734f-4f38-aa9e-4c4fd477a25c', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 95, 'All of the following are true about external cause codes EXCEPT:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('813582af-b8df-4ab4-a73e-de06fd3b35c3', 'a311131f-734f-4f38-aa9e-4c4fd477a25c', 0, 'Y93 activity codes are only to be reported once, at the initial encounter for treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0833cb54-d5f6-4285-ad32-13c89a9866a7', 'a311131f-734f-4f38-aa9e-4c4fd477a25c', 1, 'Y92 place of occurrence codes are only to be reported once, at the initial encounter for treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f709663c-3c00-45ab-b997-a39d3a060de1', 'a311131f-734f-4f38-aa9e-4c4fd477a25c', 2, 'There is no national requirement for mandatory ICD-10-CM external cause reporting');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b12a131-f0cc-4983-bdfe-12c426f502e2', 'a311131f-734f-4f38-aa9e-4c4fd477a25c', 3, 'Home health agencies are required to use external cause codes for all falls');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a311131f-734f-4f38-aa9e-4c4fd477a25c', '5b12a131-f0cc-4983-bdfe-12c426f502e2', 'Note: the original exam key marked “Y93 - activity codes are only to be reported once at the initial encounter for treatment.” — this appears mismarked. ⚠ Worth double-checking. Per ICD-10-CM guideline I.C.20.e, both place-of-occurrence (Y92) and activity (Y93) codes ARE explicitly limited to reporting at the initial encounter for treatment – so statement 1 as marked is actually TRUE, not the exception. There genuinely is no blanket ICD-10-CM national mandate for external cause reporting (statement 3, true) – but that’s a general-coding statement, and it doesn’t necessarily override a home-health-specific OASIS/CMS quality-reporting expectation to capture fall circumstances, which is the more defensible reading of statement 4 as the true statement (matching your own notes elsewhere in this set, which treat “HH needs external cause codes for all falls” as TRUE). If statement 4 is true, by elimination statement 1 shouldn’t be marked as the false one – this item may need to be re-checked directly against your current coding manual’s exact Y93 wording.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9790761e-f385-414f-925d-782726ffc436', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 96, '3-month-old Joseph Lovett has lumbar spina bifida with hydrocephalus. Joseph has a CSF shunt and has complete paraplegia. He is admitted to home health for SN assessment and parent education on managing care.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e7c0e75-2062-4712-9a66-79695151087d', '9790761e-f385-414f-925d-782726ffc436', 0, 'Q05.2, G82.21, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d948d130-ba04-454f-a8a2-5ac23041f5bf', '9790761e-f385-414f-925d-782726ffc436', 1, 'Q05.4, G82.21, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9d76b9a-12c9-4f93-ae51-a1d130a26531', '9790761e-f385-414f-925d-782726ffc436', 2, 'G82.21, Q05.2, Z98.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eca78102-f81e-4820-9706-88727ec6ee8a', '9790761e-f385-414f-925d-782726ffc436', 3, 'Q05.3, G82.20, Z98.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9790761e-f385-414f-925d-782726ffc436', '9e7c0e75-2062-4712-9a66-79695151087d', 'Q05.2 = lumbar spina bifida with hydrocephalus (the specific combination code capturing both the spina bifida level and the hydrocephalus together). G82.21 = paraplegia, complete. Z98.2 = presence of the CSF shunt.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2de11e93-7e96-4f7d-9e55-4551909bfb7a', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 97, 'A 64-year-old woman is admitted to home care for management of cancer of her transplanted right kidney and related pain. She is noted to have HTN, CKD stage 3a, and is currently a cigarette smoker. Her past medical history includes breast cancer 5 years ago with mastectomy and no recurrence per the oncologist.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40386b51-3759-4b2f-b7cc-8cec1d564af0', '2de11e93-7e96-4f7d-9e55-4551909bfb7a', 0, 'T86.19, C80.2, C64.1, G89.3, I12.9, N18.31, F17.210, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('713ccaaf-2a90-485e-8bdb-b1709961809c', '2de11e93-7e96-4f7d-9e55-4551909bfb7a', 1, 'C64.1, G89.3, I12.9, N18.31, F17.210, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1631461-b991-488c-ad68-f4911d44a64d', '2de11e93-7e96-4f7d-9e55-4551909bfb7a', 2, 'D64.1, G89.3, I12.0, N18.31, F17.210, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('358354c7-6141-43e0-a4b2-a5cce0e63077', '2de11e93-7e96-4f7d-9e55-4551909bfb7a', 3, 'T86.19, C64.1, G89.3, I12.0, N18.31, F17.210, Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2de11e93-7e96-4f7d-9e55-4551909bfb7a', '40386b51-3759-4b2f-b7cc-8cec1d564af0', 'T86.19 = other complication of transplanted kidney (the malignancy arising in the transplant is coded first as a transplant complication), with C80.2 = malignant neoplasm associated with transplanted organ, and C64.1 = the site-specific malignant neoplasm of the right kidney. I12.9+N18.31 for the hypertensive CKD stage 3a — N18.3 alone is a non-billable parent requiring the a/b specification. Z85.3 = personal history of breast cancer (resolved, no recurrence, so history code is appropriate here, unlike Q34 where the cancer was still active).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1214a959-b9fe-4681-9132-c237f9cca668', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 98, 'A 74-year-old female presented to the hospital with AMS, fever of 102, and lethargy. She was found to have a UTI with a urine culture positive for E. coli. She was sent home with a 14-day course of Keflex. Comorbidities include poorly controlled insulin-dependent DM, HTN, peripheral neuropathy, lymphedema, and morbid obesity with a BMI of 51. Home care is ordered for teaching related to hygiene, UTI prevention, and medication management; the focus of care is the recurrent UTIs. How would you code this?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a530eed-7e01-49c8-a624-41e8e626275f', '1214a959-b9fe-4681-9132-c237f9cca668', 0, 'N39.0, A41.51, E11.65, E11.42, I10, I89.0, E66.01, Z68.43, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('783a1971-a1cc-40b8-ae5a-c48556d43f55', '1214a959-b9fe-4681-9132-c237f9cca668', 1, 'N30.00, B96.20, E11.65, G62.9, I10, I89.0, E66.01, Z68.43, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24c9e2d1-e7ce-4727-9d48-0d3997307175', '1214a959-b9fe-4681-9132-c237f9cca668', 2, 'N39.0, B96.20, R41.82, E11.65, E11.42, I10, I89.0, E66.01, Z68.43, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e516f68-88a1-4b00-906e-67f81ae06c88', '1214a959-b9fe-4681-9132-c237f9cca668', 3, 'N39.0, B96.20, E11.65, E11.42, I10, I89.0, E66.01, Z68.43, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1214a959-b9fe-4681-9132-c237f9cca668', '7e516f68-88a1-4b00-906e-67f81ae06c88', 'N39.0 = UTI, site unspecified, sequenced first since “focus of care is the recurrent UTIs.” B96.20 = unspecified E. coli as cause. E11.65+E11.42 = poorly controlled diabetes with diabetic neuropathy. I89.0 = lymphedema, NEC. Z68.43 (BMI 50.0–59.9, adult) correctly matches the documented BMI of 51.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fe830296-b563-4861-8a42-e34b36518e40', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 99, 'The physician indicates that the patient has cirrhosis of the liver and later in the record also notes a history of alcohol dependence. When this is all the information you have, as the coder you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c71b66f-eb45-4037-820f-24bd6136c512', 'fe830296-b563-4861-8a42-e34b36518e40', 0, 'Code F10.288 as primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45731abd-47dc-4a47-b70e-93c6d39b5a10', 'fe830296-b563-4861-8a42-e34b36518e40', 1, 'Code K74.60 as primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38d1ed14-aa7f-4982-b455-525a7acb7a3d', 'fe830296-b563-4861-8a42-e34b36518e40', 2, 'Code K70.31 as primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e23d67f5-3a27-4a16-8b0c-a11ecbe445ba', 'fe830296-b563-4861-8a42-e34b36518e40', 3, 'Code K70.30 as primary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fe830296-b563-4861-8a42-e34b36518e40', '45731abd-47dc-4a47-b70e-93c6d39b5a10', 'With only “cirrhosis” and a separate, unlinked “history of alcohol dependence” documented (not stated as CURRENT alcoholic cirrhosis, and not explicitly linked by the physician as cause-and-effect), the coder cannot assume the etiology is alcoholic – doing so would be coding a diagnosis (alcoholic cirrhosis, K70.3-) that wasn’t actually stated. The safe, correct code is the unspecified/non-alcoholic cirrhosis code, K74.60, exactly as documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4c071579-4b71-4a36-87d1-f017c054af34', '2c880781-5dd0-4db9-ad3d-a9e6b4251c42', 100, 'The patient is a 62-year-old male with a past medical history of ischemic dilated cardiomyopathy, prior myocardial infarction, coronary disease with bypass surgery, and a single-chamber Medtronic implantable cardioverter-defibrillator (ICD) implanted in 2009 with generator replaced in June 2018. He presented with a pocket infection with MSSA requiring extraction of the ICD and leads. The patient is discharged to home care with IV antibiotics to treat the infection; SN is ordered for cardiac monitoring and PICC care.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75d58c6a-fbb2-4938-8998-827b30672837', '4c071579-4b71-4a36-87d1-f017c054af34', 0, 'T82.7XXD, B95.61, I25.5, I25.10, I25.2, Z45.2, Z79.2, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8716a6d0-b791-4dd9-b30a-c603887966fd', '4c071579-4b71-4a36-87d1-f017c054af34', 1, 'Z48.812, Z45.2, Z79.2, T82.7XXA, B95.61, I25.5, I25.10, I25.2, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3305f57b-3f27-43c3-9faa-234f9dba57fb', '4c071579-4b71-4a36-87d1-f017c054af34', 2, 'T82.7XXA, B95.61, I25.5, I25.10, I25.2, Z45.2, Z79.2, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c72177f4-890f-46ce-a9a7-228b52d32793', '4c071579-4b71-4a36-87d1-f017c054af34', 3, 'T82.7XXA, B95.62, I25.5, I25.10, I25.2, Z45.2, Z79.2, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4c071579-4b71-4a36-87d1-f017c054af34', '3305f57b-3f27-43c3-9faa-234f9dba57fb', 'T82.7XXA = infection/inflammatory reaction due to cardiac device (the ICD), kept as “A” (initial) since the device infection is still an active, currently-being-treated condition (the extraction just happened and IV antibiotics are ongoing) – not yet a routine aftercare/subsequent phase. B95.61 = MSSA as the organism. I25.5 = ischemic cardiomyopathy; I25.2 = old myocardial infarction; I25.10 = atherosclerotic heart disease. Note Z95.1 (presence of aortocoronary bypass graft) is retained since the CABG hardware is unrelated to and unaffected by the ICD extraction. Summary of Flagged Discrepancies Q6: C) The SN must do the first visit and the OASIS assessment. Q49: B) The clinician must be contacted and approve any diagnosis changes suggested to a completed OASIS assessment. Q66: B) Request clinician confirmation of non-healing. Q86: B) O90.0, E10.9 (same as Q51) Q95: D) Home health agencies are required to use external cause codes for all falls. All other 94 questions were checked against standard ICD-10-CM sequencing/combination-code rules and OASIS conventions and the highlighted answers were confirmed correct. A couple of individual codes (BMI Z68.- band in Q55/Q98, and the M19.9 vs M19.91 detail in Q76) are minor code-selection nuances noted inline rather than full disagreements – worth a quick check against your current code book if you want to be airtight.');

-- ---------- Paper 2: BCHH-C Practice Paper 2 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('a9fbf371-d80a-40ab-81a4-783e47a0378c', 'bchhc-practice-2', 'BCHH-C Practice Paper 2', 'bchhc', ARRAY['M1021\M1023 Sequencing', '7th Character', 'OASIS Integumentary', 'CoP']::TEXT[], 100, 'standard', true, 2);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f443ad5a-846a-43cd-8736-ba7823d499fc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 1, 'A 76-year-old is discharged home after inpatient treatment of an acute exacerbation of chronic systolic heart failure. She has hypertension, CKD stage 3, and type 2 diabetes with diabetic chronic kidney disease documented by the physician. SN is ordered for CHF disease management and daily weights.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c894cc52-b12f-4f23-a18a-09ed1e6bd725', 'f443ad5a-846a-43cd-8736-ba7823d499fc', 0, 'I11.0, I50.23, E11.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('796dbe11-c017-4e7f-9c8c-f776a70d4ac0', 'f443ad5a-846a-43cd-8736-ba7823d499fc', 1, 'I13.0, I50.23, E11.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b768cf8-e3f3-4917-a9ff-fec4731824ba', 'f443ad5a-846a-43cd-8736-ba7823d499fc', 2, 'I13.0, I50.22, E11.9, N18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('161d18ea-5879-4866-8c2e-9490ce5b481e', 'f443ad5a-846a-43cd-8736-ba7823d499fc', 3, 'I50.23, I13.0, N18.30, E11.22');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f443ad5a-846a-43cd-8736-ba7823d499fc', '796dbe11-c017-4e7f-9c8c-f776a70d4ac0', 'I13.0, I50.23, E11.22, N18.30 HTN + heart failure + CKD are all present, so the three-way combination I13.0 applies (CKD stages 1–4), followed by the specific heart failure code (acute on chronic systolic = I50.23), the diabetic CKD code E11.22 (physician linked), and the CKD stage N18.30. The heart failure and CKD codes are required “use additional” codes under I13.0.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 2, 'A patient is admitted to home health for continued IV antibiotics via a newly placed PICC line for acute osteomyelitis of the right ankle due to MSSA. Comorbidities include COPD and long-standing tobacco dependence (current smoker).');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f7f5d89-4703-4450-8b8f-3501bf77ce17', '557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', 0, 'M86.171, B95.61, J44.9, F17.210, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31746bf6-76c2-408e-aa63-b5f2f14746c5', '557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', 1, 'M86.171, B95.62, J44.9, F17.210, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3330da4e-5044-4f4e-bd5d-a312344bc65f', '557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', 2, 'Z45.2, Z79.2, M86.171, B95.61, J44.9, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04c0fa4c-afe7-4a6e-b150-48a0c14c709d', '557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', 3, 'M86.671, A41.01, J44.9, Z87.891, Z45.2, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('557a8855-ae77-4ea4-8a6b-f00abcbe5e8a', '6f7f5d89-4703-4450-8b8f-3501bf77ce17', 'M86.171, B95.61, J44.9, F17.210, Z45.2, Z79.2 The condition being treated (osteomyelitis) is primary — not the device Z-codes. MSSA as the causal organism of a localized infection is B95.61 (B95.62 is MRSA; A41.01 would be MSSA sepsis, not documented). Current smoker = F17.210, not history Z87.891. Z45.2 (attention to vascular access device) and Z79.2 (long-term antibiotics) follow.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 3, 'A 62-year-old woman is admitted to home health for incisional care following a left total mastectomy for left breast cancer. The incision is healing well with no complications. Chemotherapy will begin in three weeks. SN is ordered for surgical site monitoring and drain care.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('813d21ec-9203-4efe-9497-7953bfaabbaa', '07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', 0, 'Z48.3, C50.912, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df148e8a-f626-4d9d-9186-8efbf4332c7a', '07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', 1, 'C50.912, Z48.3, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6141007e-7d4d-4825-a728-26ff0305c737', '07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', 2, 'Z48.3, Z85.3, Z90.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24041eb6-c1be-4d0b-96a4-31fe45968e2c', '07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', 3, 'Z42.1, C50.912, Z90.13');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('07f5b11d-3ea2-45c7-9bf0-dbdb695bf583', '813d21ec-9203-4efe-9497-7953bfaabbaa', 'Z48.3, C50.912, Z90.12 Uncomplicated surgical aftercare following neoplasm surgery = Z48.3 primary. The cancer is still coded as current (C50.912) because treatment (chemo) is planned/ongoing — not Z85.3. Acquired absence of the left breast = Z90.12.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5b09d154-da20-4849-a0e5-12292abf1102', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 4, 'An 84-year-old woman sustained a fracture of the right femur greater trochanter when she stood up from her chair and her leg gave way — the physician documents a pathologic fracture due to age-related osteoporosis, treated with ORIF. She is home with PT for gait training during routine healing. She also has HTN.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e5d6c5e-f819-4a69-a5ef-d5e6885fd28f', '5b09d154-da20-4849-a0e5-12292abf1102', 0, 'S72.111D, M81.0, I10, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c837d5bd-4e2a-49db-85c9-d0d63fb77333', '5b09d154-da20-4849-a0e5-12292abf1102', 1, 'M80.051D, I10, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd9a1d40-3a8a-4d42-99e7-6131506988f8', '5b09d154-da20-4849-a0e5-12292abf1102', 2, 'M80.051A, M81.0, I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b0eb95a-9fcd-49c7-b26b-055ca2ed1bf6', '5b09d154-da20-4849-a0e5-12292abf1102', 3, 'Z47.89, M81.0, I10, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5b09d154-da20-4849-a0e5-12292abf1102', 'c837d5bd-4e2a-49db-85c9-d0d63fb77333', 'M80.051D, I10, Z91.81 A fracture from a minimal-force event that the physician attributes to osteoporosis is a pathologic fracture: M80.051- (age-related osteoporosis with current pathological fracture, right femur). M81.0 is NOT added — the M80 combination code includes the osteoporosis. 7th character D for routine healing aftercare.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('345e716f-03ec-4ebd-863b-a049d852f869', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 5, 'A patient underwent ORIF for a traumatic fracture of the left radius three weeks ago after falling off a step stool at home. She is admitted to home health for PT and routine fracture aftercare; the fracture is healing normally. Which 7th character applies to the fracture code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab6f307a-2d72-44da-ba0f-00456fdf09ac', '345e716f-03ec-4ebd-863b-a049d852f869', 0, 'A — initial encounter, because the wound still requires skilled care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80d0d216-68f2-4b8d-a855-1f436f78ec6c', '345e716f-03ec-4ebd-863b-a049d852f869', 1, 'D — subsequent encounter, because she is receiving routine care during the healing phase');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45584564-bae4-41af-b89f-a44aa62bb872', '345e716f-03ec-4ebd-863b-a049d852f869', 2, 'S — sequela, because the injury happened in the past');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0714377c-d9a5-42a9-8811-857a04a572ad', '345e716f-03ec-4ebd-863b-a049d852f869', 3, 'G — subsequent encounter for fracture with delayed healing');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('345e716f-03ec-4ebd-863b-a049d852f869', '80d0d216-68f2-4b8d-a855-1f436f78ec6c', 'D — subsequent encounter Once the patient has received active treatment (the ORIF) and is now in the routine healing/recovery phase, 7th character D applies. “A” is for active treatment of the acute injury; wound checks and PT during healing are subsequent care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79b98a37-0111-495d-9984-3fd7030a3cf9', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 6, 'A type 2 diabetic patient has a non-pressure ulcer of the left heel with fat layer exposed. The physician links the ulcer to the diabetes. SN is ordered for wound care. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb32cf35-0fcd-4e58-ab4c-8fa18700f506', '79b98a37-0111-495d-9984-3fd7030a3cf9', 0, 'E11.622, L97.422');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2896842c-064d-4868-b71b-a7bd70c9b002', '79b98a37-0111-495d-9984-3fd7030a3cf9', 1, 'E11.621, L97.421');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e95da4c-82c2-40dc-8676-569674fbd94e', '79b98a37-0111-495d-9984-3fd7030a3cf9', 2, 'L97.422, E11.622');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e448dadf-9a61-43fd-8611-173ee53e4bf6', '79b98a37-0111-495d-9984-3fd7030a3cf9', 3, 'E11.622, L97.423');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('79b98a37-0111-495d-9984-3fd7030a3cf9', 'cb32cf35-0fcd-4e58-ab4c-8fa18700f506', 'E11.622, L97.422 Diabetic skin ulcer = E11.622 (other skin ulcer), sequenced first per the “use additional code” note, then the site/severity code: left heel with fat layer exposed = L97.422.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f092b80e-350f-474c-bd9a-7e1767d6ca6b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 7, 'SN is ordered for wound care to a stage 3 pressure ulcer of the sacrum and a stage 2 pressure ulcer of the right heel. Both ulcers are open and being treated. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc01feae-f8e3-4088-bd10-d77e02deec5d', 'f092b80e-350f-474c-bd9a-7e1767d6ca6b', 0, 'L89.152, L89.611');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f7c0a088-459e-425b-983e-9570bd871aa2', 'f092b80e-350f-474c-bd9a-7e1767d6ca6b', 1, 'L89.153, L89.612');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b24b25b-d667-4775-abe8-25e554ec6816', 'f092b80e-350f-474c-bd9a-7e1767d6ca6b', 2, 'L89.154, L89.613');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e9817b6-89c2-4d0b-a7df-9271bc0dfe88', 'f092b80e-350f-474c-bd9a-7e1767d6ca6b', 3, 'L89.150, L89.610');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f092b80e-350f-474c-bd9a-7e1767d6ca6b', 'f7c0a088-459e-425b-983e-9570bd871aa2', 'L89.153, L89.612 Sacrum stage 3 = L89.153; right heel stage 2 = L89.612. Each pressure ulcer gets its own combination site+stage code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3af39636-bebb-4261-9469-bde93b3b2c1e', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 8, 'A patient was hospitalized with sepsis due to an E. coli urinary tract infection. The sepsis fully resolved before discharge, and the patient is sent home on oral antibiotics to complete treatment of the UTI. SN is ordered for medication teaching and infection monitoring. How should the home health admission be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a57d398b-f728-42ef-98cd-883dcdd328ef', '3af39636-bebb-4261-9469-bde93b3b2c1e', 0, 'A41.51, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42d4cad4-db91-4253-a8ae-e77f3dd3e663', '3af39636-bebb-4261-9469-bde93b3b2c1e', 1, 'N39.0, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc5a2683-b37a-48be-a798-c7ce1ef6c5d7', '3af39636-bebb-4261-9469-bde93b3b2c1e', 2, 'A41.9, N39.0, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3eb67c12-f5b0-49e1-a6d3-c5bed17109e9', '3af39636-bebb-4261-9469-bde93b3b2c1e', 3, 'N39.0, A41.51, B96.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3af39636-bebb-4261-9469-bde93b3b2c1e', '42d4cad4-db91-4253-a8ae-e77f3dd3e663', 'N39.0, B96.20 Sepsis resolved before discharge is not coded in home health — code only what is still being treated: the UTI (N39.0) with E. coli organism code B96.20.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('71a54523-8a0b-42d8-9b46-348812ca01fa', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 9, 'A patient is discharged home on oral fidaxomicin for recurrent Clostridioides difficile colitis. AKI that developed in the hospital resolved prior to discharge. SN is ordered for medication management and hydration monitoring.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94e58e85-8326-4224-9c9a-1f4ce2976bfd', '71a54523-8a0b-42d8-9b46-348812ca01fa', 0, 'A04.72, N17.9, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06c544ea-77ce-48d8-949c-f0895420c452', '71a54523-8a0b-42d8-9b46-348812ca01fa', 1, 'A04.71, N17.9, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52b722a9-d562-4e5f-b026-db38fb492c07', '71a54523-8a0b-42d8-9b46-348812ca01fa', 2, 'A04.71, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb139dbc-b8b9-43f5-a145-376d40001f7a', '71a54523-8a0b-42d8-9b46-348812ca01fa', 3, 'A04.72, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('71a54523-8a0b-42d8-9b46-348812ca01fa', '52b722a9-d562-4e5f-b026-db38fb492c07', 'A04.71, Z79.2 Recurrent C. difficile enterocolitis = A04.71 (A04.72 is “not specified as recurrent”). Resolved AKI is not coded. Z79.2 for the long-term antibiotic course.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df469834-8f49-43d8-ae1e-efcadd3df7d7', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 10, 'A patient is admitted to home health after coronary artery bypass grafting (CABG x2) for coronary artery disease. SN is ordered for sternal incision monitoring; the wound is healing well with no complications. Select the correct primary and secondary codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f52e056b-013a-4e3c-a39c-9f60e1abb3c0', 'df469834-8f49-43d8-ae1e-efcadd3df7d7', 0, 'I25.10, Z48.812, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a492dcf3-f478-4e44-bc53-6373d6407b3f', 'df469834-8f49-43d8-ae1e-efcadd3df7d7', 1, 'Z48.812, I25.10, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3a28725-b1cf-4c9b-bfe1-4a92f8a73b0c', 'df469834-8f49-43d8-ae1e-efcadd3df7d7', 2, 'Z48.812, Z95.1, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e36be7a-abbd-4d74-9fa2-a4e05b24901c', 'df469834-8f49-43d8-ae1e-efcadd3df7d7', 3, 'Z95.1, I25.10, Z48.812');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('df469834-8f49-43d8-ae1e-efcadd3df7d7', 'a492dcf3-f478-4e44-bc53-6373d6407b3f', 'Z48.812, I25.10, Z95.1 Uncomplicated aftercare following circulatory system surgery (Z48.812) is primary; CAD (I25.10) remains a current chronic condition; Z95.1 reports the bypass graft status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 11, 'A left-hand-dominant patient has residual left-sided hemiplegia and aphasia following a cerebral infarction six months ago. PT, OT, and ST are ordered. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75f339ff-f26a-409e-b3c6-3018bccee5eb', '8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', 0, 'I69.352, I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5f7b9be-ff34-4f03-814f-a3123fa7221b', '8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', 1, 'I69.354, I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13c2fe2e-8cdb-4497-b658-596aa10c5501', '8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', 2, 'I69.351, I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3c93bff-010e-4d6c-842f-4019d29d3dab', '8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', 3, 'G81.94, R47.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a9069d3-1f3f-4a0c-ad75-6daf6c767e2a', '75f339ff-f26a-409e-b3c6-3018bccee5eb', 'I69.352, I69.320 Left-handed patient with left-sided hemiplegia = dominant side affected → I69.352 (hemiplegia following cerebral infarction affecting left dominant side). Aphasia following cerebral infarction = I69.320. I69 codes, not G81/R47, because the deficits are documented late effects of the CVA.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e7182eff-26fe-4af5-bd66-1c65e8a9b139', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 12, 'A right-hand-dominant patient suffered a CVA with residual left-sided hemiplegia. Per the ICD-10-CM default rules, the hemiplegia is coded as affecting the:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('837e7095-f76c-4496-8264-c8a3393b8af8', 'e7182eff-26fe-4af5-bd66-1c65e8a9b139', 0, 'Dominant side — I69.351');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0d90173-96ff-41c7-a69e-98c21cb8c105', 'e7182eff-26fe-4af5-bd66-1c65e8a9b139', 1, 'Non-dominant side — I69.354');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6073a305-008e-4b49-9fc4-3545ea19dbdd', 'e7182eff-26fe-4af5-bd66-1c65e8a9b139', 2, 'Unspecified side — I69.359');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b167d30-ed5c-48fd-a143-53c3c2c5752a', 'e7182eff-26fe-4af5-bd66-1c65e8a9b139', 3, 'Dominant side, because the left side is always dominant when affected');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e7182eff-26fe-4af5-bd66-1c65e8a9b139', 'a0d90173-96ff-41c7-a69e-98c21cb8c105', 'Non-dominant side — I69.354 Default rules: if right-handed, the left side is non-dominant; if left-handed, the right side is non-dominant; for ambidextrous patients the default is dominant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4b271e20-fab7-4e18-b9d7-d056b0680074', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 13, 'A patient has oropharyngeal dysphagia documented as a late effect of a cerebral infarction. ST is ordered. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d661996a-207f-4c82-ac3a-3a23ed5fb16b', '4b271e20-fab7-4e18-b9d7-d056b0680074', 0, 'R13.12, I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a09f03cd-2342-4598-8cf5-8943a2836f2e', '4b271e20-fab7-4e18-b9d7-d056b0680074', 1, 'I69.391, R13.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a920719b-4a21-48fe-8f41-b6dc563d1013', '4b271e20-fab7-4e18-b9d7-d056b0680074', 2, 'I69.391, R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3f3a8c9-efd6-492b-9653-ef9df200ed0a', '4b271e20-fab7-4e18-b9d7-d056b0680074', 3, 'R13.10 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4b271e20-fab7-4e18-b9d7-d056b0680074', 'a09f03cd-2342-4598-8cf5-8943a2836f2e', 'I69.391, R13.12 Dysphagia following cerebral infarction (I69.391) is sequenced first, with an additional code identifying the phase — oropharyngeal = R13.12 — per the “use additional code” note at I69.391.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9c65b976-ee48-4b5e-ad01-962645be96e5', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 14, 'The physician documents “hypertension” and “congestive heart failure, unspecified” in the same record with no statement linking or unlinking them. Per current ICD-10-CM guidelines, the coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('277ab233-0207-4b77-9a24-61e15a54039e', '9c65b976-ee48-4b5e-ad01-962645be96e5', 0, 'Code I10 and I50.9 separately, since no causal link was documented');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29bd8616-13f4-4973-a488-d1a0ceae6100', '9c65b976-ee48-4b5e-ad01-962645be96e5', 1, 'Code I11.0 and I50.9, since HTN and heart failure are presumed related unless documented as unrelated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('949266ce-59d4-44b6-9cf0-2b2fff432b90', '9c65b976-ee48-4b5e-ad01-962645be96e5', 2, 'Query the physician before assigning any code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb0db364-5d4b-4408-bdcc-8fb75c675689', '9c65b976-ee48-4b5e-ad01-962645be96e5', 3, 'Code I50.9 only, since heart failure is the more acute condition');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9c65b976-ee48-4b5e-ad01-962645be96e5', '29bd8616-13f4-4973-a488-d1a0ceae6100', 'Code I11.0 and I50.9 The classification presumes a causal relationship between hypertension and heart failure (the “with” convention');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e73428c4-a635-4d4c-9ff1-1c8664ecb30e', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 15, 'A patient has hypertension and CKD stage 3a documented, with no link stated. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('434981a8-15df-426c-870b-29c8d7d0034e', 'e73428c4-a635-4d4c-9ff1-1c8664ecb30e', 0, 'I10, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27caeb8a-6db4-42d2-9db0-1ffac85c5a2d', 'e73428c4-a635-4d4c-9ff1-1c8664ecb30e', 1, 'I12.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09a5b2d4-38b3-41e0-8323-ea5396832b57', 'e73428c4-a635-4d4c-9ff1-1c8664ecb30e', 2, 'I12.0, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f58dbfb-e29d-44d6-a03a-ba8805fb5ec3', 'e73428c4-a635-4d4c-9ff1-1c8664ecb30e', 3, 'I13.10, N18.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e73428c4-a635-4d4c-9ff1-1c8664ecb30e', '27caeb8a-6db4-42d2-9db0-1ffac85c5a2d', 'I12.9, N18.31 HTN and CKD are presumed related: I12.9 (hypertensive CKD, stage 1–4 or unspecified) plus N18.31 for the stage.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d71618d-1133-407b-8011-251fb67d4fea', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 16, 'A patient with hypertension, chronic heart failure (unspecified type), and CKD stage 4 is admitted for cardiac and renal disease management. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('baa002f0-1ccc-4dcf-8f5b-4b886eeb26be', '2d71618d-1133-407b-8011-251fb67d4fea', 0, 'I11.0, I50.9, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99b27df6-5acb-4ca9-afa1-6dec973f3c69', '2d71618d-1133-407b-8011-251fb67d4fea', 1, 'I12.9, N18.4, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11f76ae7-c320-4419-9a5b-e23fef83ec29', '2d71618d-1133-407b-8011-251fb67d4fea', 2, 'I13.0, I50.9, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6644d973-36ba-4341-a030-b4ef8d1153dd', '2d71618d-1133-407b-8011-251fb67d4fea', 3, 'I13.2, I50.9, N18.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d71618d-1133-407b-8011-251fb67d4fea', '11f76ae7-c320-4419-9a5b-e23fef83ec29', 'I13.0, I50.9, N18.4 All three conditions → hypertensive heart AND CKD combination. CKD stage 4 keeps it at I13.0 (I13.2 requires CKD 5/ESRD). Use additional codes for the heart failure type and CKD stage.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dc40a27f-b473-4870-adcb-ac915f93502b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 17, 'A hypertensive patient with chronic diastolic heart failure and ESRD attends hemodialysis three times weekly. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d7233a6-c719-4f5d-a419-227d3d1f0235', 'dc40a27f-b473-4870-adcb-ac915f93502b', 0, 'I13.0, I50.32, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e76e04ef-5630-4965-8c74-68384ecf357c', 'dc40a27f-b473-4870-adcb-ac915f93502b', 1, 'I13.2, I50.32, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60bd4331-ceff-468a-90c8-05f5f6693052', 'dc40a27f-b473-4870-adcb-ac915f93502b', 2, 'I12.0, N18.6, I50.32, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c74953d4-60b3-4151-9af5-43250e7b8436', 'dc40a27f-b473-4870-adcb-ac915f93502b', 3, 'I13.2, I50.32, N18.5, Z99.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dc40a27f-b473-4870-adcb-ac915f93502b', 'e76e04ef-5630-4965-8c74-68384ecf357c', 'I13.2, I50.32, N18.6, Z99.2 ESRD moves the combination to I13.2; then the specific heart failure (chronic diastolic = I50.32), N18.6 for ESRD, and Z99.2 for dialysis dependence.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('92eab06e-19b6-47fc-bc81-71bae3b1c597', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 18, 'A patient with CKD stage 5 (not on dialysis) has physician-documented anemia in chronic kidney disease. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8635f7f2-2635-4df3-aa4c-284b4cbaa89a', '92eab06e-19b6-47fc-bc81-71bae3b1c597', 0, 'D63.1, N18.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a1cf6bd-340c-4b37-be07-ff43454ddba5', '92eab06e-19b6-47fc-bc81-71bae3b1c597', 1, 'N18.5, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83f5b070-ad97-47c0-85f8-727f9abb68fe', '92eab06e-19b6-47fc-bc81-71bae3b1c597', 2, 'N18.6, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6147523-b7a6-45d9-a4eb-76a0de6cdc38', '92eab06e-19b6-47fc-bc81-71bae3b1c597', 3, 'N18.5, D64.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('92eab06e-19b6-47fc-bc81-71bae3b1c597', '4a1cf6bd-340c-4b37-be07-ff43454ddba5', 'N18.5, D63.1 D63.1 (anemia in CKD) carries a “code first” instruction — the CKD is sequenced before the anemia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e15c6104-08fb-4dc2-8f33-526c98848d00', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 19, 'A patient receiving outpatient chemotherapy for colon cancer develops anemia that the oncologist documents as an adverse effect of the antineoplastic drug (correctly administered). Home health SN is ordered for management of the anemia. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e211072-f66d-444e-9198-c7985913fee3', 'e15c6104-08fb-4dc2-8f33-526c98848d00', 0, 'D64.81, T45.1X5D, C18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d46d9ee9-8358-48e3-b400-16f3568b18dc', 'e15c6104-08fb-4dc2-8f33-526c98848d00', 1, 'C18.9, D64.81, T45.1X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ce2c47a-b5e8-4182-ada6-755bd815cb1f', 'e15c6104-08fb-4dc2-8f33-526c98848d00', 2, 'T45.1X5D, D64.81, C18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8bbf3b73-c0e4-4766-9957-c79fdb7b5ed1', 'e15c6104-08fb-4dc2-8f33-526c98848d00', 3, 'D63.0, C18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e15c6104-08fb-4dc2-8f33-526c98848d00', '1e211072-f66d-444e-9198-c7985913fee3', 'D64.81, T45.1X5D, C18.9 Anemia due to an adverse effect of chemotherapy: the anemia (D64.81, anemia due to antineoplastic chemotherapy) is sequenced first when it is the reason for the encounter, followed by the adverse-effect T-code (T45.1X5-) and the neoplasm. (Contrast with anemia OF neoplastic disease, D63.0, where the neoplasm is coded first.)');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 20, 'A patient with unresectable pancreatic cancer is admitted to home health for management of anemia documented by the physician as “anemia of neoplastic disease.” No chemotherapy is being given. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9571593b-cf1e-4a34-a124-edfab140a4c7', 'ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 0, 'D63.0, C25.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b470541f-d9b5-4706-b4fb-2cb475588e6e', 'ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 1, 'C25.9, D63.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1fb194f-95ce-460b-9ab9-6fcd391779d6', 'ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 2, 'D64.9, C25.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56a2dec6-5236-4d3b-950d-fd0c2bb15a7e', 'ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 3, 'C25.9, D64.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ca8b7b92-eb39-4db8-915b-2e080c0d20c9', 'b470541f-d9b5-4706-b4fb-2cb475588e6e', 'C25.9, D63.0 “Anemia in neoplastic disease” (D63.0) has a “code first neoplasm” note — the malignancy is sequenced first even when the encounter is for the anemia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2472cc94-3b23-4f7e-a723-e417809a93a8', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 21, 'A patient is admitted for SN wound care to an infected right below-knee amputation stump. Wound culture grew MRSA. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('657a47f5-e4ea-4ef3-b506-ce903d3c2462', '2472cc94-3b23-4f7e-a723-e417809a93a8', 0, 'T87.43, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eca6c5bb-32ae-46f8-a735-be3c0b663dea', '2472cc94-3b23-4f7e-a723-e417809a93a8', 1, 'T87.44, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e12d176-7eae-4973-9943-ee1c6b4da9f0', '2472cc94-3b23-4f7e-a723-e417809a93a8', 2, 'T87.43, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92bfa13e-5f80-43bc-a11b-b13e7cc2536b', '2472cc94-3b23-4f7e-a723-e417809a93a8', 3, 'Z89.511, B95.62');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2472cc94-3b23-4f7e-a723-e417809a93a8', '7e12d176-7eae-4973-9943-ee1c6b4da9f0', 'T87.43, B95.62 Infection of amputation stump, right lower extremity = T87.43; MRSA as causal organism = B95.62 (B95.61 is MSSA).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a19834b-6934-40d6-9187-77cdfcb4cadc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 22, 'A patient’s abdominal surgical wound dehisced one week after open cholecystectomy, with no infection documented. She is admitted to home health for active wound care including wound VAC therapy. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('649fb83c-774d-411f-8d51-464fd9bec758', '3a19834b-6934-40d6-9187-77cdfcb4cadc', 0, 'Z48.815 — aftercare following digestive system surgery');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2ce04f4-cf96-4d91-b771-b9ebd4124865', '3a19834b-6934-40d6-9187-77cdfcb4cadc', 1, 'T81.31XA — disruption of external operation wound, initial encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d1dcca1-e977-419f-88cc-4b846c152e05', '3a19834b-6934-40d6-9187-77cdfcb4cadc', 2, 'T81.31XS — disruption of external operation wound, sequela');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6167b3a-ec6b-4abd-9577-6171a5c07aa1', '3a19834b-6934-40d6-9187-77cdfcb4cadc', 3, 'T81.41XA — infection following a procedure, superficial incisional site');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3a19834b-6934-40d6-9187-77cdfcb4cadc', 'b2ce04f4-cf96-4d91-b771-b9ebd4124865', 'T81.31XA A dehisced wound receiving active wound care (debridement/VAC-level treatment) is a surgical complication coded with T81.31X- and 7th character A while active treatment continues — not routine aftercare (Z48.815), which is only for uncomplicated recovery.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3813f281-7520-4216-98a7-ea8c9de555e2', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 23, 'At SOC the nurse notes a raised, itchy rash over the patient’s trunk. The physician confirms it is dermatitis due to amoxicillin, which the patient has been taking correctly as prescribed. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae8479ef-6038-4c2f-b355-4e96b6640542', '3813f281-7520-4216-98a7-ea8c9de555e2', 0, 'T36.0X1D, L27.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d03d2631-882a-46eb-8619-52532733b618', '3813f281-7520-4216-98a7-ea8c9de555e2', 1, 'L27.0, T36.0X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba3edad1-e2f1-408b-83f4-46807b5320f7', '3813f281-7520-4216-98a7-ea8c9de555e2', 2, 'L27.1, T36.0X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d457f429-d59f-459f-aecc-4d8b77637218', '3813f281-7520-4216-98a7-ea8c9de555e2', 3, 'L27.0, T36.0X1A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3813f281-7520-4216-98a7-ea8c9de555e2', 'd03d2631-882a-46eb-8619-52532733b618', 'L27.0, T36.0X5D Adverse effect of a correctly administered drug: code the manifestation first (L27.0, generalized skin eruption due to drugs taken internally), then the adverse-effect code T36.0X5- (penicillins, adverse effect). 5th/6th character “5” = adverse effect; “1” would be accidental poisoning.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10783527-a242-4342-b9a4-9ae9d861e883', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 24, 'A confused elderly patient accidentally took a double dose of her digoxin and was hospitalized with digoxin toxicity and bradycardia. She is discharged to home health for cardiac monitoring and medication management. How is this classified?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95aafb59-1f79-42d0-b3da-d3c2a93db102', '10783527-a242-4342-b9a4-9ae9d861e883', 0, 'Adverse effect — code the bradycardia first, then T46.0X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7eb8fe3e-5705-43b4-9fe2-5b54f224b17a', '10783527-a242-4342-b9a4-9ae9d861e883', 1, 'Poisoning, accidental — code T46.0X1D first, followed by the bradycardia');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3104223d-a11d-46a9-aafc-a8420ffd96c0', '10783527-a242-4342-b9a4-9ae9d861e883', 2, 'Underdosing — T46.0X6D first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32aa1a6a-90bd-4bb5-ad2a-fc4d66161b9d', '10783527-a242-4342-b9a4-9ae9d861e883', 3, 'Adverse effect — T46.0X5D first, then the bradycardia');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('10783527-a242-4342-b9a4-9ae9d861e883', '7eb8fe3e-5705-43b4-9fe2-5b54f224b17a', 'Poisoning, accidental — T46.0X1D first Taking the wrong dose in error is a poisoning, not an adverse effect. Poisoning codes are sequenced FIRST, followed by the manifestations (bradycardia).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('72af5050-586f-46df-bd8d-a8bb3891e415', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 25, 'A patient’s heart failure exacerbated because she could not afford her furosemide and had been skipping doses for two weeks. The physician documents the exacerbation as due to noncompliance because of financial hardship. In addition to the heart failure code, the coder should assign:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d820bb1-f7a9-4ec0-ae06-85b9476db144', '72af5050-586f-46df-bd8d-a8bb3891e415', 0, 'T50.1X5D and Z91.128');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('564ef2a4-f64e-4bac-9f51-ec1033e54658', '72af5050-586f-46df-bd8d-a8bb3891e415', 1, 'T50.1X6D and Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('262491f2-2928-46ad-9489-3653b739ca1c', '72af5050-586f-46df-bd8d-a8bb3891e415', 2, 'T50.1X1D and Z91.14');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7bb2e2c5-9686-4dd9-bf39-1d53bee43136', '72af5050-586f-46df-bd8d-a8bb3891e415', 3, 'No additional codes — noncompliance is never coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('72af5050-586f-46df-bd8d-a8bb3891e415', '564ef2a4-f64e-4bac-9f51-ec1033e54658', 'T50.1X6D and Z91.120 Underdosing: T-code with 6th character “6” (underdosing of loop diuretics = T50.1X6-), which is never primary — the exacerbated condition is coded first — plus Z91.120 (intentional underdosing due to financial hardship).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('73c98c08-13a5-48af-9ddc-5684ae2638ff', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 26, 'A patient sustained a laceration of the right lower leg when he fell from a ladder while cleaning gutters at his single-family home. The ER sutured the wound; home health SN now provides routine dressing changes during healing. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9dbe4a22-97bc-4c54-9204-b703a9234750', '73c98c08-13a5-48af-9ddc-5684ae2638ff', 0, 'S81.801D, W11.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8537cb1a-98d4-4460-9d79-db6d13c6331c', '73c98c08-13a5-48af-9ddc-5684ae2638ff', 1, 'S81.801A, W11.XXXA, Y92.017');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('346802ba-7034-4e8d-8d1d-86cd278c30e0', '73c98c08-13a5-48af-9ddc-5684ae2638ff', 2, 'W11.XXXD, S81.801D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbe4cc68-d260-49f9-9809-180c72a52bc5', '73c98c08-13a5-48af-9ddc-5684ae2638ff', 3, 'S81.801D, W10.0XXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('73c98c08-13a5-48af-9ddc-5684ae2638ff', '9dbe4a22-97bc-4c54-9204-b703a9234750', 'S81.801D, W11.XXXD Subsequent encounter (routine dressing changes during healing) → 7th character D on both the laceration and the fall-from-ladder external cause code. Y92 place-of-occurrence codes are reported only at the initial encounter, so Y92.017 is not repeated in home health.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('550886ab-a9a9-48c2-b3f6-9943fef58e18', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 27, 'A patient sustained a third-degree burn of the right hand and a second-degree burn of the right forearm in a kitchen grease fire. SN is ordered for active burn wound care to both sites. Select the correct sequencing principle and codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e198cd06-28ef-4e48-9592-8ebb80b43e51', '550886ab-a9a9-48c2-b3f6-9943fef58e18', 0, 'T22.211A, T23.301A — code burns in the order listed in the record');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88a3bcac-4a3f-4c36-9b0f-b5c07973b748', '550886ab-a9a9-48c2-b3f6-9943fef58e18', 1, 'T23.301A, T22.211A — sequence the highest-degree burn first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('091ade4a-fbbd-440d-8bad-bcf68a31e6e4', '550886ab-a9a9-48c2-b3f6-9943fef58e18', 2, 'T23.301D, T22.211D — subsequent encounter because the ER visit already occurred');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34bed9f2-82f1-48e5-98ed-144a73bc0be7', '550886ab-a9a9-48c2-b3f6-9943fef58e18', 3, 'T30.0 — one code for all burns of unspecified sites');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('550886ab-a9a9-48c2-b3f6-9943fef58e18', '88a3bcac-4a3f-4c36-9b0f-b5c07973b748', 'T23.301A, T24.231A — highest degree first When multiple burns are present, sequence the highest-severity burn first (third-degree hand before second-degree forearm). 7th character A applies while the burns are receiving active wound care. (Option letters list the principle; the second-degree right forearm burn is T22.211A.)');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b1035af6-0eb3-4d28-89ce-6f9e92550efa', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 28, 'A patient splashed drain cleaner (an alkaline chemical) on his left forearm, causing full-thickness skin damage. Which statement is correct?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d346efcc-5cb8-4194-a037-439e461d22be', 'b1035af6-0eb3-4d28-89ce-6f9e92550efa', 0, 'This is coded as a burn (T22.-) because the tissue damage is identical');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14a25e39-c602-4cac-9d9d-f1e2db3e87c0', 'b1035af6-0eb3-4d28-89ce-6f9e92550efa', 1, 'This is coded as a corrosion (T22.6-/T22.7- range) because it was caused by a chemical');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad754605-7c4a-4be9-8542-122bbadd4be7', 'b1035af6-0eb3-4d28-89ce-6f9e92550efa', 2, 'Burns and corrosions use entirely different chapters of ICD-10-CM');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d1e3299-ecfc-4386-994a-83b7a88879b4', 'b1035af6-0eb3-4d28-89ce-6f9e92550efa', 3, 'Only the external cause code differs between burns and corrosions');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b1035af6-0eb3-4d28-89ce-6f9e92550efa', '14a25e39-c602-4cac-9d9d-f1e2db3e87c0', 'Corrosion Chemical-caused tissue damage is classified as a corrosion; the burn/corrosion distinction is built into the T20–T25 codes (corrosion codes are separate subcategories), and the same sequencing rules apply.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cae19b38-a213-4f98-ad4b-c71da7ca9c24', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 29, 'The physician documents “morbid obesity.” The RN records a BMI of 42.5 in the SOC assessment, but no BMI appears in physician documentation. The coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14d669eb-61b9-40e9-b8e7-e95481b48d97', 'cae19b38-a213-4f98-ad4b-c71da7ca9c24', 0, 'Assign E66.01 only — BMI cannot be coded without physician documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('37c33172-f452-4440-b073-7ce7dc638b0b', 'cae19b38-a213-4f98-ad4b-c71da7ca9c24', 1, 'Assign E66.01 and Z68.41 — the BMI code may be based on clinician (e.g., RN/dietitian) documentation as long as the associated diagnosis is documented by the provider');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52bef72f-1353-4c73-9f84-e4b481fc7476', 'cae19b38-a213-4f98-ad4b-c71da7ca9c24', 2, 'Assign Z68.41 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2925facc-08b1-427f-bdd3-9fae245b5601', 'cae19b38-a213-4f98-ad4b-c71da7ca9c24', 3, 'Query the physician before assigning any obesity code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cae19b38-a213-4f98-ad4b-c71da7ca9c24', '37c33172-f452-4440-b073-7ce7dc638b0b', 'Assign E66.01 and Z68.41 BMI (Z68.-) may be coded from documentation by clinicians who are not the patient’s provider (nurse, dietitian), but only when an associated reportable diagnosis (obesity) is documented by the provider. BMI 42.5 = Z68.41.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('336192f1-3d87-4e0a-a3c4-b99b14a81ca9', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 30, 'A patient is admitted with physician-documented severe protein-calorie malnutrition; SN and dietitian services address nutritional repletion via new PEG tube feedings. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('628adcfe-2b8c-450d-b588-f2dd68e1541c', '336192f1-3d87-4e0a-a3c4-b99b14a81ca9', 0, 'E43, Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45b81993-0399-44a1-a13d-04ee0571d320', '336192f1-3d87-4e0a-a3c4-b99b14a81ca9', 1, 'E44.0, Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('802bd57d-3d9b-4532-afa3-40a1bc786582', '336192f1-3d87-4e0a-a3c4-b99b14a81ca9', 2, 'E46, K94.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c42ec8db-7753-46b0-beb2-e398d6886b35', '336192f1-3d87-4e0a-a3c4-b99b14a81ca9', 3, 'E43, K94.29');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('336192f1-3d87-4e0a-a3c4-b99b14a81ca9', '628adcfe-2b8c-450d-b588-f2dd68e1541c', 'E43, Z43.1 Severe protein-calorie malnutrition (unspecified severity pattern) = E43. Attention to gastrostomy for the new PEG feedings = Z43.1; there is no gastrostomy complication documented (ruling out K94.2-).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8514f581-1337-4b8e-957b-b028b9cc1e79', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 31, 'A patient has Alzheimer’s disease with dementia, without behavioral disturbance. SN is ordered for medication management and caregiver teaching. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c950322d-e7e9-4a6e-b521-8d0a90608e02', '8514f581-1337-4b8e-957b-b028b9cc1e79', 0, 'F02.80, G30.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6cabc422-4640-46d3-a527-74fff611b1d1', '8514f581-1337-4b8e-957b-b028b9cc1e79', 1, 'G30.9, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6e6b9ef-8e96-415f-a037-c105a724de02', '8514f581-1337-4b8e-957b-b028b9cc1e79', 2, 'F03.90, G30.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54172990-6672-415a-8ebf-2a57e99a4449', '8514f581-1337-4b8e-957b-b028b9cc1e79', 3, 'G30.9, F03.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8514f581-1337-4b8e-957b-b028b9cc1e79', '6cabc422-4640-46d3-a527-74fff611b1d1', 'G30.9, F02.80 Etiology/manifestation pair: code first the Alzheimer’s disease (G30.9), then dementia in diseases classified elsewhere without behavioral disturbance (F02.80). F03.90 is only for dementia without a stated cause.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87a1b02c-4e61-47ec-97eb-0aebcae97245', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 32, 'A patient has relapsing-remitting multiple sclerosis with neurogenic bladder, managed with an indwelling Foley catheter that SN changes monthly. PT addresses MS-related mobility decline. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a221d70-6fe1-4de3-9c6f-f5e7dcfcb353', '87a1b02c-4e61-47ec-97eb-0aebcae97245', 0, 'G35A, N31.9, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9dd1843e-60c3-49f6-b7d7-e288bed034e1', '87a1b02c-4e61-47ec-97eb-0aebcae97245', 1, 'N31.9, G35A, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95bde2b5-6ef4-465b-a7a6-27ef2b340b00', '87a1b02c-4e61-47ec-97eb-0aebcae97245', 2, 'G35A, N31.9, Z93.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f526b9fc-9dfa-4fd8-898a-82922db7e2ee', '87a1b02c-4e61-47ec-97eb-0aebcae97245', 3, 'G35A, R33.9, Z46.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('87a1b02c-4e61-47ec-97eb-0aebcae97245', '6a221d70-6fe1-4de3-9c6f-f5e7dcfcb353', 'G35A (relapsing-remitting multiple sclerosis, the documented specific course) is used rather than the bare, non-billable G35 parent. MS is the underlying condition and focus of therapy; neurogenic bladder N31.9, and Z46.6 for encounter for attention/changing of the urinary device.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('61533e99-5b8a-4558-894e-951796386403', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 33, 'A patient had a single seizure two years ago attributed to a medication that was discontinued; there have been no further seizures and the patient takes no anticonvulsants. The physician lists “history of seizure.” The coder should assign:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49bbc617-61ee-49ad-9e7d-41e6a27ffb43', '61533e99-5b8a-4558-894e-951796386403', 0, 'G40.909 — epilepsy, unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5979d8e9-4487-4fc3-8516-98a446bbbdb4', '61533e99-5b8a-4558-894e-951796386403', 1, 'R56.9 — unspecified convulsions');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4180ee5b-ffde-4d5d-87dd-2e3580b753c6', '61533e99-5b8a-4558-894e-951796386403', 2, 'Z86.69 — personal history of other diseases of the nervous system');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd8cd109-d488-4ae8-8c66-8edbe90e2e7f', '61533e99-5b8a-4558-894e-951796386403', 3, 'G40.901 — epilepsy, intractable');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('61533e99-5b8a-4558-894e-951796386403', '4180ee5b-ffde-4d5d-87dd-2e3580b753c6', 'Z86.69 A resolved, non-recurring seizure with no current treatment is history — not active epilepsy (G40.-) and not a current symptom (R56.9). Personal history of nervous system disease = Z86.69.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2a8e214-866a-4f08-9fda-6dcb3c09a44b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 34, 'A patient is admitted for treatment of pneumonia (organism unspecified). The patient also carries a diagnosis of COPD; no exacerbation is documented. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fecd26d9-0955-4e49-a4ae-0ad153814d62', 'a2a8e214-866a-4f08-9fda-6dcb3c09a44b', 0, 'J18.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b06cf65-8d9a-4a8c-b98d-a116219b8772', 'a2a8e214-866a-4f08-9fda-6dcb3c09a44b', 1, 'J44.0, J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72444bbe-2c39-47e4-8d0f-5eac3a230dbf', 'a2a8e214-866a-4f08-9fda-6dcb3c09a44b', 2, 'J44.1, J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('168a7122-96bc-4cd2-9cbb-4f8d20fbae1a', 'a2a8e214-866a-4f08-9fda-6dcb3c09a44b', 3, 'J18.9 only — COPD is included in the pneumonia code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2a8e214-866a-4f08-9fda-6dcb3c09a44b', '0b06cf65-8d9a-4a8c-b98d-a116219b8772', 'J44.0, J18.9 COPD with a lower respiratory infection uses the combination J44.0 (“COPD with acute lower respiratory infection”) sequenced with an additional code for the infection (J18.9). J44.1 is only added when an acute exacerbation is also documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62b80471-42c3-45f6-ba1b-ee8cbf915301', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 35, 'A patient with COPD is hospitalized with both an acute exacerbation of the COPD and pneumonia due to Pseudomonas, and comes to home health for continued treatment of both. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d93c6a74-583d-4a96-9269-f2c7f01e08e7', '62b80471-42c3-45f6-ba1b-ee8cbf915301', 0, 'J44.0, J15.1, J44.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a71cd2a-9755-447c-8090-4d7e89e5a1ed', '62b80471-42c3-45f6-ba1b-ee8cbf915301', 1, 'J44.1, J44.0, J15.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c978840b-fc33-4d1f-835d-1d04964449c8', '62b80471-42c3-45f6-ba1b-ee8cbf915301', 2, 'J44.0, J44.1 — pneumonia is not coded separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1582210a-1ba5-4f8a-bd8a-86b5987cbb81', '62b80471-42c3-45f6-ba1b-ee8cbf915301', 3, 'J15.1, J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('62b80471-42c3-45f6-ba1b-ee8cbf915301', 'd93c6a74-583d-4a96-9269-f2c7f01e08e7', 'J44.0, J15.1, J44.1 Both events documented: J44.0 (COPD with lower respiratory infection) + the pneumonia organism code (Pseudomonas = J15.1) + J44.1 (COPD with acute exacerbation). All three may be reported together per the guidelines.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a59044c9-cda0-445e-8028-2e1c23ba3b6c', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 36, 'The physician documents “asthma-COPD overlap” — the patient has both COPD (unspecified) and mild persistent asthma. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e1fa770-087c-4fdb-9e85-e03449f1347e', 'a59044c9-cda0-445e-8028-2e1c23ba3b6c', 0, 'J44.9 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2377c83-3a0c-4011-be2d-d9c800e89129', 'a59044c9-cda0-445e-8028-2e1c23ba3b6c', 1, 'J45.30 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4969f0b-21b1-4e84-83bc-7877a3c0d013', 'a59044c9-cda0-445e-8028-2e1c23ba3b6c', 2, 'J44.9, J45.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1f6cc958-3bdf-4196-9f0a-66b66cb0d97c', 'a59044c9-cda0-445e-8028-2e1c23ba3b6c', 3, 'J44.1, J45.998');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a59044c9-cda0-445e-8028-2e1c23ba3b6c', 'e4969f0b-21b1-4e84-83bc-7877a3c0d013', 'J44.9, J45.30 When asthma and COPD are both documented, code both — the COPD code plus the code for the specific type of asthma (mild persistent = J45.30).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db08c6fe-128f-4444-8164-fab6f6cf418e', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 37, 'A patient is admitted to home health for management of an acute exacerbation of bronchiectasis. Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f00a91be-d471-409c-b711-ec3e240fb93d', 'db08c6fe-128f-4444-8164-fab6f6cf418e', 0, 'J47.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da1b15b2-2586-4e07-9dbe-e8baddcedbac', 'db08c6fe-128f-4444-8164-fab6f6cf418e', 1, 'J47.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f5075ef-c0b0-4759-8c1c-7a1a0c929921', 'db08c6fe-128f-4444-8164-fab6f6cf418e', 2, 'J47.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dcecad55-cb4f-467f-962f-83fbcd5cc212', 'db08c6fe-128f-4444-8164-fab6f6cf418e', 3, 'J44.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('db08c6fe-128f-4444-8164-fab6f6cf418e', 'da1b15b2-2586-4e07-9dbe-e8baddcedbac', 'J47.1 Bronchiectasis with acute exacerbation = J47.1. J47.0 is bronchiectasis with acute lower respiratory infection; J47.9 is uncomplicated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee58c73c-0c5c-47a0-8127-67ea3193c18d', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 38, 'A patient has physician-documented chronic hypoxic respiratory failure and uses continuous home oxygen. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('373db38e-bf85-4ea1-b9bc-0c51950a3a87', 'ee58c73c-0c5c-47a0-8127-67ea3193c18d', 0, 'J96.10, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df4f41b5-70f8-44c9-8c43-18249129c9ee', 'ee58c73c-0c5c-47a0-8127-67ea3193c18d', 1, 'J96.11, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88581838-525a-4489-b032-f1a922233197', 'ee58c73c-0c5c-47a0-8127-67ea3193c18d', 2, 'J96.91, Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38345e3c-01a1-4352-841d-c53f19bfa5e8', 'ee58c73c-0c5c-47a0-8127-67ea3193c18d', 3, 'J96.11, Z99.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ee58c73c-0c5c-47a0-8127-67ea3193c18d', 'df4f41b5-70f8-44c9-8c43-18249129c9ee', 'J96.11, Z99.81 Chronic respiratory failure with hypoxia = J96.11; dependence on supplemental oxygen = Z99.81.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 39, 'A patient discharged after a prolonged ICU stay remains ventilator dependent at home, with SN and respiratory support. Which status code is required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('322eb095-6a0b-492c-b286-6cce4ecb328f', 'baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 0, 'Z99.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab76ee99-d1e8-48c8-a3eb-059a54df1b5c', 'baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 1, 'Z99.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86b04b46-69c5-4cb3-824b-8ea4a214102f', 'baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 2, 'Z93.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('096c0e17-1040-4f54-bd5e-01a9ac6285c1', 'baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 3, 'Z43.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('baf50ea7-8b4b-4b4e-9396-0374cfe70e4a', 'ab76ee99-d1e8-48c8-a3eb-059a54df1b5c', 'Z99.11 Ventilator dependence = Z99.11. Z99.81 is supplemental oxygen only; Z43.0/Z93.0 address the tracheostomy, not the ventilator.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b7b9df8e-cbe7-4b93-98ba-5667122805c7', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 40, 'SN is ordered to teach the family routine care of a well-healed, uncomplicated tracheostomy (cleaning and tube changes). Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ead9a792-8198-4180-8dd8-34d03c08b6d8', 'b7b9df8e-cbe7-4b93-98ba-5667122805c7', 0, 'Z93.0 — tracheostomy status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b54b04b-5790-4136-8f04-b5db9870b78a', 'b7b9df8e-cbe7-4b93-98ba-5667122805c7', 1, 'Z43.0 — encounter for attention to tracheostomy');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('344bf7c4-deab-417f-86e9-aac668e976e7', 'b7b9df8e-cbe7-4b93-98ba-5667122805c7', 2, 'J95.02 — infection of tracheostomy stoma');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3d4a873-99d2-4b06-b11d-a97f51b8d1e3', 'b7b9df8e-cbe7-4b93-98ba-5667122805c7', 3, 'Z43.7 — attention to artificial opening');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b7b9df8e-cbe7-4b93-98ba-5667122805c7', '8b54b04b-5790-4136-8f04-b5db9870b78a', 'Z43.0 The encounter is FOR care/teaching of the tracheostomy → attention code Z43.0. Z93.0 (status) is used only when the trach is incidental to the reason for care; no complication is documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 41, 'SN is ordered for wound care to an infected gastrostomy site with surrounding cellulitis of the abdominal wall; culture grew MSSA. The patient has type 2 diabetes. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ac0e423-2d89-472f-b317-ffcbc5e55c5e', '1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', 0, 'Z43.1, L03.311, B95.61, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('982fda5d-7a21-45bc-96c9-bc16a029e915', '1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', 1, 'K94.22, L03.311, B95.61, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e52d74a1-9c16-40bf-af56-534e8eb3fcc5', '1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', 2, 'K94.29, L03.311, B95.62, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f51c6d2-80bf-43db-90fc-7fb84de9d27b', '1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', 3, 'K94.23, B95.61, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1243fc5f-e25d-4292-bfa6-d1e0d5a78adb', '982fda5d-7a21-45bc-96c9-bc16a029e915', 'K94.22, L03.311, B95.61, E11.9 An infected gastrostomy is a gastrostomy complication: K94.22 (gastrostomy infection) with “use additional” codes for the cellulitis (abdominal wall = L03.311) and organism (MSSA = B95.61). K94.29 is for other complications like excoriation, not infection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1884026-ab38-4a22-8423-98971d0c3260', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 42, 'A patient with a well-functioning colostomy created two years ago (self-managed, no problems) is admitted to home health for an unrelated CHF exacerbation. How is the colostomy captured?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a6c900f3-3783-47a6-96c4-906a039884c1', 'a1884026-ab38-4a22-8423-98971d0c3260', 0, 'Z43.3 — attention to colostomy');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c83290fb-9cbe-4ca3-bad7-8bc05903be39', 'a1884026-ab38-4a22-8423-98971d0c3260', 1, 'Z93.3 — colostomy status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e2a8895-8d4a-487e-95a0-fbbd895c7960', 'a1884026-ab38-4a22-8423-98971d0c3260', 2, 'K94.00 — colostomy complication, unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eef0b503-82e4-4dff-8693-9419c5440adf', 'a1884026-ab38-4a22-8423-98971d0c3260', 3, 'It is not coded at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1884026-ab38-4a22-8423-98971d0c3260', 'c83290fb-9cbe-4ca3-bad7-8bc05903be39', 'Z93.3 A well-functioning, self-managed ostomy that is not the focus of care is reported with the status code Z93.3 — not attention (Z43.3) and not a complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a45ff28-b921-4288-8b83-a8c9a161a64b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 43, 'A patient with a chronic indwelling Foley catheter develops a UTI that the physician attributes to the catheter; the E. coli UTI is being actively treated at home with oral antibiotics, and SN performs catheter changes. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('199a31cd-9deb-4e71-8e64-d36b30a8fb26', '8a45ff28-b921-4288-8b83-a8c9a161a64b', 0, 'N39.0, B96.20, T83.511A, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('185d2695-f8c1-4d4c-86e6-2f32b49463a7', '8a45ff28-b921-4288-8b83-a8c9a161a64b', 1, 'T83.511A, N39.0, B96.20, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3afd41c9-4f11-4d0d-9927-a992954b782a', '8a45ff28-b921-4288-8b83-a8c9a161a64b', 2, 'T83.511D, N39.0, B96.20, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2105c187-bfe9-4465-8aac-ccf15a4e4cb6', '8a45ff28-b921-4288-8b83-a8c9a161a64b', 3, 'N39.0, T83.510A, B96.20, Z46.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a45ff28-b921-4288-8b83-a8c9a161a64b', '185d2695-f8c1-4d4c-86e6-2f32b49463a7', 'T83.511A, N39.0, B96.20, Z46.6 A catheter-associated UTI is a device complication: T83.511- (infection due to indwelling urethral catheter) sequenced first with 7th character A while the infection is actively treated, then the UTI and organism, then Z46.6 for the catheter care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d4bf067-cd8f-4569-b225-e82e7b0b091d', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 44, 'A patient underwent an uncomplicated elective right total hip replacement for primary osteoarthritis five days ago. PT and SN are ordered for joint aftercare and incision monitoring; there are no complications. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0702d36-f7a8-49ca-9022-67f0fd9e9435', '5d4bf067-cd8f-4569-b225-e82e7b0b091d', 0, 'Z47.1, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('899b27b7-dc93-4539-a796-a0157a0fac5b', '5d4bf067-cd8f-4569-b225-e82e7b0b091d', 1, 'M16.11, Z47.1, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5194d0c4-307c-404c-9393-d6748915b735', '5d4bf067-cd8f-4569-b225-e82e7b0b091d', 2, 'Z47.1, M16.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5425fdd0-1192-49c8-9b5d-1ebaff86f178', '5d4bf067-cd8f-4569-b225-e82e7b0b091d', 3, 'Z96.641, Z47.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5d4bf067-cd8f-4569-b225-e82e7b0b091d', 'a0702d36-f7a8-49ca-9022-67f0fd9e9435', 'Z47.1, Z96.641 Uncomplicated joint replacement aftercare = Z47.1 primary, plus the joint presence code Z96.641 (right artificial hip). The osteoarthritis is NOT coded — it was resolved by removal/replacement of the joint.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e8ab607d-ee0b-4200-871f-f91b57ea5237', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 45, 'Which statement correctly distinguishes aftercare (Z47.1) from a complication code following joint replacement surgery?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('543e6522-a0b2-4b72-9bb1-6822e06b6908', 'e8ab607d-ee0b-4200-871f-f91b57ea5237', 0, 'Z47.1 is used whenever therapy is ordered, even if the prosthesis is infected');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c9c4935-87a4-4f26-8fa6-759b62e91143', 'e8ab607d-ee0b-4200-871f-f91b57ea5237', 1, 'A complication code (T84.-) is assigned instead of aftercare when the encounter is for treatment of a documented prosthetic complication such as infection or mechanical loosening');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfca08c2-fc18-485d-a375-a913aaa3465f', 'e8ab607d-ee0b-4200-871f-f91b57ea5237', 2, 'Both Z47.1 and the T84.- complication code must always be assigned together');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f44f8c93-77b1-49dc-ad52-0b16dd75ecc0', 'e8ab607d-ee0b-4200-871f-f91b57ea5237', 3, 'Complication codes may only be used during the inpatient stay');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e8ab607d-ee0b-4200-871f-f91b57ea5237', '8c9c4935-87a4-4f26-8fa6-759b62e91143', 'Aftercare Z-codes are for uncomplicated recovery; when the encounter treats a documented prosthetic complication (T84.- infection, mechanical loosening, etc.), the complication code is assigned instead of Z47.1.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 46, 'A right-hand-dominant patient has residual weakness of the left arm and leg following a stroke; therapy is ordered. The physician documents “left hemiparesis due to old CVA.” Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a031bc5-439a-4003-8266-d8869e34a16c', '0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', 0, 'I69.351');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67187359-dec1-4b7f-a067-a1e8f4da4dc0', '0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', 1, 'I69.354');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('567fe784-a322-4bb3-85cf-49d240c6b854', '0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', 2, 'G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('705296aa-d2d1-46a6-920b-618527bc9fbe', '0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', 3, 'I69.359');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0c53103a-f02b-4ddd-b8a3-199f5fa2d3dc', '67187359-dec1-4b7f-a067-a1e8f4da4dc0', 'I69.354 Right-hand-dominant with left-sided residual weakness = non-dominant side → I69.354. Documented late effect of CVA takes the I69 category, not G81.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('af484bee-2f78-4f0e-b24f-3833390840d3', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 47, 'Per ICD-10-CM, if a patient is documented as ambidextrous and has hemiplegia following a CVA, the default is to code the affected side as:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42ea57ff-412d-495a-83e0-c121596232e7', 'af484bee-2f78-4f0e-b24f-3833390840d3', 0, 'Non-dominant');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67c6e5bb-5a87-4442-a1ae-1d30c25413d1', 'af484bee-2f78-4f0e-b24f-3833390840d3', 1, 'Dominant');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2bf5a54d-63d6-4000-a0b5-a0cfba3e05db', 'af484bee-2f78-4f0e-b24f-3833390840d3', 2, 'Unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc5618d5-f57e-4fe2-98de-be845f9d3f60', 'af484bee-2f78-4f0e-b24f-3833390840d3', 3, 'Whichever side the coder chooses');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('af484bee-2f78-4f0e-b24f-3833390840d3', '67c6e5bb-5a87-4442-a1ae-1d30c25413d1', 'Dominant Per the ICD-10-CM guideline defaults: ambidextrous patients default to dominant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db2bd520-0540-45aa-ab08-5b79062ff9c9', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 48, 'A patient completed treatment for right breast cancer four years ago with lumpectomy and radiation. There is no current disease and no ongoing treatment. She is admitted to home health for an unrelated hip fracture. The breast cancer history is captured with:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44a0fd6c-9ffc-46a3-8f30-a23283f38a17', 'db2bd520-0540-45aa-ab08-5b79062ff9c9', 0, 'C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ecb6095-f7fb-4831-b32b-d1cb8873cbeb', 'db2bd520-0540-45aa-ab08-5b79062ff9c9', 1, 'Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f7eb1930-fa94-4ef7-9664-de527bf573ca', 'db2bd520-0540-45aa-ab08-5b79062ff9c9', 2, 'Z85.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88997a5b-befa-4fb0-9bfa-3e498b54159a', 'db2bd520-0540-45aa-ab08-5b79062ff9c9', 3, 'Z80.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('db2bd520-0540-45aa-ab08-5b79062ff9c9', '7ecb6095-f7fb-4831-b32b-d1cb8873cbeb', 'Z85.3 Primary breast malignancy previously excised, no further treatment, no recurrence → personal history code Z85.3.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43c67f52-8c4b-4efc-a017-b3d1d1536e33', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 49, 'A patient has bone metastases from prostate cancer. The prostate cancer itself was previously excised and the oncologist documents no evidence of primary disease; treatment is now directed only at the bone metastases. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61ec2737-bf82-4f31-a7cf-d2ff070323a3', '43c67f52-8c4b-4efc-a017-b3d1d1536e33', 0, 'C61, C79.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b618ec35-fcac-490d-8ee2-46eb3d21337a', '43c67f52-8c4b-4efc-a017-b3d1d1536e33', 1, 'C79.51, Z85.46');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('23e63d40-ec96-4a33-bc7a-59937e8807e1', '43c67f52-8c4b-4efc-a017-b3d1d1536e33', 2, 'C79.51, C61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6240e579-dec0-4998-9390-aaa0b9a82458', '43c67f52-8c4b-4efc-a017-b3d1d1536e33', 3, 'Z85.46, C79.51');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43c67f52-8c4b-4efc-a017-b3d1d1536e33', 'b618ec35-fcac-490d-8ee2-46eb3d21337a', 'C79.51, Z85.46 Treatment is directed at the secondary site only: the metastasis (C79.51) is coded as current, and the eradicated primary becomes history — Z85.46 (personal history of prostate cancer).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('61538c9f-301b-49a5-905c-e69e5bf04955', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 50, 'A home health nurse administers antineoplastic chemotherapy in the home for a patient’s non-Hodgkin lymphoma. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b64d23b-a3ad-418f-8a08-35c0cad2f835', '61538c9f-301b-49a5-905c-e69e5bf04955', 0, 'C85.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75dfd05d-36b4-4ab8-aba3-0bf9596a643f', '61538c9f-301b-49a5-905c-e69e5bf04955', 1, 'Z51.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('895456fc-a0a5-4651-88e0-6f813a2acc3d', '61538c9f-301b-49a5-905c-e69e5bf04955', 2, 'Z51.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b01fad6-599e-48af-8950-98c280e7d759', '61538c9f-301b-49a5-905c-e69e5bf04955', 3, 'Z08');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('61538c9f-301b-49a5-905c-e69e5bf04955', '75dfd05d-36b4-4ab8-aba3-0bf9596a643f', 'Z51.11 When the encounter is solely for administration of antineoplastic chemotherapy, Z51.11 is sequenced first, followed by the malignancy.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8c4d30cc-1f55-4a2f-937b-447bfae7280c', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 51, 'A patient with asymptomatic HIV-positive status (never had an HIV-related illness) is admitted to home health following knee replacement. How is the HIV status captured?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c0b062bc-bf65-4434-962a-bde9d1b01244', '8c4d30cc-1f55-4a2f-937b-447bfae7280c', 0, 'B20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e1ade7a5-67e9-48aa-ab85-1692fdde9f28', '8c4d30cc-1f55-4a2f-937b-447bfae7280c', 1, 'Z21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30180152-aef9-4789-8e02-38cf291f0546', '8c4d30cc-1f55-4a2f-937b-447bfae7280c', 2, 'R75');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b44d8d63-0206-472a-ab22-62953ddc32a8', '8c4d30cc-1f55-4a2f-937b-447bfae7280c', 3, 'Z20.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8c4d30cc-1f55-4a2f-937b-447bfae7280c', 'e1ade7a5-67e9-48aa-ab85-1692fdde9f28', 'Z21 Asymptomatic HIV-positive status with no history of HIV-related illness = Z21. Once any HIV-related condition has ever been documented, B20 is used permanently instead.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5aaa481-579e-48ea-8504-74523df123ce', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 52, 'Per the Official Guidelines, when severe sepsis with septic shock is currently present and being treated, the correct coding structure is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5811001d-116f-4b4f-b1e2-fc62f687dcaf', 'e5aaa481-579e-48ea-8504-74523df123ce', 0, 'R65.21 first, then the underlying infection');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ec0f8f2-eaea-4b12-8720-fda7e966e3a1', 'e5aaa481-579e-48ea-8504-74523df123ce', 1, 'The underlying systemic infection code first, then R65.21, plus codes for any organ dysfunction');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('736f74ac-ec9e-44c6-b9cf-d156b6442ea3', 'e5aaa481-579e-48ea-8504-74523df123ce', 2, 'Only the organ dysfunction codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b49f19b5-febc-4b64-9e65-714127f3fbbd', 'e5aaa481-579e-48ea-8504-74523df123ce', 3, 'A41.9 alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e5aaa481-579e-48ea-8504-74523df123ce', '5ec0f8f2-eaea-4b12-8720-fda7e966e3a1', 'Underlying infection first, then R65.21, plus organ dysfunction codes Severe sepsis structure: systemic infection code (e.g., A41.-) first, then R65.21 (severe sepsis with septic shock), then codes for the associated organ dysfunction.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('943d334a-6eaa-4ae0-9c21-343fd861dc7c', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 53, 'A patient with long-standing rheumatoid arthritis (no organ involvement documented) receives SN for injectable methotrexate teaching. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31875a0c-f81e-4176-83ad-ee539e5858a9', '943d334a-6eaa-4ae0-9c21-343fd861dc7c', 0, 'M06.9, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26fed8b7-c92e-4a72-95ed-346b6ee3138e', '943d334a-6eaa-4ae0-9c21-343fd861dc7c', 1, 'M05.9, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('098c5f8a-007a-4703-93ea-1fa8aa06e787', '943d334a-6eaa-4ae0-9c21-343fd861dc7c', 2, 'M06.9, Z51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c96a709-be27-4e0e-8ece-35ce18e6d4c7', '943d334a-6eaa-4ae0-9c21-343fd861dc7c', 3, 'M19.90, Z79.899');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('943d334a-6eaa-4ae0-9c21-343fd861dc7c', '31875a0c-f81e-4176-83ad-ee539e5858a9', 'M06.9, Z79.899 Rheumatoid arthritis without documented rheumatoid factor detail defaults to M06.9 (other RA). Long-term methotrexate is captured with Z79.899 (other long-term drug therapy).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 54, 'A patient’s traumatic right ankle fracture was casted eight weeks ago. X-ray now shows delayed healing, and the orthopedist documents “delayed union.” The patient continues home PT. Which 7th character applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e929d4e0-7d30-49d8-8b38-f653ea96f0d0', 'e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 0, 'D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af06ed2b-6419-4343-b5f9-87885d6b47ca', 'e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 1, 'G');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6fdded8e-e1ec-452b-8db5-cc6931829ba9', 'e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 2, 'K');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6435ee78-dd54-4648-8dc9-6a464850b502', 'e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 3, 'S');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e21f3568-0c4c-4e54-a64b-03e8ac90e2ad', 'af06ed2b-6419-4343-b5f9-87885d6b47ca', 'G Delayed healing/delayed union of a fracture = 7th character G (subsequent encounter for fracture with delayed healing).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('37189bed-755e-470f-9259-d3e3ef914e22', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 55, 'The orthopedist documents nonunion of a traumatic left femoral shaft fracture that occurred five months ago. Which 7th character applies to the fracture code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8901db64-13c3-4191-9a28-52bea71086f0', '37189bed-755e-470f-9259-d3e3ef914e22', 0, 'D — routine healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('233242ff-6e2b-4385-977b-54265f355f0f', '37189bed-755e-470f-9259-d3e3ef914e22', 1, 'G — delayed healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46cccea9-eebe-43b8-823b-83aea589267e', '37189bed-755e-470f-9259-d3e3ef914e22', 2, 'K — nonunion');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2faaba84-be59-4bd1-be99-ba80dd6a508e', '37189bed-755e-470f-9259-d3e3ef914e22', 3, 'P — malunion');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('37189bed-755e-470f-9259-d3e3ef914e22', '46cccea9-eebe-43b8-823b-83aea589267e', '"Nonunion" is the specific, documented healing status the physician has identified, and ICD-10-CM has a dedicated 7th character for exactly this: K. This is distinct from the more commonly-tested D (routine/expected healing) — nonunion means the fracture fragments have failed to fuse despite the expected healing timeframe having passed, a genuinely different clinical course requiring different follow-up (often surgical revision) than a fracture healing on schedule. G (delayed healing) is a lesser, intermediate finding — healing is behind schedule but still progressing, not yet failed — and doesn''t match "nonunion" as explicitly documented here. P (malunion) describes a fracture that healed, but in a faulty position — also a different, specific finding not supported by this stem.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ed8c2562-ede6-43de-9947-e06bbc826bda', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 56, 'A patient has type 1 diabetes managed with an insulin pump. Per the guidelines, the coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('101d080b-6230-4723-877e-c91aab2da1c8', 'ed8c2562-ede6-43de-9947-e06bbc826bda', 0, 'Assign E10.- plus Z79.4 for the insulin use');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1997863e-765f-45c2-bbb3-4aef9eed6429', 'ed8c2562-ede6-43de-9947-e06bbc826bda', 1, 'Assign E10.- without Z79.4, because insulin use is intrinsic to type 1 diabetes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('112c4ee1-0fe0-483d-b49b-7b2d2bd81f63', 'ed8c2562-ede6-43de-9947-e06bbc826bda', 2, 'Assign E11.- plus Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be96fe8b-0e10-4511-86e0-93a475835496', 'ed8c2562-ede6-43de-9947-e06bbc826bda', 3, 'Assign Z79.4 as the principal diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ed8c2562-ede6-43de-9947-e06bbc826bda', '1997863e-765f-45c2-bbb3-4aef9eed6429', 'E10.- without Z79.4 For type 1 diabetes, insulin use is intrinsic to the condition, so Z79.4 is not assigned. Z79.4 is used for type 2 (or secondary) diabetes managed with insulin.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 57, 'A patient is admitted for pneumonia treatment. The record documents fever, productive cough, and shortness of breath. Per the guidelines, the coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a660da0-c40d-42b6-b420-c0414d89bd26', '8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', 0, 'Code the pneumonia and all three symptoms');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('321af195-e72f-44bd-a551-16c912a521d5', '8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', 1, 'Code the pneumonia only — signs and symptoms integral to a confirmed diagnosis are not coded separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('93c0baac-63b8-4c81-a80a-ed5364abcb0c', '8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', 2, 'Code the symptoms only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6d00430-c66c-4f13-88a7-5627006e8df8', '8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', 3, 'Code the pneumonia and only the fever');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8adf08f4-4cb8-4f38-ac90-90e4f0f3bc3b', '321af195-e72f-44bd-a551-16c912a521d5', 'Code the pneumonia only Signs and symptoms that are integral to a confirmed diagnosis (fever, cough, SOB with pneumonia) are not coded separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('597e58f2-b580-4726-b168-f7b1412831f7', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 58, 'In an etiology/manifestation convention pair (e.g., a code with a “code first” note and a code “in diseases classified elsewhere”), the correct sequencing is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('84150f51-f3b6-4fb8-9dea-b04ead1db7d2', '597e58f2-b580-4726-b168-f7b1412831f7', 0, 'The manifestation code first, then the etiology');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9168ec84-f1e5-42e9-9220-c5d6057c1580', '597e58f2-b580-4726-b168-f7b1412831f7', 1, 'The etiology code first, then the manifestation code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3b47319-bce4-4f2c-83b2-20e7514db471', '597e58f2-b580-4726-b168-f7b1412831f7', 2, 'Either order is acceptable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25c294eb-4200-4326-b084-4f4244e82779', '597e58f2-b580-4726-b168-f7b1412831f7', 3, 'Only the manifestation is coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('597e58f2-b580-4726-b168-f7b1412831f7', '9168ec84-f1e5-42e9-9220-c5d6057c1580', 'Etiology first, then manifestation The etiology/manifestation convention requires the underlying condition (“code first”) to be sequenced before the manifestation (“in diseases classified elsewhere”');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1bd76b83-5356-4f6f-84ab-14acf66e26c8', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 59, 'An Excludes1 note under a code means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4caec2ff-9945-4d1f-b5b3-ac409617739a', '1bd76b83-5356-4f6f-84ab-14acf66e26c8', 0, 'The excluded code may be assigned with the code when both conditions coexist');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe8ba1a3-13dd-41c3-b474-68d234ec5154', '1bd76b83-5356-4f6f-84ab-14acf66e26c8', 1, 'The two conditions can never be coded together (they are mutually exclusive), unless they are unrelated to each other');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5f74ee4-281d-430e-bb83-e99214407435', '1bd76b83-5356-4f6f-84ab-14acf66e26c8', 2, 'The excluded condition is included in the code above');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d9fde5c-7d9f-463b-8bcd-7f678d56b7db', '1bd76b83-5356-4f6f-84ab-14acf66e26c8', 3, 'The coder must query the physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1bd76b83-5356-4f6f-84ab-14acf66e26c8', 'fe8ba1a3-13dd-41c3-b474-68d234ec5154', 'Excludes1 = “not coded here” — the two conditions are mutually exclusive and generally cannot be reported together, with the narrow exception that they may be reported together when the two conditions are documented as unrelated to each other.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1d06afbb-d9d0-4fe2-822b-c7a09893324a', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 60, 'An Excludes2 note under a code means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d1b62d8-1662-47d2-aff9-b57b6adda293', '1d06afbb-d9d0-4fe2-822b-c7a09893324a', 0, 'The excluded condition is not part of the condition represented by the code, but the two codes may be assigned together when the patient has both conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6228b3c7-882d-46f2-9cf1-ec9166d7a234', '1d06afbb-d9d0-4fe2-822b-c7a09893324a', 1, 'The two codes can never appear together');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec8d9815-4447-4747-a5db-707d52e6a62f', '1d06afbb-d9d0-4fe2-822b-c7a09893324a', 2, 'The excluded code replaces the code above');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35eaaa5e-9df1-4bbd-9ab3-c31bf72ae6c8', '1d06afbb-d9d0-4fe2-822b-c7a09893324a', 3, 'The note applies only to inpatient coding');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1d06afbb-d9d0-4fe2-822b-c7a09893324a', '6d1b62d8-1662-47d2-aff9-b57b6adda293', 'Excludes2 = “not included here” — the excluded condition is separate from the code above, and both codes may be assigned together when the patient has both.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('214b7441-2fc6-4e0a-ac28-8190537dafc5', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 61, '“NEC” (not elsewhere classifiable) in the ICD-10-CM index indicates:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('730d8fd1-0601-4733-bae1-1dbebdeea1e2', '214b7441-2fc6-4e0a-ac28-8190537dafc5', 0, 'The documentation is insufficient to assign a specific code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57d8e00a-ff26-43e7-a061-6851ebfe5118', '214b7441-2fc6-4e0a-ac28-8190537dafc5', 1, 'The record documents a specific condition, but the classification does not provide a specific code for it — an “other specified” code is used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ccfb6a04-00a3-4931-b2ea-c2277f137fcc', '214b7441-2fc6-4e0a-ac28-8190537dafc5', 2, 'The condition is unspecified in the record');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('abe8bbcd-1f28-4ba9-846d-46644af19771', '214b7441-2fc6-4e0a-ac28-8190537dafc5', 3, 'The code is invalid for home health');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('214b7441-2fc6-4e0a-ac28-8190537dafc5', '57d8e00a-ff26-43e7-a061-6851ebfe5118', 'NEC means the documentation is specific but the classification lacks a matching specific code, so an “other specified” code is assigned. NOS is the reverse — the documentation itself is unspecific.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 62, 'The clinician documents “diabetic foot ulcer” but does not indicate laterality, and the OASIS wound documentation is also silent on side. As the coder you would:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3c6a8e92-44df-435d-807a-0893dea61b64', '8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', 0, 'Default to the right side');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a2b1fe8-0188-49e7-9038-1a5e82d8677d', '8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', 1, 'Assign the unspecified-site code and move on');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('956c753b-98de-46f5-80f5-312a85e55406', '8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', 2, 'Contact the assessing clinician to confirm laterality/site so the most specific code can be assigned');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ac09689-3215-4436-a421-14ade88e5ad8', '8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', 3, 'Assign codes for both feet');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8687dd2e-4dab-420a-bb17-2e1cf3deb7bc', '956c753b-98de-46f5-80f5-312a85e55406', 'Contact the assessing clinician Home health coders must code to the highest specificity supported by documentation; missing laterality warrants collaboration with the assessing clinician (who may verify with the physician) rather than defaulting or guessing.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5e362bfa-ae23-4a4a-b118-91fc9af2d872', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 63, 'In home health, the primary diagnosis reported in M1021 should be:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c40f9995-9eb4-4556-9e9e-8a031bbc0053', '5e362bfa-ae23-4a4a-b118-91fc9af2d872', 0, 'The diagnosis listed first on the hospital discharge summary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a2ac811-93f6-45d6-b58c-bc02352f9fd9', '5e362bfa-ae23-4a4a-b118-91fc9af2d872', 1, 'The chief reason for the home health admission — the diagnosis most related to the current plan of care and skilled services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26f43fbe-6e20-4e66-9788-d72defcc8265', '5e362bfa-ae23-4a4a-b118-91fc9af2d872', 2, 'The diagnosis with the highest case-mix points');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fa93f26-2113-4b7b-9a77-e465f25a385b', '5e362bfa-ae23-4a4a-b118-91fc9af2d872', 3, 'The oldest chronic condition');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5e362bfa-ae23-4a4a-b118-91fc9af2d872', '8a2ac811-93f6-45d6-b58c-bc02352f9fd9', 'M1021 is the diagnosis most related to the current home health plan of care — the chief reason skilled services are being provided — which is not necessarily the hospital’s principal diagnosis or the highest-scoring code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('372c960c-9d5b-43d7-bd36-252c8d79127d', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 64, 'How many primary diagnoses may be reported on the OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b7da787-8dde-4dd3-978f-e2e1d18b0301', '372c960c-9d5b-43d7-bd36-252c8d79127d', 0, 'One');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6696dfe-abdc-4582-baea-32cb6bcec1ce', '372c960c-9d5b-43d7-bd36-252c8d79127d', 1, 'Two');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0380131-627a-4a6a-a5dd-c0fe58274c1d', '372c960c-9d5b-43d7-bd36-252c8d79127d', 2, 'Up to six');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60017dfd-b9a4-4e34-a0b9-0417c5455fcf', '372c960c-9d5b-43d7-bd36-252c8d79127d', 3, 'As many as apply');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('372c960c-9d5b-43d7-bd36-252c8d79127d', '3b7da787-8dde-4dd3-978f-e2e1d18b0301', 'Only one primary diagnosis is reported on the OASIS at M1021 — this reflects the single, principal reason for the home health episode of care, the condition most related to the current plan of care. This is distinct from M1023, which allows reporting of additional/other diagnoses (up to five) that coexist and are relevant to the patient''s care but are not the primary focus. Reporting more than one primary diagnosis would misrepresent the episode''s actual focus and is not supported by OASIS data-collection rules.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cdd45c6d-159a-41d5-ba5e-062f436b2c13', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 65, 'Which of the following may NOT be reported as a primary home health diagnosis?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fca6af68-f563-414d-8b0f-fd0dcca32a07', 'cdd45c6d-159a-41d5-ba5e-062f436b2c13', 0, 'A resolving surgical aftercare Z-code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2c0605d-8d37-4719-b489-87dc3e7ded6e', 'cdd45c6d-159a-41d5-ba5e-062f436b2c13', 1, 'An external cause (V, W, X, Y) code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4cb8c9a5-4242-4917-8547-e208f39bf564', 'cdd45c6d-159a-41d5-ba5e-062f436b2c13', 2, 'A symptom code when no definitive diagnosis is established');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e63097b-e914-498f-a518-6098fdec09bf', 'cdd45c6d-159a-41d5-ba5e-062f436b2c13', 3, 'A chronic disease code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cdd45c6d-159a-41d5-ba5e-062f436b2c13', 'e2c0605d-8d37-4719-b489-87dc3e7ded6e', 'An external cause code V-Y external cause codes may never be reported as primary. Aftercare Z-codes and, when no definitive diagnosis exists, symptom codes can be primary; chronic diseases frequently are.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5ca74b53-6aab-487b-9215-d31693d9f5c6', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 66, 'Skilled nursing and physical therapy are both ordered at SOC. Per the Medicare Conditions of Participation, who must perform the initial assessment visit and the SOC comprehensive assessment (OASIS)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af2e6066-6842-4a66-8ed0-376c3c522cf2', '5ca74b53-6aab-487b-9215-d31693d9f5c6', 0, 'Either discipline, as long as the visit occurs timely');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5454464f-b26e-472c-a4ae-913943af3615', '5ca74b53-6aab-487b-9215-d31693d9f5c6', 1, 'The registered nurse');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1f6dad7-4613-4948-80e0-1843ced0d0f7', '5ca74b53-6aab-487b-9215-d31693d9f5c6', 2, 'The physical therapist, if therapy is the primary service');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2fdf2e07-8f53-4b91-933e-c4119b7f331e', '5ca74b53-6aab-487b-9215-d31693d9f5c6', 3, 'Whoever the agency schedules first');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5ca74b53-6aab-487b-9215-d31693d9f5c6', '5454464f-b26e-472c-a4ae-913943af3615', 'The registered nurse Per 42 CFR 484.55, when nursing is ordered, the RN must perform the initial assessment visit and the SOC comprehensive assessment (OASIS).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('abc8f1c8-cc20-412a-beca-566feea4f76b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 67, 'Orders are for physical therapy ONLY (no nursing). Who may perform the initial assessment and SOC OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33c5fe4b-2e7b-4e35-9c94-07594f2b34e5', 'abc8f1c8-cc20-412a-beca-566feea4f76b', 0, 'Only an RN may ever perform an OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a01dae2-ed21-45b8-95f3-70577cd7f23f', 'abc8f1c8-cc20-412a-beca-566feea4f76b', 1, 'The physical therapist may perform the initial assessment and the SOC comprehensive assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('436c9d44-1511-4d8d-88ae-10865012ff31', 'abc8f1c8-cc20-412a-beca-566feea4f76b', 2, 'An LPN');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b049e59-05cf-4cc8-9b07-c3f68f2fe3a2', 'abc8f1c8-cc20-412a-beca-566feea4f76b', 3, 'A home health aide');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('abc8f1c8-cc20-412a-beca-566feea4f76b', '4a01dae2-ed21-45b8-95f3-70577cd7f23f', 'The physical therapist When therapy is the only ordered discipline (therapy-only case), the qualified therapist (PT/SLP/OT per the rules) may perform the initial assessment and SOC OASIS.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a70b5a68-1100-40e6-b535-558c2eb8f638', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 68, 'The SOC comprehensive assessment must be completed within what timeframe?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('805604e3-89b7-4c99-bac6-1496ff606559', 'a70b5a68-1100-40e6-b535-558c2eb8f638', 0, 'Within 24 hours of referral');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('23f50214-6e2d-4ee7-884c-114bc96d433d', 'a70b5a68-1100-40e6-b535-558c2eb8f638', 1, 'Within 5 days after the start of care date');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f536135d-3a5e-4d65-acce-d00fe623b0cc', 'a70b5a68-1100-40e6-b535-558c2eb8f638', 2, 'Within 7 days of the first visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c57f0e0d-b8dc-4e5c-ad3d-02a4a2eb2c80', 'a70b5a68-1100-40e6-b535-558c2eb8f638', 3, 'Within 48 hours of hospital discharge, no exceptions');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a70b5a68-1100-40e6-b535-558c2eb8f638', '23f50214-6e2d-4ee7-884c-114bc96d433d', 'Within 5 days after the SOC date The SOC comprehensive assessment must be completed within 5 calendar days after the start of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('adb9ffd5-7544-4a9c-9666-1134284c40fc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 69, 'The recertification OASIS assessment must be completed:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff5dab94-253e-4bb8-a26d-69813d386269', 'adb9ffd5-7544-4a9c-9666-1134284c40fc', 0, 'During the last 5 days of the current 60-day certification period (days 56–60)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb7fd7d3-643b-45f3-a802-d98cfe062fd4', 'adb9ffd5-7544-4a9c-9666-1134284c40fc', 1, 'Any time in the last 2 weeks of the episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66633488-99aa-490e-95be-33b76f5ede91', 'adb9ffd5-7544-4a9c-9666-1134284c40fc', 2, 'Within 5 days after the new period begins');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3b234c2-18c6-44ea-8dab-3b388578c351', 'adb9ffd5-7544-4a9c-9666-1134284c40fc', 3, 'On day 60 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('adb9ffd5-7544-4a9c-9666-1134284c40fc', 'ff5dab94-253e-4bb8-a26d-69813d386269', 'Days 56–60 The recertification assessment must be conducted during the last 5 days of the current 60-day certification period.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 70, 'A coder reviewing a completed SOC OASIS believes a different diagnosis should be primary based on the referral documents. The correct action is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('085059d0-4571-4509-ad74-d9a2dd47698c', '3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', 0, 'Change the primary diagnosis — coders own diagnosis selection');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('290ab81f-6387-4ecd-ae9b-c0aeb3b1887e', '3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', 1, 'Contact the assessing clinician, who must agree to and approve any diagnosis change to the completed assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1780833-3d1b-4b3b-92e6-24f38c6d14f1', '3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', 2, 'Leave it and note the disagreement in the chart');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a7ac697-d4d6-48d9-b765-b03ee5840eef', '3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', 3, 'Ask the physician to change the OASIS directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3d37a3f0-71a8-4871-81a3-b0be4e55a7dd', '290ab81f-6387-4ecd-ae9b-c0aeb3b1887e', 'Contact the assessing clinician Diagnosis changes to a completed OASIS require collaboration with — and approval by — the assessing clinician; the coder cannot unilaterally change clinical content (only technical corrections such as fixing manifestation sequencing are coder-level changes).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 71, 'At recertification, a stage 4 sacral pressure ulcer has granulated so that only subcutaneous tissue is now visible. How is it reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2872dad4-a517-4057-9fd3-a032ae475444', 'dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', 0, 'Stage 3, reflecting current depth');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d48e5e5-5a7e-4afe-a247-dee9bff37add', 'dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', 1, 'Stage 4 — pressure ulcers are never reverse-staged; a healing stage 4 remains a stage 4 until fully healed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32b73b8c-fb9a-4d6f-abb0-2393e379df2f', 'dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', 2, 'Stage 2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('055ed074-e897-4dd3-aa20-f00289dc6244', 'dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', 3, 'Unstageable');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dc36532d-8ea1-40c8-80a6-2aa1697d5b4c', '6d48e5e5-5a7e-4afe-a247-dee9bff37add', 'Stage 4 Pressure ulcers are never reverse-staged. A granulating stage 4 remains a stage 4 (healing) until fully closed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('02691247-a919-411f-9208-e1f19e8d763a', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 72, 'A previously documented stage 3 pressure ulcer of the left buttock is now fully epithelialized and closed. For ICD-10-CM coding at this SOC:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('795898e3-c4ab-49a0-947f-518e637055de', '02691247-a919-411f-9208-e1f19e8d763a', 0, 'Code L89.323 as if still open');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03b037d6-9419-43f9-a2b9-315f26b0a5ee', '02691247-a919-411f-9208-e1f19e8d763a', 1, 'A healed pressure ulcer is not coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('649fe93f-1a5c-406e-965b-858e40c42318', '02691247-a919-411f-9208-e1f19e8d763a', 2, 'Code L89.320 (unstageable)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2e10b67-2a29-43ff-9575-9801a3c8189c', '02691247-a919-411f-9208-e1f19e8d763a', 3, 'Code Z87.2 as primary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('02691247-a919-411f-9208-e1f19e8d763a', '03b037d6-9419-43f9-a2b9-315f26b0a5ee', 'Not coded Completely epithelialized/healed pressure ulcers are not assigned an L89 code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a147df7-3eac-42e0-9254-79a5eb6a329b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 73, 'A sacral pressure ulcer is completely covered with slough and eschar so that the wound bed cannot be visualized. Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1cc6ba6-dfb8-4ab0-b3fe-66120e616b7b', '8a147df7-3eac-42e0-9254-79a5eb6a329b', 0, 'L89.159 — sacral pressure ulcer, unspecified stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05c46c9b-2c09-464b-b472-026fab89a66c', '8a147df7-3eac-42e0-9254-79a5eb6a329b', 1, 'L89.150 — sacral pressure ulcer, unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53b7cacb-1ba4-46ea-8448-2004ba9c59aa', '8a147df7-3eac-42e0-9254-79a5eb6a329b', 2, 'L89.154 — sacral pressure ulcer, stage 4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b28ecfb4-61d0-41d1-8fb9-8ecaf9108a18', '8a147df7-3eac-42e0-9254-79a5eb6a329b', 3, 'L89.153 — sacral pressure ulcer, stage 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a147df7-3eac-42e0-9254-79a5eb6a329b', '05c46c9b-2c09-464b-b472-026fab89a66c', 'L89.150 A wound bed obscured by slough/eschar cannot be staged → unstageable, 6th character 0. “Unspecified” (9) means the documentation failed to state a stage, which is different from clinically unstageable.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b14a5686-7e8c-484a-aeb5-f8e7af20c48e', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 74, 'The clinician documents a “deep tissue pressure injury” of the right heel — intact skin with a deep purple discoloration. Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4761111d-ac9a-4ceb-b0cb-026219c7ba55', 'b14a5686-7e8c-484a-aeb5-f8e7af20c48e', 0, 'L89.611 — right heel, stage 1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05b6dd43-485f-458e-9b6a-ce1e3a2c7bb2', 'b14a5686-7e8c-484a-aeb5-f8e7af20c48e', 1, 'L89.616 — right heel pressure-induced deep tissue damage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0d9573a-de1b-4456-b375-176330cea8f7', 'b14a5686-7e8c-484a-aeb5-f8e7af20c48e', 2, 'L89.610 — right heel, unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79ad5677-4180-4c39-b6d5-f83657488559', 'b14a5686-7e8c-484a-aeb5-f8e7af20c48e', 3, 'L89.619 — right heel, unspecified stage');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b14a5686-7e8c-484a-aeb5-f8e7af20c48e', '05b6dd43-485f-458e-9b6a-ce1e3a2c7bb2', 'L89.616 Deep tissue pressure injury (intact skin, deep discoloration) has its own 6th character 6 codes: right heel = L89.616.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a56ec1e6-81ba-4dbe-b470-58cb4663c323', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 75, 'A patient has a venous stasis ulcer of the right calf (skin breakdown only) with documented varicose veins of the right lower extremity with inflammation. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bad616d0-3506-4f5d-a413-353fc431e37f', 'a56ec1e6-81ba-4dbe-b470-58cb4663c323', 0, 'L97.211, I83.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f064a37f-203d-43c6-8450-ec67e78497b5', 'a56ec1e6-81ba-4dbe-b470-58cb4663c323', 1, 'I83.211, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4bcc78fa-a3ad-48d8-96b9-540f2ef85d98', 'a56ec1e6-81ba-4dbe-b470-58cb4663c323', 2, 'I87.2, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7a8afaf-86f1-422a-8690-dbdd06d55b8e', 'a56ec1e6-81ba-4dbe-b470-58cb4663c323', 3, 'I83.212, L97.212');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a56ec1e6-81ba-4dbe-b470-58cb4663c323', 'f064a37f-203d-43c6-8450-ec67e78497b5', 'I83.211, L97.211 Venous ulcers require the underlying venous condition to be coded first: varicose veins of the right lower extremity with both ulcer and inflammation = I83.211, then the site/severity code L97.211 (right calf, breakdown of skin).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9fa99f4a-fe55-483c-bf7b-5c2598dcf992', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 76, 'A patient has an ulcer of the left midfoot due to documented atherosclerosis of the native arteries of the left leg; the ulcer extends into the fat layer. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3bcade63-9ef0-42f1-b095-eec45027ee55', '9fa99f4a-fe55-483c-bf7b-5c2598dcf992', 0, 'I70.244, L97.522');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2630e666-1a25-4f70-a1e8-43589df004d2', '9fa99f4a-fe55-483c-bf7b-5c2598dcf992', 1, 'L97.522, I70.244');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1a6646d-eaad-482a-a142-ee368f6ed848', '9fa99f4a-fe55-483c-bf7b-5c2598dcf992', 2, 'I70.243, L97.521');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb70040d-32e3-40b8-a779-ec08a07f0683', '9fa99f4a-fe55-483c-bf7b-5c2598dcf992', 3, 'I73.9, L97.529');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9fa99f4a-fe55-483c-bf7b-5c2598dcf992', '3bcade63-9ef0-42f1-b095-eec45027ee55', 'I70.244, L97.522 Atherosclerosis of native arteries of the left leg with ulceration of the heel/midfoot = I70.244, coded first, then L97.522 (left heel and midfoot, fat layer exposed).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e6e1cf25-7653-4040-8ecc-b55a9d51b940', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 77, 'For OASIS item M1340 (surgical wound), which of the following IS considered a current surgical wound?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e756cdc0-de41-468e-9f0a-9d8d9ba57277', 'e6e1cf25-7653-4040-8ecc-b55a9d51b940', 0, 'A PICC line insertion site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3c3bd1b7-ff00-44c7-b8d3-89fd211ffcff', 'e6e1cf25-7653-4040-8ecc-b55a9d51b940', 1, 'An implanted venous access port (implanted infusion device) still in place');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01c3de3a-ccef-4cff-8475-fd3cdc3c63d9', 'e6e1cf25-7653-4040-8ecc-b55a9d51b940', 2, 'A chest tube exit site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39f00c3d-dc9b-4b14-9440-16cf4e7b4cad', 'e6e1cf25-7653-4040-8ecc-b55a9d51b940', 3, 'A cataract extraction site');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e6e1cf25-7653-4040-8ecc-b55a9d51b940', '3c3bd1b7-ff00-44c7-b8d3-89fd211ffcff', 'An implanted venous access port Per OASIS guidance, implanted infusion devices/venous access devices are considered surgical wounds while in place. PICC lines (not implanted), chest tubes, and mucosal/eye procedures are not.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e474114-4f5f-4301-8c61-cecc07f616a0', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 78, 'Which of the following would be EXCLUDED as an observable surgical wound on the OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e91e0fa-39c2-40bf-ba05-62cd5b1c8755', '8e474114-4f5f-4301-8c61-cecc07f616a0', 0, 'A healing CABG sternal incision');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fde0ee3-82f5-496e-937a-5f8d08bdd42c', '8e474114-4f5f-4301-8c61-cecc07f616a0', 1, 'An orthopedic pin site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16c7aed5-195d-4e0b-bf72-9ead00582f84', '8e474114-4f5f-4301-8c61-cecc07f616a0', 2, 'Surgery to mucosal membranes (e.g., oral surgery)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d08e901-c043-4e87-8d08-1eba8bebf1c1', '8e474114-4f5f-4301-8c61-cecc07f616a0', 3, 'A laparoscopic port site with intact sutures');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8e474114-4f5f-4301-8c61-cecc07f616a0', '16c7aed5-195d-4e0b-bf72-9ead00582f84', 'Surgery to mucosal membranes Mucosal surgical sites (oral, GU, etc.) and cataract surgery are not observable surgical wounds; incisions, orthopedic pin sites, and lap port sites are.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('44cf4865-095e-4887-a569-0c33c29c1368', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 79, 'The physician documents type 2 diabetes and CKD stage 3 in the same record, with no statement connecting them. Per the “with” convention, the coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa76ec4a-3a68-422c-bc56-e96b5c13e2db', '44cf4865-095e-4887-a569-0c33c29c1368', 0, 'Code E11.9 and N18.30 separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2a6b34e-423f-48ee-ba4c-e29bd39fbbbf', '44cf4865-095e-4887-a569-0c33c29c1368', 1, 'Code E11.22 and N18.30 — the conditions are presumed linked by the term “with” in the Alphabetic Index unless documented as unrelated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e938c5d3-057d-4197-81a8-23df1597ed9a', '44cf4865-095e-4887-a569-0c33c29c1368', 2, 'Query before coding anything');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91a066c0-5526-4751-b227-903fabbca6fb', '44cf4865-095e-4887-a569-0c33c29c1368', 3, 'Code N18.30 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('44cf4865-095e-4887-a569-0c33c29c1368', 'c2a6b34e-423f-48ee-ba4c-e29bd39fbbbf', 'E11.22 and N18.30 The index term “with” presumes a causal relationship between diabetes and CKD unless the provider documents they are unrelated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3b349653-6cc5-4a6c-96a2-4e9563745dd4', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 80, 'The physician documents type 2 diabetes and a left heel ulcer, with nothing linking or unlinking them. The coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f90d3d4f-8346-4df9-838a-c89c4476fc86', '3b349653-6cc5-4a6c-96a2-4e9563745dd4', 0, 'Never link diabetes and ulcers without an explicit statement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7e4cc67-ad8b-4233-8310-1d7f00ac3de6', '3b349653-6cc5-4a6c-96a2-4e9563745dd4', 1, 'Presume the link and assign E11.622 with the appropriate L97- code, per the “with” convention');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('477e4125-9389-4597-96b8-009cd112a5c7', '3b349653-6cc5-4a6c-96a2-4e9563745dd4', 2, 'Assign only the L97- code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8dae9b73-5ea3-4707-af2d-d484037f077f', '3b349653-6cc5-4a6c-96a2-4e9563745dd4', 3, 'Assign E11.9 and L97.429 with no linkage');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3b349653-6cc5-4a6c-96a2-4e9563745dd4', 'c7e4cc67-ad8b-4233-8310-1d7f00ac3de6', 'Presume the link Same “with” convention: diabetes with a foot/heel ulcer is presumed diabetic (E11.622 + L97-site code) absent documentation of another cause.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 81, 'The physician documents hypertension, heart failure, and CKD, and separately states the heart failure is due to viral cardiomyopathy and NOT related to the hypertension. The coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1f3d3495-1821-46db-a74f-ad89f5999bf1', '1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 0, 'Still assign I13.0 — the presumption cannot be overcome');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcd12ce7-b41e-4985-9f71-f5c27ad1b007', '1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 1, 'Assign I12.- for the HTN/CKD relationship, plus I50.- and the cardiomyopathy separately, since the provider unlinked the heart failure from the hypertension');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3dd94618-7236-47ab-b878-32c3d91cb691', '1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 2, 'Assign I11.0 anyway');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d98bfa3-9695-4746-a05e-d59dc2615a7c', '1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 3, 'Assign I10, I50.9, N18.9 with no combination codes');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1c6ce3b6-c683-4dbb-bf70-f22b0a711ba6', 'fcd12ce7-b41e-4985-9f71-f5c27ad1b007', 'The presumption is rebuttable: when the provider attributes the heart failure to another cause, the HF is unlinked from the HTN — code the HTN/CKD combination (I12.-) plus the heart failure and cardiomyopathy separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 82, 'A widow presented with chest pain shortly after her husband’s funeral and was diagnosed with Takotsubo (stress-induced) cardiomyopathy. Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b0ccf2e-0af9-4415-b8d6-c0d68aaa62d4', 'e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 0, 'I42.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2d7edeb-d90f-44a4-b259-eecc9748d750', 'e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 1, 'I51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd01c5f1-2c9c-462a-9d68-fe367cd5e061', 'e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 2, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('caca5c8b-8141-464c-9d9d-ff475873cfcc', 'e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 3, 'I25.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e14cb4d4-c510-4c49-a57c-d7d7b5b3d104', 'b2d7edeb-d90f-44a4-b259-eecc9748d750', 'I51.81 Takotsubo (stress-induced/broken-heart) syndrome = I51.81.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 83, 'The physician documents “persistent atrial fibrillation.” Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20ccb914-a1d4-4b60-8518-d4c1c1a623a4', 'aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', 0, 'I48.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77ee0837-d737-4ecf-8030-fc49373b6ef1', 'aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', 1, 'I48.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31a82e57-3160-47ec-93d1-146b8c3b9386', 'aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', 2, 'I48.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8223f3e9-1ac4-40a7-b138-201b361d0a9f', 'aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', 3, 'I48.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aaf90c19-364a-4d1e-9a87-4c7bfd1f5f1b', '77ee0837-d737-4ecf-8030-fc49373b6ef1', 'I48.19 “Persistent atrial fibrillation” (not otherwise specified as longstanding) = I48.19, other persistent atrial fibrillation. I48.0 is paroxysmal; I48.20 is chronic/permanent unspecified; I48.91 is unspecified afib.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2de1d49e-a977-45a6-b5ec-38f77f5eb538', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 84, 'A patient has documented coronary artery disease of the native arteries with stable angina pectoris. Select the correct code(s).');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8404805-cd33-43d6-b9ba-37b035abc785', '2de1d49e-a977-45a6-b5ec-38f77f5eb538', 0, 'I25.10, I20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('717a122f-9574-4803-8068-fb5862c50c66', '2de1d49e-a977-45a6-b5ec-38f77f5eb538', 1, 'I25.119');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('37a64d6e-7451-4101-b6d7-7181b1e249e3', '2de1d49e-a977-45a6-b5ec-38f77f5eb538', 2, 'I20.9, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69eab1ad-a706-47ec-851a-ff684e5a61d6', '2de1d49e-a977-45a6-b5ec-38f77f5eb538', 3, 'I25.10 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2de1d49e-a977-45a6-b5ec-38f77f5eb538', '717a122f-9574-4803-8068-fb5862c50c66', 'I25.119 CAD of native arteries with angina uses the combination code I25.119 (with unspecified angina');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 85, 'A patient had an ST-elevation MI seven months ago, with no current ischemic symptoms. How is the old MI captured today?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a93b6c2-2d39-4a35-a363-a571e9e8561d', '8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 0, 'I21.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b082babe-4789-4b7d-ae28-00ebfed46a73', '8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 1, 'I22.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9949715-b7be-4206-bf25-84623b54cd39', '8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 2, 'I25.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('092bdb41-71b8-44d2-a2b2-23d38cab5fcf', '8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 3, 'Z86.79');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8ff61c65-eec5-479f-9bf9-f4cdf89168b8', 'a9949715-b7be-4206-bf25-84623b54cd39', 'I25.2 An MI older than 4 weeks with no current symptoms = old myocardial infarction, I25.2.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('344f9d99-b264-4aaa-8ffb-d275f60fa2fc', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 86, 'A patient suffered an acute anterior wall STEMI, and two weeks later — still within four weeks of the first MI — sustained a second acute MI (NSTEMI). For the current home health episode both are still within the 4-week acute window. The correct structure is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44702606-8127-4176-8c33-0469c1a8cdd4', '344f9d99-b264-4aaa-8ffb-d275f60fa2fc', 0, 'Code only the most recent MI');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01f0ae0b-ab07-4ee5-b76d-cc3a7772716c', '344f9d99-b264-4aaa-8ffb-d275f60fa2fc', 1, 'Assign an I22.- code for the subsequent MI together with the I21.- code for the initial MI');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83dd04c0-9149-423b-92f7-2962e397d573', '344f9d99-b264-4aaa-8ffb-d275f60fa2fc', 2, 'Assign I25.2 for both');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab611de5-14ed-4cdc-b71a-cf5cb7adf8bd', '344f9d99-b264-4aaa-8ffb-d275f60fa2fc', 3, 'Assign two I21.- codes');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('344f9d99-b264-4aaa-8ffb-d275f60fa2fc', '01f0ae0b-ab07-4ee5-b76d-cc3a7772716c', 'I22.- with I21.- A new acute MI occurring within 4 weeks of a prior acute MI is a subsequent MI: assign the I22.- code in conjunction with the I21.- code of the initial infarction.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 87, 'A patient has GERD with esophagitis, without bleeding. Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc52514a-9b59-4bab-ac08-1f5df673e773', '49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 0, 'K21.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab1c000e-f2ff-4fbc-9f25-d2021036ea27', '49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 1, 'K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a4e41e6-6b1b-4cbf-8282-bfa3f3356f36', '49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 2, 'K21.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed99b3d8-3dbe-46f9-98f8-32ec8fbf8212', '49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 3, 'K20.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49cfcbc7-82d8-4ef5-8fa4-2f2b4670f228', 'ab1c000e-f2ff-4fbc-9f25-d2021036ea27', 'K21.00 GERD with esophagitis, without bleeding = K21.00. K21.9 is without esophagitis; K21.01 is with bleeding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c854151a-6f6b-4d9d-a228-a0bd5390a38d', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 88, 'A patient is receiving SN wound care for an abscess of the right lower leg with surrounding cellulitis; cultures grew MSSA. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73307b04-c9f0-42f2-8894-a510ef10d971', 'c854151a-6f6b-4d9d-a228-a0bd5390a38d', 0, 'L02.415, L03.115, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51fde1c5-94ec-41f4-8e04-431a46d5e830', 'c854151a-6f6b-4d9d-a228-a0bd5390a38d', 1, 'L03.115, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b158b7f3-0816-4310-b05d-6a54e4ad2c53', 'c854151a-6f6b-4d9d-a228-a0bd5390a38d', 2, 'L02.415, B95.61 — cellulitis is included in the abscess code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab81b92f-2fa3-470e-8b6d-70bbfd958e6a', 'c854151a-6f6b-4d9d-a228-a0bd5390a38d', 3, 'L02.415, L03.115, B95.62');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c854151a-6f6b-4d9d-a228-a0bd5390a38d', '73307b04-c9f0-42f2-8894-a510ef10d971', 'L02.415, L03.115, B95.61 Abscess and cellulitis are separate conditions — code both (right lower limb abscess L02.415 and cellulitis L03.115) plus the organism; MSSA = B95.61.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 89, 'Which pairing is correct?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3131d8b3-76b4-42ce-934d-4d3443f73f66', 'cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', 0, 'MSSA sepsis = A41.02; MRSA sepsis = A41.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('450fe119-6a5a-4453-bb94-43d859e27086', 'cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', 1, 'MSSA as cause of other disease = B95.62; MRSA as cause of other disease = B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89fc32c3-eeaa-4e9c-baf4-ec64e2bee246', 'cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', 2, 'MSSA sepsis = A41.01; MRSA sepsis = A41.02; MSSA organism code = B95.61; MRSA organism code = B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab587391-affe-4902-82c7-eb6b0f86adcd', 'cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', 3, 'MSSA and MRSA share the same organism code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cd2a3526-c385-4f8d-a531-0bc58b5f8bfd', '89fc32c3-eeaa-4e9c-baf4-ec64e2bee246', 'MSSA sepsis A41.01 / MRSA sepsis A41.02; as the cause of other diseases, MSSA = B95.61 and MRSA = B95.62.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6378e805-eaf4-4ffd-8521-519b4442b2f1', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 90, 'A 3-week-old infant born at 32 weeks is admitted to home health for monitoring of apnea of prematurity and neonatal jaundice with phototherapy. Which principle governs code selection?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc877075-8f67-4fa4-bfce-8e2f98d19ac4', '6378e805-eaf4-4ffd-8521-519b4442b2f1', 0, 'Chapter 16 (P) perinatal codes are used because the conditions originated in the perinatal period, regardless of the patient’s current age');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e40044be-2edb-4ea7-bdfa-6fba4c89c0f8', '6378e805-eaf4-4ffd-8521-519b4442b2f1', 1, 'R-codes must be used because the baby is now home');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01cfc9ae-293e-4b58-999d-8b42575f45e0', '6378e805-eaf4-4ffd-8521-519b4442b2f1', 2, 'P-codes may only be used during the birth hospitalization');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83af2016-a94e-4604-892d-a2d5ab1c19f5', '6378e805-eaf4-4ffd-8521-519b4442b2f1', 3, 'Z38.- is the principal diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6378e805-eaf4-4ffd-8521-519b4442b2f1', 'cc877075-8f67-4fa4-bfce-8e2f98d19ac4', 'Chapter 16 (P00–P96) codes are used for conditions that originate in the perinatal period regardless of the patient’s current age, as long as the condition is still present/being treated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('93e8aaf0-2da7-4a34-a040-b78c9b131ba2', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 91, 'A 28-year-old is receiving home health wound care three weeks after cesarean delivery. The physician documents a “superficial incisional surgical site infection of the cesarean wound.” Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0d2d2fa-7bec-4a47-87b1-2cdc7d3e1c6e', '93e8aaf0-2da7-4a34-a040-b78c9b131ba2', 0, 'T81.41XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3c2b58e-85b5-44c6-95b4-c780d0b45a26', '93e8aaf0-2da7-4a34-a040-b78c9b131ba2', 1, 'O86.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53d7344d-8584-4ad5-a308-83fd22f2686a', '93e8aaf0-2da7-4a34-a040-b78c9b131ba2', 2, 'O90.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36fe8d47-8947-4599-9a24-83479ba24cf2', '93e8aaf0-2da7-4a34-a040-b78c9b131ba2', 3, 'O86.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('93e8aaf0-2da7-4a34-a040-b78c9b131ba2', '36fe8d47-8947-4599-9a24-83479ba24cf2', 'O86.01 Complications of the puerperium take Chapter 15 codes over general surgical complication codes: superficial incisional surgical site infection following cesarean = O86.01. (O90.0 is C-section wound disruption/dehiscence; T81.41XA is for non-obstetric wounds.)');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18b64343-4069-4e14-b9c9-faa992018737', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 92, 'A patient is admitted to home health following a right transmetatarsal amputation for diabetic gangrene; the residual limb is healing without complication and SN provides stump care and shaping. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53c3c5b3-7267-4000-a79c-393fb71c199f', '18b64343-4069-4e14-b9c9-faa992018737', 0, 'Z47.81, E11.52, Z89.421');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('572d9ea8-b705-4cd1-854a-67dd7f771bf5', '18b64343-4069-4e14-b9c9-faa992018737', 1, 'E11.52, Z47.81, Z89.421');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('582e9d14-7724-4c93-8ce3-3f150f50ab82', '18b64343-4069-4e14-b9c9-faa992018737', 2, 'Z89.421, Z47.81, E11.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5ca427c-12d2-4743-bb71-b4a2cf89474c', '18b64343-4069-4e14-b9c9-faa992018737', 3, 'T87.81, E11.52, Z89.421');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('18b64343-4069-4e14-b9c9-faa992018737', '53c3c5b3-7267-4000-a79c-393fb71c199f', 'Z47.81, E11.52, Z89.421 Uncomplicated amputation aftercare = Z47.81 primary; the diabetic peripheral angiopathy with gangrene (E11.52) remains a coded current condition; Z89.421 = acquired absence of right foot (partial/transmetatarsal level per documentation).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cfb9cbdc-84da-448f-bd06-60690ac77275', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 93, 'A patient is admitted for surgical aftercare following a partial colectomy (open) for a perforated diverticulitis that was resolved surgically; a new colostomy was created and requires teaching. Select the correct codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e589898-e7b9-41d3-ba30-87b1f35a4cd4', 'cfb9cbdc-84da-448f-bd06-60690ac77275', 0, 'K57.20, Z43.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3725fc1d-90b9-4bcf-b0e9-ed118c64355d', 'cfb9cbdc-84da-448f-bd06-60690ac77275', 1, 'Z48.815, Z43.3, Z87.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50b08187-3b3b-4bd5-abf0-880e3ce02529', 'cfb9cbdc-84da-448f-bd06-60690ac77275', 2, 'Z43.3, Z48.815');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('55883c39-08a5-4ef2-8850-68ea933c4ff8', 'cfb9cbdc-84da-448f-bd06-60690ac77275', 3, 'Z48.815, Z43.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cfb9cbdc-84da-448f-bd06-60690ac77275', '55883c39-08a5-4ef2-8850-68ea933c4ff8', 'Z48.815, Z43.3 The diverticulitis was surgically resolved and is not coded. Aftercare following digestive system surgery (Z48.815) plus attention to the new colostomy (Z43.3).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03c59e02-64d4-45dc-9f16-60214e574c96', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 94, 'A patient with multiple traumatic wounds from a motor vehicle collision three weeks ago receives daily dressing changes at home; all wounds are healing as expected. The appropriate 7th character for the injury codes is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ede382b-9d74-4c28-b1a1-41c89b0dea6e', '03c59e02-64d4-45dc-9f16-60214e574c96', 0, 'A — because active wound care is being provided');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b635b57-f8c5-4aee-8065-01a6b3e5f17a', '03c59e02-64d4-45dc-9f16-60214e574c96', 1, 'D — because the patient is in the routine healing/recovery phase receiving routine care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b75da09-8e11-42dc-ac75-e87f9c1e4172', '03c59e02-64d4-45dc-9f16-60214e574c96', 2, 'S — because the accident is in the past');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db846f33-eff0-41ac-aed3-d022708e16f7', '03c59e02-64d4-45dc-9f16-60214e574c96', 3, 'A for the largest wound and D for the rest');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('03c59e02-64d4-45dc-9f16-60214e574c96', '0b635b57-f8c5-4aee-8065-01a6b3e5f17a', 'D Routine dressing changes during expected healing = subsequent encounter, 7th character D. Character A is reserved for active treatment of the acute injury phase (ED care, surgical treatment, non-healing/complicated wounds under active treatment).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1af103e-d3d4-4728-aa38-51feb4ad64e7', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 95, 'A patient with end-stage COPD has elected to focus on comfort; the physician orders home health with a palliative focus (symptom control, no curative intent), though the patient is not on hospice. Which additional code captures the palliative care encounter?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8aabfb50-0201-46db-87f0-bdfc88905ab6', 'd1af103e-d3d4-4728-aa38-51feb4ad64e7', 0, 'Z51.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('90f4df78-5d2d-463b-8093-29158c261d81', 'd1af103e-d3d4-4728-aa38-51feb4ad64e7', 1, 'Z51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b70e44fb-91c1-40fa-a04a-dc64ce907776', 'd1af103e-d3d4-4728-aa38-51feb4ad64e7', 2, 'Z76.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6c93da3-b89f-42d1-a58d-06cf9b9efe05', 'd1af103e-d3d4-4728-aa38-51feb4ad64e7', 3, 'Z74.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d1af103e-d3d4-4728-aa38-51feb4ad64e7', '8aabfb50-0201-46db-87f0-bdfc88905ab6', 'Z51.5 Encounter for palliative care = Z51.5, added as a secondary code alongside the terminal/serious condition codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bec67835-b954-4a96-895e-1ee65e45e234', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 96, 'Which statement about external cause codes (V00–Y99) is TRUE?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51912ac0-234d-410a-af99-ad48c11f0da0', 'bec67835-b954-4a96-895e-1ee65e45e234', 0, 'An external cause code may be reported as the primary diagnosis if the injury is the focus of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16a99825-0961-4370-a057-7ae83533172e', 'bec67835-b954-4a96-895e-1ee65e45e234', 1, 'External cause codes can never be used in home health');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9e87398-8ae9-42c7-8e36-625db8fa854e', 'bec67835-b954-4a96-895e-1ee65e45e234', 2, 'External cause codes are always sequenced after the injury/condition codes and may never be primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80d74a09-6204-4ad1-8021-99e4951ac603', 'bec67835-b954-4a96-895e-1ee65e45e234', 3, 'External cause codes replace the injury code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bec67835-b954-4a96-895e-1ee65e45e234', 'd9e87398-8ae9-42c7-8e36-625db8fa854e', 'External cause codes are supplementary — always sequenced after the injury/condition and never primary. They are usable (and encouraged) in home health, but no national mandate requires them.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8871f8f0-57d3-46b2-ba35-da7b05cfd330', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 97, 'Which statement about place-of-occurrence (Y92) and activity (Y93) codes is TRUE?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7b63fde-3ab9-4413-8595-280b8917d7af', '8871f8f0-57d3-46b2-ba35-da7b05cfd330', 0, 'They are reported at every encounter for the injury');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bb74de2-e2f0-4b15-8399-aaf5b995fee5', '8871f8f0-57d3-46b2-ba35-da7b05cfd330', 1, 'They are reported only once, at the initial encounter for treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92ae3eb6-29b7-420c-a5db-ef905b74d19a', '8871f8f0-57d3-46b2-ba35-da7b05cfd330', 2, 'Y92 is repeated at every visit but Y93 is not');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('112334d8-8d09-4add-b6ef-bb05f3775bb3', '8871f8f0-57d3-46b2-ba35-da7b05cfd330', 3, 'They are required on all home health claims');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8871f8f0-57d3-46b2-ba35-da7b05cfd330', '6bb74de2-e2f0-4b15-8399-aaf5b995fee5', 'Y92 place-of-occurrence and Y93 activity codes are assigned only once, at the initial encounter for treatment; the external cause code for the mechanism (e.g., the W-code fall) is carried through the treatment episode with the appropriate 7th character.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7bcae7ea-82fb-488c-a7cf-8fdf2c658044', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 98, 'A patient has had three falls in the past two months and the physician documents “repeated falls”; the plan of care includes fall-risk interventions. The care team also wants the chart to reflect ongoing fall risk. Select the correct code assignment.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83ce4676-a1f1-4bdb-bc40-e7657fed36fe', '7bcae7ea-82fb-488c-a7cf-8fdf2c658044', 0, 'R29.6 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d786087-27e6-44f3-9aa7-1b8d4477125c', '7bcae7ea-82fb-488c-a7cf-8fdf2c658044', 1, 'Z91.81 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f24f4c4-903b-4a8c-8b73-9074374209b1', '7bcae7ea-82fb-488c-a7cf-8fdf2c658044', 2, 'R29.6 and Z91.81 — both may be assigned together when both apply');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0e23ae0-9379-4fc7-842b-b03c69d5a3ac', '7bcae7ea-82fb-488c-a7cf-8fdf2c658044', 3, 'W19.XXXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7bcae7ea-82fb-488c-a7cf-8fdf2c658044', '9f24f4c4-903b-4a8c-8b73-9074374209b1', 'R29.6 and Z91.81 Repeated falls (R29.6) captures the current clinical finding; history of falling (Z91.81) captures ongoing fall risk — the guidelines permit both together when both apply.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('35e7f5a4-563f-4703-9b96-ed059143895c', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 99, 'A patient had a transient ischemic attack eight months ago with no residual deficits. How is this history captured?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('238d4d52-f5f2-4696-9397-81b2e12cfd62', '35e7f5a4-563f-4703-9b96-ed059143895c', 0, 'I63.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('416d395f-1026-4b2f-af52-c8af6ff3b6f7', '35e7f5a4-563f-4703-9b96-ed059143895c', 1, 'G45.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d7cdfc4-e70b-409a-8235-b7f6a1675582', '35e7f5a4-563f-4703-9b96-ed059143895c', 2, 'Z86.73');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c29d080c-7fec-40f6-9bc4-03612934ed3b', '35e7f5a4-563f-4703-9b96-ed059143895c', 3, 'I69.398');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('35e7f5a4-563f-4703-9b96-ed059143895c', '3d7cdfc4-e70b-409a-8235-b7f6a1675582', 'Z86.73 A TIA leaves no residual deficits by definition; a past TIA is reported with Z86.73 (personal history of TIA/cerebral infarction without residual deficits).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0ef87d0f-a22c-43fb-9a0d-593d796d2204', 'a9fbf371-d80a-40ab-81a4-783e47a0378c', 100, 'A patient newly started on warfarin after a DVT is admitted to home health for weekly venipuncture for PT/INR monitoring; the DVT itself is resolved and the anticoagulation is now long-term prophylaxis. Select the correct codes and sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3168952e-112f-47dd-ab2e-e04917ea757a', '0ef87d0f-a22c-43fb-9a0d-593d796d2204', 0, 'Z79.01, Z51.81, Z86.718');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1148a31-96db-4a0b-bb05-bcdf5e4323af', '0ef87d0f-a22c-43fb-9a0d-593d796d2204', 1, 'Z51.81, Z79.01, Z86.718');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00636df9-0c75-45f4-959d-879e4b55db77', '0ef87d0f-a22c-43fb-9a0d-593d796d2204', 2, 'I82.409, Z51.81, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d7516ee2-f999-4da6-882f-fa0ee56ba67d', '0ef87d0f-a22c-43fb-9a0d-593d796d2204', 3, 'Z86.718, Z51.81, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0ef87d0f-a22c-43fb-9a0d-593d796d2204', 'd1148a31-96db-4a0b-bb05-bcdf5e4323af', 'Z51.81, Z79.01, Z86.718 Encounter for therapeutic drug monitoring (Z51.81) is the reason for skilled care and is sequenced first, with Z79.01 (long-term anticoagulants) and Z86.718 (history of venous thrombosis) as supporting codes; the resolved DVT is not coded as current.');

-- ---------- Paper 3: BCHH-C Practice Paper 3 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('26d63dcd-a40f-43d7-9959-e6e57b284877', 'bchhc-practice-3', 'BCHH-C Practice Paper 3', 'bchhc', ARRAY['ICD-10-CM Conventions', 'Diabetes', 'Cardiac\Renal', 'Respiratory', 'GI']::TEXT[], 100, 'standard', true, 3);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f6b31788-9ed2-4a44-86d0-8f1921d935a1', '26d63dcd-a40f-43d7-9959-e6e57b284877', 1, 'A 68-year-old male is admitted to home health for SN management of newly diagnosed type 2 diabetes with diabetic polyneuropathy. He also has hypertension and benign prostatic hyperplasia. What is the correct M1021/M1023 coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53f59b65-bc99-4429-9b0e-690fa7122626', 'f6b31788-9ed2-4a44-86d0-8f1921d935a1', 0, 'E11.42, I10, N40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4faacbf-e4c5-4d75-a3ee-cdca4808e752', 'f6b31788-9ed2-4a44-86d0-8f1921d935a1', 1, 'E11.65, I10, N40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3df679a-248c-4f43-9288-c156f01b1b02', 'f6b31788-9ed2-4a44-86d0-8f1921d935a1', 2, 'G63, E11.42, I10, N40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79f7a90a-e020-4cfd-947b-aa323dba8c70', 'f6b31788-9ed2-4a44-86d0-8f1921d935a1', 3, 'E11.42, G63, I10, N40.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f6b31788-9ed2-4a44-86d0-8f1921d935a1', '53f59b65-bc99-4429-9b0e-690fa7122626', 'E11.42, I10, N40.0 Type 2 DM with diabetic polyneuropathy = E11.42 (the “with” convention presumes the link). I10 = HTN, N40.0 = BPH without obstruction. G63 is a manifestation code but is included in E11.42’s combination code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('940e335c-252d-4623-bc39-36edae97f49d', '26d63dcd-a40f-43d7-9959-e6e57b284877', 2, 'A patient is receiving home health for CHF monitoring. Documentation states: “History of type 2 diabetes, currently diet-controlled, no complications.” How should the diabetes be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0478bb67-6fdb-45cf-9c5b-f4fcaa851433', '940e335c-252d-4623-bc39-36edae97f49d', 0, 'E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('826e3e41-34a1-4a5d-8f80-5f8e2594dcb5', '940e335c-252d-4623-bc39-36edae97f49d', 1, 'Z86.39');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fec3ef6e-0cc6-4420-a1a6-156c42290a4d', '940e335c-252d-4623-bc39-36edae97f49d', 2, 'E11.65');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8a3a63f-4725-47c3-9f43-7b94bed8e1b3', '940e335c-252d-4623-bc39-36edae97f49d', 3, 'Do not code — diet-controlled diabetes is not coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('940e335c-252d-4623-bc39-36edae97f49d', '0478bb67-6fdb-45cf-9c5b-f4fcaa851433', 'E11.9 Diet-controlled type 2 diabetes is still coded as E11.9 (without complications). “History of diabetes” (Z86.39) is only used when the condition truly no longer exists, which is essentially never for type 2 DM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a0ff8a78-72c2-46c9-a593-6c49f2572bc7', '26d63dcd-a40f-43d7-9959-e6e57b284877', 3, 'A type 2 diabetic patient on insulin and metformin is admitted for SN wound care of a right great toe ulcer. The physician documents “diabetic foot ulcer, right great toe, with breakdown of skin.” How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21bfaee4-cdad-4ef8-8567-722e882c534b', 'a0ff8a78-72c2-46c9-a593-6c49f2572bc7', 0, 'E11.621, L97.511, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8414f2e7-bb56-4fae-8731-95ce06f8e9f9', 'a0ff8a78-72c2-46c9-a593-6c49f2572bc7', 1, 'E11.622, L97.511, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95d5544e-6c64-48da-84f3-d955b251ca3c', 'a0ff8a78-72c2-46c9-a593-6c49f2572bc7', 2, 'L97.511, E11.621, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c49a2fa-f6f5-458d-bd1a-d6fe1aab8976', 'a0ff8a78-72c2-46c9-a593-6c49f2572bc7', 3, 'E11.621, L97.519, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a0ff8a78-72c2-46c9-a593-6c49f2572bc7', '21bfaee4-cdad-4ef8-8567-722e882c534b', 'E11.621, L97.511, Z79.4 DM type 2 with foot ulcer = E11.621 (right), then L97.511 for site/severity (right great toe, limited to breakdown of skin), plus Z79.4 for long-term insulin in a type 2 diabetic.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('15d6aefa-2b5f-40e9-8d21-65350b56ed33', '26d63dcd-a40f-43d7-9959-e6e57b284877', 4, 'A home health patient has type 1 diabetes with diabetic chronic kidney disease, stage 4. Which coding is correct?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a9a61cc-1596-4f93-965c-911038935466', '15d6aefa-2b5f-40e9-8d21-65350b56ed33', 0, 'E10.22, N18.4, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f47504e9-7fa3-41b7-9ade-13db0ed9bd77', '15d6aefa-2b5f-40e9-8d21-65350b56ed33', 1, 'E10.22, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a5986c6-1394-4c26-b48f-59ff271f5c42', '15d6aefa-2b5f-40e9-8d21-65350b56ed33', 2, 'E13.22, N18.4, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b4952e7-bea8-4e38-922c-45126627c19a', '15d6aefa-2b5f-40e9-8d21-65350b56ed33', 3, 'E10.9, N18.4, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('15d6aefa-2b5f-40e9-8d21-65350b56ed33', 'f47504e9-7fa3-41b7-9ade-13db0ed9bd77', 'E10.22, N18.4 Type 1 DM with diabetic CKD = E10.22, followed by N18.4 (stage 4). Z79.4 is NOT added for type 1 diabetes — insulin is intrinsic to the disease.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6df5d969-9911-4750-ae97-157b0901b8b8', '26d63dcd-a40f-43d7-9959-e6e57b284877', 5, 'A patient with type 2 diabetes is on an insulin pump. How should the insulin use be captured?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27c7ed25-ff6f-4680-8994-820f508ecea3', '6df5d969-9911-4750-ae97-157b0901b8b8', 0, 'Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fc12fd0-2969-4a58-b400-e276b1027c35', '6df5d969-9911-4750-ae97-157b0901b8b8', 1, 'Z96.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d451d9d5-e195-4899-8ef4-99801439600e', '6df5d969-9911-4750-ae97-157b0901b8b8', 2, 'Z79.4 and Z96.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1e6780b-023f-4a4f-885c-4f1411c5a1fb', '6df5d969-9911-4750-ae97-157b0901b8b8', 3, 'Neither — insulin pump patients do not get Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6df5d969-9911-4750-ae97-157b0901b8b8', 'd451d9d5-e195-4899-8ef4-99801439600e', 'Z79.4 and Z96.41 Type 2 DM on insulin pump requires both Z79.4 (long-term insulin use) and Z96.41 (presence of insulin pump).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', '26d63dcd-a40f-43d7-9959-e6e57b284877', 6, 'A home health patient has hypertension and CKD stage 3a. The physician has NOT documented any relationship between the two conditions. Under ICD-10-CM guidelines, how should the coder proceed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee9a54fb-0441-490c-8281-44c7a7f17706', '4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', 0, 'Code I10 and N18.31 separately — no assumed link');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e711c1b3-e3e1-4042-826d-2372bb3d606f', '4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', 1, 'Assume a causal relationship and assign I12.9 with N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ef26813-55ff-4c75-ad06-b9da55ad91c1', '4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', 2, 'Query the physician before coding');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27206f71-c60b-4f2c-b605-7532d107ab96', '4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', 3, 'Assign I10 and N18.30 separately with a note');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4ead3e9b-1f55-4cd2-a994-d0ef474c4aae', 'e711c1b3-e3e1-4042-826d-2372bb3d606f', 'ICD-10-CM presumes a causal relationship between HTN and CKD — the coder does not need explicit provider documentation linking them (guideline I.C.9.a.2). Assign I12.9 with N18.31, the specific billable code for the documented stage 3a — N18.3 alone is a non-billable parent.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e1ee37f9-55e7-4f0d-941e-04b1cec4436b', '26d63dcd-a40f-43d7-9959-e6e57b284877', 7, 'A patient has hypertensive heart disease with heart failure AND hypertensive CKD stage 2. What combination code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79226e80-47aa-4a9b-8c15-59378bd8e03c', 'e1ee37f9-55e7-4f0d-941e-04b1cec4436b', 0, 'I11.0, I50.9, N18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57b7d8e8-e544-484e-a711-7abf594be4a9', 'e1ee37f9-55e7-4f0d-941e-04b1cec4436b', 1, 'I13.10, I50.9, N18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e1373e34-dee3-4763-ac38-fc28b17ddf48', 'e1ee37f9-55e7-4f0d-941e-04b1cec4436b', 2, 'I12.9, I11.0, I50.9, N18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a9ff6da-1f8e-4846-97ff-ed47dae5f178', 'e1ee37f9-55e7-4f0d-941e-04b1cec4436b', 3, 'I13.0, I50.9, N18.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e1ee37f9-55e7-4f0d-941e-04b1cec4436b', '0a9ff6da-1f8e-4846-97ff-ed47dae5f178', 'I13.0, I50.9, N18.2 When both hypertensive heart disease with HF and hypertensive CKD are present, use I13.- (hypertensive heart and CKD). I13.0 = with HF, CKD stages 1–4. Additional codes for the HF type and CKD stage are required.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43fd48fc-6f17-4815-8813-528db75ad64e', '26d63dcd-a40f-43d7-9959-e6e57b284877', 8, 'A home health patient is being treated for acute on chronic diastolic heart failure. He also has paroxysmal atrial fibrillation and COPD. SN is ordered for CHF management. What is the M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5152aab-1c07-4f68-b863-bfa959f57874', '43fd48fc-6f17-4815-8813-528db75ad64e', 0, 'I50.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3908e67d-95a5-445a-af55-aa8012bfa5a5', '43fd48fc-6f17-4815-8813-528db75ad64e', 1, 'I50.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aff9a2d3-c7e8-405d-8c51-b05cf84d1caa', '43fd48fc-6f17-4815-8813-528db75ad64e', 2, 'I48.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f532f5a-0159-4c00-9048-3a93848e37ae', '43fd48fc-6f17-4815-8813-528db75ad64e', 3, 'J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43fd48fc-6f17-4815-8813-528db75ad64e', '3908e67d-95a5-445a-af55-aa8012bfa5a5', 'I50.33 Acute on chronic diastolic HF = I50.33. This is the condition SN is ordered for, so it is M1021.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6258cd4b-9e4b-481a-8d7e-22080add9227', '26d63dcd-a40f-43d7-9959-e6e57b284877', 9, 'The physician documents “cardiomyopathy due to chronic alcoholism.” How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3e9f53e-5326-411d-8ce6-09d73c9ee63a', '6258cd4b-9e4b-481a-8d7e-22080add9227', 0, 'I42.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('37aef150-c722-49a2-a12b-2e0a1b6aae6c', '6258cd4b-9e4b-481a-8d7e-22080add9227', 1, 'I42.6, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dac9a632-3964-408a-907b-ccde31268341', '6258cd4b-9e4b-481a-8d7e-22080add9227', 2, 'F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2adcfcfe-e442-45b9-b817-9ad05267b744', '6258cd4b-9e4b-481a-8d7e-22080add9227', 3, 'I42.9, F10.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6258cd4b-9e4b-481a-8d7e-22080add9227', 'd3e9f53e-5326-411d-8ce6-09d73c9ee63a', 'I42.6 Alcoholic cardiomyopathy has its own specific combination code I42.6. A separate code for the alcoholism is not required because it is included in the code description, though F10.20 may also be coded if independently documented and treated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6df8849a-22f0-48ba-9504-86afdbfd49e5', '26d63dcd-a40f-43d7-9959-e6e57b284877', 10, 'A patient has documented coronary artery disease of native coronary artery with unstable angina. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c1c1475-7e1f-49c2-b52d-8b4d34457a38', '6df8849a-22f0-48ba-9504-86afdbfd49e5', 0, 'I25.110');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdebff82-938d-4713-868e-1296a31681b1', '6df8849a-22f0-48ba-9504-86afdbfd49e5', 1, 'I20.0, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76648b7d-edf9-420d-93fb-ac72bb084dc5', '6df8849a-22f0-48ba-9504-86afdbfd49e5', 2, 'I25.10, I20.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2022a4ec-a983-44f8-b5cd-dba153b0d6cb', '6df8849a-22f0-48ba-9504-86afdbfd49e5', 3, 'I25.119');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6df8849a-22f0-48ba-9504-86afdbfd49e5', '4c1c1475-7e1f-49c2-b52d-8b4d34457a38', 'I25.110 CAD of native coronary artery with unstable angina = I25.110. The guideline presumes the causal relationship and a separate I20.0 is not coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('958bf834-faa2-4d5e-9d5c-9fc3f42db207', '26d63dcd-a40f-43d7-9959-e6e57b284877', 11, 'A 72-year-old is admitted to HH after CABG surgery 3 weeks ago. He is stable, wounds healing. SN is ordered for post-surgical assessment and cardiac rehab education. The patient also has HTN and type 2 diabetes. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0aeac559-ce7b-49ed-bc3b-02060f3414e9', '958bf834-faa2-4d5e-9d5c-9fc3f42db207', 0, 'I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a220b5be-4e21-4ce9-a346-f8cd50c1cacd', '958bf834-faa2-4d5e-9d5c-9fc3f42db207', 1, 'Z48.812');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f866f1f-3629-445e-a1b6-16f52795c8d3', '958bf834-faa2-4d5e-9d5c-9fc3f42db207', 2, 'Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5901dc0e-a5c5-45dc-96e0-d847d7f62b24', '958bf834-faa2-4d5e-9d5c-9fc3f42db207', 3, 'Z48.812, I25.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('958bf834-faa2-4d5e-9d5c-9fc3f42db207', 'a220b5be-4e21-4ce9-a346-f8cd50c1cacd', 'Z48.812 Aftercare following heart surgery = Z48.812 as M1021 when the encounter is for routine post-surgical recovery, not active treatment of the CAD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('897c18ba-d11f-48cb-a51b-b06bcc5eadc4', '26d63dcd-a40f-43d7-9959-e6e57b284877', 12, 'A patient has atrial fibrillation documented as “chronic.” Under ICD-10-CM, which code is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efeb623c-f324-4238-998e-c431f1be4e10', '897c18ba-d11f-48cb-a51b-b06bcc5eadc4', 0, 'I48.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7dd8557-636c-4924-ad96-c10d1ed0ab48', '897c18ba-d11f-48cb-a51b-b06bcc5eadc4', 1, 'I48.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed9b15bf-f721-4ecf-94ac-7609a40f18b5', '897c18ba-d11f-48cb-a51b-b06bcc5eadc4', 2, 'I48.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13c05cfe-fdee-47ee-91a0-10322aa81e31', '897c18ba-d11f-48cb-a51b-b06bcc5eadc4', 3, 'I48.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('897c18ba-d11f-48cb-a51b-b06bcc5eadc4', 'efeb623c-f324-4238-998e-c431f1be4e10', 'I48.20 “Chronic” atrial fibrillation is classified as permanent (long-standing, accepted) and maps to I48.20 (chronic/permanent AF, unspecified).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70802dd0-0890-4134-9f64-8ee9daa30426', '26d63dcd-a40f-43d7-9959-e6e57b284877', 13, 'A patient had a STEMI of the anterior wall 2 days ago, treated in the hospital. Now discharged to home health. The MI is still within the initial treatment phase. What code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('10455bab-16f3-4ab4-bfc3-2cd29abd24a4', '70802dd0-0890-4134-9f64-8ee9daa30426', 0, 'I25.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('986d7c67-342d-4556-8116-3aab38c70dee', '70802dd0-0890-4134-9f64-8ee9daa30426', 1, 'I21.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e909aa1-6e38-4e59-b323-adb8d2377ad3', '70802dd0-0890-4134-9f64-8ee9daa30426', 2, 'I21.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c32f15f-03f6-4d70-839b-317e45e97468', '70802dd0-0890-4134-9f64-8ee9daa30426', 3, 'I22.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('70802dd0-0890-4134-9f64-8ee9daa30426', '2e909aa1-6e38-4e59-b323-adb8d2377ad3', 'I21.01 STEMI of anterior wall (LAD) within 4 weeks = I21.01. Active treatment phase continues in home health; the MI code remains current.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63ea796f-f040-4d7b-83ac-1cb7f8811091', '26d63dcd-a40f-43d7-9959-e6e57b284877', 14, 'The same patient from Q13 returns to home health 6 weeks later. The MI is healed with no ongoing symptoms. How is the old MI coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4017997d-cc05-4585-93b2-159d1af67898', '63ea796f-f040-4d7b-83ac-1cb7f8811091', 0, 'I21.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e28b6012-5a24-41a9-b949-9d6a3248fe4a', '63ea796f-f040-4d7b-83ac-1cb7f8811091', 1, 'I25.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce91ff77-3668-4a94-ba80-9d94843da048', '63ea796f-f040-4d7b-83ac-1cb7f8811091', 2, 'Z86.79');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('285bb789-1554-4cc6-9e40-7020924391dc', '63ea796f-f040-4d7b-83ac-1cb7f8811091', 3, 'Do not code — resolved MI is not reportable');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('63ea796f-f040-4d7b-83ac-1cb7f8811091', 'e28b6012-5a24-41a9-b949-9d6a3248fe4a', 'I25.2 A healed MI with no ongoing symptoms beyond 4 weeks = I25.2 (old myocardial infarction). Z86.79 is not the correct code for a prior MI.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', '26d63dcd-a40f-43d7-9959-e6e57b284877', 15, 'A patient is admitted to home health for management of a new DVT of the right femoral vein. She is on warfarin. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a35c8151-984a-4b4d-98d5-fd9c4d59aa88', '5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', 0, 'I82.411, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('715ebab8-ed11-4997-b95b-62c64d3d826b', '5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', 1, 'I82.491, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5c19400-167f-4d02-bb51-e660e2f8b547', '5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', 2, 'I82.411, Z79.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1067712b-4ef5-4b15-995f-1092e73df71d', '5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', 3, 'I80.11, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5300bfa7-7fd3-4b1f-b1fe-61c5917baf2e', 'a35c8151-984a-4b4d-98d5-fd9c4d59aa88', 'I82.411, Z79.01 Acute DVT of right femoral vein = I82.411. Warfarin = Z79.01 (long-term anticoagulants).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('622177e3-f73a-480b-98e1-b4b5407936d9', '26d63dcd-a40f-43d7-9959-e6e57b284877', 16, 'A patient had a PE 3 months ago, fully resolved. She remains on long-term Eliquis. What codes apply for the home health episode focused on anticoagulant management?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d54944f6-930e-4d30-9171-0072610a6f24', '622177e3-f73a-480b-98e1-b4b5407936d9', 0, 'I26.99, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a97d56a-276b-4087-99c4-289be9bc051e', '622177e3-f73a-480b-98e1-b4b5407936d9', 1, 'Z79.01, Z86.711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('306480e2-416d-4b84-8875-351388255af6', '622177e3-f73a-480b-98e1-b4b5407936d9', 2, 'Z51.81, Z79.01, Z86.711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('444a3e9e-29ec-4be4-8a1d-25b3e6accd18', '622177e3-f73a-480b-98e1-b4b5407936d9', 3, 'I26.90, Z79.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('622177e3-f73a-480b-98e1-b4b5407936d9', '306480e2-416d-4b84-8875-351388255af6', 'Z51.81, Z79.01, Z86.711 The PE is resolved — code the encounter for therapeutic drug monitoring (Z51.81) as M1021, with Z79.01 (anticoagulant) and Z86.711 (history of PE).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9bc3eba5-6188-46db-b4ad-fc7c67226f27', '26d63dcd-a40f-43d7-9959-e6e57b284877', 17, 'A patient is admitted to HH with COPD with acute exacerbation. He also has a long history of tobacco dependence and continues to smoke. What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fd9f112-7c96-49df-9f6f-6251acb90766', '9bc3eba5-6188-46db-b4ad-fc7c67226f27', 0, 'J44.1, F17.210, Z87.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('216f87c7-8071-41e1-9f60-2ef6f483a898', '9bc3eba5-6188-46db-b4ad-fc7c67226f27', 1, 'J44.1, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3df97c70-e3ed-4c85-9db8-b744277742b2', '9bc3eba5-6188-46db-b4ad-fc7c67226f27', 2, 'J44.0, F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cead6032-6e97-4d9c-897e-700dd4ef2138', '9bc3eba5-6188-46db-b4ad-fc7c67226f27', 3, 'J44.9, Z72.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9bc3eba5-6188-46db-b4ad-fc7c67226f27', '216f87c7-8071-41e1-9f60-2ef6f483a898', 'J44.1, F17.210 COPD with acute exacerbation = J44.1. Current smoker with tobacco dependence = F17.210. Z87.891 (history of tobacco use) is for FORMER smokers, not current ones.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fc890504-a926-440b-a88a-fd8db8a607e1', '26d63dcd-a40f-43d7-9959-e6e57b284877', 18, 'A patient has asthma documented as “moderate persistent with acute exacerbation.” He also has allergic rhinitis. What ICD-10 code applies for the asthma?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bf54b8e-d36b-4269-b2fe-2db18a89b993', 'fc890504-a926-440b-a88a-fd8db8a607e1', 0, 'J45.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7a82ab2-cba2-4fc9-9e24-86df532d32a1', 'fc890504-a926-440b-a88a-fd8db8a607e1', 1, 'J45.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f167c6d9-a2c8-4fc4-ac8c-b67a617add30', 'fc890504-a926-440b-a88a-fd8db8a607e1', 2, 'J45.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb505bc8-ebac-4be2-88a3-a21e5f39522b', 'fc890504-a926-440b-a88a-fd8db8a607e1', 3, 'J45.51');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fc890504-a926-440b-a88a-fd8db8a607e1', 'a7a82ab2-cba2-4fc9-9e24-86df532d32a1', 'J45.41 Moderate persistent asthma with acute exacerbation = J45.41.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('baeef65b-fb09-4d88-8911-850aa45c122d', '26d63dcd-a40f-43d7-9959-e6e57b284877', 19, 'A home health patient is on a home ventilator for chronic respiratory failure. SN visits for ventilator management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9025af4c-cc3f-44c7-8ea6-6550f08457c4', 'baeef65b-fb09-4d88-8911-850aa45c122d', 0, 'J96.10, Z99.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52ea228e-045d-430a-9fe5-bd471e59611e', 'baeef65b-fb09-4d88-8911-850aa45c122d', 1, 'J96.11, Z99.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('47ab7d54-fbff-4046-801c-b05c2c9d0fa5', 'baeef65b-fb09-4d88-8911-850aa45c122d', 2, 'Z99.11, J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62221075-81be-424b-94d8-6b9f7969dfb0', 'baeef65b-fb09-4d88-8911-850aa45c122d', 3, 'J96.10, Z99.12');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('baeef65b-fb09-4d88-8911-850aa45c122d', '9025af4c-cc3f-44c7-8ea6-6550f08457c4', 'J96.10, Z99.11 Chronic respiratory failure, type unspecified = J96.10. Dependence on respirator/ventilator = Z99.11.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fa5c00cd-7a64-40ab-bd25-377baa6790f0', '26d63dcd-a40f-43d7-9959-e6e57b284877', 20, 'A patient is admitted for SN care after right lower lobe pneumonia due to aspiration of food. The patient has dysphagia secondary to a prior stroke. What is the correct coding sequence?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6865f303-8429-469f-a6c4-3850034bfee2', 'fa5c00cd-7a64-40ab-bd25-377baa6790f0', 0, 'J69.0, R13.10, I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('151f337e-45e1-4993-a24e-91f759f3d86b', 'fa5c00cd-7a64-40ab-bd25-377baa6790f0', 1, 'J69.0, I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0ecdbbf-7cde-4ca6-9637-9bc3aaa3d239', 'fa5c00cd-7a64-40ab-bd25-377baa6790f0', 2, 'I69.391, J69.0, R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7fd2e56-ecbf-459c-9586-987a47eb8c22', 'fa5c00cd-7a64-40ab-bd25-377baa6790f0', 3, 'J15.9, R13.10, I69.391');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fa5c00cd-7a64-40ab-bd25-377baa6790f0', '6865f303-8429-469f-a6c4-3850034bfee2', 'J69.0, R13.10, I69.391 Aspiration pneumonia = J69.0 primary. Dysphagia (R13.10) and the stroke sequela causing it (I69.391) follow. The aspiration pneumonia is coded with J69.0, not a standard pneumonia code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', '26d63dcd-a40f-43d7-9959-e6e57b284877', 21, 'A home health patient has GERD with documented Barrett’s esophagus without dysplasia. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfd857b0-1de5-4fc8-b1e0-9f358e9bccfa', '2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', 0, 'K21.00, K22.70');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74b2e01f-9b6c-4755-8b13-b842529d5732', '2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', 1, 'K22.70, K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6afebb68-4fe5-4c76-a4dd-87c882a1e2dc', '2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', 2, 'K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3396228d-beac-45ec-981d-7644569fef2e', '2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', 3, 'K22.710');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d1fcbcc-0bd2-4f1f-8d24-0c360028250b', 'bfd857b0-1de5-4fc8-b1e0-9f358e9bccfa', 'K21.00, K22.70 GERD with Barrett’s without dysplasia are coded separately: K21.00 (GERD with esophagitis, without bleeding) and K22.70 (Barrett’s without dysplasia). These are not mutually exclusive.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51f5ef35-560e-47c8-8285-f83d75ff08b7', '26d63dcd-a40f-43d7-9959-e6e57b284877', 22, 'A patient has a PEG tube for enteral feeding due to dysphagia from ALS. SN visits for PEG care and nutritional management. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2783a4e0-ad47-4956-b213-7b9ecd217601', '51f5ef35-560e-47c8-8285-f83d75ff08b7', 0, 'Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bcdff53-49dc-4d02-825b-b3c4a0c25019', '51f5ef35-560e-47c8-8285-f83d75ff08b7', 1, 'G12.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1464a6bf-1e8f-4172-9741-f1bce53aad96', '51f5ef35-560e-47c8-8285-f83d75ff08b7', 2, 'K94.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4aeaf6d-1d0b-4434-b894-ea03b27011f6', '51f5ef35-560e-47c8-8285-f83d75ff08b7', 3, 'R13.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('51f5ef35-560e-47c8-8285-f83d75ff08b7', '9bcdff53-49dc-4d02-825b-b3c4a0c25019', 'G12.21 The ALS (G12.21) is the underlying reason the patient needs the PEG and home health services — it is M1021. Z43.1 (attention to gastrostomy) is a supporting code, not primary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd11e227-a133-4de6-bbaf-53803d2ec691', '26d63dcd-a40f-43d7-9959-e6e57b284877', 23, 'A patient is admitted to home health for management of Crohn’s disease of the large intestine with intestinal obstruction. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01b00930-f02a-4c0a-a636-32b676cb4852', 'cd11e227-a133-4de6-bbaf-53803d2ec691', 0, 'K50.012');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b04e696-f1aa-4c50-93ad-f33dff8c182c', 'cd11e227-a133-4de6-bbaf-53803d2ec691', 1, 'K50.112');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e13d6cda-4ea9-4643-b45b-3a29641d59b6', 'cd11e227-a133-4de6-bbaf-53803d2ec691', 2, 'K50.812');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f814b00f-5ea7-432f-8e13-1820e72c59bf', 'cd11e227-a133-4de6-bbaf-53803d2ec691', 3, 'K50.012, K56.69');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cd11e227-a133-4de6-bbaf-53803d2ec691', '01b00930-f02a-4c0a-a636-32b676cb4852', 'K50.012 Crohn’s disease of small intestine with intestinal obstruction = K50.012. ICD-10-CM provides combination codes for Crohn’s with complications; do not code the obstruction separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8de64005-1858-4284-a8b6-5f06da1d598e', '26d63dcd-a40f-43d7-9959-e6e57b284877', 24, 'A patient has a new colostomy placed for colon cancer. She is admitted to HH for ostomy care and teaching. The colon cancer was completely resected. What codes should be assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09e6ac1f-e0db-4e6b-8b73-4de1c78e5971', '8de64005-1858-4284-a8b6-5f06da1d598e', 0, 'C18.9, Z43.3, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03f1e6e4-b7b4-4937-ae91-ccd8fe6b8788', '8de64005-1858-4284-a8b6-5f06da1d598e', 1, 'Z43.3, Z93.3, Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('47231b94-6a75-4b02-b0ee-d90d90f8a6e7', '8de64005-1858-4284-a8b6-5f06da1d598e', 2, 'Z48.815, Z43.3, Z93.3, Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6cb905c-8b62-41f8-a9bd-495d1b718e20', '8de64005-1858-4284-a8b6-5f06da1d598e', 3, 'Z43.3, C18.9, Z93.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8de64005-1858-4284-a8b6-5f06da1d598e', '03f1e6e4-b7b4-4937-ae91-ccd8fe6b8788', 'Z43.3, Z93.3, Z85.038 Cancer was completely resected — code as history (Z85.038). Encounter is for ostomy care: Z43.3 (attention to colostomy) primary, Z93.3 (colostomy status), and Z85.038 (history of colon cancer).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0d361851-b264-4d4d-9d35-d57e3971881b', '26d63dcd-a40f-43d7-9959-e6e57b284877', 25, 'A home health patient has chronic hepatitis C with documented cirrhosis. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b4e52e2-ffa8-4d14-a704-b3064b5670a6', '0d361851-b264-4d4d-9d35-d57e3971881b', 0, 'B18.2, K74.60');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83636ae9-1cf2-459e-bb18-2666e83c0a45', '0d361851-b264-4d4d-9d35-d57e3971881b', 1, 'K74.60, B18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('645f25ac-09e7-4464-aacd-6ab3dffee50e', '0d361851-b264-4d4d-9d35-d57e3971881b', 2, 'B18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3fbf9d1-f071-45d9-b949-545e72a42038', '0d361851-b264-4d4d-9d35-d57e3971881b', 3, 'K74.69, B18.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0d361851-b264-4d4d-9d35-d57e3971881b', '5b4e52e2-ffa8-4d14-a704-b3064b5670a6', 'B18.2, K74.60 Chronic hepatitis C is coded B18.2, with cirrhosis K74.60 coded additionally per the “code also” instruction under B18.2.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('101c9256-de43-460d-a5ee-7c39690985c9', '26d63dcd-a40f-43d7-9959-e6e57b284877', 26, 'An ICD-10-CM code description states “other specified.” This indicates:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94e163f9-a69a-4f7b-87a9-8192f37f8346', '101c9256-de43-460d-a5ee-7c39690985c9', 0, 'The physician documentation is vague or incomplete');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('917840cd-e954-459c-b6e8-38d7e6a20866', '101c9256-de43-460d-a5ee-7c39690985c9', 1, 'A specific code exists but was not used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14aa7c66-a5d6-4108-a8bc-34f542107945', '101c9256-de43-460d-a5ee-7c39690985c9', 2, 'The documentation is specific but ICD-10-CM lacks a code for that specificity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7eda9552-4f37-410c-8112-3adb37da0dd5', '101c9256-de43-460d-a5ee-7c39690985c9', 3, 'The condition is undetermined');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('101c9256-de43-460d-a5ee-7c39690985c9', '14aa7c66-a5d6-4108-a8bc-34f542107945', '“Other specified” (NEC) means the clinical documentation is specific, but ICD-10-CM does not have a unique code matching that specificity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79ba9624-e117-45e0-b141-fa16779a0b6c', '26d63dcd-a40f-43d7-9959-e6e57b284877', 27, 'When an Excludes1 note appears under a code, this means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54feb431-c4cc-426f-ab63-cfe9c2809d91', '79ba9624-e117-45e0-b141-fa16779a0b6c', 0, 'Both codes may be reported together');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('019c7453-e325-4abb-984c-9f154b861609', '79ba9624-e117-45e0-b141-fa16779a0b6c', 1, 'The excluded condition should be coded elsewhere — the two codes cannot be used together unless documentation supports they are unrelated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a30eeb9-d0b3-4fdf-8c6d-55800cecb5e2', '79ba9624-e117-45e0-b141-fa16779a0b6c', 2, 'The excluded code is included in the main code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1c9d7bd-9735-4c68-9779-d2bb0d2a3ee6', '79ba9624-e117-45e0-b141-fa16779a0b6c', 3, 'The coder should query the physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('79ba9624-e117-45e0-b141-fa16779a0b6c', '019c7453-e325-4abb-984c-9f154b861609', 'Excludes1 means the two conditions are mutually exclusive and should not be coded together unless documentation specifically supports they are unrelated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', '26d63dcd-a40f-43d7-9959-e6e57b284877', 28, 'A “code also” note in ICD-10-CM means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('baf9f91f-d601-44ef-ae55-73815196b28b', '10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', 0, 'The additional code is mandatory');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f52bd6b-4280-43f3-9732-9f416504cba8', '10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', 1, 'Two codes may be needed to fully describe the condition, depending on documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60276252-9e3d-4f9a-91e4-1e3e6f697188', '10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', 2, 'Code the additional code only if it is the primary diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5670c87d-f460-4b45-9fcf-101aa5e360da', '10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', 3, 'The code is optional and should not be added');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('10bfbe54-3ab2-4eec-8b99-ff040e2b3a69', '4f52bd6b-4280-43f3-9732-9f416504cba8', '“Code also” means an additional code may be needed to fully describe the condition; it is not mandatory but depends on documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aaf4f6de-fc04-4403-adb4-fbfa701f2661', '26d63dcd-a40f-43d7-9959-e6e57b284877', 29, 'A “code first” note under a manifestation code means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6fcb87c-7a52-4e66-be02-97094074f2fa', 'aaf4f6de-fc04-4403-adb4-fbfa701f2661', 0, 'The manifestation code can be sequenced first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f7cd1bb4-5c35-47b3-a6f9-055151c593f3', 'aaf4f6de-fc04-4403-adb4-fbfa701f2661', 1, 'The underlying condition must be sequenced before the manifestation code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f6e0e36-b9e9-49cc-a0a5-1adeab062369', 'aaf4f6de-fc04-4403-adb4-fbfa701f2661', 2, 'Either code may be sequenced first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5234640-06a8-4bad-95d3-9d3a8520b4a8', 'aaf4f6de-fc04-4403-adb4-fbfa701f2661', 3, 'Only the underlying condition should be coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aaf4f6de-fc04-4403-adb4-fbfa701f2661', 'f7cd1bb4-5c35-47b3-a6f9-055151c593f3', 'A “code first” note means the underlying etiology must be sequenced before the manifestation code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('30008ce9-672d-4b7c-8917-42b7c2bcf138', '26d63dcd-a40f-43d7-9959-e6e57b284877', 30, 'The 7th character “A” for injuries means:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21447420-c027-484a-9db5-da1977a6a159', '30008ce9-672d-4b7c-8917-42b7c2bcf138', 0, 'The first time the patient is seen by any provider');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b02a21ad-2908-4c7f-a53e-cb51e3d5d338', '30008ce9-672d-4b7c-8917-42b7c2bcf138', 1, 'Active phase of treatment — applies while the patient is receiving active treatment for the condition');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdd09045-4815-44f4-bdda-eae13042ed39', '30008ce9-672d-4b7c-8917-42b7c2bcf138', 2, 'Ambulatory treatment only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6977262-80c0-4ffe-be20-c49b70b24847', '30008ce9-672d-4b7c-8917-42b7c2bcf138', 3, 'Only emergency department visits');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('30008ce9-672d-4b7c-8917-42b7c2bcf138', 'b02a21ad-2908-4c7f-a53e-cb51e3d5d338', '7th character “A” = active phase of treatment, not simply the first visit. In home health, “A” applies when the patient is still receiving active treatment (e.g., surgical wound care for a complication).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('26aa9801-f868-47c1-af8c-01dca54f6ef3', '26d63dcd-a40f-43d7-9959-e6e57b284877', 31, 'When should 7th character “D” (subsequent encounter) be used?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('034e1b30-9880-455b-a2c0-36cf7af938f9', '26aa9801-f868-47c1-af8c-01dca54f6ef3', 0, 'Only after the initial ED visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f443961-2acf-4c5b-a5e4-dd28ec83302e', '26aa9801-f868-47c1-af8c-01dca54f6ef3', 1, 'During the healing/recovery phase when receiving routine care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea4f636a-a8bc-4aeb-a2db-67dbdaf1a634', '26aa9801-f868-47c1-af8c-01dca54f6ef3', 2, 'Only for follow-up visits with the same provider');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfad3b01-5f54-48fe-a06a-49e1bae44f92', '26aa9801-f868-47c1-af8c-01dca54f6ef3', 3, 'When complications develop');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('26aa9801-f868-47c1-af8c-01dca54f6ef3', '0f443961-2acf-4c5b-a5e4-dd28ec83302e', '“D” = subsequent encounter for routine care during healing/recovery. This is the most common 7th character in home health for healing injuries.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70739d87-6942-49e2-bb2b-2636d2a7d694', '26d63dcd-a40f-43d7-9959-e6e57b284877', 32, 'A patient is admitted to HH for wound care of a traumatic laceration of the right forearm that was sutured in the ED 5 days ago. The wound is healing normally. What 7th character applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64abae76-45f6-4632-9075-7844fd89421d', '70739d87-6942-49e2-bb2b-2636d2a7d694', 0, 'A — initial encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e68f326-d77d-4d75-9a8f-8a79de0a7013', '70739d87-6942-49e2-bb2b-2636d2a7d694', 1, 'D — subsequent encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42a872c4-3252-4455-8a6d-f41a710d45b9', '70739d87-6942-49e2-bb2b-2636d2a7d694', 2, 'S — sequela');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('407d7661-7cd1-47eb-b838-47507dbd40e3', '70739d87-6942-49e2-bb2b-2636d2a7d694', 3, 'G — delayed healing');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('70739d87-6942-49e2-bb2b-2636d2a7d694', '7e68f326-d77d-4d75-9a8f-8a79de0a7013', 'D — subsequent encounter The laceration was treated in the ED (initial encounter). HH wound care during normal healing = subsequent encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('830f7d80-6e26-48c1-8301-3644900415e3', '26d63dcd-a40f-43d7-9959-e6e57b284877', 33, '7th character “S” (sequela) is used when:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fac5705-ee15-40f3-ab21-5656d51bdfcb', '830f7d80-6e26-48c1-8301-3644900415e3', 0, 'The injury is still healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b8c87f3-c709-42f3-a323-057deea92a8a', '830f7d80-6e26-48c1-8301-3644900415e3', 1, 'A complication has developed during treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a620897e-bf3d-4aa5-a34e-693a7ffe35d0', '830f7d80-6e26-48c1-8301-3644900415e3', 2, 'Treatment is being provided for a residual condition after the acute injury/illness has resolved');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd8e7fd8-0375-4622-8283-e2016f207f9e', '830f7d80-6e26-48c1-8301-3644900415e3', 3, 'The condition is chronic');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('830f7d80-6e26-48c1-8301-3644900415e3', 'a620897e-bf3d-4aa5-a34e-693a7ffe35d0', 'Sequela “S” is used when care is for a residual effect after the acute condition has resolved (e.g., scar, chronic pain from a healed injury).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4edb398-5c87-4912-a659-b5c24866fbf6', '26d63dcd-a40f-43d7-9959-e6e57b284877', 34, 'A home health patient had a hip fracture 8 months ago. She now has chronic pain at the fracture site — the fracture itself is fully healed. How is the pain coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f3760548-9428-4f27-b656-eb2ae9c946ed', 'd4edb398-5c87-4912-a659-b5c24866fbf6', 0, 'S72.001D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7bd715a-29ec-4653-b471-b64c1987e89d', 'd4edb398-5c87-4912-a659-b5c24866fbf6', 1, 'S72.001S, G89.29');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33fecbd1-1de3-41dd-aa68-a5ccdebee54f', 'd4edb398-5c87-4912-a659-b5c24866fbf6', 2, 'M25.559');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7480bffc-52c8-4e42-b142-df5f296c568b', 'd4edb398-5c87-4912-a659-b5c24866fbf6', 3, 'G89.29, S72.001S');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d4edb398-5c87-4912-a659-b5c24866fbf6', '7480bffc-52c8-4e42-b142-df5f296c568b', 'G89.29, S72.001S Chronic pain from a healed fracture = sequela. G89.29 (chronic pain) may be sequenced first when pain management is the focus, followed by S72.001S (hip fracture, sequela).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', '26d63dcd-a40f-43d7-9959-e6e57b284877', 35, 'A patient is admitted to home health for SN management of a UTI due to E. coli. She also has an indwelling urinary catheter. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c404c795-7d29-4cdf-b3b8-8cc2e31a526b', '3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', 0, 'N39.0, B96.20, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfb470a4-e32f-4f07-8af9-39db1d877590', '3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', 1, 'T83.511A, N39.0, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a5b6fa6-b56e-4428-bd7e-b748b24f44be', '3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', 2, 'N39.0, B96.20, T83.511A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7a1f42e-92fc-4b5a-9bd2-f3f8d3fb07fe', '3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', 3, 'T83.518A, N39.0, B96.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3a9b4dfe-6364-4307-8b02-af5ec8ec8a12', 'c404c795-7d29-4cdf-b3b8-8cc2e31a526b', 'N39.0, B96.20, Z46.6 UTI = N39.0, E. coli organism = B96.20. The catheter’s presence is coded with Z46.6 (fitting/adjustment of urinary device) as a relevant status code. T83.511A is used when the catheter CAUSED the infection — the question does not establish that link.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0781ff7f-a66e-417c-a068-9b0bdf3bff59', '26d63dcd-a40f-43d7-9959-e6e57b284877', 36, 'A patient has a documented adverse effect of warfarin — bleeding gums. She is taking the medication as prescribed. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2384066d-ed01-4d87-92ba-1eb1e00e1ccd', '0781ff7f-a66e-417c-a068-9b0bdf3bff59', 0, 'T45.511A, K06.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e4ec838-23bb-4dc1-9ff4-2c7855b2cb6a', '0781ff7f-a66e-417c-a068-9b0bdf3bff59', 1, 'K06.8, T45.515A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('543df48d-f5b8-40a9-9e02-a4007c490efd', '0781ff7f-a66e-417c-a068-9b0bdf3bff59', 2, 'T45.515A, K06.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56ff9cd1-0af0-4e7d-a238-533170acaf86', '0781ff7f-a66e-417c-a068-9b0bdf3bff59', 3, 'T45.511A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0781ff7f-a66e-417c-a068-9b0bdf3bff59', '8e4ec838-23bb-4dc1-9ff4-2c7855b2cb6a', 'K06.8, T45.515A Adverse effect: code the manifestation (K06.8, gum disorder) first, then the adverse effect code (T45.515A — adverse effect of anticoagulants).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', '26d63dcd-a40f-43d7-9959-e6e57b284877', 37, 'How does adverse effect coding differ from poisoning?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aef7c4a0-7758-473a-85da-a6fe76f87ad1', 'f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', 0, 'Adverse effect uses the 5th/6th character “5” (adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('184f670c-1780-45d3-9096-99a1b704bb00', 'f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', 1, 'They are the same — intent determines sequencing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7acb6e9d-1349-480f-8338-596ff54baf97', 'f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', 2, 'Adverse effects are coded only with the medication code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1bc34f8-7e7d-4946-accb-78a8f4aad261', 'f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', 3, 'Poisoning never requires an intent character');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f616f69b-0fd7-4a46-99c4-cef9a0c7b98e', 'aef7c4a0-7758-473a-85da-a6fe76f87ad1', 'Adverse effect = medication taken correctly → 5th/6th character “5.” Poisoning = wrong medication, wrong dose, or wrong intent → characters 1–4 indicate intent (accidental, intentional, assault, undetermined).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('675a0541-d3e9-4b5f-b90b-5ee1347aba25', '26d63dcd-a40f-43d7-9959-e6e57b284877', 38, 'A patient accidentally took a double dose of metformin and became hypoglycemic. How is this classified?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99b443b5-0233-42c0-8497-44e9b3cbd415', '675a0541-d3e9-4b5f-b90b-5ee1347aba25', 0, 'Adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20cc49cc-0c84-4c35-8b70-2c0919619952', '675a0541-d3e9-4b5f-b90b-5ee1347aba25', 1, 'Poisoning — accidental');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a34fc211-9d01-4345-99ad-6bd401df1b48', '675a0541-d3e9-4b5f-b90b-5ee1347aba25', 2, 'Underdosing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa5fb02c-96d7-4aed-b4ee-b7af425d683b', '675a0541-d3e9-4b5f-b90b-5ee1347aba25', 3, 'Complication of care');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('675a0541-d3e9-4b5f-b90b-5ee1347aba25', '20cc49cc-0c84-4c35-8b70-2c0919619952', 'Poisoning — accidental Taking a double dose = not taken as prescribed = poisoning. Accidental intent because the overdose was unintentional.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff117e8e-b93e-4788-b65b-9d3855f489be', '26d63dcd-a40f-43d7-9959-e6e57b284877', 39, 'A home health patient has been non-compliant with taking her prescribed Lasix and now has fluid overload. How should the underdosing be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7df2c6c2-39b7-42cb-b6d4-f07cb1d665e1', 'ff117e8e-b93e-4788-b65b-9d3855f489be', 0, 'T50.1X6A, E87.70, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfb435de-b2a8-47db-b770-456ac6e0b99a', 'ff117e8e-b93e-4788-b65b-9d3855f489be', 1, 'E87.70, T50.1X6A, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6ec75af-f2b5-4d05-a07d-f40650bf5401', 'ff117e8e-b93e-4788-b65b-9d3855f489be', 2, 'E87.70, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9746ca7-dd8d-4931-893f-1bfc51b1c073', 'ff117e8e-b93e-4788-b65b-9d3855f489be', 3, 'T50.1X1A, E87.70');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff117e8e-b93e-4788-b65b-9d3855f489be', 'cfb435de-b2a8-47db-b770-456ac6e0b99a', 'E87.70, T50.1X6A, Z91.120 Underdosing: the resulting condition (fluid overload E87.70) is sequenced first, then the underdosing code (T50.1X6A), then the non-compliance code (Z91.120).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be64ad45-de44-4ebf-a93b-8662bfef591c', '26d63dcd-a40f-43d7-9959-e6e57b284877', 40, 'What is the correct sequencing rule for underdosing codes?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f59bff57-390c-4d34-b4a1-65f08be3250b', 'be64ad45-de44-4ebf-a93b-8662bfef591c', 0, 'The underdosing code is primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('10cce48b-6b50-4b9e-ba50-5b3f720d0a73', 'be64ad45-de44-4ebf-a93b-8662bfef591c', 1, 'The condition resulting from the underdosing is primary; the underdosing code and non-compliance code are additional');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8f5203e-8fc3-4e14-8bf1-7446fdc4a234', 'be64ad45-de44-4ebf-a93b-8662bfef591c', 2, 'Only the non-compliance code is needed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89afdbfa-a3c8-4999-b10f-356dda689699', 'be64ad45-de44-4ebf-a93b-8662bfef591c', 3, 'Underdosing codes are never used in home health');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be64ad45-de44-4ebf-a93b-8662bfef591c', '10cce48b-6b50-4b9e-ba50-5b3f720d0a73', 'The condition resulting from underdosing is primary; the underdosing T-code and the non-compliance/complication code are additional.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('999e904c-272c-467d-8847-a6707bd70cfd', '26d63dcd-a40f-43d7-9959-e6e57b284877', 41, 'A patient has a mechanical complication of a right hip prosthetic joint — documented as periprosthetic osteolysis. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8aa9c355-7934-41d2-a2db-a0b442c92ad2', '999e904c-272c-467d-8847-a6707bd70cfd', 0, 'T84.050A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7498cbe8-59d0-4233-9009-53ea0edd9dd2', '999e904c-272c-467d-8847-a6707bd70cfd', 1, 'T84.059A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3377f276-8653-482c-bb8e-5edc9bd77f66', '999e904c-272c-467d-8847-a6707bd70cfd', 2, 'T84.050D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e68e1804-b011-43ef-b84a-ef6c5701ed8c', '999e904c-272c-467d-8847-a6707bd70cfd', 3, 'M89.751');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('999e904c-272c-467d-8847-a6707bd70cfd', '3377f276-8653-482c-bb8e-5edc9bd77f66', 'T84.050D Periprosthetic osteolysis of right hip = T84.050. In home health, routine care of a known mechanical complication = 7th character D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('24c53bbd-3520-41aa-be85-7becfe6df1f8', '26d63dcd-a40f-43d7-9959-e6e57b284877', 42, 'A patient is receiving home health for physical therapy after right total knee replacement 3 weeks ago. The joint is healing well with no complications. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0851fd6-0cb4-4236-8d74-83a3de052b8b', '24c53bbd-3520-41aa-be85-7becfe6df1f8', 0, 'Z96.651');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40e7ec0b-585c-49a1-bbd0-cdeff3858505', '24c53bbd-3520-41aa-be85-7becfe6df1f8', 1, 'Z47.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11e2223b-30d5-48a9-a7e5-ff2208c2f9f3', '24c53bbd-3520-41aa-be85-7becfe6df1f8', 2, 'T84.84XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cde1e52d-1c7a-46b8-98f6-27eb5a133007', '24c53bbd-3520-41aa-be85-7becfe6df1f8', 3, 'M17.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('24c53bbd-3520-41aa-be85-7becfe6df1f8', '40e7ec0b-585c-49a1-bbd0-cdeff3858505', 'Z47.33 Routine aftercare following knee replacement = Z47.33. Z96.651 is the presence of the prosthetic joint, not the aftercare code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', '26d63dcd-a40f-43d7-9959-e6e57b284877', 43, 'A patient is admitted to home health for PT after left total hip replacement. During the episode, the physician documents “prosthetic joint infection, left hip.” How does coding change?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85212f1e-9efa-4e70-99d7-a1ac85fd6a7b', '43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', 0, 'Continue coding Z47.32 as primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b4dd301-3ad8-4944-9451-805b42972030', '43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', 1, 'Change M1021 to T84.54XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea557957-9729-4935-a8a5-dcdeb41250b6', '43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', 2, 'Code Z96.642, T84.54XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5454c2c-8243-4aa6-9294-cedc283449b3', '43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', 3, 'Code T84.54XA, then Z96.642');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43c9ca2a-cfc6-4ffd-8cd9-acb1e3f5e849', '8b4dd301-3ad8-4944-9451-805b42972030', 'Change M1021 to T84.54XA A new prosthetic joint infection is a complication requiring active treatment → T84.54XA becomes the primary code. “A” because active treatment of the infection is occurring.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8cbb1207-17c4-423e-81cd-0400c5d8f5f4', '26d63dcd-a40f-43d7-9959-e6e57b284877', 44, 'A patient has rheumatoid arthritis with rheumatoid factor, affecting multiple joints. She is on long-term methotrexate. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5a5023a-6266-46f7-a323-56f1ae6e88db', '8cbb1207-17c4-423e-81cd-0400c5d8f5f4', 0, 'M05.79, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebba1512-9cd6-41dd-9d8c-b38e0614227a', '8cbb1207-17c4-423e-81cd-0400c5d8f5f4', 1, 'M06.09, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65be5baa-11c5-4d62-8b9b-0a511f0d0848', '8cbb1207-17c4-423e-81cd-0400c5d8f5f4', 2, 'M05.59, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44b24db2-63b1-425c-bef4-42f197ac352e', '8cbb1207-17c4-423e-81cd-0400c5d8f5f4', 3, 'M06.9, Z79.899');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8cbb1207-17c4-423e-81cd-0400c5d8f5f4', 'e5a5023a-6266-46f7-a323-56f1ae6e88db', 'M05.79, Z79.899 Seropositive RA with RF, multiple sites = M05.79. Long-term methotrexate = Z79.899 (other long-term drug therapy).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2388be0-d47e-40b5-a6dc-70d16e32b816', '26d63dcd-a40f-43d7-9959-e6e57b284877', 45, 'A patient is referred to home health for SN to manage a new diagnosis of CKD stage 4 with anemia of CKD. She is on EPO injections. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd7bc4a8-8b6f-480c-81d4-59e95195dfdc', 'a2388be0-d47e-40b5-a6dc-70d16e32b816', 0, 'N18.4, D63.1, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d73789a8-b687-4f5f-bf60-e5a7c2af51a5', 'a2388be0-d47e-40b5-a6dc-70d16e32b816', 1, 'D63.1, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63167aac-06b9-44ba-95df-6e24d652cfb1', 'a2388be0-d47e-40b5-a6dc-70d16e32b816', 2, 'N18.4, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('918a6d93-6fff-4181-a01e-9ed5db06e0e5', 'a2388be0-d47e-40b5-a6dc-70d16e32b816', 3, 'N18.4, D64.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2388be0-d47e-40b5-a6dc-70d16e32b816', '63167aac-06b9-44ba-95df-6e24d652cfb1', 'N18.4, D63.1 CKD stage 4 = N18.4. Anemia in CKD = D63.1 (anemia in chronic kidney disease — “code first” the underlying CKD). No separate Z79 is needed for EPO per standard practice, though Z79.899 is acceptable.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', '26d63dcd-a40f-43d7-9959-e6e57b284877', 46, 'A patient has documented “benign hypertension.” Under ICD-10-CM, how is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1d69a75-7c78-461a-b925-a4c8b799dd62', '091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', 0, 'I10 — essential hypertension');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bc20d96-2230-4c95-bdf8-352347111026', '091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', 1, 'I10 — there is no separate code for benign vs. malignant hypertension in ICD-10-CM');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7653022-27e4-48f4-a8f9-f2fd5db60c02', '091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', 2, 'I15.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2285618b-add2-4d4d-a4b0-4feb45e129e0', '091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', 3, 'I13.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('091ddc5e-eab9-40f4-b19d-1a6d5c34f0b2', '6bc20d96-2230-4c95-bdf8-352347111026', 'ICD-10-CM eliminated benign vs. malignant hypertension distinction. All essential HTN = I10.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('74cec6bd-afc4-4510-b551-be9d94e1efc0', '26d63dcd-a40f-43d7-9959-e6e57b284877', 47, 'A home health patient’s documentation shows “borderline diabetes.” How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd557c33-89c8-42ac-aaf3-13f78f238edd', '74cec6bd-afc4-4510-b551-be9d94e1efc0', 0, 'E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbe5d87e-6422-49b1-bf14-24cc9c1582d5', '74cec6bd-afc4-4510-b551-be9d94e1efc0', 1, 'R73.03');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5539e169-40fe-4bec-8350-2ec5f55cfae1', '74cec6bd-afc4-4510-b551-be9d94e1efc0', 2, 'E13.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99041247-4ba0-448f-ad29-5c51dd9f8644', '74cec6bd-afc4-4510-b551-be9d94e1efc0', 3, 'R73.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('74cec6bd-afc4-4510-b551-be9d94e1efc0', 'cbe5d87e-6422-49b1-bf14-24cc9c1582d5', 'R73.03 “Borderline diabetes” = prediabetes = R73.03. It is not coded as diabetes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da3e70ec-ddc1-4fff-b53f-e198613fae75', '26d63dcd-a40f-43d7-9959-e6e57b284877', 48, 'A home health patient has morbid obesity with a BMI of 42. What codes are required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d369ef39-9992-43dd-82e9-63aadcf988f7', 'da3e70ec-ddc1-4fff-b53f-e198613fae75', 0, 'E66.01, Z68.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db2a845d-3e81-468d-8c66-6c29793e382c', 'da3e70ec-ddc1-4fff-b53f-e198613fae75', 1, 'E66.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b06bb1a-1e72-477a-80bc-f19ade941f99', 'da3e70ec-ddc1-4fff-b53f-e198613fae75', 2, 'Z68.42, E66.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31fb2bf7-c426-44b8-8646-dcb498390ad8', 'da3e70ec-ddc1-4fff-b53f-e198613fae75', 3, 'E66.9, Z68.42');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('da3e70ec-ddc1-4fff-b53f-e198613fae75', 'd369ef39-9992-43dd-82e9-63aadcf988f7', 'E66.01, Z68.42 Morbid obesity = E66.01. BMI 42 = Z68.42. BMI codes are always secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c4ef5d51-9839-4360-9864-20c26b789b75', '26d63dcd-a40f-43d7-9959-e6e57b284877', 49, 'When coding BMI, from whose documentation can the BMI value be taken?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d85ae22-cc56-420b-9702-4a47f6c12236', 'c4ef5d51-9839-4360-9864-20c26b789b75', 0, 'Only the physician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b03290f9-bb6e-4d22-a438-00dc5f3fcf03', 'c4ef5d51-9839-4360-9864-20c26b789b75', 1, 'Only the assessing clinician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6515a8d7-76ab-4d9d-94ba-c6b40788050e', 'c4ef5d51-9839-4360-9864-20c26b789b75', 2, 'Any qualified healthcare provider — but the associated diagnosis (obesity) must come from the patient’s provider');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('220b3e0b-fd67-4720-bae2-2a9e8c3d035b', 'c4ef5d51-9839-4360-9864-20c26b789b75', 3, 'The coder may calculate it from height and weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c4ef5d51-9839-4360-9864-20c26b789b75', '6515a8d7-76ab-4d9d-94ba-c6b40788050e', 'BMI can be documented by any qualified healthcare provider (nurse, dietitian), but the associated diagnosis (obesity) must be documented by the patient’s responsible provider.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('774559c1-846c-446f-a112-697500a3cd04', '26d63dcd-a40f-43d7-9959-e6e57b284877', 50, 'A patient is admitted to HH after a right CVA with left-sided hemiplegia. The patient is left-hand dominant. How should the hemiplegia be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b12c91b7-0f35-4e07-a645-b844ac03fcba', '774559c1-846c-446f-a112-697500a3cd04', 0, 'G81.92');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7c0bc755-b303-4ec5-8fb4-944b674ffba4', '774559c1-846c-446f-a112-697500a3cd04', 1, 'G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a414a835-300b-4c17-b314-716cc29abe7a', '774559c1-846c-446f-a112-697500a3cd04', 2, 'I63.9, G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd479f94-2781-4c00-8975-887e49e01198', '774559c1-846c-446f-a112-697500a3cd04', 3, 'I63.9, G81.92');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('774559c1-846c-446f-a112-697500a3cd04', 'a414a835-300b-4c17-b314-716cc29abe7a', 'I63.9, G81.94 Acute CVA = I63.9. Left-sided hemiplegia in a left-dominant patient = G81.94 (affecting the dominant side).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df089788-40ae-4f95-975c-079e439a72bb', '26d63dcd-a40f-43d7-9959-e6e57b284877', 51, 'The same patient from Q50 is readmitted to HH 8 months later. The CVA has resolved, but left-sided hemiplegia persists. How is the hemiplegia now coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af6f0c47-8d18-435b-8e18-d9236d526d21', 'df089788-40ae-4f95-975c-079e439a72bb', 0, 'G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4682b17a-a324-48b8-8ddb-26cca4f3af7b', 'df089788-40ae-4f95-975c-079e439a72bb', 1, 'I69.354');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('503f4345-b4b1-43ad-bff1-4a6e69c66ebe', 'df089788-40ae-4f95-975c-079e439a72bb', 2, 'I69.352');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ac28d6ba-d7dd-491a-9578-01cb6c4528e4', 'df089788-40ae-4f95-975c-079e439a72bb', 3, 'I69.959');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('df089788-40ae-4f95-975c-079e439a72bb', '4682b17a-a324-48b8-8ddb-26cca4f3af7b', 'I69.354 Resolved CVA with residual hemiplegia = I69.354 (hemiplegia affecting dominant side, following cerebral infarction). The acute stroke code is no longer used.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('129ab50c-e2bc-4760-a0ed-143752ad6fb5', '26d63dcd-a40f-43d7-9959-e6e57b284877', 52, 'A patient has residual aphasia from a prior CVA. The CVA itself is resolved. She is also left-hand dominant. How is the aphasia coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dba92d61-14c3-4ecd-aa7e-271ecf43a89a', '129ab50c-e2bc-4760-a0ed-143752ad6fb5', 0, 'R47.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6100e838-76c9-4168-a974-6aa5172faf77', '129ab50c-e2bc-4760-a0ed-143752ad6fb5', 1, 'I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4ddcffb-4469-47a8-9318-37bad4b46e61', '129ab50c-e2bc-4760-a0ed-143752ad6fb5', 2, 'I69.920');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc5811ba-3f10-4421-973e-91133c2910d8', '129ab50c-e2bc-4760-a0ed-143752ad6fb5', 3, 'R47.01, I63.9S');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('129ab50c-e2bc-4760-a0ed-143752ad6fb5', '6100e838-76c9-4168-a974-6aa5172faf77', 'I69.320 Residual aphasia from resolved CVA = I69.320 (aphasia following cerebral infarction). Dominance is not relevant for aphasia coding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', '26d63dcd-a40f-43d7-9959-e6e57b284877', 53, 'A home health patient has Parkinson’s disease (without dyskinesia, without motor fluctuations) with documented dementia. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46b80fe5-a042-404d-abdc-1cadb62b855b', '405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', 0, 'G20, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb3a611a-0c07-4cd4-bfdf-e97f1da38f22', '405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', 1, 'F02.80, G20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b2ca398-a455-4b47-aa74-d1c4e9ce25c1', '405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', 2, 'G20.A1, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6664a05b-c095-4884-9bd0-c6a5f3283a1f', '405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', 3, 'G20, F03.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('405e8339-1ef1-45a8-a3dd-0e6a808fb0cb', '7b2ca398-a455-4b47-aa74-d1c4e9ce25c1', 'G20.A1 (Parkinson''s disease without dyskinesia, without mention of fluctuations — matching the documented status) is coded first, per the ''code first'' sequencing convention, followed by F02.80 (dementia in diseases classified elsewhere, without behavioral disturbance). G20 alone is a non-billable parent and is not sufficient. Reversing the sequence (option B) is incorrect, since Parkinson''s is the etiology and must be sequenced first. F03.90 (option D) is the wrong dementia code — it''s used only when no underlying cause is documented, not when the dementia is specifically attributed to a diagnosed disease like Parkinson''s.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b3d62b26-ce9e-4f3e-9410-012433380346', '26d63dcd-a40f-43d7-9959-e6e57b284877', 54, 'A patient with Alzheimer’s disease (early onset) has documented wandering behavior. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8debf98a-6a42-4362-be01-2e0cf34a4b8a', 'b3d62b26-ce9e-4f3e-9410-012433380346', 0, 'G30.0, F02.811, Z91.83');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f53ffca-347f-45d5-8a8a-15e0b0504656', 'b3d62b26-ce9e-4f3e-9410-012433380346', 1, 'G30.0, F02.A0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88a32ca2-6be5-46bf-bea3-f58ebf40f7dc', 'b3d62b26-ce9e-4f3e-9410-012433380346', 2, 'G30.0, F02.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1dbf0ecc-b882-4bbe-ab57-969f17e394b6', 'b3d62b26-ce9e-4f3e-9410-012433380346', 3, 'F02.811, G30.0, Z91.83');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b3d62b26-ce9e-4f3e-9410-012433380346', '8debf98a-6a42-4362-be01-2e0cf34a4b8a', 'G30.0, F02.811, Z91.83 Early-onset Alzheimer’s = G30.0 (code first). Dementia with behavioral disturbance = F02.811. Wandering = Z91.83 (additional code).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48ac702e-306a-4d3c-bd87-ab2b63789404', '26d63dcd-a40f-43d7-9959-e6e57b284877', 55, 'A patient with epilepsy has a seizure during the home health visit. She has documented intractable generalized tonic-clonic epilepsy. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e78e15c-7e5d-4240-ae46-4a960aed1159', '48ac702e-306a-4d3c-bd87-ab2b63789404', 0, 'G40.319');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('539f4816-eda5-4f2a-88d5-afc33fbded22', '48ac702e-306a-4d3c-bd87-ab2b63789404', 1, 'G40.311');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65afaf3c-ed0f-4618-9077-ab6333090842', '48ac702e-306a-4d3c-bd87-ab2b63789404', 2, 'G40.319, R56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a1131dd-d5f1-41c3-85a7-bb4a547a43c2', '48ac702e-306a-4d3c-bd87-ab2b63789404', 3, 'R56.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('48ac702e-306a-4d3c-bd87-ab2b63789404', '539f4816-eda5-4f2a-88d5-afc33fbded22', 'G40.311 Intractable generalized tonic-clonic epilepsy = G40.311 (with status epilepticus would be G40.311). The seizure (R56.9) is integral to epilepsy and is not coded separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', '26d63dcd-a40f-43d7-9959-e6e57b284877', 56, 'Per the ICD-10-CM guidelines, when a patient has a personal history of a condition that no longer exists and is not receiving treatment for it, what type of code should be used?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('917a1286-a903-430f-b898-09807be1d4a8', '759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', 0, 'The acute condition code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95a533e8-8123-46c2-ac99-a40a22b7b869', '759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', 1, 'A Z code for personal history');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3af7d640-0fcb-4e92-b201-738cf5e51e83', '759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', 2, 'A Z code for status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7faccf0-fafe-4f7a-a75b-88f87ef1e69c', '759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', 3, 'No code is needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('759bdb6b-f0fa-4505-9eb2-1ad97b6d2450', '95a533e8-8123-46c2-ac99-a40a22b7b869', 'A Z code for personal history When a condition no longer exists and is not being treated, a personal history Z code (Z85-Z87) is appropriate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('299ee5b5-fe22-4b95-a8df-9065fb78bc0b', '26d63dcd-a40f-43d7-9959-e6e57b284877', 57, 'A home health patient had breast cancer 5 years ago, completed treatment, and has no evidence of disease. She is referred for lymphedema management of the right arm. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d31dec39-f48f-4ba2-b505-7ec8dfa78652', '299ee5b5-fe22-4b95-a8df-9065fb78bc0b', 0, 'C50.911, I97.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ea19657-ed99-4a3e-a8ce-c7351b31426d', '299ee5b5-fe22-4b95-a8df-9065fb78bc0b', 1, 'Z85.3, I97.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a14412b-e143-4d96-8161-1ba5971ec872', '299ee5b5-fe22-4b95-a8df-9065fb78bc0b', 2, 'I97.2, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62d47921-1942-40bf-a1c9-a4be2b90caae', '299ee5b5-fe22-4b95-a8df-9065fb78bc0b', 3, 'I89.0, Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('299ee5b5-fe22-4b95-a8df-9065fb78bc0b', '5ea19657-ed99-4a3e-a8ce-c7351b31426d', 'Z85.3, I97.2 Breast cancer no longer present = Z85.3 (personal history). Lymphedema is coded I97.2 (postmastectomy lymphedema syndrome). The lymphedema management is the reason for HH, but Z85.3 as M1021 establishes the clinical context.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c1ec06e8-c5d6-4389-908e-0e13cb3629be', '26d63dcd-a40f-43d7-9959-e6e57b284877', 58, 'A patient has a current malignant neoplasm of the prostate and is receiving home health for pain management. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44fac378-a321-4f2d-a7bc-fad02189f2b0', 'c1ec06e8-c5d6-4389-908e-0e13cb3629be', 0, 'C61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fbbf9a1b-e7be-4c54-b5d4-53460862cff9', 'c1ec06e8-c5d6-4389-908e-0e13cb3629be', 1, 'G89.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('acb8b939-4610-43dc-929e-9ab33e9104bc', 'c1ec06e8-c5d6-4389-908e-0e13cb3629be', 2, 'Z51.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64abcccc-4c0c-482e-bee5-88f66a534b25', 'c1ec06e8-c5d6-4389-908e-0e13cb3629be', 3, 'G89.3, C61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c1ec06e8-c5d6-4389-908e-0e13cb3629be', '44fac378-a321-4f2d-a7bc-fad02189f2b0', 'C61 Active malignant neoplasm of the prostate = C61 as M1021. G89.3 (neoplasm-related pain) may be added as secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', '26d63dcd-a40f-43d7-9959-e6e57b284877', 59, 'A patient is admitted to home health for chemotherapy-related nausea management. She has ovarian cancer currently under treatment. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db83c01e-e2a1-4225-a8ab-f4890eca8ef9', '61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', 0, 'C56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96e5a699-9adf-4e05-9db5-50c6049a95e2', '61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', 1, 'R11.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fb24f39-a386-4a3c-95f5-9c9e7e414ea7', '61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', 2, 'Z51.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98294127-874b-4bd3-b769-b8206f557477', '61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', 3, 'T45.1X5A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('61f07b2e-a1cb-4c8d-9ad1-af72b5e4ef69', 'db83c01e-e2a1-4225-a8ab-f4890eca8ef9', 'C56.9 The active cancer (C56.9) is M1021 — it is the underlying reason the patient is receiving home health and having chemotherapy complications.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc44dcd7-2d56-4829-856b-7a78e9adb1c3', '26d63dcd-a40f-43d7-9959-e6e57b284877', 60, 'A patient completed radiation therapy for lung cancer 6 months ago. The cancer is in remission. She now has radiation fibrosis of the lung. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a38d17f0-5f5b-40eb-8881-19f4d881958a', 'cc44dcd7-2d56-4829-856b-7a78e9adb1c3', 0, 'C34.90, J70.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24a2d16f-8244-423a-8de1-d9a5d0cdda1d', 'cc44dcd7-2d56-4829-856b-7a78e9adb1c3', 1, 'J70.1, Z85.118');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('972a3a33-cad8-4ced-a1e9-3a2602883efe', 'cc44dcd7-2d56-4829-856b-7a78e9adb1c3', 2, 'J70.1, C34.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c86e41c1-a65b-40d5-a210-87f905f5378b', 'cc44dcd7-2d56-4829-856b-7a78e9adb1c3', 3, 'Z85.118, J70.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cc44dcd7-2d56-4829-856b-7a78e9adb1c3', '24a2d16f-8244-423a-8de1-d9a5d0cdda1d', 'J70.1, Z85.118 Radiation fibrosis of the lung = J70.1 (chronic pulmonary manifestation due to radiation). Cancer is in remission/treated = Z85.118 (history). The active cancer code is no longer used once treatment is complete and the cancer is in remission.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('143d4ac2-7cb8-4eca-8a4e-5084933fcca6', '26d63dcd-a40f-43d7-9959-e6e57b284877', 61, 'A home health patient is on long-term Coumadin for a mechanical heart valve. What codes apply when the encounter is for INR monitoring?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97cd9f71-6e2c-410c-a455-bcf62a61a7ad', '143d4ac2-7cb8-4eca-8a4e-5084933fcca6', 0, 'Z95.2, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05cab32f-dcbc-4b47-b23e-8c4d8adc32c1', '143d4ac2-7cb8-4eca-8a4e-5084933fcca6', 1, 'Z51.81, Z79.01, Z95.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('649678e3-63c4-4f27-bfe7-a7c7d8d3713a', '143d4ac2-7cb8-4eca-8a4e-5084933fcca6', 2, 'Z79.01, Z95.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ccceb4e7-6dce-40f4-96ab-f0498504eaaa', '143d4ac2-7cb8-4eca-8a4e-5084933fcca6', 3, 'Z51.81, Z95.2, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('143d4ac2-7cb8-4eca-8a4e-5084933fcca6', '05cab32f-dcbc-4b47-b23e-8c4d8adc32c1', 'Z51.81, Z79.01, Z95.2 Encounter for drug monitoring = Z51.81 primary. Z79.01 = long-term anticoagulant. Z95.2 = prosthetic heart valve.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('af0408f5-ad04-4b92-b730-212d63264cd3', '26d63dcd-a40f-43d7-9959-e6e57b284877', 62, 'Under OASIS, when must the SOC comprehensive assessment be completed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('694fdf07-5cdc-4647-9909-3c62794f0b6e', 'af0408f5-ad04-4b92-b730-212d63264cd3', 0, 'During the first visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7c9c8a6-3259-4da9-836f-25fe5bc4c43e', 'af0408f5-ad04-4b92-b730-212d63264cd3', 1, 'Within 5 calendar days after the start of care date');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91f27a4f-b345-46d5-931f-95c833dc7d7b', 'af0408f5-ad04-4b92-b730-212d63264cd3', 2, 'Within 48 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a62c3748-a562-495b-9d34-08dcd92b2abb', 'af0408f5-ad04-4b92-b730-212d63264cd3', 3, 'Before the second visit');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('af0408f5-ad04-4b92-b730-212d63264cd3', 'b7c9c8a6-3259-4da9-836f-25fe5bc4c43e', 'Within 5 calendar days after the start of care date The SOC comprehensive assessment must be completed within 5 days after SOC.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('01ad9a95-fae7-4281-80f9-b3d1470d2f7a', '26d63dcd-a40f-43d7-9959-e6e57b284877', 63, 'Who may complete the SOC OASIS assessment when both SN and PT are ordered?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6170257c-5010-4389-a6cd-578f3968e828', '01ad9a95-fae7-4281-80f9-b3d1470d2f7a', 0, 'Either the RN or the PT');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e62f1561-b37b-4030-9845-06c347764ff5', '01ad9a95-fae7-4281-80f9-b3d1470d2f7a', 1, 'The RN, because nursing is ordered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('511b3606-9afe-4129-9234-9c63221bb48d', '01ad9a95-fae7-4281-80f9-b3d1470d2f7a', 2, 'Whichever discipline visits first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0773eba1-3ce0-4367-b6d3-41e2f1d77aec', '01ad9a95-fae7-4281-80f9-b3d1470d2f7a', 3, 'The physician determines who completes it');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('01ad9a95-fae7-4281-80f9-b3d1470d2f7a', 'e62f1561-b37b-4030-9845-06c347764ff5', 'The RN, because nursing is ordered When nursing is an ordered discipline, the RN must perform the initial assessment and SOC OASIS (42 CFR 484.55).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a212825-8b5b-4989-a916-cc6b4f19183f', '26d63dcd-a40f-43d7-9959-e6e57b284877', 64, 'A therapy-only case (PT, OT, and SLP ordered, no nursing) — who performs the initial OASIS assessment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97b6b981-fc18-41f9-8137-07dc02f69dae', '9a212825-8b5b-4989-a916-cc6b4f19183f', 0, 'Only an RN can do OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd1e03d9-411f-4bf5-8934-4a9474948064', '9a212825-8b5b-4989-a916-cc6b4f19183f', 1, 'The qualified therapist for the therapy discipline ordered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e80f52bd-d5fe-4748-b65d-065f19a9a689', '9a212825-8b5b-4989-a916-cc6b4f19183f', 2, 'A supervisory RN must do it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd8fd5c8-95c7-4c5b-8f0e-51f48707ff6e', '9a212825-8b5b-4989-a916-cc6b4f19183f', 3, 'OASIS is not required for therapy-only cases');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9a212825-8b5b-4989-a916-cc6b4f19183f', 'bd1e03d9-411f-4bf5-8934-4a9474948064', 'The qualified therapist for the therapy discipline ordered In therapy-only cases, the qualified therapist may perform the initial assessment and OASIS.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', '26d63dcd-a40f-43d7-9959-e6e57b284877', 65, 'What is the timeframe for the recertification OASIS assessment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0006d31b-9a71-4a6f-94a9-84a0df1ef16f', '226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', 0, 'The last 5 days of the current 60-day episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('398a1548-1e3a-4a5d-8e8c-919d939fbba9', '226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', 1, 'Days 56–60 of the current certification period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('062409af-636b-495d-9190-863c83f7cdc0', '226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', 2, 'Within 48 hours of the new certification period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ffbff645-cd23-4365-97c8-e96288a55078', '226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', 3, 'Any time during the last 2 weeks');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('226c81f8-23eb-48ef-ba0f-88d9ba9f48cd', '398a1548-1e3a-4a5d-8e8c-919d939fbba9', 'Days 56–60 of the current certification period The recertification assessment window is the last 5 days of the current 60-day period.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('af0c717e-be4f-4c0e-b185-ee3a9290c399', '26d63dcd-a40f-43d7-9959-e6e57b284877', 66, 'The OASIS Transfer assessment (RFA 6) must be completed when?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b48d325-4257-4035-b8e5-a5be5cc7bc8a', 'af0c717e-be4f-4c0e-b185-ee3a9290c399', 0, 'Within 48 hours of the transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8109bde-0aa7-44df-a484-2d28791396dd', 'af0c717e-be4f-4c0e-b185-ee3a9290c399', 1, 'On the date of transfer to an inpatient facility');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d45de84-68e9-4dfe-8119-f1977cd72c1a', 'af0c717e-be4f-4c0e-b185-ee3a9290c399', 2, 'Within 2 business days of learning of the transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54f1a57d-cacf-42a5-8f58-6f6aa35a7b0d', 'af0c717e-be4f-4c0e-b185-ee3a9290c399', 3, 'On the next business day after transfer');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('af0c717e-be4f-4c0e-b185-ee3a9290c399', 'd8109bde-0aa7-44df-a484-2d28791396dd', 'On the date of transfer to an inpatient facility The Transfer OASIS (RFA 6) is completed on the date of transfer.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70c3111b-e588-46c8-b367-5a15deb4ce8d', '26d63dcd-a40f-43d7-9959-e6e57b284877', 67, 'Under the OASIS correction policy, what types of changes can a coder make without clinician involvement?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('269c5065-ead5-490d-a37f-ccdf02f6e414', '70c3111b-e588-46c8-b367-5a15deb4ce8d', 0, 'Any coding change');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d9cc974-81bc-4ec6-9037-57420b76b7ff', '70c3111b-e588-46c8-b367-5a15deb4ce8d', 1, 'Technical corrections only — such as sequencing corrections or fixing obvious transcription errors');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc624e59-7eef-47aa-987e-09e5f940ee7b', '70c3111b-e588-46c8-b367-5a15deb4ce8d', 2, 'Changes to clinical assessment items');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('18eb3129-0bfc-481e-860d-c4e19dc082f5', '70c3111b-e588-46c8-b367-5a15deb4ce8d', 3, 'Changes to diagnosis codes based on coder clinical judgment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('70c3111b-e588-46c8-b367-5a15deb4ce8d', '4d9cc974-81bc-4ec6-9037-57420b76b7ff', 'Technical corrections only Coders can make technical corrections (sequencing fixes, obvious transcription errors). Clinical or substantive changes require the assessing clinician.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ca85a9f-05b5-41e4-8230-801b0eebaa59', '26d63dcd-a40f-43d7-9959-e6e57b284877', 68, 'Under Medicare CoP, how many days does the agency have to complete the initial assessment visit?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc3ab248-5daf-4391-962f-ff4093107307', '8ca85a9f-05b5-41e4-8230-801b0eebaa59', 0, '24 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('780ca814-14ba-481b-8eb3-8cc2f9f35029', '8ca85a9f-05b5-41e4-8230-801b0eebaa59', 1, '48 hours from referral');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25c71989-ec0d-4f24-8c09-e5957c1b604a', '8ca85a9f-05b5-41e4-8230-801b0eebaa59', 2, 'Within 48 hours of referral, or within 48 hours of the patient’s return home, or on the physician-ordered SOC date');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdc2fdfd-21ee-44d1-8206-9be29fa28c42', '8ca85a9f-05b5-41e4-8230-801b0eebaa59', 3, '5 calendar days');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8ca85a9f-05b5-41e4-8230-801b0eebaa59', '25c71989-ec0d-4f24-8c09-e5957c1b604a', 'The initial assessment visit must occur within 48 hours of referral, within 48 hours of the patient’s return home, or on the physician-ordered SOC date.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', '26d63dcd-a40f-43d7-9959-e6e57b284877', 69, 'A physician orders home health services but does not sign the plan of care. What is required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('47c9e46b-ba14-4022-a249-b2eb46f71818', 'a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', 0, 'Services can proceed without a signed POC for up to 60 days');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('782a411f-017d-43fa-8e16-13022ace60a7', 'a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', 1, 'The verbal order is sufficient permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf853741-8ec1-4da2-8eac-a8549ecc77c9', 'a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', 2, 'A physician must sign the plan of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44703fb6-021c-478d-9f47-e644e98057f3', 'a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', 3, 'The RN can sign on behalf of the physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2605c88-e0d5-41ca-bc4e-6f9a395f7c00', 'cf853741-8ec1-4da2-8eac-a8549ecc77c9', 'A physician signature is required on the plan of care. Services may begin based on verbal orders, but the POC must ultimately be signed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c47e92d-7e44-4ede-8bdf-a35956a7b742', '26d63dcd-a40f-43d7-9959-e6e57b284877', 70, 'For OASIS purposes, which of the following conditions would be coded as M1021 (primary diagnosis)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a0aa1df-b8f0-4523-bcda-55dee1dfdf16', '0c47e92d-7e44-4ede-8bdf-a35956a7b742', 0, 'The most severe diagnosis the patient has');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e594fdc-6a96-4141-8500-f1a09e3e782b', '0c47e92d-7e44-4ede-8bdf-a35956a7b742', 1, 'The diagnosis that most impacts the home health plan of care and is the chief reason for home health services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d122f5f-8bc3-4ed2-9404-674215892e52', '0c47e92d-7e44-4ede-8bdf-a35956a7b742', 2, 'The first diagnosis listed on the hospital discharge summary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f00eac4-4e66-4a1a-b96e-e21b2cce65d0', '0c47e92d-7e44-4ede-8bdf-a35956a7b742', 3, 'The diagnosis with the highest case-mix weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0c47e92d-7e44-4ede-8bdf-a35956a7b742', '9e594fdc-6a96-4141-8500-f1a09e3e782b', 'M1021 is the diagnosis most related to the home health plan of care — the chief reason skilled services are being provided.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d31b7cfa-686d-4a95-b925-06c4a2423c23', '26d63dcd-a40f-43d7-9959-e6e57b284877', 71, 'A patient is admitted to home health with heart failure as M1021. Two weeks into the episode, she develops a UTI that becomes the main focus of skilled care. Should M1021 change?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c0eabefb-e4d1-4f57-83b5-906636130c9d', 'd31b7cfa-686d-4a95-b925-06c4a2423c23', 0, 'No — M1021 never changes during a certification period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('acd19f64-9761-4a6a-8b17-f08bdbe2a573', 'd31b7cfa-686d-4a95-b925-06c4a2423c23', 1, 'Yes — M1021 should be updated to reflect the UTI if it is now the chief reason for home health services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d774592-51ce-47ae-8ae9-e2614ac2fe4b', 'd31b7cfa-686d-4a95-b925-06c4a2423c23', 2, 'Only if the physician writes a new order');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('faea871d-5a14-454e-8548-4493da5f6945', 'd31b7cfa-686d-4a95-b925-06c4a2423c23', 3, 'Only at recertification');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d31b7cfa-686d-4a95-b925-06c4a2423c23', 'acd19f64-9761-4a6a-8b17-f08bdbe2a573', 'M1021 can be changed during the certification period when a new condition becomes the primary reason for home health services, following agency and physician collaboration.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('741988bf-4d41-4631-99df-ee7c35aa1ba2', '26d63dcd-a40f-43d7-9959-e6e57b284877', 72, 'A patient is admitted for wound care of a Stage 3 pressure ulcer of the sacrum. Two weeks later, the wound now has slough covering the wound bed and cannot be staged. How is the pressure ulcer coded now?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b11b5c5-5fdd-469b-96e8-ce0e9e92d0d9', '741988bf-4d41-4631-99df-ee7c35aa1ba2', 0, 'Change to unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('918cd3de-a207-4a08-bfb4-53a5ee0311d2', '741988bf-4d41-4631-99df-ee7c35aa1ba2', 1, 'Keep as Stage 3 — do not reverse-stage or change to unstageable when a previously staged ulcer becomes covered with slough');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('90d5fb59-60ea-4392-9ad6-a1af232123ab', '741988bf-4d41-4631-99df-ee7c35aa1ba2', 2, 'Change to unspecified stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92f398d7-cee0-4cd1-b424-d4d44d2606e1', '741988bf-4d41-4631-99df-ee7c35aa1ba2', 3, 'Code as Stage 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('741988bf-4d41-4631-99df-ee7c35aa1ba2', '918cd3de-a207-4a08-bfb4-53a5ee0311d2', 'Never reverse-stage. A previously staged pressure ulcer that becomes covered with slough retains its original staging. Unstageable is only for wounds that were NEVER previously staged.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e99b2c07-460f-4750-aba7-b94ae8c6fc19', '26d63dcd-a40f-43d7-9959-e6e57b284877', 73, 'A newly admitted patient has a pressure ulcer of the left heel entirely covered by eschar. This is the first observation. What stage is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e66ad650-8d40-4fd8-b260-d107a0c59d19', 'e99b2c07-460f-4750-aba7-b94ae8c6fc19', 0, 'Stage 4 — eschar always means Stage 4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27012899-ca5f-4295-b6d8-b05b1e8b9108', 'e99b2c07-460f-4750-aba7-b94ae8c6fc19', 1, 'Unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86bb8897-c274-4afa-91e5-92bfb18ed219', 'e99b2c07-460f-4750-aba7-b94ae8c6fc19', 2, 'Unspecified stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4460b6c-6c62-4a3e-b8c9-d0187ba89d14', 'e99b2c07-460f-4750-aba7-b94ae8c6fc19', 3, 'Stage 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e99b2c07-460f-4750-aba7-b94ae8c6fc19', '27012899-ca5f-4295-b6d8-b05b1e8b9108', 'Unstageable A newly observed PU entirely covered by eschar = unstageable on first observation (the wound bed cannot be visualized to determine the stage).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f1116663-47dc-4f57-a11b-573b66090a7f', '26d63dcd-a40f-43d7-9959-e6e57b284877', 74, 'For OASIS item M1311 (current number of unhealed pressure ulcers at each stage), does the count include pressure ulcers that have been surgically repaired with a flap or graft?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6fab0e88-70c1-40af-9393-ced8ed5976b7', 'f1116663-47dc-4f57-a11b-573b66090a7f', 0, 'Yes — always count them at the original stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50cd4218-bd2f-407a-8909-33118e8a9b53', 'f1116663-47dc-4f57-a11b-573b66090a7f', 1, 'No — surgically repaired pressure ulcers are no longer coded as pressure ulcers; they are surgical wounds');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebe74138-5ea8-45c7-86ff-722499933a3f', 'f1116663-47dc-4f57-a11b-573b66090a7f', 2, 'Only if the graft has failed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61374446-9f2b-44b9-9cf3-26fba5fedf05', 'f1116663-47dc-4f57-a11b-573b66090a7f', 3, 'Only if the original stage was 3 or 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f1116663-47dc-4f57-a11b-573b66090a7f', '50cd4218-bd2f-407a-8909-33118e8a9b53', 'A pressure ulcer surgically repaired with a flap/graft is no longer classified as a pressure ulcer for OASIS staging — it becomes a surgical wound.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('731a6a1f-b70f-46e1-8d57-784bb2bab86a', '26d63dcd-a40f-43d7-9959-e6e57b284877', 75, 'A patient has a stasis ulcer of the right lower leg with both varicose veins and inflammation. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e09aa328-2801-4c75-bfb3-d6d4b8c21d3b', '731a6a1f-b70f-46e1-8d57-784bb2bab86a', 0, 'L97.911, I83.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b49dbd5d-1b2d-4cb7-ae45-dcf2f41fbe68', '731a6a1f-b70f-46e1-8d57-784bb2bab86a', 1, 'I83.211, L97.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50223243-7542-444e-adee-a55d4b86af41', '731a6a1f-b70f-46e1-8d57-784bb2bab86a', 2, 'I83.211, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4463e978-6525-4b2f-b582-1581a2f731bf', '731a6a1f-b70f-46e1-8d57-784bb2bab86a', 3, 'I87.311, L97.211');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('731a6a1f-b70f-46e1-8d57-784bb2bab86a', '50223243-7542-444e-adee-a55d4b86af41', 'I83.211, L97.211 Varicose veins with ulcer and inflammation of right lower leg = I83.211 (code first), then L97.211 for site and severity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc4685f4-2529-41ba-980a-138e49fd73f2', '26d63dcd-a40f-43d7-9959-e6e57b284877', 76, 'A patient has peripheral arterial disease with an ulcer on the left ankle with muscle involvement. What codes are assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3aaa8945-d1b5-410c-82e4-4ee7f49f20bf', 'cc4685f4-2529-41ba-980a-138e49fd73f2', 0, 'I70.242, L97.329');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63a60231-786d-4b28-92c7-1af6617348f0', 'cc4685f4-2529-41ba-980a-138e49fd73f2', 1, 'L97.322, I70.242');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('009673f4-604b-4120-953f-60787f6e2151', 'cc4685f4-2529-41ba-980a-138e49fd73f2', 2, 'I70.242, L97.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73881604-fd85-4ef7-a07d-47512e4a236b', 'cc4685f4-2529-41ba-980a-138e49fd73f2', 3, 'I70.232, L97.322');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cc4685f4-2529-41ba-980a-138e49fd73f2', '009673f4-604b-4120-953f-60787f6e2151', 'I70.242, L97.322 PAD with ulcer of left ankle, muscle involvement: I70.242 (atherosclerosis, left leg with ulceration of ankle) coded first, then L97.322 (non-pressure chronic ulcer of left ankle with muscle involvement).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a305b9df-cc11-4644-8909-081ddbfc4cbe', '26d63dcd-a40f-43d7-9959-e6e57b284877', 77, 'For OASIS M1340 (Does this patient have a surgical wound?), which of the following is TRUE?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db042d1f-8bc4-47a1-bcab-043f2d02118e', 'a305b9df-cc11-4644-8909-081ddbfc4cbe', 0, 'Surgical wounds are only counted during the first 30 days post-surgery');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a1e4877-ec14-4c7b-96a0-8f59e6e37be0', 'a305b9df-cc11-4644-8909-081ddbfc4cbe', 1, 'A surgically closed wound is a surgical wound as long as it has not fully epithelialized');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2bd12176-b8ad-4a3b-82fa-8791d6471b9d', 'a305b9df-cc11-4644-8909-081ddbfc4cbe', 2, 'All healed surgical sites must still be reported');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2714666-a2fb-4559-8f4b-68e8b1205e40', 'a305b9df-cc11-4644-8909-081ddbfc4cbe', 3, 'Only wounds with complications count');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a305b9df-cc11-4644-8909-081ddbfc4cbe', '5a1e4877-ec14-4c7b-96a0-8f59e6e37be0', 'A surgically closed wound counts as a surgical wound for OASIS M1340 as long as it has not fully epithelialized/healed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75d929e5-5577-4883-b54e-e7767ea25b79', '26d63dcd-a40f-43d7-9959-e6e57b284877', 78, 'A patient had cardiac catheterization via the right femoral artery 4 days ago. The puncture site is still visible but healing well. Is this a surgical wound per OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b5a1ce7-ceda-4f72-856a-028a5ca22725', '75d929e5-5577-4883-b54e-e7767ea25b79', 0, 'No — catheterization sites are not surgical wounds');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbf4e2c9-67f7-4691-b001-d008b9470447', '75d929e5-5577-4883-b54e-e7767ea25b79', 1, 'Yes — any percutaneous vascular access site that has not fully healed is a surgical wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50e8024c-bfa0-42fc-bbd8-6db7dba77af6', '75d929e5-5577-4883-b54e-e7767ea25b79', 2, 'Only if it has complications');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c39c901c-4b6b-4ae3-8d5d-a188ef583cb2', '75d929e5-5577-4883-b54e-e7767ea25b79', 3, 'Only if it required sutures');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75d929e5-5577-4883-b54e-e7767ea25b79', 'cbf4e2c9-67f7-4691-b001-d008b9470447', 'Per OASIS guidance, percutaneous vascular access sites (catheterization) that are still open/healing are considered surgical wounds.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b272a816-dd60-4d14-b944-3651bebde7d8', '26d63dcd-a40f-43d7-9959-e6e57b284877', 79, 'A home health patient has a documented “history of MRSA.” She has no current MRSA infection. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('41eb6579-4096-42f3-a3b0-614eab1d4f16', 'b272a816-dd60-4d14-b944-3651bebde7d8', 0, 'B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5a4f3f8-ef67-47ae-aade-b1b5f2716d1c', 'b272a816-dd60-4d14-b944-3651bebde7d8', 1, 'Z16.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d41c7f88-3b7a-4842-8baa-323607fa015f', 'b272a816-dd60-4d14-b944-3651bebde7d8', 2, 'Z22.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39416530-1f71-4f8a-b9fe-eb0566517c10', 'b272a816-dd60-4d14-b944-3651bebde7d8', 3, 'Z86.14');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b272a816-dd60-4d14-b944-3651bebde7d8', '39416530-1f71-4f8a-b9fe-eb0566517c10', 'Z86.14 History of MRSA with no current infection = Z86.14 (personal history of MRSA). Z22.322 is MRSA colonization/carrier (requires documentation of current carrier status, not just history).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62056022-17e3-4c09-b607-ccc37a2b5a5f', '26d63dcd-a40f-43d7-9959-e6e57b284877', 80, 'A patient has a current wound infection with MRSA identified as the organism. How is MRSA coded in addition to the wound infection code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ad7a61f-9ef8-4acc-8d9b-329416fd32d8', '62056022-17e3-4c09-b607-ccc37a2b5a5f', 0, 'Z22.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60156dcd-9b66-4d42-94b8-1f9095b2a131', '62056022-17e3-4c09-b607-ccc37a2b5a5f', 1, 'B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b260c6f-176f-4e47-8323-bf13fb762c51', '62056022-17e3-4c09-b607-ccc37a2b5a5f', 2, 'A49.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24e21b8f-eba4-443c-8143-97aa4f1bb819', '62056022-17e3-4c09-b607-ccc37a2b5a5f', 3, 'Z16.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('62056022-17e3-4c09-b607-ccc37a2b5a5f', '60156dcd-9b66-4d42-94b8-1f9095b2a131', 'B95.62 Current MRSA as the causal organism of a documented infection = B95.62, coded as an additional code to the infection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8d370968-021a-42d3-bc45-9c1071aa2e58', '26d63dcd-a40f-43d7-9959-e6e57b284877', 81, 'A home health patient has documented “sepsis due to MRSA.” What is the correct sepsis code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5e0b192-b35b-419c-a677-2726d5205a9e', '8d370968-021a-42d3-bc45-9c1071aa2e58', 0, 'A41.9, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('414dcf2c-c4bb-41ec-9157-e941156f701e', '8d370968-021a-42d3-bc45-9c1071aa2e58', 1, 'A41.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1c70026-e00c-4758-b67d-aa5ded3462d4', '8d370968-021a-42d3-bc45-9c1071aa2e58', 2, 'R65.20, A41.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b5e8c3f-aef5-430d-b0be-5ec4f1deca7e', '8d370968-021a-42d3-bc45-9c1071aa2e58', 3, 'A41.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8d370968-021a-42d3-bc45-9c1071aa2e58', '414dcf2c-c4bb-41ec-9157-e941156f701e', 'A41.02 Sepsis due to MRSA = A41.02 (the combination sepsis code for MRSA). B95.62 is not added separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5929fb48-fc20-4545-997d-4760a0864861', '26d63dcd-a40f-43d7-9959-e6e57b284877', 82, 'A patient is admitted to home health for wound care and IV antibiotics for a post-operative wound infection of the left knee replacement site. The infection is due to Staphylococcus aureus (MSSA). What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7ae481c-477d-4333-8587-6d4e6229b585', '5929fb48-fc20-4545-997d-4760a0864861', 0, 'T84.54XA, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a8c134d3-cd95-4e98-82d7-aa9c74c38869', '5929fb48-fc20-4545-997d-4760a0864861', 1, 'T84.54XD, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b40501ef-672f-41c9-b1df-c08a7805cbcb', '5929fb48-fc20-4545-997d-4760a0864861', 2, 'T81.41XA, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20445ea3-e0de-46ef-b743-dfac092c3996', '5929fb48-fc20-4545-997d-4760a0864861', 3, 'T81.41XD, B95.61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5929fb48-fc20-4545-997d-4760a0864861', 'a8c134d3-cd95-4e98-82d7-aa9c74c38869', 'T84.54XD, B95.61 Post-operative infection of left knee prosthetic joint = T84.54X-. In home health for ongoing treatment (wound care, IV antibiotics) = 7th character D for subsequent/routine care. MSSA organism = B95.61.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', '26d63dcd-a40f-43d7-9959-e6e57b284877', 83, 'A patient is admitted to HH after hospitalization for a right hip fracture treated with ORIF. The fracture is healing with routine recovery. PT and SN are ordered. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45fc1082-0408-4600-9040-b847acc264c5', 'bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', 0, 'S72.001D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5ec2074-aa72-4a8c-9813-578071b806a6', 'bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', 1, 'Z47.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48842d00-6880-4ebf-bf30-735992a150bf', 'bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', 2, 'S72.001A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eee2b3f4-2413-4472-8139-5a3f0585fe15', 'bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', 3, 'Z96.641');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bab71eb8-c9ae-41d9-a4cd-2fad1f41d757', '45fc1082-0408-4600-9040-b847acc264c5', 'S72.001D Healing hip fracture after ORIF = the fracture code with 7th character D (subsequent encounter, routine healing). Z47.1 (aftercare for hip fracture) is used when there is no active fracture code to report.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee93f8c0-1c1b-478d-9e4d-567c76e78225', '26d63dcd-a40f-43d7-9959-e6e57b284877', 84, 'A patient was hospitalized for a traumatic subdural hematoma. She is now in home health for PT/OT rehabilitation. The hematoma was surgically evacuated and is resolving. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('abe87a4e-99ae-428b-946a-2a7524945b92', 'ee93f8c0-1c1b-478d-9e4d-567c76e78225', 0, 'S06.5X0D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ce94f13-2d18-4b63-964a-04964c3c7eaf', 'ee93f8c0-1c1b-478d-9e4d-567c76e78225', 1, 'S06.5X0A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fabecffd-bb19-4b14-949b-c05d42802fd7', 'ee93f8c0-1c1b-478d-9e4d-567c76e78225', 2, 'I62.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7366132d-1496-4685-bac7-a3e9303e011d', 'ee93f8c0-1c1b-478d-9e4d-567c76e78225', 3, 'Z47.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ee93f8c0-1c1b-478d-9e4d-567c76e78225', 'abe87a4e-99ae-428b-946a-2a7524945b92', 'S06.5X0D Traumatic subdural hematoma in healing phase = S06.5X0D. The injury code with “D” is appropriate during the recovery phase.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6571a127-7b18-4c37-b725-980e891b80de', '26d63dcd-a40f-43d7-9959-e6e57b284877', 85, 'A home health patient had a fall from a ladder at home, sustaining a compression fracture of L1. He is receiving HH for PT and pain management. The fracture is in the healing phase. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('941d03bb-f1f6-42a3-8ac7-bad3bcb6f5b6', '6571a127-7b18-4c37-b725-980e891b80de', 0, 'S12.000D, W11.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3dc063d4-ff4e-4fd0-a9c5-977d760380a0', '6571a127-7b18-4c37-b725-980e891b80de', 1, 'S32.010D, W11.XXXD, Y93.89, Y99.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54a4e1cc-6654-49a0-a03e-82d7bb70b3ca', '6571a127-7b18-4c37-b725-980e891b80de', 2, 'S32.010A, W11.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2bdc990b-9fdc-405a-9ecb-f90f8bbb89ea', '6571a127-7b18-4c37-b725-980e891b80de', 3, 'M48.56XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6571a127-7b18-4c37-b725-980e891b80de', '3dc063d4-ff4e-4fd0-a9c5-977d760380a0', 'S32.010D, W11.XXXD, Y93.89, Y99.8 Healing L1 compression fracture = S32.010D. Fall from ladder = W11.XXXD (7th character matches the injury code). Activity and external status codes are optional but appropriate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('988177cb-06a8-47e2-a6dc-2c934f292baa', '26d63dcd-a40f-43d7-9959-e6e57b284877', 86, 'Per coding guidelines, when is a condition coded as “acute and chronic”?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25c35de9-61e1-4e41-b983-33a26972045c', '988177cb-06a8-47e2-a6dc-2c934f292baa', 0, 'When the physician uses both terms, and separate codes exist for each form, assign both codes with the acute code sequenced first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('097d2fd8-4900-467e-81f6-91042fd7c51e', '988177cb-06a8-47e2-a6dc-2c934f292baa', 1, 'Only the chronic code is assigned');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('838348af-0364-4d77-b3bd-95e7506ed4c3', '988177cb-06a8-47e2-a6dc-2c934f292baa', 2, 'Only the acute code is assigned');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91ac81cc-84b0-4b49-a41f-f79647d3b7c1', '988177cb-06a8-47e2-a6dc-2c934f292baa', 3, 'A combination acute-and-chronic code is always used');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('988177cb-06a8-47e2-a6dc-2c934f292baa', '25c35de9-61e1-4e41-b983-33a26972045c', 'When both acute and chronic forms are documented and separate codes exist, assign both — acute sequenced before chronic.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d2fb199-0dfc-4c85-ac99-a68a1997409e', '26d63dcd-a40f-43d7-9959-e6e57b284877', 87, 'A patient has both acute kidney injury and chronic kidney disease (stage 3a) documented. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c75795f7-1b38-4790-8b8e-0d21fcf34eb4', '2d2fb199-0dfc-4c85-ac99-a68a1997409e', 0, 'N17.9 and N18.31 — both codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8ca1449-48d0-4791-a02e-d4c4c9c7a645', '2d2fb199-0dfc-4c85-ac99-a68a1997409e', 1, 'N18.31 only — AKI is not coded when CKD is present');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17111be6-d233-431f-ba2e-e1dbf63721bd', '2d2fb199-0dfc-4c85-ac99-a68a1997409e', 2, 'N17.9, N18.31 — AKI first, then CKD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03baf04a-daeb-4180-b59c-e9418d8d5430', '2d2fb199-0dfc-4c85-ac99-a68a1997409e', 3, 'N17.9 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d2fb199-0dfc-4c85-ac99-a68a1997409e', '17111be6-d233-431f-ba2e-e1dbf63721bd', 'Both AKI (N17.9) and CKD (N18.31, the billable code for the documented stage 3a — N18.3 alone is a non-billable parent) can be coded when both are present and documented, with the acute condition sequenced first.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('309d3c5b-4299-459c-95d6-86328d2d73d6', '26d63dcd-a40f-43d7-9959-e6e57b284877', 88, 'Per ICD-10-CM guidelines, what is the correct approach when the documentation states “probable pneumonia”?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9db364bd-ae14-448a-bc57-a20399e34403', '309d3c5b-4299-459c-95d6-86328d2d73d6', 0, 'Do not code — only confirmed diagnoses are coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a591c98a-5ecb-4630-842e-05275385d0ac', '309d3c5b-4299-459c-95d6-86328d2d73d6', 1, 'Code the pneumonia as if confirmed, per the inpatient guideline for uncertain diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9af6a2e7-cdc9-499b-9e3a-2e7b882bdf2f', '309d3c5b-4299-459c-95d6-86328d2d73d6', 2, 'Code R06.00 (dyspnea) as a symptom only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39deab2f-3291-4c26-ad04-7d3d704802e4', '309d3c5b-4299-459c-95d6-86328d2d73d6', 3, 'In home health, code the condition as if it exists when documented as probable/suspected');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('309d3c5b-4299-459c-95d6-86328d2d73d6', '39deab2f-3291-4c26-ad04-7d3d704802e4', 'In home health (outpatient), uncertain diagnoses documented as “probable,” “suspected,” etc. are coded as if confirmed, per guideline IV.H.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('67b6835d-d132-4250-bd2b-a2aaec17fa17', '26d63dcd-a40f-43d7-9959-e6e57b284877', 89, 'Which of the following statements about Z codes is FALSE?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b277e605-5ba9-49b4-999d-603ae8d2a6d3', '67b6835d-d132-4250-bd2b-a2aaec17fa17', 0, 'Some Z codes can only be used as secondary codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b21e68d0-2e38-4a09-8a77-84265bdaf863', '67b6835d-d132-4250-bd2b-a2aaec17fa17', 1, 'Some Z codes can be used as either primary or secondary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e27c7a30-9997-4740-a6f4-51b6f5123a5f', '67b6835d-d132-4250-bd2b-a2aaec17fa17', 2, 'All Z codes are secondary codes only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fdfef58-2111-407e-8609-8bd7ebf7cedc', '67b6835d-d132-4250-bd2b-a2aaec17fa17', 3, 'Some Z codes can only be used as the primary/first-listed code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('67b6835d-d132-4250-bd2b-a2aaec17fa17', 'e27c7a30-9997-4740-a6f4-51b6f5123a5f', 'FALSE: Not all Z codes are secondary. Some Z codes (like Z51.81, Z47.33) are specifically designated as first-listed/primary codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('248d43d3-3d45-4519-8dd0-b1818c8b5c31', '26d63dcd-a40f-43d7-9959-e6e57b284877', 90, 'A patient is admitted to HH for SN medication management. She has major depressive disorder (single episode, moderate) and generalized anxiety disorder. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61cd0037-d752-4b5a-a82a-7ed06b6b06f5', '248d43d3-3d45-4519-8dd0-b1818c8b5c31', 0, 'F32.1, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c431a609-5afc-4cb6-99f8-19d1fc757089', '248d43d3-3d45-4519-8dd0-b1818c8b5c31', 1, 'F33.1, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f89233e-c2d0-439c-b4d6-22e58ae4209c', '248d43d3-3d45-4519-8dd0-b1818c8b5c31', 2, 'F32.9, F41.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd5a8cd9-9d84-419c-895c-44c4aaa99df0', '248d43d3-3d45-4519-8dd0-b1818c8b5c31', 3, 'F32.A, F41.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('248d43d3-3d45-4519-8dd0-b1818c8b5c31', '61cd0037-d752-4b5a-a82a-7ed06b6b06f5', 'F32.1, F41.1 Major depressive disorder, single episode, moderate = F32.1. GAD = F41.1.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', '26d63dcd-a40f-43d7-9959-e6e57b284877', 91, 'A home health patient has documented “dementia with behavioral disturbance, wandering.” The underlying cause of dementia is not specified. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecebbfa9-4ea8-419b-b63d-1f1bd50ed8c8', '8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', 0, 'F03.90, Z91.83');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4416b50-9434-4eb8-819b-b5ecd3062ae2', '8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', 1, 'F03.911, Z91.83');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2806a2e1-a6f6-450a-8a97-984a52cc6b5d', '8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', 2, 'F03.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1537a7c4-c15d-41d7-8ae2-79379e0b81a5', '8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', 3, 'F03.918');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8e2f7e25-0eeb-43b2-91e9-b6c6ee685a89', 'b4416b50-9434-4eb8-819b-b5ecd3062ae2', 'F03.911, Z91.83 Unspecified dementia with behavioral disturbance (wandering) requires the disturbance code F03.911 plus Z91.83 (wandering in diseases classified elsewhere).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea2033de-55c8-4c78-8947-cd2c9f9b0c02', '26d63dcd-a40f-43d7-9959-e6e57b284877', 92, 'A patient is admitted to home health for PT after a right shoulder rotator cuff repair. The surgery was 2 weeks ago and she is in routine recovery. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('064795c9-7867-4260-b182-bcbdca2814a8', 'ea2033de-55c8-4c78-8947-cd2c9f9b0c02', 0, 'M75.111');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6debae87-f71c-4d33-87d8-3e16c7bb8cf3', 'ea2033de-55c8-4c78-8947-cd2c9f9b0c02', 1, 'Z47.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('58cc145a-67e8-4a26-8507-812045f43d9d', 'ea2033de-55c8-4c78-8947-cd2c9f9b0c02', 2, 'S46.011D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02c0ed2f-c41f-4ced-a1de-e9beeac185c6', 'ea2033de-55c8-4c78-8947-cd2c9f9b0c02', 3, 'Z96.611');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ea2033de-55c8-4c78-8947-cd2c9f9b0c02', '6debae87-f71c-4d33-87d8-3e16c7bb8cf3', 'Z47.89 Routine aftercare following surgery on the musculoskeletal system (shoulder rotator cuff repair) with normal healing = Z47.89 (encounter for other orthopedic aftercare).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0eae01dd-9539-4701-a156-ef527e9ba34b', '26d63dcd-a40f-43d7-9959-e6e57b284877', 93, 'A patient has documented osteoporosis with a current pathological fracture of the thoracic vertebra. She is receiving active treatment. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0a145c6-685a-4003-afa1-a1300baafbe7', '0eae01dd-9539-4701-a156-ef527e9ba34b', 0, 'M80.08XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd45bea1-fea6-4df2-9912-6479a7506aa2', '0eae01dd-9539-4701-a156-ef527e9ba34b', 1, 'M81.0, M48.50XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed754014-85d2-49bd-a079-90ab32d665a9', '0eae01dd-9539-4701-a156-ef527e9ba34b', 2, 'M80.08XA, M48.50XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85f5f928-fe71-464d-b4dc-2143cca04ece', '0eae01dd-9539-4701-a156-ef527e9ba34b', 3, 'M80.08XD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0eae01dd-9539-4701-a156-ef527e9ba34b', 'e0a145c6-685a-4003-afa1-a1300baafbe7', 'M80.08XA Osteoporosis with current pathological fracture of the thoracic vertebra = M80.08XA. Active treatment = 7th character A. The combination code includes both the osteoporosis and the fracture.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', '26d63dcd-a40f-43d7-9959-e6e57b284877', 94, 'Under ICD-10-CM guidelines, if the patient has a “history of falls” and “recurrent falls,” can both R29.6 and Z91.81 be coded together?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3e8d84f-ae85-41bb-a333-2b619f54c2aa', '1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', 0, 'No — only one can be reported per guidelines');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5db959fb-4d6c-4b20-a738-eaee26018097', '1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', 1, 'Yes — R29.6 (repeated falls) captures the current clinical finding and Z91.81 (history of falling) captures ongoing risk');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f57c277-b8fe-4bc0-842f-668b0925bbf6', '1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', 2, 'Only Z91.81 is used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3caed316-30e5-4a36-8ab4-1a2e9a994001', '1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', 3, 'Only R29.6 is used');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b336b8a-6b8d-4e75-bbbb-ef0aea6a9531', '5db959fb-4d6c-4b20-a738-eaee26018097', 'Yes — R29.6 (repeated falls, current finding) and Z91.81 (history of falling, ongoing risk) can both be coded together per guidelines.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('adb016da-46ac-45ed-88f8-ee3117123083', '26d63dcd-a40f-43d7-9959-e6e57b284877', 95, 'A patient is admitted to home health for SN care of a right lower leg cellulitis. She also has type 2 diabetes. The physician documents the cellulitis is NOT related to the diabetes. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3801f077-5535-40f5-8b5c-84c2da048d19', 'adb016da-46ac-45ed-88f8-ee3117123083', 0, 'E11.622, L03.115');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3180c33e-e3db-4470-85f5-5d64b3dd100c', 'adb016da-46ac-45ed-88f8-ee3117123083', 1, 'L03.115, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8cbce61-b151-4f70-8ab7-d30222e3d6cc', 'adb016da-46ac-45ed-88f8-ee3117123083', 2, 'E11.621, L03.115');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae460c28-3e6e-444b-8956-79680c70e943', 'adb016da-46ac-45ed-88f8-ee3117123083', 3, 'L03.116, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('adb016da-46ac-45ed-88f8-ee3117123083', '3180c33e-e3db-4470-85f5-5d64b3dd100c', 'L03.115, E11.9 When the physician explicitly documents the cellulitis is NOT related to diabetes, the presumed link is overridden. Code L03.115 (cellulitis, right lower leg) and E11.9 (DM without complications) separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89099d74-462f-4e65-b03d-703d6e4444f2', '26d63dcd-a40f-43d7-9959-e6e57b284877', 96, 'A home health patient has bilateral lower extremity edema due to chronic venous insufficiency. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b0ec20a-528e-4907-a8e0-cf30a675dfa1', '89099d74-462f-4e65-b03d-703d6e4444f2', 0, 'R60.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5ae8924-be5e-470d-895f-f6c2c08611f2', '89099d74-462f-4e65-b03d-703d6e4444f2', 1, 'I87.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57344c2b-3f18-44c9-ab35-e0b8b72ebc90', '89099d74-462f-4e65-b03d-703d6e4444f2', 2, 'I87.2, R60.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2921fc22-d13e-459d-801d-6bb680dbcd54', '89099d74-462f-4e65-b03d-703d6e4444f2', 3, 'I83.93');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('89099d74-462f-4e65-b03d-703d6e4444f2', 'c5ae8924-be5e-470d-895f-f6c2c08611f2', 'I87.2 Chronic venous insufficiency causing edema = I87.2. The edema (R60.0) is integral to the venous insufficiency and is not coded separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', '26d63dcd-a40f-43d7-9959-e6e57b284877', 97, 'A patient has a tracheostomy and is receiving HH for tracheostomy care. She has a history of laryngeal cancer (in remission). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62609f36-1d7e-49e9-ba59-ac402603c401', '7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', 0, 'Z43.0, Z93.0, Z85.020');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('84aa6802-7ee8-4774-b00e-268653eee1ca', '7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', 1, 'Z93.0, Z43.0, C32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64d552e8-2d92-47ec-98f7-fd5e6c387f5b', '7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', 2, 'Z43.0, Z93.0, C32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2083acf4-f7ec-4565-9971-cb8e8fbbcec1', '7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', 3, 'J95.00, Z93.0, Z85.020');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7d62e1aa-cd01-4316-b8fd-4623f3ba81b7', '62609f36-1d7e-49e9-ba59-ac402603c401', 'Z43.0, Z93.0, Z85.020 Encounter for trach care = Z43.0 (attention to tracheostomy). Z93.0 = tracheostomy status. Laryngeal cancer in remission = Z85.020 (history).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('872eadbc-3c8f-405e-8c48-0a71fcb1bacb', '26d63dcd-a40f-43d7-9959-e6e57b284877', 98, 'Under OASIS, when is an agency required to perform a Resumption of Care (ROC) assessment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f169f172-4501-4d89-b33a-06d2c32478a3', '872eadbc-3c8f-405e-8c48-0a71fcb1bacb', 0, 'When a patient returns from an inpatient stay to continue the same home health episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cd88fa9-e2e2-4207-953c-0233411120a9', '872eadbc-3c8f-405e-8c48-0a71fcb1bacb', 1, 'When a patient returns from a physician visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1252d37-1a01-4e06-b503-37a472af815f', '872eadbc-3c8f-405e-8c48-0a71fcb1bacb', 2, 'At every recertification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fad98b2f-37d9-4155-9b7c-d1bb88f940a1', '872eadbc-3c8f-405e-8c48-0a71fcb1bacb', 3, 'Only when the patient has been hospitalized for more than 30 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('872eadbc-3c8f-405e-8c48-0a71fcb1bacb', 'f169f172-4501-4d89-b33a-06d2c32478a3', 'ROC is required when a patient returns from an inpatient facility stay to continue the same home health certification period.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ffd672c5-bc35-4f3c-ac84-aea042dacaa5', '26d63dcd-a40f-43d7-9959-e6e57b284877', 99, 'For OASIS M1306, what defines an “observable surgical wound”?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bca330d7-66ab-4318-98c7-b58bd0e40a49', 'ffd672c5-bc35-4f3c-ac84-aea042dacaa5', 0, 'Any wound resulting from surgery, regardless of location');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('269c0872-8bb5-4a62-b231-8e8a4d9a2170', 'ffd672c5-bc35-4f3c-ac84-aea042dacaa5', 1, 'An open wound, incision, or entry site on the skin resulting from a procedure that can be observed and assessed by the clinician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e2b6828-cd67-400b-ae50-ef7b650bc193', 'ffd672c5-bc35-4f3c-ac84-aea042dacaa5', 2, 'Only wounds that are infected');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fb572009-92e3-40b2-8599-76342f3809ef', 'ffd672c5-bc35-4f3c-ac84-aea042dacaa5', 3, 'Only wounds less than 30 days old');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ffd672c5-bc35-4f3c-ac84-aea042dacaa5', '269c0872-8bb5-4a62-b231-8e8a4d9a2170', 'OASIS M1306 defines an observable surgical wound as a wound, incision, or entry site on the body surface resulting from a surgical procedure that can be observed and assessed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('780d7a2e-85e6-4fb5-9fd1-b9a85929c708', '26d63dcd-a40f-43d7-9959-e6e57b284877', 100, 'A home health patient has a Stage 2 pressure ulcer of the right elbow and a deep tissue pressure injury of the left ischial tuberosity. How many pressure ulcers are reported in OASIS M1311?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a67c19e0-3b65-4a26-a000-762e181fc288', '780d7a2e-85e6-4fb5-9fd1-b9a85929c708', 0, '1 — DTPI is not counted as a pressure ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e64c3cb2-ec1e-49e8-a8af-e88f37e8abc7', '780d7a2e-85e6-4fb5-9fd1-b9a85929c708', 1, '2 — each is counted separately at their respective stages');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('81269e7d-368d-4298-b8d5-3096ba81f7b4', '780d7a2e-85e6-4fb5-9fd1-b9a85929c708', 2, '2 — but DTPI is counted under “unstageable”');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('abfa02d3-d320-46c8-bc23-09e9bf834b7b', '780d7a2e-85e6-4fb5-9fd1-b9a85929c708', 3, '1 — only the Stage 2 is counted; DTPI is reported elsewhere');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('780d7a2e-85e6-4fb5-9fd1-b9a85929c708', 'e64c3cb2-ec1e-49e8-a8af-e88f37e8abc7', '2 — each is counted separately Both the Stage 2 PU and the DTPI are counted in M1311. DTPI has its own category in the OASIS pressure ulcer staging items.');

-- ---------- Paper 4: BCHH-C Practice Paper 4 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 'bchhc-practice-4', 'BCHH-C Practice Paper 4', 'bchhc', ARRAY['Pressure Ulcers', 'Surgical Wounds', 'Burns', 'Adverse Effects', 'OASIS Integumentary']::TEXT[], 100, 'standard', true, 4);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 1, 'A patient is admitted to home health for wound care of a Stage 4 pressure ulcer of the right hip. Two weeks later the wound bed shows healthy granulation tissue with the wound size decreasing. What stage is now reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb73c887-2e01-48c6-838b-7dc1fd73b430', 'ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', 0, 'Stage 3 — wound has improved');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('de2953d4-c857-4512-8a59-2c1f7e70b346', 'ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', 1, 'Stage 4 — pressure ulcers are never reverse-staged');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('874c9b15-d169-48db-a625-ee9ed66adccd', 'ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', 2, 'Unstageable — granulation tissue obscures the base');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b3404d13-786c-446d-a2ac-b9f208e912e8', 'ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', 3, 'Healing stage — a separate healing code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ca87df3b-f7c9-49d4-84e5-bd7b9dc59025', 'de2953d4-c857-4512-8a59-2c1f7e70b346', 'Stage 4 — pressure ulcers are never reverse-staged Even with healthy granulation and improvement, the stage remains 4. Reverse staging is never done.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ce1610b-988d-42bf-9745-02ee165527b4', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 2, 'A home health patient has a Stage 3 pressure ulcer of the sacrum that was present at SOC. At the recertification assessment, the wound has completely epithelialized (healed). How is the pressure ulcer coded at recertification?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fd696c3-1f1d-4155-92da-9c1abc4b46fc', '8ce1610b-988d-42bf-9745-02ee165527b4', 0, 'L89.153 — still coded as Stage 3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8543f6e-ba35-4a25-a98b-438725a86ef2', '8ce1610b-988d-42bf-9745-02ee165527b4', 1, 'L89.150 — unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0292230b-24aa-40cc-9725-2bfe2875f6fe', '8ce1610b-988d-42bf-9745-02ee165527b4', 2, 'The pressure ulcer is no longer coded — a healed PU receives no L89 code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0089fd17-95aa-498a-8438-50a93a45473d', '8ce1610b-988d-42bf-9745-02ee165527b4', 3, 'Z87.39 — personal history of pressure ulcer');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8ce1610b-988d-42bf-9745-02ee165527b4', '0292230b-24aa-40cc-9725-2bfe2875f6fe', 'The pressure ulcer is no longer coded A completely healed/epithelialized pressure ulcer receives no L89 code. It is no longer an active condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 3, 'A newly admitted patient has a pressure ulcer of the left buttock. The wound bed is 100% covered with thick, adherent, black eschar. The ulcer has never been previously staged. What stage is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9cb68cd2-2946-4ae8-ba54-d50d4abaa37e', 'db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', 0, 'Stage 4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80202796-84e8-4386-93c3-50d1d2831451', 'db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', 1, 'Stage 3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c000e33-2dd3-436b-8880-74bcad1eb132', 'db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', 2, 'Unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d95cdfbc-aa4a-4d2d-b926-1f574049fa6a', 'db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', 3, 'Deep tissue pressure injury');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('db5f5a1c-ee90-4314-8bb3-1d38ee4df7fd', '1c000e33-2dd3-436b-8880-74bcad1eb132', 'Unstageable A wound bed completely covered by eschar on first observation = unstageable. The stage cannot be determined until the eschar is removed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f484cb9b-4880-4c4b-8f43-d992947f7479', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 4, 'A patient has deep tissue pressure injury (DTPI) of the right heel — intact skin with deep, dark purple discoloration. What is the correct ICD-10-CM code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('739e5a87-047c-4c45-bcd1-d3f2544a8cc5', 'f484cb9b-4880-4c4b-8f43-d992947f7479', 0, 'L89.610');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('220bd3e6-4389-493a-9c60-66c63d43cff8', 'f484cb9b-4880-4c4b-8f43-d992947f7479', 1, 'L89.616');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99f63c44-ade9-4bae-ab1e-7de0ea1ca2b2', 'f484cb9b-4880-4c4b-8f43-d992947f7479', 2, 'L89.619');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('acd6cf84-67a5-446f-b085-35d3945137ed', 'f484cb9b-4880-4c4b-8f43-d992947f7479', 3, 'L89.611');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f484cb9b-4880-4c4b-8f43-d992947f7479', '220bd3e6-4389-493a-9c60-66c63d43cff8', 'L89.616 DTPI of the right heel = L89.616. The 6th character “6” designates deep tissue pressure injury.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62b9496d-c8f4-4f2a-9144-0062f8f16419', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 5, 'During a home health episode, a patient’s previously staged Stage 2 pressure ulcer of the left elbow becomes covered with slough, obscuring the wound bed. What stage should be reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be6ecc71-f082-450d-8666-069a5f2a961c', '62b9496d-c8f4-4f2a-9144-0062f8f16419', 0, 'Unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72702161-1bf8-4729-af97-9b87c4d4b37f', '62b9496d-c8f4-4f2a-9144-0062f8f16419', 1, 'Stage 2 — retain the previous staging');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dcbbcabe-97f5-46be-a82e-95f184ebded7', '62b9496d-c8f4-4f2a-9144-0062f8f16419', 2, 'Stage 3 — slough indicates progression');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6885a1f5-e8fe-4116-b9db-6dd12a8f57eb', '62b9496d-c8f4-4f2a-9144-0062f8f16419', 3, 'Unspecified — documentation is insufficient');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('62b9496d-c8f4-4f2a-9144-0062f8f16419', '72702161-1bf8-4729-af97-9b87c4d4b37f', 'Stage 2 — retain the previous staging A previously staged pressure ulcer that later becomes obscured by slough retains its original staging. Unstageable applies only to wounds never previously staged.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5812222c-e1ea-49a7-94b2-d82274fb45d3', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 6, 'A patient has pressure ulcers at three sites: Stage 4 sacrum, Stage 2 right heel, and DTPI left heel. How many pressure ulcer codes are required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6cf33cc-53c0-4c09-a6f8-d8d74a7e4b85', '5812222c-e1ea-49a7-94b2-d82274fb45d3', 0, '1 — code only the worst');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a225c4a3-c238-4103-863b-a32ba76e6e8c', '5812222c-e1ea-49a7-94b2-d82274fb45d3', 1, '2 — only staged ulcers');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d624bc2-fc05-4d70-acc0-9754f3585d51', '5812222c-e1ea-49a7-94b2-d82274fb45d3', 2, '3 — each site and stage gets its own code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dee83bb3-d7f1-4b52-9e0f-af5046971b72', '5812222c-e1ea-49a7-94b2-d82274fb45d3', 3, '1 — use a combination code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5812222c-e1ea-49a7-94b2-d82274fb45d3', '3d624bc2-fc05-4d70-acc0-9754f3585d51', '3 — each site and stage gets its own code Each pressure ulcer at a different site or stage receives its own individual L89 code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef6a30e7-8066-442b-a221-faa140999030', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 7, 'A patient had a Stage 4 pressure ulcer of the sacrum that was surgically repaired with a muscle flap graft. The graft site is healing. For OASIS M1311, how is this wound classified?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f542aae2-0aa0-4d00-a397-a8181315606d', 'ef6a30e7-8066-442b-a221-faa140999030', 0, 'Stage 4 pressure ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4736e1d4-0147-4ead-ab42-a7404a695418', 'ef6a30e7-8066-442b-a221-faa140999030', 1, 'Unstageable pressure ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a88b784-3ed2-471a-8874-0b5c70a89a0f', 'ef6a30e7-8066-442b-a221-faa140999030', 2, 'Not a pressure ulcer — it is now a surgical wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f3b1800-79a2-4b7e-94ac-c7230ec1deb7', 'ef6a30e7-8066-442b-a221-faa140999030', 3, 'Healed pressure ulcer — not counted');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ef6a30e7-8066-442b-a221-faa140999030', '1a88b784-3ed2-471a-8874-0b5c70a89a0f', 'Not a pressure ulcer — it is now a surgical wound A pressure ulcer repaired with a flap/graft is reclassified as a surgical wound for OASIS purposes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9a283e2-df5f-4be7-b6ea-b103776e9211', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 8, 'A patient is admitted to home health for SN wound care of a non-healing stasis ulcer of the right lower leg. She has varicose veins with inflammation. The wound has fat layer exposed. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('046adcac-f1df-4536-b4b9-d0d5bac7a2c2', 'a9a283e2-df5f-4be7-b6ea-b103776e9211', 0, 'I83.211, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d99bdd4e-8c37-4473-b3ce-ad0e32fd0f6a', 'a9a283e2-df5f-4be7-b6ea-b103776e9211', 1, 'I83.211, L97.212');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2103ba9a-4b53-4ff2-b7cf-d8c70644bd28', 'a9a283e2-df5f-4be7-b6ea-b103776e9211', 2, 'L97.212, I83.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('58a1ee62-3134-4a6a-a834-2be341d2595d', 'a9a283e2-df5f-4be7-b6ea-b103776e9211', 3, 'I87.311, L97.212');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a9a283e2-df5f-4be7-b6ea-b103776e9211', 'd99bdd4e-8c37-4473-b3ce-ad0e32fd0f6a', 'I83.211, L97.212 Varicose veins with ulcer and inflammation of right lower leg = I83.211 (code first). Fat layer exposed = L97.212 (right calf, fat layer exposed).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5135da21-e08b-46f5-bb71-d4ebf4263251', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 9, 'A patient has a venous stasis ulcer of the left calf. The wound shows muscle involvement. She also has post-thrombotic syndrome of the left lower extremity. What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7795e85d-a78f-4fd5-abd4-da3f3b0972ed', '5135da21-e08b-46f5-bb71-d4ebf4263251', 0, 'I87.012, L97.223');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04f362f3-2440-4b05-ba54-efa982338143', '5135da21-e08b-46f5-bb71-d4ebf4263251', 1, 'I87.012, L97.222');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7cc7d23-3075-4c54-b82f-2173c188d3fb', '5135da21-e08b-46f5-bb71-d4ebf4263251', 2, 'L97.223, I87.012');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b4ba922-f8bd-4f5b-ae89-65dd1c1e0fbf', '5135da21-e08b-46f5-bb71-d4ebf4263251', 3, 'I87.012, L97.213');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5135da21-e08b-46f5-bb71-d4ebf4263251', '7795e85d-a78f-4fd5-abd4-da3f3b0972ed', 'I87.012, L97.223 Post-thrombotic syndrome of left lower extremity = I87.012 (code first). Left calf ulcer with muscle involvement = L97.223.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('32803a1e-7583-42ed-867a-bac0dbe7e34f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 10, 'A patient with peripheral arterial disease has an ischemic ulcer of the right midfoot with bone involvement. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e4fe2ff-edb2-416e-8b6d-e75b6bb812a5', '32803a1e-7583-42ed-867a-bac0dbe7e34f', 0, 'I70.234, L97.514');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d15d836-7f2e-4e9a-ab31-7d59b1822039', '32803a1e-7583-42ed-867a-bac0dbe7e34f', 1, 'I70.244, L97.514');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c49d6f4-bd9c-41c5-a8c0-eabbcb5e5ee5', '32803a1e-7583-42ed-867a-bac0dbe7e34f', 2, 'I70.234, L97.414');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74364629-9989-491b-9425-d3966cfec5ba', '32803a1e-7583-42ed-867a-bac0dbe7e34f', 3, 'L97.514, I70.234');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('32803a1e-7583-42ed-867a-bac0dbe7e34f', '9e4fe2ff-edb2-416e-8b6d-e75b6bb812a5', 'I70.234, L97.514 PAD with ulcer of right midfoot = I70.234 (code first), then L97.514 (right midfoot, bone involvement).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a3310f23-0742-40de-8835-89ea8a0150fd', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 11, 'A patient has type 2 diabetes with a diabetic ulcer of the left ankle. The physician documents fat layer exposed. What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e80e8cf3-2b44-46b1-ab82-c9b82cc679b4', 'a3310f23-0742-40de-8835-89ea8a0150fd', 0, 'E11.622, L97.322, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0fa8acc0-1471-4743-ab73-702e5abfe433', 'a3310f23-0742-40de-8835-89ea8a0150fd', 1, 'E11.621, L97.322, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35970563-9e93-490f-994f-6dd85555bc97', 'a3310f23-0742-40de-8835-89ea8a0150fd', 2, 'L97.322, E11.622');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83ff678f-394a-47ee-b60a-3f1dbacd6bf5', 'a3310f23-0742-40de-8835-89ea8a0150fd', 3, 'E11.622, L97.312, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a3310f23-0742-40de-8835-89ea8a0150fd', 'e80e8cf3-2b44-46b1-ab82-c9b82cc679b4', 'E11.622, L97.322, Z79.4 Type 2 DM with diabetic ulcer of left ankle = E11.622 (left foot). Left ankle with fat layer exposed = L97.322. Z79.4 for insulin use in type 2 DM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('326f3287-5941-4251-b779-c6e90c71fe9f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 12, 'A patient has both a diabetic foot ulcer (right heel, breakdown of skin) and a venous stasis ulcer (left lower leg, muscle involvement). She has type 2 DM on insulin and varicose veins. How should both wounds be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78e6d0bb-caf2-4e3f-a593-94bc17523216', '326f3287-5941-4251-b779-c6e90c71fe9f', 0, 'E11.621, L97.411, I83.212, L97.223, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d6238d5-33d8-41fc-bccb-281686c70d95', '326f3287-5941-4251-b779-c6e90c71fe9f', 1, 'E11.621, L97.411, Z79.4 only — code only the primary wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28726546-b7c9-472a-a5fb-f6973b677576', '326f3287-5941-4251-b779-c6e90c71fe9f', 2, 'I83.212, L97.223, E11.621, L97.411, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f50d105-e677-46b6-8e60-d4213f4e53fd', '326f3287-5941-4251-b779-c6e90c71fe9f', 3, 'E11.622, L97.411, I83.222, L97.223, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('326f3287-5941-4251-b779-c6e90c71fe9f', '78e6d0bb-caf2-4e3f-a593-94bc17523216', 'E11.621, L97.411, I83.212, L97.223, Z79.4 Both wounds are coded completely. Diabetic right heel ulcer: E11.621, L97.411. Venous stasis left lower leg ulcer with muscle: I83.212, L97.223. Z79.4 for insulin in type 2.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6e5fac5-f044-4e8e-bed3-e0f577c18947', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 13, 'For OASIS item M1340 (Does the patient have a surgical wound?), which of the following qualifies as a surgical wound?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('093ed3a8-22e1-4bf4-a7d4-ba397ec4db10', 'b6e5fac5-f044-4e8e-bed3-e0f577c18947', 0, 'A PICC line insertion site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2add9f7b-add8-48fd-b552-db054dd1dc0e', 'b6e5fac5-f044-4e8e-bed3-e0f577c18947', 1, 'A venipuncture site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('141a56d9-3734-4054-9425-f8473207f38f', 'b6e5fac5-f044-4e8e-bed3-e0f577c18947', 2, 'An orthopedic pin/wire site that has not healed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83c72d6b-152d-4414-99a0-6361e7e3c145', 'b6e5fac5-f044-4e8e-bed3-e0f577c18947', 3, 'A healed appendectomy scar from 3 months ago');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b6e5fac5-f044-4e8e-bed3-e0f577c18947', '141a56d9-3734-4054-9425-f8473207f38f', 'An orthopedic pin/wire site that has not healed Orthopedic pin sites are surgical wounds per OASIS. PICC lines are not implanted devices; venipuncture sites and healed scars do not qualify.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 14, 'A patient had a total knee replacement 2 weeks ago. The surgical incision is closed with staples, dry, and approximated with no signs of infection. For M1340, this wound is:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('caf90b02-ab43-47ac-8586-07bb55ac325f', '83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', 0, 'Not a surgical wound — it is closed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91067793-0dbb-449f-9a6b-01b03209d8cb', '83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', 1, 'A surgical wound — closed but not yet fully epithelialized');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2571e7ba-d1c2-4653-ad2b-21219cc66c97', '83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', 2, 'A surgical wound only if there are complications');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('162c91e7-19d4-4356-9b8b-018bafa7e374', '83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', 3, 'Not applicable — joint replacement sites are excluded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('83a7abac-5d9c-4a4e-afc7-5208cf8b8e00', '91067793-0dbb-449f-9a6b-01b03209d8cb', 'A surgical wound — closed but not yet fully epithelialized Stapled/sutured incisions that have not fully epithelialized are still surgical wounds for OASIS M1340.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63fa76a1-d61e-40b8-be73-512bd87d62f8', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 15, 'A patient had cataract surgery 1 week ago. For OASIS purposes, is the eye surgical site considered a surgical wound?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e2217c4-c1cc-4a3f-b2fc-726284a9da9e', '63fa76a1-d61e-40b8-be73-512bd87d62f8', 0, 'Yes — any post-surgical site is a surgical wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6d2d0b2-5090-4895-8d13-75def8890b0a', '63fa76a1-d61e-40b8-be73-512bd87d62f8', 1, 'No — surgery on the eye (mucosal membrane) is not considered an observable surgical wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0c81624-4d53-4004-98f7-2d76bfc994ab', '63fa76a1-d61e-40b8-be73-512bd87d62f8', 2, 'Yes — but only if it has complications');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fb82fa6-fe49-4f1b-9f3a-ea30210fe14f', '63fa76a1-d61e-40b8-be73-512bd87d62f8', 3, 'No — cataract surgery is outpatient and is excluded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('63fa76a1-d61e-40b8-be73-512bd87d62f8', 'b6d2d0b2-5090-4895-8d13-75def8890b0a', 'No — surgery on the eye is not considered an observable surgical wound Per OASIS, cataract and mucosal membrane surgeries are excluded from observable surgical wounds.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a9178de-6d5a-4334-9473-7d1a6588a293', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 16, 'A patient is admitted to HH with a third-degree burn of the right forearm (5% TBSA) sustained from a grease spill while cooking 1 week ago. The wound is receiving active treatment. What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bacace87-3e10-41f2-89a1-213858319e8d', '5a9178de-6d5a-4334-9473-7d1a6588a293', 0, 'T22.311A, T31.0, X10.2XXA, Y93.G3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59dfe2cd-baa2-489d-be4b-2d29c1fbe7a0', '5a9178de-6d5a-4334-9473-7d1a6588a293', 1, 'T22.311D, T31.0, X10.2XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74a1cb6e-bb68-4940-a63e-2a2c88d123b4', '5a9178de-6d5a-4334-9473-7d1a6588a293', 2, 'T22.311A, T31.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f32c51b2-af86-4463-980e-08f19d862b3d', '5a9178de-6d5a-4334-9473-7d1a6588a293', 3, 'T22.311D, T31.0, X10.2XXD, Y93.G3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5a9178de-6d5a-4334-9473-7d1a6588a293', '59dfe2cd-baa2-489d-be4b-2d29c1fbe7a0', 'T22.311D, T31.0, X10.2XXD Third-degree burn of right forearm = T22.311. One week old, receiving wound care in HH = subsequent encounter (D). T31.0 for TBSA <10%. External cause W/X code with matching 7th character.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 17, 'What is the difference between a burn and a corrosion in ICD-10-CM?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6551561a-a07a-49f1-8533-dbe46536c84b', 'caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', 0, 'Burns are thermal and electrical injuries; corrosions are chemical injuries');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dff56ee7-4cc8-4098-846f-e9639a9dcb3e', 'caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', 1, 'Burns are more severe than corrosions');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d7e2553e-63ee-49ef-9d44-9ef71b0ed771', 'caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', 2, 'Burns are external; corrosions are internal');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21392741-5abb-4bc0-a422-80e6dbb48490', 'caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', 3, 'There is no difference — they are synonymous');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('caec5f14-32de-4fe1-b23b-3ef5fd45f2a0', '6551561a-a07a-49f1-8533-dbe46536c84b', 'Burns are caused by thermal sources (heat, fire, electricity, radiation');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0666309e-ae8d-4062-9235-390bb048957f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 18, 'A patient has a second-degree burn of the right hand and a first-degree burn of the left forearm from a house fire. How is TBSA coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc351c54-28d1-46db-bd5a-ce6d19ead19b', '0666309e-ae8d-4062-9235-390bb048957f', 0, 'Code only the highest-degree burn');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca8ecb51-2263-4c3a-8822-d692535c1340', '0666309e-ae8d-4062-9235-390bb048957f', 1, 'Code each burn site separately; TBSA is based on all burn sites regardless of degree');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('10ea7420-dce2-4adc-953e-1b6a5a267e97', '0666309e-ae8d-4062-9235-390bb048957f', 2, 'Code each burn site separately; TBSA is based on second and third-degree burns only — first-degree is excluded from TBSA calculation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16a45ee3-d35f-4bd9-9b0f-abe55781d36a', '0666309e-ae8d-4062-9235-390bb048957f', 3, 'Use a single combination code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0666309e-ae8d-4062-9235-390bb048957f', '10ea7420-dce2-4adc-953e-1b6a5a267e97', 'Each burn site is coded separately. TBSA percentage (T31) is calculated using second-degree and third-degree burns only; first-degree burns are excluded from the TBSA calculation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a01ba0e-26bd-4b9b-9016-5679072d23c6', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 19, 'A patient has a chemical burn (corrosion) of the chest wall from a cleaning product splash. Second degree, initial encounter. What type of code is used?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7210275a-8cf6-4808-8e1a-24518f7e63c9', '9a01ba0e-26bd-4b9b-9016-5679072d23c6', 0, 'T20-T25 burn codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73c1e89c-917c-4a93-bbb4-19b449e015e7', '9a01ba0e-26bd-4b9b-9016-5679072d23c6', 1, 'T20-T25 corrosion codes (separate from burn codes within the same categories)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('026e27f3-c69d-4f68-830d-a4e07fedcc63', '9a01ba0e-26bd-4b9b-9016-5679072d23c6', 2, 'T36-T65 poisoning codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddf5a723-0479-41fe-894e-033b20447a49', '9a01ba0e-26bd-4b9b-9016-5679072d23c6', 3, 'L55 sunburn codes');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9a01ba0e-26bd-4b9b-9016-5679072d23c6', '73c1e89c-917c-4a93-bbb4-19b449e015e7', 'Corrosions use the same T20-T25 code range as burns but with separate code values within those categories specifically for corrosions.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c302b37d-a3bf-43bf-96be-be12b1445144', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 20, 'A patient sustained burns in a house fire 6 months ago. The burns are healed but she now has significant scarring (keloid) of the chest. How is the scarring coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2e81ab3-9057-4b38-901c-4f185f034af0', 'c302b37d-a3bf-43bf-96be-be12b1445144', 0, 'T21.31XS (sequela of burn)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f567041-3e28-4f50-bac7-bf72cc1a12c8', 'c302b37d-a3bf-43bf-96be-be12b1445144', 1, 'L91.0, T21.31XS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5b30c77-b12d-4650-a75b-ec96042464db', 'c302b37d-a3bf-43bf-96be-be12b1445144', 2, 'L91.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab0c5efc-6186-410c-ad26-112def657737', 'c302b37d-a3bf-43bf-96be-be12b1445144', 3, 'L90.5, T21.31XS');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c302b37d-a3bf-43bf-96be-be12b1445144', '8f567041-3e28-4f50-bac7-bf72cc1a12c8', 'L91.0 (keloid scar) is coded for the current condition. T21.31XS (burn of third degree of chest wall, sequela) identifies the cause — note the required "XX" placeholder characters before the 7th-character extension; T21.31 alone is a non-billable parent, and dropping the placeholders (e.g., "T21.31S") is not a valid code. Both the current condition and the cause, with the sequela 7th character, are coded together.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6d3548a8-b7c1-4c55-bdcf-f5b012190718', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 21, 'A home health patient is on warfarin for atrial fibrillation. She develops spontaneous bruising (purpura). She is taking the warfarin correctly as prescribed. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03bc9fa1-90b8-4850-a3f5-34d43de6aa6c', '6d3548a8-b7c1-4c55-bdcf-f5b012190718', 0, 'T45.511A, D69.2, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49d8a23e-c87f-460e-b2e5-cc32be474bb4', '6d3548a8-b7c1-4c55-bdcf-f5b012190718', 1, 'D69.2, T45.515A, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebde2215-d511-4c5f-8bb9-c2bf8c02b611', '6d3548a8-b7c1-4c55-bdcf-f5b012190718', 2, 'T45.515A, D69.2, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2f834b9-9965-40b1-bbb7-8901dfe774b3', '6d3548a8-b7c1-4c55-bdcf-f5b012190718', 3, 'D69.59, I48.91, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6d3548a8-b7c1-4c55-bdcf-f5b012190718', '49d8a23e-c87f-460e-b2e5-cc32be474bb4', 'D69.2, T45.515A, I48.91 Adverse effect: manifestation first (purpura D69.2), then adverse effect of anticoagulant (T45.515A), then the condition being treated (atrial fibrillation I48.91).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cf92c8e0-3856-4557-9515-31ecb1c67f5d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 22, 'A patient was prescribed oxycodone for pain. She intentionally took 4 times the prescribed dose. She is admitted to HH after ER treatment for the overdose. How is the poisoning classified?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('709e7b70-47fd-46cd-b397-34a3b1f778d5', 'cf92c8e0-3856-4557-9515-31ecb1c67f5d', 0, 'T40.2X1D — poisoning, accidental');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8af720ea-3e18-45aa-95d5-83255aa9c4a2', 'cf92c8e0-3856-4557-9515-31ecb1c67f5d', 1, 'T40.2X2D — poisoning, intentional self-harm');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d458031-1875-4e2e-80f5-260587e4aa2e', 'cf92c8e0-3856-4557-9515-31ecb1c67f5d', 2, 'T40.2X5D — adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce1c6dc8-bc7c-4b49-ab66-e75932d7714f', 'cf92c8e0-3856-4557-9515-31ecb1c67f5d', 3, 'T40.2X1A — poisoning, accidental, initial');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cf92c8e0-3856-4557-9515-31ecb1c67f5d', '8af720ea-3e18-45aa-95d5-83255aa9c4a2', 'T40.2X2D — poisoning, intentional self-harm Intentionally taking more than prescribed = poisoning, intentional self-harm. In HH after initial treatment = 7th character D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0199c5ae-4e8d-4919-815f-6aabeb9a47a6', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 23, 'A patient on prescribed lithium for bipolar disorder has developed lithium toxicity (tremor, confusion). She has been taking the medication correctly, but her kidney function declined, causing drug accumulation. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd76401d-f9da-4534-ac7a-7cfdc494b75c', '0199c5ae-4e8d-4919-815f-6aabeb9a47a6', 0, 'Poisoning — accidental');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8aded5c-cc58-4872-9702-3e48e5d063e7', '0199c5ae-4e8d-4919-815f-6aabeb9a47a6', 1, 'Adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f56c1436-2f4e-48e7-824a-5db219eb60f6', '0199c5ae-4e8d-4919-815f-6aabeb9a47a6', 2, 'Underdosing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34ec3780-fc5a-404b-9e05-54cdb33aa215', '0199c5ae-4e8d-4919-815f-6aabeb9a47a6', 3, 'Complication of care');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0199c5ae-4e8d-4919-815f-6aabeb9a47a6', 'c8aded5c-cc58-4872-9702-3e48e5d063e7', 'Adverse effect The medication was taken correctly as prescribed; the toxicity resulted from a change in kidney function, not misuse. This is an adverse effect.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae6ba5f7-73ea-4fac-958b-a9e43c11b999', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 24, 'A patient on methotrexate for RA has developed pancytopenia as a known side effect. She is taking the medication as prescribed. What is the correct sequencing?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2aa28a62-2897-4112-864c-bd985b8a033e', 'ae6ba5f7-73ea-4fac-958b-a9e43c11b999', 0, 'T45.1X5A, D61.818 — adverse effect first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('354cf639-faf7-45b0-b870-cf9ffe2befe3', 'ae6ba5f7-73ea-4fac-958b-a9e43c11b999', 1, 'D61.818, T45.1X5A — manifestation first, then adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97e3a017-8a8d-43ab-985e-32f5e4ee3cb8', 'ae6ba5f7-73ea-4fac-958b-a9e43c11b999', 2, 'D61.818 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43967a0d-f95d-44eb-8427-9535d8573a40', 'ae6ba5f7-73ea-4fac-958b-a9e43c11b999', 3, 'T45.1X5D, D61.818');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ae6ba5f7-73ea-4fac-958b-a9e43c11b999', '354cf639-faf7-45b0-b870-cf9ffe2befe3', 'D61.818, T45.1X5A — manifestation first, then adverse effect For adverse effects: the manifestation/condition is sequenced first, followed by the adverse effect T-code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 25, 'A home health patient has been skipping doses of her antihypertensive medication. Her blood pressure is now dangerously elevated. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89b28bbc-32f4-43d3-a1d2-ac9e7f6b4e6e', 'ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', 0, 'T46.5X6A, I10, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff9a4cd4-3b1a-413d-a2ed-7d8f959ef22e', 'ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', 1, 'I10, T46.5X6A, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('397d2e1e-ef72-456d-996c-db2995b95d8a', 'ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', 2, 'I16.0, T46.5X6A, Z91.120');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a3cfa82-6a2f-41fa-a678-77a05078d265', 'ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', 3, 'I10, Z91.120');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ca7b3cb8-da7c-4ecc-b598-0d8f074109c0', 'ff9a4cd4-3b1a-413d-a2ed-7d8f959ef22e', 'I10, T46.5X6A, Z91.120 Underdosing: the resulting condition (hypertension I10) is primary. Underdosing of antihypertensive (T46.5X6A) and non-compliance (Z91.120) follow.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89ed7b9d-7875-4359-88f7-a47c9277d37b', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 26, 'A patient has a non-healing surgical wound of the abdomen from surgery 4 weeks ago. The wound is dehisced and there is an infection. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f3a8b8b-bfc3-44da-a47d-ce24ba61eec5', '89ed7b9d-7875-4359-88f7-a47c9277d37b', 0, 'T81.31XA, T81.41XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a823baff-f793-4593-ba2b-f250e480f125', '89ed7b9d-7875-4359-88f7-a47c9277d37b', 1, 'T81.31XD, T81.41XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a810747d-5920-4850-82db-4a705b48f147', '89ed7b9d-7875-4359-88f7-a47c9277d37b', 2, 'T81.31XA, L08.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c397b511-ece6-4b25-9265-7fe3e0532e92', '89ed7b9d-7875-4359-88f7-a47c9277d37b', 3, 'L76.21, T81.41XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('89ed7b9d-7875-4359-88f7-a47c9277d37b', 'a823baff-f793-4593-ba2b-f250e480f125', 'T81.31XD, T81.41XD Dehiscence = T81.31X-. Post-op wound infection = T81.41X-. In HH for ongoing care = 7th character D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87c2065e-687c-48e4-8c6b-077c54182b8d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 27, 'A patient has cellulitis of the right lower leg overlying a chronic venous stasis ulcer. The cellulitis is being treated with IV antibiotics at home. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54707c60-28d3-43c9-a420-2cdb4861774f', '87c2065e-687c-48e4-8c6b-077c54182b8d', 0, 'L03.115, I83.011, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05831e72-b4be-442b-92b0-a3e111809cc5', '87c2065e-687c-48e4-8c6b-077c54182b8d', 1, 'I83.011, L97.211, L03.115');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('103de010-8e36-4b0e-ae29-307763a9baee', '87c2065e-687c-48e4-8c6b-077c54182b8d', 2, 'L03.115, L97.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34805783-d289-4cd4-b0f7-897abb238aeb', '87c2065e-687c-48e4-8c6b-077c54182b8d', 3, 'L03.115, I87.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('87c2065e-687c-48e4-8c6b-077c54182b8d', '54707c60-28d3-43c9-a420-2cdb4861774f', 'L03.115, I83.011, L97.211 Cellulitis is coded separately (L03.115). The underlying venous condition with ulcer (I83.011) and wound severity (L97.211) are also coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b783e48f-d67a-41a9-a378-dabde954f26e', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 28, 'A home health patient has a diabetic foot ulcer that has progressed to osteomyelitis. She has type 2 DM. How should the osteomyelitis be coded in relation to the diabetes?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3bbc867-fbd1-4197-b31f-6000e33f54e6', 'b783e48f-d67a-41a9-a378-dabde954f26e', 0, 'E11.69, M86.171');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ae77189-a528-47c6-a038-b728162d8c9b', 'b783e48f-d67a-41a9-a378-dabde954f26e', 1, 'M86.171, E11.621');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b7b6a86-3f51-4209-b31d-ffa2c9354a53', 'b783e48f-d67a-41a9-a378-dabde954f26e', 2, 'E11.618, M86.171');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a05dbbaf-0ba1-4c11-8a58-ef61f88cc535', 'b783e48f-d67a-41a9-a378-dabde954f26e', 3, 'E11.621, L97.511, M86.171');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b783e48f-d67a-41a9-a378-dabde954f26e', '9b7b6a86-3f51-4209-b31d-ffa2c9354a53', 'E11.618, M86.171 Diabetes with other specified diabetic arthropathy (osteomyelitis) = E11.618, followed by the osteomyelitis code M86.171. The “with” convention links diabetes to bone/joint infections.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('44c5d8cb-a790-486b-9069-46562ed5d292', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 29, 'A patient is admitted to HH for wound care of a chronic non-pressure ulcer of the right thigh with necrosis of muscle. The etiology is documented as arterial insufficiency. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f6ef95f-61dc-4fbc-a74a-d01d09cafd9d', '44c5d8cb-a790-486b-9069-46562ed5d292', 0, 'I70.211, L97.113');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecd055e4-82fc-461f-89fd-75f495bf2b8d', '44c5d8cb-a790-486b-9069-46562ed5d292', 1, 'I70.211, L97.113, L97.114');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2ec7b27-b2c3-4145-9641-5562fe72495c', '44c5d8cb-a790-486b-9069-46562ed5d292', 2, 'L97.113, I70.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fb9abc67-056b-43d4-9414-04dea169c9ae', '44c5d8cb-a790-486b-9069-46562ed5d292', 3, 'I70.218, L97.113');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('44c5d8cb-a790-486b-9069-46562ed5d292', '0f6ef95f-61dc-4fbc-a74a-d01d09cafd9d', 'I70.211, L97.113 Atherosclerosis of native arteries of right leg with ulceration of thigh = I70.211 (code first). Right thigh with necrosis of muscle = L97.113.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('96f33220-3a3d-4176-b706-21f2f53e41fd', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 30, 'A patient has a skin tear of the left forearm from bumping into furniture. The wound is receiving home health wound care. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e598f95-5fd9-444f-a6ed-37aaab7cd41f', '96f33220-3a3d-4176-b706-21f2f53e41fd', 0, 'S51.812D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('244fbadf-4b27-4f6e-bdb2-2b2188599de7', '96f33220-3a3d-4176-b706-21f2f53e41fd', 1, 'L76.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('de86cdca-b5e9-4179-8826-721403d06822', '96f33220-3a3d-4176-b706-21f2f53e41fd', 2, 'S51.812A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a958c58b-24db-4b61-9199-73cc762bd0d5', '96f33220-3a3d-4176-b706-21f2f53e41fd', 3, 'S61.412D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('96f33220-3a3d-4176-b706-21f2f53e41fd', '8e598f95-5fd9-444f-a6ed-37aaab7cd41f', 'S51.812D Skin tear from trauma = open wound code. Left forearm open wound = S51.812. In HH for wound care = 7th character D (subsequent encounter).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6ed06d60-6af0-4ae4-a240-130aadafdd15', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 31, 'A patient with chronic kidney disease stage 5 is on home peritoneal dialysis. SN visits for dialysis management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e4f4454-b738-4191-af6b-4f06d5e12bce', '6ed06d60-6af0-4ae4-a240-130aadafdd15', 0, 'N18.5, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5573b092-0e8d-4cb2-bf6d-9c3ad58e7029', '6ed06d60-6af0-4ae4-a240-130aadafdd15', 1, 'N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('de16d436-1926-438d-ad0e-85c1d7d3d8c5', '6ed06d60-6af0-4ae4-a240-130aadafdd15', 2, 'Z99.2, N18.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42a9beda-656d-4734-9bae-10013dbd5aee', '6ed06d60-6af0-4ae4-a240-130aadafdd15', 3, 'N18.6, Z49.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6ed06d60-6af0-4ae4-a240-130aadafdd15', '5573b092-0e8d-4cb2-bf6d-9c3ad58e7029', 'N18.6, Z99.2 CKD stage 5 on dialysis = N18.6 (ESRD). Z99.2 = dependence on renal dialysis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d67ec57-9202-4080-bd64-6e0648ca0c14', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 32, 'A patient has an AV fistula for hemodialysis. The fistula site has developed an infection. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f4c3dd7-6dcf-4bf8-94ee-c5765dcabb47', '7d67ec57-9202-4080-bd64-6e0648ca0c14', 0, 'T82.7XXA, B95.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3734a919-cf1f-4079-89bc-d36fd92da6e8', '7d67ec57-9202-4080-bd64-6e0648ca0c14', 1, 'T82.7XXD, B95.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5054499c-f85c-4a8c-b32b-dd5842282c5f', '7d67ec57-9202-4080-bd64-6e0648ca0c14', 2, 'N18.6, T82.7XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('740d11ff-0852-4b30-847b-d1e1b1886f7d', '7d67ec57-9202-4080-bd64-6e0648ca0c14', 3, 'T82.7XXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7d67ec57-9202-4080-bd64-6e0648ca0c14', '4f4c3dd7-6dcf-4bf8-94ee-c5765dcabb47', 'T82.7XXA Infection of AV fistula (vascular device) = T82.7XXA. Use “A” if active treatment of the infection is occurring. B95.8 may be added if a specific organism is identified.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9c4c02e-93dc-413a-a832-419fe2f25e69', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 33, 'A home health patient has a documented “chronic wound” of the left heel without any documented etiology. How should the coder proceed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27959f03-9b11-4e99-8b40-e2b9aadfd686', 'b9c4c02e-93dc-413a-a832-419fe2f25e69', 0, 'Code L97.422 — non-pressure chronic ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1de45e3-d6d7-42e3-99c7-cfd1c11ea570', 'b9c4c02e-93dc-413a-a832-419fe2f25e69', 1, 'Query the clinician/physician for the etiology');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15b9d287-ea76-47cc-9d20-e389cea1df2d', 'b9c4c02e-93dc-413a-a832-419fe2f25e69', 2, 'Assign L98.499 — non-pressure chronic ulcer, unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b94276ba-474b-4dc4-9128-56ed3ff0d569', 'b9c4c02e-93dc-413a-a832-419fe2f25e69', 3, 'Code L89.620 — assume it is a pressure ulcer');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9c4c02e-93dc-413a-a832-419fe2f25e69', 'b1de45e3-d6d7-42e3-99c7-cfd1c11ea570', 'Query the clinician/physician for the etiology A chronic wound without documented etiology should not be assumed to be any particular type. Query to establish whether it is pressure-related, diabetic, vascular, or other.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('236adf94-9f89-47ea-9902-5a55fdaf5e3e', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 34, 'A patient has psoriasis with psoriatic arthritis. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4280a5ae-453c-4e5a-af80-10da5caf19a6', '236adf94-9f89-47ea-9902-5a55fdaf5e3e', 0, 'L40.50, M07.39');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32caf166-7e37-4329-a0f5-dc4b8973c3e8', '236adf94-9f89-47ea-9902-5a55fdaf5e3e', 1, 'L40.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6642f311-5fff-48c3-bdb4-ba7b161da950', '236adf94-9f89-47ea-9902-5a55fdaf5e3e', 2, 'M07.39, L40.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a299fb8-23b7-4283-8c48-290c83d15fec', '236adf94-9f89-47ea-9902-5a55fdaf5e3e', 3, 'L40.59');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('236adf94-9f89-47ea-9902-5a55fdaf5e3e', '32caf166-7e37-4329-a0f5-dc4b8973c3e8', 'L40.50 (arthropathic psoriasis, unspecified) is a single combination code that already captures both the psoriasis and the psoriatic arthritis together, so no separate manifestation code is added. M07.39 is not used at all — it does not exist as a valid ICD-10-CM code, and even the M07 category itself is the wrong disease family (enteropathic arthropathies, unrelated to psoriasis); ICD-10-CM classifies all psoriasis-related joint disease exclusively under the L40.5x combination-code family.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('93ee06ce-998e-4f8c-9bc2-2044f1672854', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 35, 'A patient is admitted to HH for management of a severe contact dermatitis of the hands due to latex gloves used at work. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc290376-f425-426c-878c-ed3c34b3b51f', '93ee06ce-998e-4f8c-9bc2-2044f1672854', 0, 'L23.4, L25.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae5d5902-be06-410a-9438-065ce0af33fd', '93ee06ce-998e-4f8c-9bc2-2044f1672854', 1, 'L23.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f28879c0-e889-4433-886f-79a0784cb2f4', '93ee06ce-998e-4f8c-9bc2-2044f1672854', 2, 'L25.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74735f9a-ee00-4b3e-b084-f3d93133474e', '93ee06ce-998e-4f8c-9bc2-2044f1672854', 3, 'L23.4, Y93.89, Y99.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('93ee06ce-998e-4f8c-9bc2-2044f1672854', 'ae5d5902-be06-410a-9438-065ce0af33fd', 'L23.4 Allergic contact dermatitis due to rubber (latex) = L23.4. External cause codes (Y93, Y99) are optional supplementary codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a583eda9-343e-4e0b-a368-e355b03892d1', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 36, 'A patient has a Stage 2 pressure ulcer of the right trochanter. What is the correct ICD-10-CM code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e4efaa6-5c1a-4335-9290-a32ecf3545b2', 'a583eda9-343e-4e0b-a368-e355b03892d1', 0, 'L89.212');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a325b6d7-7048-4560-8d37-0e368a547555', 'a583eda9-343e-4e0b-a368-e355b03892d1', 1, 'L89.202');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38b46b61-fcee-49c3-b771-23ab6c0e4436', 'a583eda9-343e-4e0b-a368-e355b03892d1', 2, 'L89.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94a3817c-09b2-4d0b-a80d-16321ecb1d85', 'a583eda9-343e-4e0b-a368-e355b03892d1', 3, 'L89.222');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a583eda9-343e-4e0b-a368-e355b03892d1', '0e4efaa6-5c1a-4335-9290-a32ecf3545b2', 'L89.212 Right trochanter Stage 2 pressure ulcer = L89.212.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c8d5fed-1392-483a-a1ec-8f551443af51', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 37, 'A home health patient has two pressure ulcers of the sacrum: one Stage 2 and one Stage 4. How are these coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c536067-1e5c-45f9-9301-010ad4b4930d', '0c8d5fed-1392-483a-a1ec-8f551443af51', 0, 'L89.154 only — code the highest stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d8526a6-ba03-42a6-9577-c15090d2909d', '0c8d5fed-1392-483a-a1ec-8f551443af51', 1, 'L89.152 and L89.154 — code both stages at the same site');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('301da501-e029-4f84-99af-3f6f66d04a1d', '0c8d5fed-1392-483a-a1ec-8f551443af51', 2, 'L89.154 and L89.152 — highest stage first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e1d87cf9-d0ff-4ada-a1ee-c06e1c9cc55d', '0c8d5fed-1392-483a-a1ec-8f551443af51', 3, 'L89.159 — unspecified stage for multiple at same site');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0c8d5fed-1392-483a-a1ec-8f551443af51', '4d8526a6-ba03-42a6-9577-c15090d2909d', 'L89.152 and L89.154 Two pressure ulcers at the same site but different stages are coded individually — both L89.152 (Stage 2) and L89.154 (Stage 4).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 38, 'For OASIS M1311, when counting the number of Stage 2 pressure ulcers, what defines a Stage 2?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5faa9f5-9dfa-4869-8c45-da876af82861', '7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', 0, 'Partial-thickness loss of dermis presenting as a shallow open ulcer with a red-pink wound bed, without slough; may also present as intact or open/ruptured blister');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c7b319f-74ac-4214-95c5-f9c89bb74a1d', '7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', 1, 'Full-thickness tissue loss with visible bone, tendon, or muscle');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d5792dd-2e56-4eb5-9188-0ef46ae0a9ed', '7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', 2, 'Full-thickness skin loss involving damage to subcutaneous tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4f43ff2-6b27-48b6-a2ba-5cab2d87da7c', '7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', 3, 'Non-blanchable erythema of intact skin');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7b6fda68-a0c7-4aeb-b243-6e9dc7c1837a', 'e5faa9f5-9dfa-4869-8c45-da876af82861', 'Stage 2 = partial-thickness loss of dermis presenting as a shallow open ulcer with a red-pink wound bed, without slough. May also present as an intact or open/ruptured blister.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 39, 'A patient had a below-knee amputation of the right leg for peripheral vascular disease. She is now admitted to HH for PT, prosthetic training, and wound care of the stump. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b32e206a-cd24-442d-94d1-a5969a2a7425', 'a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', 0, 'Z47.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ea3884d-847f-4fa6-b8e5-bbc90a2f211b', 'a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', 1, 'Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b5c67fe-f3da-40da-a772-c960438df0b7', 'a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', 2, 'I70.261');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94b40930-27c2-49f0-9de3-7dae36336619', 'a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', 3, 'S88.011D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a49d65e8-a72d-43eb-8a09-ac09ce7b0af9', 'b32e206a-cd24-442d-94d1-a5969a2a7425', 'Z47.81 Aftercare following amputation = Z47.81 as M1021 when the primary focus is post-amputation wound care and rehabilitation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b49630e3-723c-4bfb-8530-7bcf62139e40', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 40, 'After the amputation stump has healed and the patient no longer needs wound care, but continues PT for prosthetic training, what is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2efcbee-b09a-4fbc-b0a2-32494ba29048', 'b49630e3-723c-4bfb-8530-7bcf62139e40', 0, 'Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5085b50-88a9-4089-a205-94e953ecb90a', 'b49630e3-723c-4bfb-8530-7bcf62139e40', 1, 'Z47.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('639c90f4-38d2-492d-8628-c005ebb38748', 'b49630e3-723c-4bfb-8530-7bcf62139e40', 2, 'I70.261');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4ce7118-8bd3-49cb-8355-719d019568bb', 'b49630e3-723c-4bfb-8530-7bcf62139e40', 3, 'Z44.121');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b49630e3-723c-4bfb-8530-7bcf62139e40', 'd5085b50-88a9-4089-a205-94e953ecb90a', 'Z47.81 Z47.81 remains appropriate for ongoing amputation aftercare including prosthetic training, even after the stump has healed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a72dec30-8aeb-4a28-bc56-7624e02c3081', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 41, 'A patient has a documented “non-healing wound of the right foot, etiology unclear.” The patient has diabetes and PVD. The physician has not linked the wound to either condition. How should the coder handle this?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54a08083-607a-4e6a-af7e-2d521cbf5cef', 'a72dec30-8aeb-4a28-bc56-7624e02c3081', 0, 'Assume it is a diabetic ulcer and code E11.621');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d4dbdbd-1766-4359-8fc1-33aea8bb8207', 'a72dec30-8aeb-4a28-bc56-7624e02c3081', 1, 'Assume it is an arterial ulcer and code I70.233');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('654e6ca4-e23c-4169-86b2-b2c679622aaa', 'a72dec30-8aeb-4a28-bc56-7624e02c3081', 2, 'Query the physician to determine the etiology');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60556cd6-7f7b-4af9-a61a-7649c440dee4', 'a72dec30-8aeb-4a28-bc56-7624e02c3081', 3, 'Code L97.511 without an etiology code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a72dec30-8aeb-4a28-bc56-7624e02c3081', '654e6ca4-e23c-4169-86b2-b2c679622aaa', 'Query the physician to determine the etiology When the etiology is unclear and multiple possibilities exist, the coder should query rather than assume a link.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7111fd9-13a7-42b0-9625-ad82b951f625', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 42, 'A patient is on home TPN (total parenteral nutrition) through a central line for short bowel syndrome. SN visits for TPN management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1c3d6b8-e729-47e0-8988-340f581eeb7b', 'f7111fd9-13a7-42b0-9625-ad82b951f625', 0, 'K91.2, Z43.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c0f76b5-20b6-47c2-8f60-f1d3fa6dc525', 'f7111fd9-13a7-42b0-9625-ad82b951f625', 1, 'K91.2, Z46.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('302829fc-6439-47a2-8979-c242c22271cf', 'f7111fd9-13a7-42b0-9625-ad82b951f625', 2, 'Z46.89, K91.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('333e8637-4c56-4584-8c73-31fac944664b', 'f7111fd9-13a7-42b0-9625-ad82b951f625', 3, 'K91.2, Z93.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f7111fd9-13a7-42b0-9625-ad82b951f625', 'f1c3d6b8-e729-47e0-8988-340f581eeb7b', 'K91.2, Z43.8 Short bowel syndrome = K91.2 (postsurgical malabsorption). Z43.8 = attention to other artificial openings (central line care/TPN management).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c75a85ed-8194-4d7e-8458-ea8b528e5daa', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 43, 'A home health patient has a colostomy with a documented parastomal hernia. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2aad4e5-d09e-42b1-a88e-88db6b0cf2bf', 'c75a85ed-8194-4d7e-8458-ea8b528e5daa', 0, 'Z93.3, K43.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2be3930e-30ee-4aba-91c5-f7ae097bee12', 'c75a85ed-8194-4d7e-8458-ea8b528e5daa', 1, 'K43.2, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4388275b-c0aa-4418-ad23-82459dd8a7c4', 'c75a85ed-8194-4d7e-8458-ea8b528e5daa', 2, 'K94.09, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb71024d-6c79-474c-9c3e-b9e305c96a0d', 'c75a85ed-8194-4d7e-8458-ea8b528e5daa', 3, 'K43.5, Z93.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c75a85ed-8194-4d7e-8458-ea8b528e5daa', '2be3930e-30ee-4aba-91c5-f7ae097bee12', 'K43.2, Z93.3 Parastomal hernia = K43.2. Z93.3 = colostomy status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a43e9ca3-6d82-43c0-84e3-8240d964b9ae', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 44, 'A patient has a suprapubic catheter for neurogenic bladder. She is admitted for catheter care and UTI management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7850dad-38d6-4289-bc7e-9952ceaac40c', 'a43e9ca3-6d82-43c0-84e3-8240d964b9ae', 0, 'N31.9, N39.0, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c9efe23-718d-4728-8cc6-d6f09a4de090', 'a43e9ca3-6d82-43c0-84e3-8240d964b9ae', 1, 'N39.0, N31.9, T83.511A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b42c8b94-b5ff-41b8-b60f-522fc00c32b4', 'a43e9ca3-6d82-43c0-84e3-8240d964b9ae', 2, 'T83.511D, N39.0, N31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19bb9690-8056-4ada-92e4-8d9f095fcab3', 'a43e9ca3-6d82-43c0-84e3-8240d964b9ae', 3, 'N39.0, T83.518D, N31.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a43e9ca3-6d82-43c0-84e3-8240d964b9ae', '19bb9690-8056-4ada-92e4-8d9f095fcab3', 'N39.0, T83.518D, N31.9 UTI = N39.0. Infection of suprapubic catheter = T83.518D (other urinary catheter device). Neurogenic bladder = N31.9. 7th character D for ongoing treatment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d7b028bc-60db-41cf-b57b-f6288ba099b1', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 45, 'A patient is admitted to HH for wound care of a non-healing post-surgical wound following right mastectomy for breast cancer. The cancer was completely excised. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0787df36-998f-4450-8c7e-af75a321564f', 'd7b028bc-60db-41cf-b57b-f6288ba099b1', 0, 'C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c8a1560-4c8a-4628-84d2-e2a3ba7447c7', 'd7b028bc-60db-41cf-b57b-f6288ba099b1', 1, 'T81.89XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c06b96bd-2a22-4f99-b491-eb777f1b7e46', 'd7b028bc-60db-41cf-b57b-f6288ba099b1', 2, 'Z48.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('995e1c45-2040-48f9-a26d-517800d17cc5', 'd7b028bc-60db-41cf-b57b-f6288ba099b1', 3, 'T81.31XD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d7b028bc-60db-41cf-b57b-f6288ba099b1', '995e1c45-2040-48f9-a26d-517800d17cc5', 'T81.31XD Non-healing surgical wound (dehiscence) = T81.31XD as M1021. The cancer was excised (code as history Z85.3 secondary). Ongoing wound care = 7th character D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdfcabef-171c-47d7-84e5-93fa966385f5', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 46, 'A patient sustained a thermal burn of the left hand — partial thickness (second degree) — 3 weeks ago. She is now receiving HH wound care. The burn is healing normally. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4ff3971-827c-4995-94d8-5bfbb31243bb', 'fdfcabef-171c-47d7-84e5-93fa966385f5', 0, 'T23.102A, X19.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b67f3f6-d24e-4f84-9d6e-fb2bae8f63bb', 'fdfcabef-171c-47d7-84e5-93fa966385f5', 1, 'T23.102D, X19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e70b068-9f4d-460c-90a7-79cecfecccb0', 'fdfcabef-171c-47d7-84e5-93fa966385f5', 2, 'T23.102D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2a768f7-6d83-46c5-9dd3-2b42105304f5', 'fdfcabef-171c-47d7-84e5-93fa966385f5', 3, 'L90.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fdfcabef-171c-47d7-84e5-93fa966385f5', '8b67f3f6-d24e-4f84-9d6e-fb2bae8f63bb', 'T23.102D, X19.XXXD Second-degree burn of left hand, 3 weeks old, healing = T23.102D. External cause of thermal burn = X19.XXXD. Both get 7th character D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bb1376b3-a6ea-4820-bdcd-33124c49db45', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 47, 'A patient has a first-degree sunburn of the back. Is this coded as a burn in ICD-10-CM?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb43883e-eeab-41ce-9c3b-7ffea05a963c', 'bb1376b3-a6ea-4820-bdcd-33124c49db45', 0, 'Yes — L55.1 (first-degree sunburn) is in the burn chapter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1620538-bfaf-4870-a4f4-483034ab0153', 'bb1376b3-a6ea-4820-bdcd-33124c49db45', 1, 'No — sunburn uses separate L55 codes, not T20-T25 burn codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9163360-6e11-45e0-8dcf-88400a6d088d', 'bb1376b3-a6ea-4820-bdcd-33124c49db45', 2, 'Yes — T21.10XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6676ac4-007e-4bc5-af4e-421ed90b1cf8', 'bb1376b3-a6ea-4820-bdcd-33124c49db45', 3, 'Sunburns are not coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bb1376b3-a6ea-4820-bdcd-33124c49db45', 'd1620538-bfaf-4870-a4f4-483034ab0153', 'Sunburn uses L55 codes (in the skin chapter), not the T20-T25 burn injury codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8311c72c-6570-48ac-983e-7ea354123105', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 48, 'A patient has a third-degree burn of the right thigh (current area 7% of TBSA) and second-degree burn of the right forearm (3% TBSA). Total body surface involved is 10%. What TBSA code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef8d3d63-1aae-4aa2-a3b3-02490c2c1a3f', '8311c72c-6570-48ac-983e-7ea354123105', 0, 'T31.10 — 10-19% TBSA with 0% third degree');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a3e7005-b3e7-47cd-aed4-9f47357058f5', '8311c72c-6570-48ac-983e-7ea354123105', 1, 'T31.0 — less than 10%');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfa240c0-3bcd-4423-9779-8e7181b4d71d', '8311c72c-6570-48ac-983e-7ea354123105', 2, 'T31.10 — 10-19% TBSA, but the third-degree component also needs its own T31 code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d19893f2-4c0b-4e40-a6e4-51eaa9bf5b89', '8311c72c-6570-48ac-983e-7ea354123105', 3, 'T31.11 — 10-19% TBSA with 10-19% third degree');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8311c72c-6570-48ac-983e-7ea354123105', 'd19893f2-4c0b-4e40-a6e4-51eaa9bf5b89', 'T31.11 Total TBSA involved = 10%. Third-degree = 7% of TBSA. T31.11 = 10-19% total TBSA with 10-19% third degree.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be552264-da71-46e3-b41d-739413387c2d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 49, 'A patient has an infected right total hip prosthesis, currently being treated with IV antibiotics at home. The infection is due to Staphylococcus aureus (MRSA). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc3b1b47-7707-4fb7-a723-717386b438d0', 'be552264-da71-46e3-b41d-739413387c2d', 0, 'T84.54XA, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f037dbc5-c95b-4f75-b528-1a714ad4f528', 'be552264-da71-46e3-b41d-739413387c2d', 1, 'T84.54XD, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80f59d85-460a-4a71-9406-a0b724c2f622', 'be552264-da71-46e3-b41d-739413387c2d', 2, 'T84.54XD, A41.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67cb5658-2d42-401f-a7dc-15dbfe89271c', 'be552264-da71-46e3-b41d-739413387c2d', 3, 'T84.54XA, Z22.322');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be552264-da71-46e3-b41d-739413387c2d', 'f037dbc5-c95b-4f75-b528-1a714ad4f528', 'T84.54XD, B95.62 Infected right hip prosthesis = T84.54XD (ongoing treatment = D). MRSA organism = B95.62.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('975573d9-d215-4081-aacc-5e80d7c8ddab', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 50, 'A home health patient is being treated for a wound infection following cesarean section (superficial incisional SSI). She is 5 weeks postpartum. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dbc86455-8ffa-4c36-b1d4-856006ae1ea4', '975573d9-d215-4081-aacc-5e80d7c8ddab', 0, 'T81.41XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9e9de2c-d8ac-4298-84f2-42bf0003af9c', '975573d9-d215-4081-aacc-5e80d7c8ddab', 1, 'O86.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f234b0a4-ab8f-4b4b-8013-0395b5b0855e', '975573d9-d215-4081-aacc-5e80d7c8ddab', 2, 'T81.41XA, O90.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('407b95b7-921b-4931-b50c-783bd8ce1e56', '975573d9-d215-4081-aacc-5e80d7c8ddab', 3, 'O86.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('975573d9-d215-4081-aacc-5e80d7c8ddab', 'd9e9de2c-d8ac-4298-84f2-42bf0003af9c', 'O86.01 Post-cesarean wound infection within the puerperium (6 weeks) uses Chapter 15 obstetric codes: O86.01 (superficial incisional SSI following cesarean).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee413932-f834-4cfb-9b77-390a7c17c18e', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 51, 'A patient has a chronic non-pressure ulcer of the left lower leg with exposed bone. The etiology is documented as venous hypertension. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9d0604d-8856-4cfd-9ddc-c8f4f8e727b2', 'ee413932-f834-4cfb-9b77-390a7c17c18e', 0, 'I87.312, L97.224');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f3f1676-c280-4b43-89e1-3ffa5134c5eb', 'ee413932-f834-4cfb-9b77-390a7c17c18e', 1, 'I87.012, L97.224');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1406f17-035c-4c17-8c9d-336ff2baad74', 'ee413932-f834-4cfb-9b77-390a7c17c18e', 2, 'I83.212, L97.224');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ca12ca1-04b7-46c4-ae89-1026404032b0', 'ee413932-f834-4cfb-9b77-390a7c17c18e', 3, 'L97.224, I87.312');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ee413932-f834-4cfb-9b77-390a7c17c18e', 'b9d0604d-8856-4cfd-9ddc-c8f4f8e727b2', 'I87.312, L97.224 Venous hypertension with ulcer of left lower leg = I87.312 (code first). Bone involvement = L97.224.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e2a9985b-8bb9-4d15-aaa5-c0891de7b755', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 52, 'A patient has three surgical wounds: a right knee replacement incision (healing), a chest port site (implanted port for chemotherapy), and a healed abdominal appendectomy scar (3 months old, fully epithelialized). How many surgical wounds are reported for OASIS M1340?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1112c683-aabb-4331-83e9-f118314a1cac', 'e2a9985b-8bb9-4d15-aaa5-c0891de7b755', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33971977-ca76-46a2-8940-96dce0e06f56', 'e2a9985b-8bb9-4d15-aaa5-c0891de7b755', 1, '2 — the healed appendectomy scar does not count');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cd9df57-773d-4205-8b08-8f5d752367ac', 'e2a9985b-8bb9-4d15-aaa5-c0891de7b755', 2, '1 — only the knee incision counts');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5de60280-59d4-47f2-a8e9-c3d95633657e', 'e2a9985b-8bb9-4d15-aaa5-c0891de7b755', 3, '0 — none qualify');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e2a9985b-8bb9-4d15-aaa5-c0891de7b755', '33971977-ca76-46a2-8940-96dce0e06f56', '2 The knee incision (healing) and the chest port site (implanted device = surgical wound per OASIS) count. The fully epithelialized appendectomy scar does not count.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('553df1cf-154d-4cd6-9787-956e3c54d0d2', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 53, 'A patient has a non-healing diabetic ulcer of the right heel with fat layer exposed. She also has a Stage 3 pressure ulcer of the coccyx. She has type 2 DM on insulin. What is the complete wound coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4d5c727-ba40-47e6-9cef-a5d3ed684f5d', '553df1cf-154d-4cd6-9787-956e3c54d0d2', 0, 'E11.621, L97.412, L89.153, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a793b3e3-f880-4659-bafa-6c0afc60c611', '553df1cf-154d-4cd6-9787-956e3c54d0d2', 1, 'L89.153, E11.621, L97.412, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d30186f-bd48-4d06-8402-5c870ce55a49', '553df1cf-154d-4cd6-9787-956e3c54d0d2', 2, 'E11.621, L97.411, L89.153, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e321386-9d75-4006-8134-78ea197d450e', '553df1cf-154d-4cd6-9787-956e3c54d0d2', 3, 'E11.622, L97.412, L89.153, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('553df1cf-154d-4cd6-9787-956e3c54d0d2', 'f4d5c727-ba40-47e6-9cef-a5d3ed684f5d', 'E11.621, L97.412, L89.153, Z79.4 Diabetic right heel ulcer: E11.621, L97.412 (fat layer). Stage 3 sacral PU: L89.153. Z79.4 for insulin in type 2 DM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('874790ce-33f0-4752-baea-e704654d407f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 54, 'A patient has a documented “skin breakdown” of the right heel. There is no documentation of pressure, diabetes, or vascular disease as the cause. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('22fb0b8d-94ed-4e7f-8e5b-68bc73f86ad2', '874790ce-33f0-4752-baea-e704654d407f', 0, 'L89.610 — assume pressure ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af1b1fa8-25f2-423b-89c7-211e1a467dcf', '874790ce-33f0-4752-baea-e704654d407f', 1, 'L97.411 — non-pressure chronic ulcer, breakdown only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('649f0c8a-4bb0-44fb-8b1e-12d579efba8e', '874790ce-33f0-4752-baea-e704654d407f', 2, 'Query the clinician/physician for etiology and cause');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba04d175-9b27-421b-926a-d59be57b753e', '874790ce-33f0-4752-baea-e704654d407f', 3, 'L98.411');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('874790ce-33f0-4752-baea-e704654d407f', '649f0c8a-4bb0-44fb-8b1e-12d579efba8e', 'Query the clinician/physician for etiology and cause “Skin breakdown” without documented etiology requires clarification before coding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b71cbb38-047b-4830-9942-77eb14a6f2e1', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 55, 'A patient on long-term prednisone for COPD has developed steroid-induced diabetes. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab11e2e8-8fa2-4fd5-88c9-9d964af13b77', 'b71cbb38-047b-4830-9942-77eb14a6f2e1', 0, 'E11.9, Z79.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c25dd42-5d39-455d-aada-561da020c04a', 'b71cbb38-047b-4830-9942-77eb14a6f2e1', 1, 'E09.9, T38.0X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d20b088e-e27a-4123-8d2d-2ac0797298d8', 'b71cbb38-047b-4830-9942-77eb14a6f2e1', 2, 'E09.9, T38.0X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a026ef1-9699-40a3-8ae3-0407f0adb6a3', 'b71cbb38-047b-4830-9942-77eb14a6f2e1', 3, 'E13.9, Z79.52');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b71cbb38-047b-4830-9942-77eb14a6f2e1', '2c25dd42-5d39-455d-aada-561da020c04a', 'E09.9, T38.0X5A Drug-induced diabetes = E09.- (drug or chemical-induced). The adverse effect of the steroid = T38.0X5A. Z79.52 is not used because the T-code captures the drug.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 56, 'A patient had a kidney transplant 2 years ago and is on immunosuppressive therapy. She is admitted for SN management of a CMV infection. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f3f9126d-39f2-4ae4-8ba8-717feee47f4d', '4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', 0, 'T86.13, B25.9, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2116bbf7-da01-4e14-81b9-ee0887cd7f86', '4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', 1, 'B25.9, Z94.0, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9625cf6e-8662-4222-96a3-b6df58a0c941', '4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', 2, 'T86.13, B25.9, Z94.0, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ffe169d0-8a1d-4fe8-a986-a6010f158bdc', '4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', 3, 'Z94.0, B25.9, Z79.899');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4c6ff3d5-770e-4aea-81f8-daf4aa16dfe0', 'f3f9126d-39f2-4ae4-8ba8-717feee47f4d', 'T86.13, B25.9, Z79.899 Kidney transplant with infection = T86.13 (kidney transplant infection). CMV = B25.9. Z79.899 for immunosuppressive therapy. Z94.0 is included in T86.13.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea6b42d0-7469-4060-875f-67ffda02d7f4', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 57, 'A patient with a functioning colostomy develops diarrhea from the colostomy site. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('517c8f65-2219-441a-ad16-afa67ac208db', 'ea6b42d0-7469-4060-875f-67ffda02d7f4', 0, 'K94.03, K91.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb3360fa-5c56-4da4-a0b7-6ef8422393b8', 'ea6b42d0-7469-4060-875f-67ffda02d7f4', 1, 'K94.03');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e1dec2e-8c62-48d6-9867-5448baf62d97', 'ea6b42d0-7469-4060-875f-67ffda02d7f4', 2, 'K59.1, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfd2e935-bdf9-4b62-953b-0f61b4818c49', 'ea6b42d0-7469-4060-875f-67ffda02d7f4', 3, 'K91.1, Z93.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ea6b42d0-7469-4060-875f-67ffda02d7f4', 'bb3360fa-5c56-4da4-a0b7-6ef8422393b8', 'K94.03 Malfunction/complication of colostomy (diarrhea) = K94.03 (colostomy malfunction).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 58, 'A patient is admitted to HH for wound care of a right below-knee amputation stump that is not healing. The amputation was performed for diabetic gangrene 3 weeks ago. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9eabc6db-a0b0-4053-b9ee-7b886f30db81', 'b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', 0, 'T87.31, E11.52, Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f3e79345-8c1d-4fc4-9964-53f47acf0c1c', 'b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', 1, 'Z47.81, E11.52, Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04abb3c8-16a9-4181-ae9c-91153ba00264', 'b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', 2, 'T87.31, E11.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d430858-5cb1-4cb2-a668-e03260a05999', 'b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', 3, 'E11.52, T87.31, Z89.511');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b99e1c8f-9bd7-4c7b-9a32-a6f3172ed838', '9eabc6db-a0b0-4053-b9ee-7b886f30db81', 'T87.31, E11.52, Z89.511 Non-healing amputation stump, right below-knee = T87.31 (dehiscence of amputation stump). E11.52 = DM with diabetic PVD/gangrene. Z89.511 = acquired absence of right leg below knee.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c7e45c24-f646-49b8-9752-c9680d57a99c', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 59, 'A patient has an open wound of the right hand from a dog bite, currently being treated with antibiotics at home. The bite occurred 1 week ago. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('914f5f5f-00f3-4e41-93fc-17151b2c6b1d', 'c7e45c24-f646-49b8-9752-c9680d57a99c', 0, 'S61.401D, W54.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f87a64f-35a5-4278-af1d-5d1c9a9e9c05', 'c7e45c24-f646-49b8-9752-c9680d57a99c', 1, 'S61.451D, W54.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb9be68e-5b90-4dd2-a10f-cce0aa770e11', 'c7e45c24-f646-49b8-9752-c9680d57a99c', 2, 'S61.401A, W54.0XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cda777b6-5e0b-4d3d-b47a-83a692eb056d', 'c7e45c24-f646-49b8-9752-c9680d57a99c', 3, 'T14.1, W54.0XXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c7e45c24-f646-49b8-9752-c9680d57a99c', '914f5f5f-00f3-4e41-93fc-17151b2c6b1d', 'S61.401D, W54.0XXD Open wound of right hand = S61.401D (subsequent encounter during healing). Dog bite = W54.0XXD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1cf42720-9523-4ca0-8604-a90238ff4058', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 60, 'A patient has documented “gangrene of the right great toe” secondary to type 2 diabetes. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4bdb9500-53c0-40b1-a888-e47d17f11d5d', '1cf42720-9523-4ca0-8604-a90238ff4058', 0, 'E11.52, I96, L97.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f45cfdcb-fc00-4685-b80a-ad7c085dcff3', '1cf42720-9523-4ca0-8604-a90238ff4058', 1, 'E11.52, I96');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ae64ff1-57e9-4f08-8d06-cb3e2d8d9e2d', '1cf42720-9523-4ca0-8604-a90238ff4058', 2, 'I96, E11.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f11d74b2-d713-459a-afc3-91e91ca2c9c5', '1cf42720-9523-4ca0-8604-a90238ff4058', 3, 'E11.621, I96');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1cf42720-9523-4ca0-8604-a90238ff4058', '4bdb9500-53c0-40b1-a888-e47d17f11d5d', 'E11.52, I96, L97.511 Type 2 DM with diabetic PVD/gangrene = E11.52. Gangrene = I96 (code also). L97.511 for the ulcer site/severity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 61, 'A home health patient with schizophrenia has developed tardive dyskinesia from long-term antipsychotic medication use. She is taking the medication correctly. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06773f76-5542-4464-a661-ffcc090d08fd', '9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', 0, 'G24.01, T43.505A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a1f8b72-f824-41a9-9921-d7a10583b725', '9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', 1, 'G24.01, T43.505D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28082a01-2e3b-4f63-bca3-429363607fe5', '9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', 2, 'T43.505A, G24.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52eb0b0a-9d18-495b-aa99-b73a72cbc651', '9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', 3, 'G24.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9ff1fa9f-4f16-4d19-96e4-d2e3e67f9428', '5a1f8b72-f824-41a9-9921-d7a10583b725', 'G24.01, T43.505D Tardive dyskinesia = G24.01 (manifestation first). Adverse effect of antipsychotic = T43.505D (D for ongoing/chronic).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6f60809f-4918-4649-9cd2-0646d8aa7e1f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 62, 'A patient is admitted for management of a fistula between the colon and bladder (colovesical fistula). What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('168cd467-7f81-4748-aa09-ffbf25842115', '6f60809f-4918-4649-9cd2-0646d8aa7e1f', 0, 'N32.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c99cde0b-4af8-4b21-924a-00b187a5a7f0', '6f60809f-4918-4649-9cd2-0646d8aa7e1f', 1, 'K63.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfc5c037-b723-4e80-ab0b-f786f773549c', '6f60809f-4918-4649-9cd2-0646d8aa7e1f', 2, 'N32.1, K63.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5dec8165-4475-4150-b200-8091656d3988', '6f60809f-4918-4649-9cd2-0646d8aa7e1f', 3, 'K60.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6f60809f-4918-4649-9cd2-0646d8aa7e1f', '168cd467-7f81-4748-aa09-ffbf25842115', 'N32.1 Colovesical fistula = N32.1 (vesicointestinal fistula). This single code captures the fistula.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0af2100f-3b94-4f87-b580-89867fcc301e', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 63, 'A patient has a chronic non-pressure ulcer of the right ankle with necrosis limited to the skin (no deeper tissue involvement). Etiology is documented as chronic venous insufficiency. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61c7e2c0-2ea3-4505-a496-d66801a691c7', '0af2100f-3b94-4f87-b580-89867fcc301e', 0, 'I87.311, L97.315');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46e61f71-d652-406a-bd8d-e08012db7f62', '0af2100f-3b94-4f87-b580-89867fcc301e', 1, 'I87.311, L97.311');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1804e659-fd64-4505-846e-90615f87c9d8', '0af2100f-3b94-4f87-b580-89867fcc301e', 2, 'I87.311, L97.312');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f94f3ce-3a53-40b4-a133-a52f66d6a4f4', '0af2100f-3b94-4f87-b580-89867fcc301e', 3, 'I83.011, L97.311');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0af2100f-3b94-4f87-b580-89867fcc301e', '46e61f71-d652-406a-bd8d-e08012db7f62', 'I87.311, L97.311 Chronic venous insufficiency with right ankle ulcer = I87.311 (code first). Skin breakdown only (no deeper involvement) = L97.311 (limited to breakdown of skin).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a4e8624-700f-48fd-9df0-c128dbe6f9c1', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 64, 'A patient is receiving home health for wound care of a surgical wound that developed a seroma. How is the seroma coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61c1ab6b-5640-4fa9-87b9-d5ef5ecf8d44', '4a4e8624-700f-48fd-9df0-c128dbe6f9c1', 0, 'T81.89XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8398f1de-0fad-45f4-b503-79cdc57b2a39', '4a4e8624-700f-48fd-9df0-c128dbe6f9c1', 1, 'L76.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c322a7cf-c535-4e99-b1e0-630a972703a9', '4a4e8624-700f-48fd-9df0-c128dbe6f9c1', 2, 'T81.89XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ac36139f-9492-4cad-93e5-3612447f43fc', '4a4e8624-700f-48fd-9df0-c128dbe6f9c1', 3, 'Seromas are not coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4a4e8624-700f-48fd-9df0-c128dbe6f9c1', '61c1ab6b-5640-4fa9-87b9-d5ef5ecf8d44', 'T81.89XD Seroma as a post-procedural complication = T81.89XD (other complication of procedure). D for ongoing management.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6fefc42f-c1de-429c-8649-49650ded79be', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 65, 'A patient has bilateral Stage 2 pressure ulcers of the heels. How many L89 codes are assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d5394d8-bae5-45ad-89e4-b51f1bc5ff0a', '6fefc42f-c1de-429c-8649-49650ded79be', 0, '1 — use a bilateral code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56e077eb-6301-47c7-acd3-1813633b6fc0', '6fefc42f-c1de-429c-8649-49650ded79be', 1, '2 — one for each heel: L89.612 and L89.622');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b67847dd-3b98-40de-97c6-d7e38bb873f8', '6fefc42f-c1de-429c-8649-49650ded79be', 2, '1 — code the right heel only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dca2f916-94ea-4afa-8282-8c6c2e2c9ee2', '6fefc42f-c1de-429c-8649-49650ded79be', 3, '2 — L89.612 and L89.612 (same code twice)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6fefc42f-c1de-429c-8649-49650ded79be', '56e077eb-6301-47c7-acd3-1813633b6fc0', '2 — one for each heel Bilateral PUs are coded separately: L89.612 (right heel, Stage 2) and L89.622 (left heel, Stage 2).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('944895d9-e455-447b-9340-e495588c952d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 66, 'A patient has a large abdominal wound being managed with a wound VAC device at home. The wound is a dehisced surgical incision following colon surgery. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ca3f1a3-e6ab-439c-a54a-ed860ba35c59', '944895d9-e455-447b-9340-e495588c952d', 0, 'Z48.815');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf28151d-8256-46d2-bdb8-04b1c981f969', '944895d9-e455-447b-9340-e495588c952d', 1, 'T81.31XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52ebf541-b744-4849-8815-8d8df168a57a', '944895d9-e455-447b-9340-e495588c952d', 2, 'T81.31XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ba157f6-6597-491e-a319-4f1f5d08039b', '944895d9-e455-447b-9340-e495588c952d', 3, 'L76.21');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('944895d9-e455-447b-9340-e495588c952d', 'bf28151d-8256-46d2-bdb8-04b1c981f969', 'T81.31XD Dehisced surgical wound being actively managed with wound VAC = T81.31XD as M1021 (disruption of surgical wound). D for ongoing wound care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bfbb795-dcb8-40d7-91a7-98caef590a6a', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 67, 'A home health patient has documented “infected right knee wound post-arthroscopy, MSSA.” She is receiving IV vancomycin at home. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3745c98-a06c-4dd0-8f8b-7158751ccf8e', '5bfbb795-dcb8-40d7-91a7-98caef590a6a', 0, 'T81.41XA, B95.61, Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9436aa2b-b96f-40be-b75d-36209783a0a6', '5bfbb795-dcb8-40d7-91a7-98caef590a6a', 1, 'T81.41XD, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1deed4fe-45e8-44b8-8057-3e9d185371b3', '5bfbb795-dcb8-40d7-91a7-98caef590a6a', 2, 'T84.54XD, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dce70137-ea10-4236-865e-76e3c2dc81f0', '5bfbb795-dcb8-40d7-91a7-98caef590a6a', 3, 'M00.061');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5bfbb795-dcb8-40d7-91a7-98caef590a6a', '9436aa2b-b96f-40be-b75d-36209783a0a6', 'T81.41XD, B95.61 Post-operative wound infection following arthroscopy = T81.41XD. MSSA = B95.61. D because it is ongoing treatment in HH.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2fd8436-f39c-4943-b069-23608d937ddf', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 68, 'A patient had a right hip fracture (intertrochanteric) repaired with an internal fixation device. She is now in HH for PT. The fracture is healing normally with 7th character D. What is the correct fracture code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8fb4fb9-916f-4e7b-a109-7a6b601c623d', 'a2fd8436-f39c-4943-b069-23608d937ddf', 0, 'S72.101D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb4185b4-0b0c-4a1d-989e-a298602d62ed', 'a2fd8436-f39c-4943-b069-23608d937ddf', 1, 'S72.141D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8bb8f4b0-b785-4148-9d83-2b75400dd617', 'a2fd8436-f39c-4943-b069-23608d937ddf', 2, 'M84.451D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f910998e-cadb-4479-ab0e-2d6895994229', 'a2fd8436-f39c-4943-b069-23608d937ddf', 3, 'Z47.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2fd8436-f39c-4943-b069-23608d937ddf', 'd8fb4fb9-916f-4e7b-a109-7a6b601c623d', 'S72.101D Intertrochanteric fracture of right femur = S72.101D. 7th character D for routine healing during subsequent encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 69, 'Per ICD-10-CM guidelines, when a patient has a displaced fracture and the documentation does not specify displaced vs. non-displaced, what is the default?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7d87e0e-8bed-443f-9db4-b421f522be71', 'fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', 0, 'Non-displaced');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d1b0fe6-9a83-4df1-babe-f0f1d33ab07a', 'fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', 1, 'Displaced');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2400424-0445-49c2-99b1-3239a9dbc243', 'fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', 2, 'Unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('81798cec-041e-42cb-8676-1feefc781642', 'fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', 3, 'Query the physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fa18b1df-e6b6-49ba-bbbd-9b02fbd524be', '7d1b0fe6-9a83-4df1-babe-f0f1d33ab07a', 'Displaced ICD-10-CM defaults to displaced when documentation does not specify displaced vs. non-displaced.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef93a52a-0a82-4693-927e-6601dba8e7de', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 70, 'A patient has a stress fracture of the right tibia from excessive running. She is receiving HH for gait training. What code is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e0c3b1e-6c12-482d-85e0-ac09abd76c36', 'ef93a52a-0a82-4693-927e-6601dba8e7de', 0, 'S82.101D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1466f6e-073d-42d2-ac7a-9e1f170964c8', 'ef93a52a-0a82-4693-927e-6601dba8e7de', 1, 'M84.361A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('37509cd9-7651-4e05-89af-787d4fc15b38', 'ef93a52a-0a82-4693-927e-6601dba8e7de', 2, 'M84.361D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc1a1f7e-3434-45b9-8c4b-a4b2900f90cb', 'ef93a52a-0a82-4693-927e-6601dba8e7de', 3, 'S82.101A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ef93a52a-0a82-4693-927e-6601dba8e7de', '37509cd9-7651-4e05-89af-787d4fc15b38', 'M84.361D Stress fracture of right tibia = M84.361. In HH for gait training (routine care) = 7th character D for subsequent encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('67a6915a-baf3-41bd-bf9a-3e438cecf05f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 71, 'A patient has documented osteomyelitis of the left femur, acute, due to MSSA. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('58fe3924-506a-45cb-9f82-6bbad532670d', '67a6915a-baf3-41bd-bf9a-3e438cecf05f', 0, 'M86.152, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2a8491a-f0e2-4f0f-a759-f68daa14e6e5', '67a6915a-baf3-41bd-bf9a-3e438cecf05f', 1, 'M86.152');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0fed9126-b9f9-4891-9350-72dbe2067be5', '67a6915a-baf3-41bd-bf9a-3e438cecf05f', 2, 'M86.252, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc44076d-20a1-4f51-a94d-69b9aa9ef743', '67a6915a-baf3-41bd-bf9a-3e438cecf05f', 3, 'M86.12, B95.61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('67a6915a-baf3-41bd-bf9a-3e438cecf05f', '58fe3924-506a-45cb-9f82-6bbad532670d', 'M86.152, B95.61 Acute osteomyelitis of left femur = M86.152. MSSA organism = B95.61.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 72, 'A home health patient had a spinal fusion surgery 3 weeks ago. She is recovering well with PT. She also has lumbar spinal stenosis and degenerative disc disease. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d11b5d8d-834b-4288-817a-39a75bd920d4', '5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', 0, 'M48.06');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39ea45a2-6f0e-49b9-83fd-adf9ffc500c4', '5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', 1, 'Z48.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca4144a5-2cbb-462d-accf-f28c3219c8aa', '5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', 2, 'M51.16');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0817076d-b10d-4e66-b9f2-4553201cf13d', '5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', 3, 'M43.16');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5d54d1c6-f4b7-49df-99e8-f44f3ddc8476', '39ea45a2-6f0e-49b9-83fd-adf9ffc500c4', 'Z48.89 Routine aftercare following spinal surgery with normal recovery = Z48.89 (encounter for other specified surgical aftercare).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('71e49fac-1c97-46b4-86e3-6b0ee0cb3519', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 73, 'A patient is admitted to HH for SN management of a new deep vein thrombosis of the left popliteal vein. She is also on warfarin for a prior PE (resolved 6 months ago). What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d64cc01-3979-4ae8-a21c-d053db890fb9', '71e49fac-1c97-46b4-86e3-6b0ee0cb3519', 0, 'I82.432');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('faf6446f-c5cd-47f2-9539-3ca7f533302a', '71e49fac-1c97-46b4-86e3-6b0ee0cb3519', 1, 'I82.432, Z86.711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec9e8c4f-e7f6-489f-b11b-fd09f2c659c5', '71e49fac-1c97-46b4-86e3-6b0ee0cb3519', 2, 'Z86.711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92cc1771-8bb9-4edc-bb88-c143305205aa', '71e49fac-1c97-46b4-86e3-6b0ee0cb3519', 3, 'I82.492');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('71e49fac-1c97-46b4-86e3-6b0ee0cb3519', '9d64cc01-3979-4ae8-a21c-d053db890fb9', 'I82.432 Acute DVT of left popliteal vein = I82.432 as M1021 (new active condition being treated). Z86.711 (history of PE) may be added as secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7f9b86e9-e558-43e0-a56a-a99db9a7951d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 74, 'A patient has chronic lymphedema of the right arm following mastectomy and axillary lymph node dissection. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7cced2da-14ee-45b2-aa33-0d538f325779', '7f9b86e9-e558-43e0-a56a-a99db9a7951d', 0, 'I89.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6139c97-b8f2-4386-aab6-6c6437353fa6', '7f9b86e9-e558-43e0-a56a-a99db9a7951d', 1, 'I97.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('130b9a1c-0f53-4c0b-931d-9ca56f462e83', '7f9b86e9-e558-43e0-a56a-a99db9a7951d', 2, 'Q82.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6d6be16-124e-4647-9346-32345b235d52', '7f9b86e9-e558-43e0-a56a-a99db9a7951d', 3, 'I89.0, Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7f9b86e9-e558-43e0-a56a-a99db9a7951d', 'f6139c97-b8f2-4386-aab6-6c6437353fa6', 'I97.2 Postmastectomy lymphedema syndrome = I97.2. This specific code captures lymphedema resulting from mastectomy/lymph node dissection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 75, 'A patient has a tunneling pressure ulcer of the sacrum, Stage 4. What additional information should be captured in the OASIS wound assessment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a57bcc7-63db-49df-96e1-8448a9e1f29f', 'f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', 0, 'Only the longest length and perpendicular width');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7176538a-3ac7-4184-a814-5b3194714890', 'f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', 1, 'Length, width, and depth — tunneling is measured separately and documented in wound assessment items');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dcf66753-8eeb-455e-aaf1-05b3213524e2', 'f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', 2, 'Length and width only — tunneling is not separately measured');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d71bc365-c20e-4c1b-8a1a-7782a2ea8f64', 'f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', 3, 'Only the total wound volume');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f13fdb0d-2b07-4edf-a91c-aa2a65d4681c', '7176538a-3ac7-4184-a814-5b3194714890', 'Tunneling is measured separately from length, width, and depth per OASIS wound assessment guidance.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('06bc6114-9a92-4f9c-838e-36f6104d4cf9', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 76, 'For OASIS M1330 (Does this patient have a stasis ulcer?), a stasis ulcer is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c23a87e1-f035-4792-a882-fe834af36add', '06bc6114-9a92-4f9c-838e-36f6104d4cf9', 0, 'Any wound on the lower extremity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44b23d97-d53f-44c4-9eb4-d4d32286d3fd', '06bc6114-9a92-4f9c-838e-36f6104d4cf9', 1, 'An open lesion caused by inadequate venous circulation, typically on the lower leg or ankle');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae671c7d-116f-4d74-8caa-b7753961dbcc', '06bc6114-9a92-4f9c-838e-36f6104d4cf9', 2, 'A wound caused by arterial disease');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c05f8917-f9ae-43a3-b23e-c606e64c51dd', '06bc6114-9a92-4f9c-838e-36f6104d4cf9', 3, 'Any ulcer below the knee');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('06bc6114-9a92-4f9c-838e-36f6104d4cf9', '44b23d97-d53f-44c4-9eb4-d4d32286d3fd', 'A stasis ulcer is an open lesion caused by inadequate venous circulation, typically found on the lower leg or ankle area.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('036803d0-ad1d-4d84-883c-3966ffe089a1', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 77, 'A patient has a non-pressure ulcer of the right thigh with undermining. The etiology is peripheral arterial disease. The wound bed shows exposed muscle. What is the severity character?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82fc8bc7-7976-4d36-a0e0-e3412631d746', '036803d0-ad1d-4d84-883c-3966ffe089a1', 0, '1 — limited to breakdown of skin');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('324825d3-a938-422d-b1f2-c4f43ae8e5e2', '036803d0-ad1d-4d84-883c-3966ffe089a1', 1, '2 — with fat layer exposed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27e42848-cf80-4987-b24e-7cfa4bcacc13', '036803d0-ad1d-4d84-883c-3966ffe089a1', 2, '3 — with necrosis of muscle');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('270eb2b5-a363-4e76-8c14-63a5424f27ba', '036803d0-ad1d-4d84-883c-3966ffe089a1', 3, '4 — with necrosis of bone');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('036803d0-ad1d-4d84-883c-3966ffe089a1', '27e42848-cf80-4987-b24e-7cfa4bcacc13', '3 — with necrosis of muscle Exposed muscle = severity character 3 (necrosis of muscle). Character 2 = fat layer exposed; character 4 = bone involvement.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('092b6958-0903-4de8-af33-0fd639b9daa9', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 78, 'A home health patient developed rhabdomyolysis as a side effect of her statin medication (taken as prescribed). How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0cc253b-3c4c-4381-a1e1-ccddcebce371', '092b6958-0903-4de8-af33-0fd639b9daa9', 0, 'T46.6X5A, M62.82');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5833b34-f58a-43d3-9933-73f43e9c4ec6', '092b6958-0903-4de8-af33-0fd639b9daa9', 1, 'M62.82, T46.6X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8beba00f-9890-45e8-b61f-5064f3879cf9', '092b6958-0903-4de8-af33-0fd639b9daa9', 2, 'M62.82, T46.6X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5b1bf1f-f0e8-49d7-8902-44f8206b33e6', '092b6958-0903-4de8-af33-0fd639b9daa9', 3, 'M62.82');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('092b6958-0903-4de8-af33-0fd639b9daa9', 'c5833b34-f58a-43d3-9933-73f43e9c4ec6', 'M62.82, T46.6X5A Adverse effect: manifestation first (rhabdomyolysis M62.82), then the adverse effect of lipid-lowering agent (T46.6X5A).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e80a9ca6-b472-42fd-b55c-e377e6c6461c', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 79, 'A patient has a wound infection of a peripherally inserted central catheter (PICC line) site. The PICC line is still in place. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('812c7933-6875-46a3-9c8b-16f42d4d4453', 'e80a9ca6-b472-42fd-b55c-e377e6c6461c', 0, 'T80.219A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b894201-b45a-4a6c-9f2a-a89d68067ab0', 'e80a9ca6-b472-42fd-b55c-e377e6c6461c', 1, 'T80.212D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a362ae83-5d24-4bfb-97cf-f8824bad6cf3', 'e80a9ca6-b472-42fd-b55c-e377e6c6461c', 2, 'T80.219D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb291e34-f8ad-4da3-98e5-a684c5432d67', 'e80a9ca6-b472-42fd-b55c-e377e6c6461c', 3, 'T80.211A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e80a9ca6-b472-42fd-b55c-e377e6c6461c', 'a362ae83-5d24-4bfb-97cf-f8824bad6cf3', 'T80.219D Infection following infusion/transfusion/injection = T80.219D. PICC line infections fall under this category. D for ongoing treatment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 80, 'A patient is admitted to HH with a sacral wound. The documentation says “wound” without specifying pressure, surgical, or other etiology. What should the coder do?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('baa3d0dd-23d2-4818-9015-e3593df85638', '0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', 0, 'Default to pressure ulcer — sacral wounds are usually pressure ulcers');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8721295f-3f98-4bfe-b282-c066458436bd', '0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', 1, 'Code as L98.499 — non-pressure chronic ulcer, unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0cf5500d-0e3a-41dc-a101-5f204d24607a', '0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', 2, 'Query the assessing clinician for wound type/etiology');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6140b20b-4245-4954-baed-f5a3e889427b', '0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', 3, 'Code as L89.159 — pressure ulcer of sacrum, unspecified stage');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0fc98f7d-3ea5-47d9-b46d-b0b30d8e0009', '0cf5500d-0e3a-41dc-a101-5f204d24607a', 'Query the assessing clinician for wound type/etiology Never assume wound etiology. Sacral wounds may be pressure ulcers, surgical wounds, or other types — query for clarification.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a913299c-2b89-44db-98e4-848a91daa80d', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 81, 'A patient has venous insufficiency of both lower legs with ulcers. The right leg has a stasis ulcer with fat layer exposed; the left leg has a stasis ulcer limited to skin breakdown. What codes are assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d0e829f-5765-4598-b289-5cddb94cf297', 'a913299c-2b89-44db-98e4-848a91daa80d', 0, 'I87.313, L97.112, L97.121');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4266bb59-0874-491d-bf45-f92fc3e545a9', 'a913299c-2b89-44db-98e4-848a91daa80d', 1, 'I87.313, L97.112, I87.312, L97.121');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be429a44-5dff-424e-b57c-0f32af77c4cb', 'a913299c-2b89-44db-98e4-848a91daa80d', 2, 'I87.311, L97.112, I87.312, L97.121');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('448a2e7d-4cae-41b6-8dd9-fe2c598f9982', 'a913299c-2b89-44db-98e4-848a91daa80d', 3, 'I87.311, L97.112, I87.322, L97.121');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a913299c-2b89-44db-98e4-848a91daa80d', 'be429a44-5dff-424e-b57c-0f32af77c4cb', 'I87.311, L97.112, I87.312, L97.121 Each leg is coded separately. Right: I87.311 (venous insufficiency, right), L97.112 (right calf, fat layer exposed). Left: I87.312 (venous insufficiency, left), L97.121 (left calf, breakdown of skin).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('219abf6a-8e8f-4238-853f-b06de4bbe1c6', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 82, 'A patient on long-term aspirin therapy has developed gastric erosions with upper GI bleeding. The aspirin is taken as prescribed for CAD. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29613a8c-4ebd-43dc-899b-ca8b40328388', '219abf6a-8e8f-4238-853f-b06de4bbe1c6', 0, 'K25.4, T39.015A, I25.10, Z79.82');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d51c245-6e78-477f-b884-7933a79e5bdc', '219abf6a-8e8f-4238-853f-b06de4bbe1c6', 1, 'K25.0, T39.015A, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8aac1f6-8847-457f-9250-86c477a35b0c', '219abf6a-8e8f-4238-853f-b06de4bbe1c6', 2, 'K25.4, T39.015D, I25.10, Z79.82');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('035dd5a4-f0c2-4c53-a69b-16cce9441334', '219abf6a-8e8f-4238-853f-b06de4bbe1c6', 3, 'T39.015A, K25.4, I25.10, Z79.82');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('219abf6a-8e8f-4238-853f-b06de4bbe1c6', '29613a8c-4ebd-43dc-899b-ca8b40328388', 'K25.4, T39.015A, I25.10, Z79.82 Adverse effect: gastric ulcer with hemorrhage (K25.4) first, then aspirin adverse effect (T39.015A), underlying condition (CAD I25.10), and Z79.82 (long-term aspirin).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df80efd8-a062-4708-9b98-bd2593a6bcf9', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 83, 'A patient is on home oxygen for chronic respiratory failure due to COPD. She is also on long-term systemic steroids. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eda1fcc0-9442-4a6d-a8f4-0705e5f87e50', 'df80efd8-a062-4708-9b98-bd2593a6bcf9', 0, 'J44.1, J96.10, Z99.81, Z79.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('362946d5-f18e-4b41-b1c3-4a58b1563f95', 'df80efd8-a062-4708-9b98-bd2593a6bcf9', 1, 'J96.10, J44.9, Z99.81, Z79.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcdbbef8-7c37-417e-8276-4ad202d0b708', 'df80efd8-a062-4708-9b98-bd2593a6bcf9', 2, 'J44.9, J96.11, Z99.81, Z79.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2200a88c-34e1-4b6e-ad75-23acea6b11f6', 'df80efd8-a062-4708-9b98-bd2593a6bcf9', 3, 'J96.10, J44.1, Z99.81, Z79.52');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('df80efd8-a062-4708-9b98-bd2593a6bcf9', '362946d5-f18e-4b41-b1c3-4a58b1563f95', 'J96.10, J44.9, Z99.81, Z79.52 Chronic respiratory failure (J96.10) sequenced first when it is the reason for HH services. COPD (J44.9) is the underlying cause. Z99.81 = oxygen dependence. Z79.52 = long-term systemic steroids.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9809021c-5493-4b81-8dbc-1d70209d9073', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 84, 'A patient had a right carotid endarterectomy 10 days ago. She is admitted to HH for SN assessment and wound care of the neck incision. She has carotid artery stenosis and hypertension. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7442b8e1-398f-4243-9ffe-a4b24719480e', '9809021c-5493-4b81-8dbc-1d70209d9073', 0, 'I65.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4a8d75d-b9ea-45ef-95ec-248f45a69ec2', '9809021c-5493-4b81-8dbc-1d70209d9073', 1, 'Z48.812');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c99b5107-5463-477a-9594-3ff6936ddfd8', '9809021c-5493-4b81-8dbc-1d70209d9073', 2, 'Z48.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb775750-94f4-4995-be24-2bc2e118bcaf', '9809021c-5493-4b81-8dbc-1d70209d9073', 3, 'I65.21, Z48.812');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9809021c-5493-4b81-8dbc-1d70209d9073', 'c99b5107-5463-477a-9594-3ff6936ddfd8', 'Z48.89 Aftercare following vascular surgery = Z48.89 (other specified surgical aftercare). The carotid stenosis (I65.21) is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33585892-4b7e-439e-8d4c-8d7a7f32320f', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 85, 'A patient has a documented “diabetic Charcot foot” (neuropathic arthropathy) of the right ankle. She has type 2 DM. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a9a69cc-1f09-469a-acc9-c726b924e611', '33585892-4b7e-439e-8d4c-8d7a7f32320f', 0, 'E11.610, M14.671');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28071632-b373-408e-bd23-4826452d4f9a', '33585892-4b7e-439e-8d4c-8d7a7f32320f', 1, 'E11.610');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79671cf5-89df-4587-9be2-984f7a611f67', '33585892-4b7e-439e-8d4c-8d7a7f32320f', 2, 'M14.671, E11.610');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4e21356-cd33-43cd-8780-7e7553c67485', '33585892-4b7e-439e-8d4c-8d7a7f32320f', 3, 'E11.618, M14.671');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('33585892-4b7e-439e-8d4c-8d7a7f32320f', '28071632-b373-408e-bd23-4826452d4f9a', 'E11.610 Type 2 DM with diabetic neuropathic arthropathy = E11.610. The combination code includes the Charcot joint.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7755e6da-23a4-4bc4-b3be-7d4b783bc772', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 86, 'A patient is admitted to HH for SN teaching on a new insulin pump for type 1 diabetes. She also has diabetic retinopathy and CKD stage 3a. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecb5d976-556a-4c24-8941-3cf0cfd695d1', '7755e6da-23a4-4bc4-b3be-7d4b783bc772', 0, 'E10.9, Z96.41, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d51dc05-91b5-4075-9d54-1bfbf90b065f', '7755e6da-23a4-4bc4-b3be-7d4b783bc772', 1, 'E10.319, E10.22, N18.31, Z96.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2a5788f-fe7e-4a92-9c44-0186d50d533d', '7755e6da-23a4-4bc4-b3be-7d4b783bc772', 2, 'E10.319, N18.31, Z96.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8c54d31-9d03-4f26-98fd-4d26d18efcca', '7755e6da-23a4-4bc4-b3be-7d4b783bc772', 3, 'E10.9, Z46.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7755e6da-23a4-4bc4-b3be-7d4b783bc772', '1d51dc05-91b5-4075-9d54-1bfbf90b065f', 'Type 1 DM with unspecified diabetic retinopathy = E10.319. DM with diabetic CKD = E10.22, plus N18.31 for the documented stage 3a (N18.3 alone is a non-billable parent requiring the a/b specification). Z96.41 = insulin pump. No Z79.4 for type 1, since insulin use is intrinsic to type 1 diabetes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a50292c3-d503-4e77-8782-dfa0d52b7541', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 87, 'A home health patient has a wound culture showing Pseudomonas aeruginosa in a chronic leg ulcer. How is the organism coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfc8f397-7e3b-43e6-8a67-cc2fc61cb503', 'a50292c3-d503-4e77-8782-dfa0d52b7541', 0, 'B96.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a1c14d7-5ecb-45c3-9b76-7d1d03feda52', 'a50292c3-d503-4e77-8782-dfa0d52b7541', 1, 'A49.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2f3553f-3080-4654-85e3-3d0dd6d272c4', 'a50292c3-d503-4e77-8782-dfa0d52b7541', 2, 'B95.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a4b01f2-79db-431b-bdf8-5c0cc7b1c338', 'a50292c3-d503-4e77-8782-dfa0d52b7541', 3, 'B96.5 is added as a secondary code to the wound code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a50292c3-d503-4e77-8782-dfa0d52b7541', '6a4b01f2-79db-431b-bdf8-5c0cc7b1c338', 'B96.5 is added as a secondary code to the wound code Pseudomonas = B96.5. It is always an additional code — never primary — added after the infection/wound code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9574a44-5359-43aa-b442-83cb39595489', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 88, 'A patient is admitted for HH wound care of a third-degree burn of the right lower leg from a campfire, now 3 weeks old and receiving skin graft care. What 7th character applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a78ded0b-f200-41d8-8deb-9156fc306dcb', 'b9574a44-5359-43aa-b442-83cb39595489', 0, 'A — still in active treatment phase (skin graft care is active treatment)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('022305bf-2dd1-432f-8781-b5af0941c639', 'b9574a44-5359-43aa-b442-83cb39595489', 1, 'D — subsequent encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('883e4eb3-b6fa-44da-88b3-38e36625092a', 'b9574a44-5359-43aa-b442-83cb39595489', 2, 'S — sequela');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fe0b548-604a-4821-9d0f-c5fbaa9449d3', 'b9574a44-5359-43aa-b442-83cb39595489', 3, 'G — delayed healing');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9574a44-5359-43aa-b442-83cb39595489', 'a78ded0b-f200-41d8-8deb-9156fc306dcb', 'A — still in active treatment phase Skin graft care is considered active treatment of the burn. 7th character A is appropriate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bea3c591-f845-4b63-965c-96f2cd259c00', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 89, 'A patient has a documented venous leg ulcer that has healed during the home health episode. At recertification, the ulcer is completely epithelialized. How is the healed ulcer coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e0842d9-9761-436e-b910-2d685bc1b8a3', 'bea3c591-f845-4b63-965c-96f2cd259c00', 0, 'Continue coding the venous ulcer — code through the episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c402fccb-8d52-4026-be47-aa917bf7467f', 'bea3c591-f845-4b63-965c-96f2cd259c00', 1, 'The venous ulcer code is discontinued; code the underlying venous insufficiency (I87.2) only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56437244-475b-4517-b9f8-20100723d3a7', 'bea3c591-f845-4b63-965c-96f2cd259c00', 2, 'Z87.39 — personal history of venous ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd73bed8-28dd-4c6f-81f7-c4a82be578cc', 'bea3c591-f845-4b63-965c-96f2cd259c00', 3, 'L97.919 — unspecified');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bea3c591-f845-4b63-965c-96f2cd259c00', 'c402fccb-8d52-4026-be47-aa917bf7467f', 'When a venous ulcer fully heals, the ulcer code is discontinued. The underlying venous insufficiency (I87.2) continues to be coded if still present.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('551cfbcd-2c31-44a8-b036-3ec544b51ee0', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 90, 'A patient has both a sacral pressure ulcer (Stage 3) and a coccygeal pressure ulcer (Stage 2). The sacrum and coccyx — are these considered the same site for coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9421b29d-a5d4-4428-9715-50716b73964f', '551cfbcd-2c31-44a8-b036-3ec544b51ee0', 0, 'Yes — both are coded under the sacrum site codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb2ed473-bdbd-424c-b30a-30d9af05068b', '551cfbcd-2c31-44a8-b036-3ec544b51ee0', 1, 'No — sacrum (L89.15-) and contiguous site of back/buttock/hip (L89.4-) are separate sites');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ecfd4e4-d168-4e43-b5f4-cdd29b54a046', '551cfbcd-2c31-44a8-b036-3ec544b51ee0', 2, 'No — coccyx has its own separate L89 code series');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39183f78-aa00-423b-9f12-076a3f51bbce', '551cfbcd-2c31-44a8-b036-3ec544b51ee0', 3, 'Yes — combine them into one code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('551cfbcd-2c31-44a8-b036-3ec544b51ee0', 'cb2ed473-bdbd-424c-b30a-30d9af05068b', 'The sacrum and coccyx are not the same site and are not coded together, but the coccyx does not have its own dedicated L89 code series — no coccyx-specific pressure ulcer code exists anywhere in ICD-10-CM. Sacral pressure ulcers use the dedicated L89.15x family (L89.153 for stage 3 here), while a coccygeal pressure ulcer is classified under L89.4x (pressure ulcer of contiguous site of back, buttock, and hip — the code used for adjacent/border sites without their own dedicated family), so L89.42 (stage 2) applies to the coccyx finding. They remain two separate codes for two separate documented sites.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e0aa770-c302-4d5a-baab-23f1331bb809', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 91, 'A patient has a right leg wound with a wound VAC. The wound culture grows MRSA. She is also a known MRSA carrier (nasal colonization). What MRSA codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60f32eca-deb1-445f-9707-52b80b9b3a7a', '1e0aa770-c302-4d5a-baab-23f1331bb809', 0, 'B95.62 for the wound, Z22.322 for the carrier status — both coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86fee015-b2df-46c9-bfd3-2c47535e8223', '1e0aa770-c302-4d5a-baab-23f1331bb809', 1, 'B95.62 only — carrier status is not coded when active infection exists');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e394990-d248-4f54-8ed7-6ce1af706022', '1e0aa770-c302-4d5a-baab-23f1331bb809', 2, 'Z22.322 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a6dd9f2-694c-46f7-979f-60e2cff11b90', '1e0aa770-c302-4d5a-baab-23f1331bb809', 3, 'A49.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1e0aa770-c302-4d5a-baab-23f1331bb809', '60f32eca-deb1-445f-9707-52b80b9b3a7a', 'B95.62 for the wound, Z22.322 for the carrier status — both coded When a patient has both an active MRSA wound infection and documented MRSA colonization, both B95.62 (organism) and Z22.322 (carrier) are coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('777d3f55-5ca7-46bb-9ccc-0ad832a91369', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 92, 'A patient has a non-healing surgical wound of the left breast following lumpectomy 4 weeks ago. She has active breast cancer, left breast. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66bdbf8d-2416-4cab-8605-78136b7d2e01', '777d3f55-5ca7-46bb-9ccc-0ad832a91369', 0, 'C50.912');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('993d2b4b-3527-43b0-9349-11e8b3aa20fe', '777d3f55-5ca7-46bb-9ccc-0ad832a91369', 1, 'T81.31XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0247e9d-31a0-4bc2-8759-c9434090a4c2', '777d3f55-5ca7-46bb-9ccc-0ad832a91369', 2, 'T81.31XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ad3e8f3-6f80-4cd2-9f9b-c45c3703d54d', '777d3f55-5ca7-46bb-9ccc-0ad832a91369', 3, 'Z48.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('777d3f55-5ca7-46bb-9ccc-0ad832a91369', 'e0247e9d-31a0-4bc2-8759-c9434090a4c2', 'T81.31XD Non-healing (dehisced) surgical wound is M1021 (T81.31XD). Active breast cancer (C50.912) is secondary — the wound care is the reason for HH services.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b7bb830-7085-4372-b785-9bd38dc2d6a2', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 93, 'A patient is receiving HH for management of a complex wound: a right heel pressure ulcer (Stage 4) that is also infected with MSSA, and she has type 2 DM on insulin with diabetic PVD. What is the complete coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ccd44832-9dcd-460d-a1fa-146b093e36a5', '1b7bb830-7085-4372-b785-9bd38dc2d6a2', 0, 'L89.614, L03.115, B95.61, E11.51, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86379543-cef6-4a10-a7a4-e014e282dae8', '1b7bb830-7085-4372-b785-9bd38dc2d6a2', 1, 'L89.614, E11.51, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5d9e428-cb0b-4e2a-afc2-f4da0213bd7e', '1b7bb830-7085-4372-b785-9bd38dc2d6a2', 2, 'E11.51, L89.614, B95.61, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a964a43-fd45-4459-8ddf-1edd3288896c', '1b7bb830-7085-4372-b785-9bd38dc2d6a2', 3, 'L89.614, E11.621, L08.9, B95.61, E11.51, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b7bb830-7085-4372-b785-9bd38dc2d6a2', 'ccd44832-9dcd-460d-a1fa-146b093e36a5', 'L89.614, L03.115, B95.61, E11.51, Z79.4 Stage 4 PU right heel = L89.614. Infected wound = cellulitis L03.115, MSSA B95.61. DM with PVD = E11.51. Z79.4 for insulin in type 2 DM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a9e07f9-d985-4748-b8fb-c683961a9f4e', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 94, 'For OASIS, can a pressure ulcer that has been surgically debrided (sharp debridement only, no flap/graft) continue to be staged as a pressure ulcer?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0bfab276-9bbe-4520-99f9-585442503873', '8a9e07f9-d985-4748-b8fb-c683961a9f4e', 0, 'No — any surgical intervention converts it to a surgical wound');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6e614cc-5921-4f75-acca-2958d5031b45', '8a9e07f9-d985-4748-b8fb-c683961a9f4e', 1, 'Yes — sharp/surgical debridement alone does not change the classification; it remains a pressure ulcer at its previous stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d26d8dd-0ed4-4837-ae7a-ef0bdbab6959', '8a9e07f9-d985-4748-b8fb-c683961a9f4e', 2, 'Only if the debridement was performed at bedside');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3ab99e0-c67b-4029-9cee-aceb9d315e91', '8a9e07f9-d985-4748-b8fb-c683961a9f4e', 3, 'Only if the wound is still open');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a9e07f9-d985-4748-b8fb-c683961a9f4e', 'e6e614cc-5921-4f75-acca-2958d5031b45', 'Yes Sharp/surgical debridement alone does not change a pressure ulcer’s classification. It remains a pressure ulcer at its previous stage. Only flap/graft repair reclassifies it.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6cd3aea-3787-47b3-a401-7380fcc2f0d6', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 95, 'A patient is admitted to HH for wound care. She has: a healing mastectomy incision (2 weeks old), a midline abdominal incision from an exploratory laparotomy (3 weeks old, healing), and a fully healed laparoscopic port site (from the same surgery, epithelialized). For OASIS M1340, how many surgical wounds?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f2c14a7-1a6f-4104-80c6-75e7f83f2bf7', 'b6cd3aea-3787-47b3-a401-7380fcc2f0d6', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d0db098-b329-41ce-b4b3-9f7fed11adc8', 'b6cd3aea-3787-47b3-a401-7380fcc2f0d6', 1, '2 — the epithelialized lap port site does not count');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f31b9a6d-8662-4314-9420-a93c3f07f96f', 'b6cd3aea-3787-47b3-a401-7380fcc2f0d6', 2, '1 — only the most recent counts');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29df8a32-3896-4ead-8dd3-4d5d3217fd8e', 'b6cd3aea-3787-47b3-a401-7380fcc2f0d6', 3, '0 — all are post-surgical and not counted');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b6cd3aea-3787-47b3-a401-7380fcc2f0d6', '4d0db098-b329-41ce-b4b3-9f7fed11adc8', '2 The mastectomy incision and the abdominal incision (both not yet fully epithelialized) count. The epithelialized lap port site does not count.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 96, 'A patient has documented “skin tears, bilateral forearms, multiple.” She is elderly with fragile skin. What ICD-10-CM codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc294d75-f784-4535-bf2a-feb6a26db0ab', '6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', 0, 'S51.812D, S51.822D (bilateral)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('077eddae-7ab9-4e8a-83c7-72e1c4a42986', '6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', 1, 'L76.01, L76.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ac06e01-2e28-4023-b1e8-24a750aca23d', '6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', 2, 'S51.812D, S51.822D, W19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c708951-c8ee-4b37-adf8-3c456114e4bd', '6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', 3, 'L98.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6c58c6fc-67ff-44f7-b7e3-00bf57ec13d3', 'dc294d75-f784-4535-bf2a-feb6a26db0ab', 'S51.812D, S51.822D Skin tears from trauma = open wound codes. Right forearm S51.812D, left forearm S51.822D. 7th character D for ongoing wound care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 97, 'A patient is on long-term opioid therapy for chronic pain. She has developed opioid-induced constipation. The opioids are taken as prescribed. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb14b2f9-e6af-4357-bf80-8c72b0e14059', 'a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', 0, 'K59.03 — drug-induced constipation specific code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cc825f8-ddf3-43f2-a2fa-8f044e0ab40f', 'a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', 1, 'K59.00, T40.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1eedcd5-f588-4acc-b2cf-7f813c806ac6', 'a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', 2, 'K59.03, T40.605A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('773bc10b-d883-497d-a59f-47c0767025df', 'a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', 3, 'K59.03, T40.2X5D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a8d6ecd8-0049-45f2-a8c8-90bb71101bb9', 'f1eedcd5-f588-4acc-b2cf-7f813c806ac6', 'K59.03, T40.605A Opioid-induced constipation has a specific code K59.03. Adverse effect of unspecified narcotics = T40.605A (5 = adverse effect).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e75e6290-9909-48d9-bf24-5f6cd39b5363', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 98, 'A home health patient has a wound with negative pressure wound therapy (wound VAC). The VAC dressing is changed every 3 days. For OASIS, the wound underneath the VAC — should it be assessed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('676a766d-94c3-4244-83b1-7d881286389f', 'e75e6290-9909-48d9-bf24-5f6cd39b5363', 0, 'No — wounds under VAC devices are not assessed for OASIS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b14b9701-d023-4b2f-b573-61f8a76fdc13', 'e75e6290-9909-48d9-bf24-5f6cd39b5363', 1, 'Yes — the wound should be assessed when the VAC is changed and findings documented per OASIS wound items');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78d44cef-1cbd-4694-8227-fa6c50e4dc0d', 'e75e6290-9909-48d9-bf24-5f6cd39b5363', 2, 'Only at SOC and DC');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a6f00849-a11f-4ea5-8688-fe3ef89f6afa', 'e75e6290-9909-48d9-bf24-5f6cd39b5363', 3, 'Only if the wound is infected');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e75e6290-9909-48d9-bf24-5f6cd39b5363', 'b14b9701-d023-4b2f-b573-61f8a76fdc13', 'Yes Wounds under VAC devices should be assessed when the VAC dressing is changed. OASIS wound items should reflect the wound’s current status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e65b531-4434-4b5a-8801-3ce9925156af', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 99, 'A patient has a sacral pressure ulcer Stage 2 that progresses to Stage 3 during the HH episode. For OASIS, how is this change handled?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c7c9bb1-5405-4b52-89d6-46dda2d6737c', '6e65b531-4434-4b5a-8801-3ce9925156af', 0, 'Continue reporting Stage 2 — never change staging upward');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2445c073-9880-4177-9a90-63180f49e75b', '6e65b531-4434-4b5a-8801-3ce9925156af', 1, 'Update to Stage 3 — staging reflects the current status and may be updated to a higher stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebc8a153-ed5b-470d-9151-fd6e57202d70', '6e65b531-4434-4b5a-8801-3ce9925156af', 2, 'Report as unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11eebc0d-760e-4b4d-aad5-c433b20b52d2', '6e65b531-4434-4b5a-8801-3ce9925156af', 3, 'Report as Stage 2 with a note about progression');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6e65b531-4434-4b5a-8801-3ce9925156af', '2445c073-9880-4177-9a90-63180f49e75b', 'Update to Stage 3 Pressure ulcer staging may be updated to a higher stage (worsening). Reverse-staging (lowering the stage) is never done, but increasing the stage is appropriate when deterioration occurs.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('374837f5-be41-4796-b132-a5ea0b5804d6', '47ba1203-2e9c-47ed-8469-4bd9888fdaa2', 100, 'A patient has chronic bilateral venous stasis ulcers of the lower legs. She also has a deep tissue pressure injury of the left ischial tuberosity. For OASIS M1311 and M1330, how are these wounds classified?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b7d7d8c-9856-4924-bfe7-5db0a73541f3', '374837f5-be41-4796-b132-a5ea0b5804d6', 0, 'All are counted under M1311 (pressure ulcers)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a91236d-d56d-499f-8c66-54a1125c72fb', '374837f5-be41-4796-b132-a5ea0b5804d6', 1, 'All are counted under M1330 (stasis ulcers)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53a14b19-5371-4c89-9160-7fd139c2256e', '374837f5-be41-4796-b132-a5ea0b5804d6', 2, 'The stasis ulcers are counted under M1330; the DTPI is counted under M1311 (pressure ulcers)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ccaf574e-5c7f-4f78-bba7-ed787fcc1969', '374837f5-be41-4796-b132-a5ea0b5804d6', 3, 'The stasis ulcers are under M1330; the DTPI is not counted in either');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('374837f5-be41-4796-b132-a5ea0b5804d6', '53a14b19-5371-4c89-9160-7fd139c2256e', 'Stasis ulcers are counted under M1330 (stasis ulcer). DTPI is counted under M1311 (pressure ulcer items) — DTPI has its own category within the pressure ulcer staging system.');

-- ---------- Paper 5: BCHH-C Practice Paper 5 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('ad0702c1-5849-4c4e-8ad0-6719f57106b3', 'bchhc-practice-5', 'BCHH-C Practice Paper 5', 'bchhc', ARRAY['Neoplasms', 'Infections\Sepsis', 'Musculoskeletal', 'Neurological', 'OB\Perinatal', 'Mental Health']::TEXT[], 100, 'standard', true, 5);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 1, 'A patient is admitted to home health for management of anemia due to chemotherapy for active colon cancer. She is currently receiving chemo. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ee2aade-b504-4aa6-ae4e-a4bbf45a1e98', 'b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 0, 'D64.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf267485-7cbc-48cf-b923-9a00c3c3f877', 'b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 1, 'C18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd6557c4-ab73-421a-9346-81dbd5abcc58', 'b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 2, 'Z51.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb6c46c1-58b4-44c8-98db-5aa8410f1f51', 'b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 3, 'C18.9, D64.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b8edda9d-39ad-424f-b07a-fca67fdfa0d0', 'bf267485-7cbc-48cf-b923-9a00c3c3f877', 'C18.9 The active cancer (C18.9) is M1021 — it is the underlying reason for the anemia and the chemotherapy. D64.81 (anemia due to antineoplastic chemotherapy) is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9398689d-857c-4832-9312-115b5f001a7e', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 2, 'A patient had lung cancer that was completely resected 3 months ago. She is not receiving any further treatment. She is admitted for PT for general deconditioning. How is the lung cancer coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da6e1097-b27e-4d45-937b-19856bb948e6', '9398689d-857c-4832-9312-115b5f001a7e', 0, 'C34.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f79b2f0-25f8-478b-a62f-8eca2b47528c', '9398689d-857c-4832-9312-115b5f001a7e', 1, 'Z85.118');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01cc0fe8-3ed4-4245-9c46-957c90a23ba2', '9398689d-857c-4832-9312-115b5f001a7e', 2, 'C34.90 in remission');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b00175f-c500-48e5-8ab4-a353eb536b5b', '9398689d-857c-4832-9312-115b5f001a7e', 3, 'Z85.118, Z87.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9398689d-857c-4832-9312-115b5f001a7e', '0f79b2f0-25f8-478b-a62f-8eca2b47528c', 'Z85.118 Completely resected lung cancer with no further treatment = personal history Z85.118. Active cancer codes are no longer used.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87b91e65-4b31-4f55-acb7-bafe31cb0602', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 3, 'A patient has metastatic breast cancer — the primary site is the left breast, with metastasis to bone. She is admitted for pain management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c856791d-ca9e-488d-8b03-d054ab888a5f', '87b91e65-4b31-4f55-acb7-bafe31cb0602', 0, 'C50.912, C79.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4182ec73-d76c-40a9-a53e-01870d515c4a', '87b91e65-4b31-4f55-acb7-bafe31cb0602', 1, 'C79.51, C50.912');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d173b13-480d-417c-91ff-ba4c88ce4244', '87b91e65-4b31-4f55-acb7-bafe31cb0602', 2, 'C50.912, C79.51, G89.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3856abb6-bf31-4dff-966d-161f84219b68', '87b91e65-4b31-4f55-acb7-bafe31cb0602', 3, 'C79.51, C50.912, G89.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('87b91e65-4b31-4f55-acb7-bafe31cb0602', 'c856791d-ca9e-488d-8b03-d054ab888a5f', 'C50.912, C79.51 Active primary breast cancer is coded first (C50.912), then the secondary/metastatic site (C79.51, bone). G89.3 may be added if pain management is a focus but is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18a12183-99e1-4962-8059-4a2201cacbdb', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 4, 'A patient has metastatic cancer with unknown primary site. Metastasis is documented in the liver and lung. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdd96f5b-ecd9-4ca1-97c6-359754606057', '18a12183-99e1-4962-8059-4a2201cacbdb', 0, 'C80.1, C78.7, C78.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03efb85a-da40-49ad-a24d-780cde411340', '18a12183-99e1-4962-8059-4a2201cacbdb', 1, 'C78.7, C78.00, C80.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5a1f54c-f4a7-4c6a-b2be-46a1f2f3fa20', '18a12183-99e1-4962-8059-4a2201cacbdb', 2, 'C78.7, C78.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4aa94c01-f398-426a-8199-52f5125da0d9', '18a12183-99e1-4962-8059-4a2201cacbdb', 3, 'C80.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('18a12183-99e1-4962-8059-4a2201cacbdb', 'bdd96f5b-ecd9-4ca1-97c6-359754606057', 'C80.1, C78.7, C78.00 Unknown primary = C80.1. Metastatic sites are coded as secondary neoplasms: liver C78.7, lung C78.00.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 5, 'A patient had prostate cancer treated with radiation 2 years ago. He now has radiation cystitis. The cancer is in remission. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77f18dd4-8e14-489d-a005-93d1e5df5859', '48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', 0, 'N30.40, Z85.46');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05027c21-6a7e-4f74-92eb-ee5cdba60b9e', '48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', 1, 'C61, N30.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6eaa0f8e-780d-470b-8757-cae8faed0ae9', '48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', 2, 'N30.40, C61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c239438-83a3-49b9-9e14-a324eb624657', '48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', 3, 'Z85.46, N30.40');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('48b0d69e-a7c6-4dc8-ac9a-c9927bbbebb7', '77f18dd4-8e14-489d-a005-93d1e5df5859', 'N30.40, Z85.46 Radiation cystitis = N30.40 (the current condition being treated). Cancer in remission = Z85.46 (history of prostate cancer).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('857df37a-a68b-4012-86ca-d1a9dcfb752d', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 6, 'A patient with active multiple myeloma is admitted to HH for SN management of pathological fracture of the right humerus. The fracture occurred spontaneously. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b13e196-e43c-4ea3-832a-cacbf2742382', '857df37a-a68b-4012-86ca-d1a9dcfb752d', 0, 'C90.00, M84.421A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d81b6f3-2a51-467b-ac82-39b76bfb7a61', '857df37a-a68b-4012-86ca-d1a9dcfb752d', 1, 'M84.421A, C90.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4862f31c-34bf-49e7-a9f5-6a37228b23ea', '857df37a-a68b-4012-86ca-d1a9dcfb752d', 2, 'C90.00, S42.201A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c67c589-55ea-4bd7-b7eb-2ca5e9a32d35', '857df37a-a68b-4012-86ca-d1a9dcfb752d', 3, 'C90.00, M84.421D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('857df37a-a68b-4012-86ca-d1a9dcfb752d', '5c67c589-55ea-4bd7-b7eb-2ca5e9a32d35', 'C90.00, M84.421D Active multiple myeloma = C90.00 (code first). Pathological fracture = M84.421D (7th character D for ongoing care in HH, not active fracture treatment).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 7, 'When a patient has both an active neoplasm and a personal history of a different neoplasm, how should they be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8587d99d-574d-49cd-b065-96469d661ec1', '2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 0, 'Code only the active neoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6bb8487-d282-4deb-92c0-fb8c39cb1a46', '2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 1, 'Code the active neoplasm with the current cancer code and the previous cancer with a Z85 history code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b480570f-b7c8-4178-95dd-7bf4a93342ac', '2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 2, 'Code both with active cancer codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b205fed-df3c-41ed-a800-28787cc60dad', '2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 3, 'Query the physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2dbb5eb4-c867-4ee0-8a1e-401b2ca217c3', 'e6bb8487-d282-4deb-92c0-fb8c39cb1a46', 'Active neoplasm uses a C-code; previously treated cancer that no longer exists uses Z85 history code. Both are reported.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1a0b13ab-9c4f-46de-85e4-040a3a4410e7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 8, 'A patient has a benign neoplasm of the right kidney. It is being monitored but not treated. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('336a77ac-9ec9-47fd-9858-fc36582177e6', '1a0b13ab-9c4f-46de-85e4-040a3a4410e7', 0, 'D30.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d5483f5-a83f-4541-a2b0-c0d4bbda7536', '1a0b13ab-9c4f-46de-85e4-040a3a4410e7', 1, 'C64.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('739b4328-d115-40e6-bb83-67ebda68ff41', '1a0b13ab-9c4f-46de-85e4-040a3a4410e7', 2, 'D09.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb6c7fbc-31f4-4967-804b-5848d72e2ccc', '1a0b13ab-9c4f-46de-85e4-040a3a4410e7', 3, 'Z85.528');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1a0b13ab-9c4f-46de-85e4-040a3a4410e7', '336a77ac-9ec9-47fd-9858-fc36582177e6', 'D30.01 Benign neoplasm of right kidney = D30.01. C64.1 would be malignant. D09 is carcinoma in situ.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2e6b025-ed63-447a-96af-a34f481af1cc', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 9, 'A patient is admitted to HH for SN and PT after hospitalization for sepsis due to E. coli UTI. The sepsis resolved before discharge. The UTI is still being treated with oral antibiotics. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50a7effd-b474-472f-b071-d814196bd788', 'a2e6b025-ed63-447a-96af-a34f481af1cc', 0, 'A41.51, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae33266b-8c0a-4107-a8e7-794369ba9895', 'a2e6b025-ed63-447a-96af-a34f481af1cc', 1, 'N39.0, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d10d5998-390a-4c75-97b4-c05827825f73', 'a2e6b025-ed63-447a-96af-a34f481af1cc', 2, 'R65.20, A41.51, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('123b4134-f586-434c-b325-00adb316277d', 'a2e6b025-ed63-447a-96af-a34f481af1cc', 3, 'A41.51, N39.0, B96.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2e6b025-ed63-447a-96af-a34f481af1cc', 'ae33266b-8c0a-4107-a8e7-794369ba9895', 'N39.0, B96.20 Sepsis that resolved before HH admission is NOT coded. Only the active UTI (N39.0) with organism (B96.20, E. coli) is coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('71ce66db-db47-45fa-9463-84d8b3237a15', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 10, 'A patient was hospitalized for MRSA sepsis with septic shock. The sepsis and shock resolved. She is admitted to HH for deconditioning and continued wound care of a left heel ulcer (the source of the sepsis). What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34f3a262-e7bc-48a4-bff5-b6a811841cc4', '71ce66db-db47-45fa-9463-84d8b3237a15', 0, 'A41.02, R65.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09df2b42-8618-472d-ad13-0e6df5626d9f', '71ce66db-db47-45fa-9463-84d8b3237a15', 1, 'L97.422');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab5c8e70-fd89-442d-a81b-fbd9df7ad803', '71ce66db-db47-45fa-9463-84d8b3237a15', 2, 'A41.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8bb09f0-11ce-4f43-8aa6-d104c7ba0c87', '71ce66db-db47-45fa-9463-84d8b3237a15', 3, 'Z87.39');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('71ce66db-db47-45fa-9463-84d8b3237a15', '09df2b42-8618-472d-ad13-0e6df5626d9f', 'L97.422 Resolved sepsis is not coded in HH. The active condition requiring skilled care is the heel ulcer (L97.422). MRSA history may be added if relevant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('86cd8871-4f46-4a3b-a446-7110dba37eaa', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 11, 'A patient is admitted to HH for IV antibiotics via PICC line for osteomyelitis. She develops Clostridioides difficile colitis during the HH episode. How is the C. diff coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30edc16e-2789-482a-a58b-3b2b7af638f4', '86cd8871-4f46-4a3b-a446-7110dba37eaa', 0, 'A04.72');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c772bebc-ca41-4462-bda5-687e2a7b8b03', '86cd8871-4f46-4a3b-a446-7110dba37eaa', 1, 'A04.71');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c41c14f9-872d-43c9-9e48-b7ceb7f65329', '86cd8871-4f46-4a3b-a446-7110dba37eaa', 2, 'A04.72, K52.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6b57ce9-fa5c-4752-ae37-878831e752cf', '86cd8871-4f46-4a3b-a446-7110dba37eaa', 3, 'A04.71, A04.72');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('86cd8871-4f46-4a3b-a446-7110dba37eaa', '30edc16e-2789-482a-a58b-3b2b7af638f4', 'A04.72 Recurrent C. difficile infection = A04.72. A04.71 is for initial episode. The C. diff is a new finding during the HH episode and should be coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0a0b427c-3674-43b3-a0cb-f42c80c386ff', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 12, 'A patient has a current UTI due to Klebsiella. She also has a long-term indwelling Foley catheter. The physician documents the UTI is catheter-associated. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9eaa3c9a-0780-4ea9-a286-b0d7c3ebe247', '0a0b427c-3674-43b3-a0cb-f42c80c386ff', 0, 'N39.0, B96.1, T83.511D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fdd3eb19-1a67-4e09-a105-ddcf3640a2d4', '0a0b427c-3674-43b3-a0cb-f42c80c386ff', 1, 'T83.511D, N39.0, B96.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf443355-00c3-4199-8d22-dc81177adc51', '0a0b427c-3674-43b3-a0cb-f42c80c386ff', 2, 'T83.511A, N39.0, B96.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8ff32480-159f-4840-aa48-990f0a83ad80', '0a0b427c-3674-43b3-a0cb-f42c80c386ff', 3, 'N39.0, T83.511D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0a0b427c-3674-43b3-a0cb-f42c80c386ff', '9eaa3c9a-0780-4ea9-a286-b0d7c3ebe247', 'N39.0, B96.1, T83.511D UTI = N39.0. Klebsiella = B96.1. Catheter-associated UTI uses T83.511D (infectious complication of indwelling catheter, subsequent encounter for ongoing care).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('69628a11-4001-490b-a366-bb6b258fca71', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 13, 'A patient has HIV disease with Pneumocystis pneumonia. She is admitted to HH for continued antibiotics and respiratory care. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('669187c7-0d79-46a8-91c7-b53399655e77', '69628a11-4001-490b-a366-bb6b258fca71', 0, 'B20, B59');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f3dfd9d0-8e39-41e1-9809-5ba580a87557', '69628a11-4001-490b-a366-bb6b258fca71', 1, 'B59, B20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27b9faec-4795-4b78-b2a4-fc03d6689f86', '69628a11-4001-490b-a366-bb6b258fca71', 2, 'Z21, B59');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a83d978-262b-4511-8ebe-dafc21af6413', '69628a11-4001-490b-a366-bb6b258fca71', 3, 'B20, J18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('69628a11-4001-490b-a366-bb6b258fca71', '669187c7-0d79-46a8-91c7-b53399655e77', 'B20, B59 HIV disease = B20 (coded first whenever any HIV-related condition is present). Pneumocystis pneumonia = B59.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eee958fc-bab2-44e5-9bd0-325f772c2812', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 14, 'A patient has a documented “history of tuberculosis.” She completed treatment 2 years ago and has no active disease. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32942406-968d-4094-9b78-12914a585d61', 'eee958fc-bab2-44e5-9bd0-325f772c2812', 0, 'A15.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('582696b9-fcdf-42ab-8839-48172ba8a1db', 'eee958fc-bab2-44e5-9bd0-325f772c2812', 1, 'Z86.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ca00f63-ab2c-40fb-9a5d-a31b99730f54', 'eee958fc-bab2-44e5-9bd0-325f772c2812', 2, 'Z87.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f33ee68-1c98-484c-a38b-6f8b59bf87e9', 'eee958fc-bab2-44e5-9bd0-325f772c2812', 3, 'R76.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eee958fc-bab2-44e5-9bd0-325f772c2812', '582696b9-fcdf-42ab-8839-48172ba8a1db', 'Z86.11 Personal history of tuberculosis (no active disease) = Z86.11.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 15, 'A patient is admitted for SN management of a new diagnosis of hepatitis B, acute, with delta agent co-infection. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a95cf26f-6c4a-4711-83bb-d67de029f718', '5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 0, 'B16.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1be493a-1de8-4570-87d9-3347efd97800', '5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 1, 'B16.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9cdc2c5-fef2-4b90-be86-3fbec2f2700e', '5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 2, 'B17.0, B16.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14dd7e53-9a59-4620-81db-e06a0f3ddcbb', '5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 3, 'B16.0, B17.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5ca950f4-a89e-4420-8cd7-d9d250a6a07a', 'a95cf26f-6c4a-4711-83bb-d67de029f718', 'B16.0 Acute hepatitis B with delta agent and without hepatic coma = B16.0. This single code captures both infections.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f632e1b8-ad92-494f-b1ea-530856d621a6', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 16, 'A home health patient has a chronic left rotator cuff tear (complete). She is receiving PT. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b5fd778-dc28-4516-b37f-d82676f05223', 'f632e1b8-ad92-494f-b1ea-530856d621a6', 0, 'S46.022D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2fc27491-f889-457b-9e29-3e67bdc2e551', 'f632e1b8-ad92-494f-b1ea-530856d621a6', 1, 'M75.122');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82de8430-8082-48e5-af39-c4217d2b43f1', 'f632e1b8-ad92-494f-b1ea-530856d621a6', 2, 'S46.022S');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6a8e646-9c3c-4ea3-99a6-7a6aad67119a', 'f632e1b8-ad92-494f-b1ea-530856d621a6', 3, 'M75.112');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f632e1b8-ad92-494f-b1ea-530856d621a6', '2fc27491-f889-457b-9e29-3e67bdc2e551', 'M75.122 Chronic (non-traumatic) rotator cuff tear, left shoulder = M75.122. Traumatic codes (S46) require a current/recent injury.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4f2bb036-526c-4d66-a3f6-6cfab943d5e3', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 17, 'A patient had a left total hip replacement 3 months ago. She develops periprosthetic fracture of the left femur around the prosthesis. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('522db210-b45a-460c-bf15-76339af5f521', '4f2bb036-526c-4d66-a3f6-6cfab943d5e3', 0, 'M97.02XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5953c821-bc25-4739-9919-400dceb855b5', '4f2bb036-526c-4d66-a3f6-6cfab943d5e3', 1, 'S72.002A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b9e61ed-9866-4cbd-b128-6c3de3d6a67d', '4f2bb036-526c-4d66-a3f6-6cfab943d5e3', 2, 'T84.040A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6a4858a-0d0b-49e5-8476-ffb6e08d1679', '4f2bb036-526c-4d66-a3f6-6cfab943d5e3', 3, 'M97.02XD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4f2bb036-526c-4d66-a3f6-6cfab943d5e3', '522db210-b45a-460c-bf15-76339af5f521', 'M97.02XA Periprosthetic fracture around a prosthetic joint = M97.02XA (left hip). Active treatment = 7th character A.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ffcef6a5-dfdb-405b-8b9f-25050d072be1', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 18, 'A patient has documented lumbar spinal stenosis with neurogenic claudication. She is admitted for PT. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56b25854-3400-463e-818c-fa841739bd6c', 'ffcef6a5-dfdb-405b-8b9f-25050d072be1', 0, 'M48.06');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e62ee3d2-a597-40c3-90ac-00fb2234bd16', 'ffcef6a5-dfdb-405b-8b9f-25050d072be1', 1, 'M48.061');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f01aabb0-3bd5-48aa-8436-4aa0c3d439f4', 'ffcef6a5-dfdb-405b-8b9f-25050d072be1', 2, 'M48.062');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85645208-8027-4f85-9300-7a6bb4b9c5e7', 'ffcef6a5-dfdb-405b-8b9f-25050d072be1', 3, 'M48.06, G95.19');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ffcef6a5-dfdb-405b-8b9f-25050d072be1', 'f01aabb0-3bd5-48aa-8436-4aa0c3d439f4', 'M48.06 is a non-billable parent — lumbar spinal stenosis requires a 6th digit specifying whether neurogenic claudication is present. Since the stem explicitly documents neurogenic claudication, M48.062 (lumbar spinal stenosis WITH neurogenic claudication) is the correct, complete code — not M48.061 (without claudication), which would contradict the documented finding, and not the bare non-billable M48.06 parent. Neurogenic claudication is not separately coded with G95.19, since M48.062 already captures it as part of the combination code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 19, 'A patient has osteoarthritis of both knees. She is receiving HH PT for bilateral knee pain and mobility limitations. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('233e47b7-eca0-4c00-adfa-cc25b6ef8a74', '3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', 0, 'M17.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5935a7a-35df-48ff-aa1d-f34af6e84e62', '3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', 1, 'M17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4bceec6-9b97-438f-87d9-b9b59c6a0486', '3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', 2, 'M17.11, M17.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b56c3e8-c332-46cf-94fe-ddb0368c1341', '3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', 3, 'M17.0, M25.561, M25.562');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3635ec8d-adb6-4a0f-bb53-baa1b2bc99e4', '233e47b7-eca0-4c00-adfa-cc25b6ef8a74', 'M17.0 Bilateral primary osteoarthritis of the knees = M17.0 (bilateral). This is a single code for bilateral involvement.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3821b11d-4243-4261-a61c-4517af91131f', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 20, 'A patient has gout of the right knee with documented tophi. She is admitted for SN medication management. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f116aae-b01d-4313-8f9d-8b11ee64714c', '3821b11d-4243-4261-a61c-4517af91131f', 0, 'M10.062');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('463704c7-073b-4f4e-86bb-aa2db075f8cc', '3821b11d-4243-4261-a61c-4517af91131f', 1, 'M1A.071');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c88bec6b-c1a6-4d2a-b1f2-38b061fd25fb', '3821b11d-4243-4261-a61c-4517af91131f', 2, 'M10.061');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b954abd-e7c7-4548-9cb3-cb187c392167', '3821b11d-4243-4261-a61c-4517af91131f', 3, 'M1A.011');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3821b11d-4243-4261-a61c-4517af91131f', '9f116aae-b01d-4313-8f9d-8b11ee64714c', 'M10.062 Gout with tophi, right knee = M10.062 (idiopathic gout with tophus, right knee).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12484f58-a7ad-4f53-8f0b-7cea6b1061b6', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 21, 'A patient has a non-traumatic compression fracture of T12 due to senile osteoporosis. She is receiving active treatment. What code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0cd6e057-2c81-47a7-acba-e3ac81488a1d', '12484f58-a7ad-4f53-8f0b-7cea6b1061b6', 0, 'M80.08XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e27a8ac-925a-478e-8964-49c25e9bd404', '12484f58-a7ad-4f53-8f0b-7cea6b1061b6', 1, 'M80.88XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a3802c4-ed64-4f77-9cd6-6d3218e68145', '12484f58-a7ad-4f53-8f0b-7cea6b1061b6', 2, 'M48.52XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('109a80ab-9551-455e-b94f-04bfeee44b92', '12484f58-a7ad-4f53-8f0b-7cea6b1061b6', 3, 'M80.08XD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('12484f58-a7ad-4f53-8f0b-7cea6b1061b6', '0cd6e057-2c81-47a7-acba-e3ac81488a1d', 'M80.08XA Senile osteoporosis = age-related osteoporosis with current pathological fracture of vertebra = M80.08XA. Active treatment = A.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('892f15cf-a491-4856-a1eb-66f0430eeb95', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 22, 'A patient had a left wrist fracture (Colles) 6 weeks ago. It was casted. The cast has been removed and she is in PT for rehabilitation. The fracture is healing normally. What code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d83b6d2-7540-4c63-89b4-570fe4e0d3b0', '892f15cf-a491-4856-a1eb-66f0430eeb95', 0, 'S52.531D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff4ff351-d64c-4cf9-82d8-bbf6e260d601', '892f15cf-a491-4856-a1eb-66f0430eeb95', 1, 'S52.531G');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1ae787b-0fff-48aa-a1eb-8247b664f97a', '892f15cf-a491-4856-a1eb-66f0430eeb95', 2, 'S52.531A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3e6b4d0-d4e8-4d75-afbd-fefdb85f17ce', '892f15cf-a491-4856-a1eb-66f0430eeb95', 3, 'Z47.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('892f15cf-a491-4856-a1eb-66f0430eeb95', '8d83b6d2-7540-4c63-89b4-570fe4e0d3b0', 'S52.531D Colles fracture, healing normally with routine care = S52.531D (subsequent encounter for closed fracture with routine healing).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1674d8e-f225-4b6a-9e6b-94864ad808fe', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 23, 'A patient has a pathological fracture of the right femur due to documented bone metastasis from breast cancer. Active treatment. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a134ce3c-353a-4288-8056-8ce210af9e69', 'a1674d8e-f225-4b6a-9e6b-94864ad808fe', 0, 'M84.451A, C79.51, C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50a1573b-e4c1-4e49-803b-23167380d411', 'a1674d8e-f225-4b6a-9e6b-94864ad808fe', 1, 'C79.51, C50.911, M84.451A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6281d6e4-fedd-4f3b-a4a0-66c375008e4c', 'a1674d8e-f225-4b6a-9e6b-94864ad808fe', 2, 'C79.51, M84.451A, C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77106012-5bd5-45b3-9939-fba8cdb60d7f', 'a1674d8e-f225-4b6a-9e6b-94864ad808fe', 3, 'M84.551A, C79.51, C50.911');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1674d8e-f225-4b6a-9e6b-94864ad808fe', 'a134ce3c-353a-4288-8056-8ce210af9e69', 'M84.451A, C79.51, C50.911 Pathological fracture due to neoplastic disease of right femur = M84.451A. Then the metastatic site (C79.51) and primary cancer (C50.911). Active treatment = A.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b26aab13-0240-4a13-a89c-8eb4844ddf55', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 24, 'A patient has ankylosing spondylitis with documented iritis (anterior uveitis). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3158edb4-b873-4620-8c49-9d7e3058b4dd', 'b26aab13-0240-4a13-a89c-8eb4844ddf55', 0, 'M45.9, H20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f80c019-eff8-4cf7-9945-c2cdebda8bbc', 'b26aab13-0240-4a13-a89c-8eb4844ddf55', 1, 'M45.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b2cea6f-d753-42ea-bc72-ef91ef351974', 'b26aab13-0240-4a13-a89c-8eb4844ddf55', 2, 'M45.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3be2715-b912-4613-a5db-3641bd9bc16c', 'b26aab13-0240-4a13-a89c-8eb4844ddf55', 3, 'M45.9, H20.019');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b26aab13-0240-4a13-a89c-8eb4844ddf55', '3158edb4-b873-4620-8c49-9d7e3058b4dd', 'M45.9, H20.9 Ankylosing spondylitis = M45.9. Iritis/anterior uveitis = H20.9 (coded separately when documented).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e0c4818-a227-4a14-a07c-18d307707633', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 25, 'A patient is admitted to HH after a right shoulder hemiarthroplasty for a comminuted proximal humerus fracture. She is 2 weeks post-op. PT is ordered. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28260490-1123-4fa7-8f1d-362e3f708c88', '1e0c4818-a227-4a14-a07c-18d307707633', 0, 'S42.291D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f6aa585-99a4-4052-a89b-f891763b30c8', '1e0c4818-a227-4a14-a07c-18d307707633', 1, 'Z47.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a47b581-c9b8-4efc-b63a-1a236d791922', '1e0c4818-a227-4a14-a07c-18d307707633', 2, 'Z96.611');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3298cc0-f757-4288-a2d1-21e1765010cf', '1e0c4818-a227-4a14-a07c-18d307707633', 3, 'S42.201D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1e0c4818-a227-4a14-a07c-18d307707633', '28260490-1123-4fa7-8f1d-362e3f708c88', 'S42.291D Healing proximal humerus fracture (comminuted) = S42.291D. The fracture code with D is used during the healing phase. Z47.89 is used when no fracture code is reportable.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('29b55461-45ef-44a9-8054-743303a50f04', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 26, 'A home health patient has relapsing-remitting multiple sclerosis with documented spasticity. She is receiving PT. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a9c08ff-c06b-46bc-92f9-dd23accf8d7d', '29b55461-45ef-44a9-8054-743303a50f04', 0, 'G35A, G80.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3117bc1e-0dbc-4921-b02e-cd57ff7271f4', '29b55461-45ef-44a9-8054-743303a50f04', 1, 'G35A, G81.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b81a81a-7fe2-43bb-8de5-361c80ee04a1', '29b55461-45ef-44a9-8054-743303a50f04', 2, 'G35A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('420953cf-5b1d-4eec-a5c0-15bde0724e69', '29b55461-45ef-44a9-8054-743303a50f04', 3, 'G35A, R25.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('29b55461-45ef-44a9-8054-743303a50f04', '6b81a81a-7fe2-43bb-8de5-361c80ee04a1', 'G35A (relapsing-remitting multiple sclerosis, the documented specific course — not the bare, non-billable G35 parent) is coded alone. Spasticity is a symptom integral to MS and is generally not coded separately unless it is being specifically and independently treated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('835a5fb0-9ade-40dd-882a-be5ead63e36f', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 27, 'A patient had a stroke 2 months ago. The stroke is resolved, but she has residual right-sided hemiplegia (she is right-handed) and dysphagia. How are the residuals coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e9016452-c531-4330-b066-04e138ac5f30', '835a5fb0-9ade-40dd-882a-be5ead63e36f', 0, 'I63.9, G81.91, R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9afc2f5b-2eb8-40f1-8cf5-9322c56026fc', '835a5fb0-9ade-40dd-882a-be5ead63e36f', 1, 'I69.351, I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c713f02-03fe-4228-949f-b8dd0442db01', '835a5fb0-9ade-40dd-882a-be5ead63e36f', 2, 'I69.951, I69.991');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1861b75-c1b8-4cbe-b2a6-1efd94e68746', '835a5fb0-9ade-40dd-882a-be5ead63e36f', 3, 'G81.91, R13.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('835a5fb0-9ade-40dd-882a-be5ead63e36f', '9afc2f5b-2eb8-40f1-8cf5-9322c56026fc', 'I69.351, I69.391 Resolved stroke with residual hemiplegia = I69.351 (right-dominant side = dominant). Residual dysphagia = I69.391. The I69 sequela codes replace the acute stroke code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ec9073aa-16f4-4d72-808a-cbc5fa1d5671', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 28, 'A patient has trigeminal neuralgia. She is being managed with carbamazepine at home. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d4be2a0-124b-47f9-9784-6324767699e8', 'ec9073aa-16f4-4d72-808a-cbc5fa1d5671', 0, 'G50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6e9a05f-0781-4e5b-b077-7e4c193315b9', 'ec9073aa-16f4-4d72-808a-cbc5fa1d5671', 1, 'G50.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ccefa39-dca4-497c-9fb3-3d816f3adaea', 'ec9073aa-16f4-4d72-808a-cbc5fa1d5671', 2, 'G44.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('feb3dbb5-ce78-46e7-b419-6dc9dfde1980', 'ec9073aa-16f4-4d72-808a-cbc5fa1d5671', 3, 'R51.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ec9073aa-16f4-4d72-808a-cbc5fa1d5671', '7d4be2a0-124b-47f9-9784-6324767699e8', 'G50.0 (trigeminal neuralgia) is the specific, physician-diagnosed condition — a distinct clinical entity involving sudden, severe facial pain along the trigeminal nerve distribution, classically treated with carbamazepine (an anticonvulsant used off-label for its nerve-pain-stabilizing effect, which is why it appears in this stem as confirmatory context). G50.1 (atypical facial pain) is a different, less specific facial pain syndrome not matching the documented trigeminal-neuralgia diagnosis. G44.89 (other headache syndrome) and R51.9 (headache, unspecified) both miscategorize this as a headache rather than the specific nerve-pain condition actually diagnosed — trigeminal neuralgia is classified as a cranial nerve disorder, not a headache.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('08a6dee4-2dbf-435a-9d32-eca9545af451', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 29, 'A patient is admitted to HH for SN management of a new seizure disorder — first seizure was 1 week ago, etiology unknown. How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4a9d74b-6735-4980-92a4-328d32ca760e', '08a6dee4-2dbf-435a-9d32-eca9545af451', 0, 'G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa07413a-e29c-4ef3-87f5-57df7f3fe2a8', '08a6dee4-2dbf-435a-9d32-eca9545af451', 1, 'R56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('68ed9074-bf01-437c-9c10-7f046205e989', '08a6dee4-2dbf-435a-9d32-eca9545af451', 2, 'G40.901');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff76abf1-1cdf-4572-97f4-fe7169f8202a', '08a6dee4-2dbf-435a-9d32-eca9545af451', 3, 'G40.919');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('08a6dee4-2dbf-435a-9d32-eca9545af451', 'f4a9d74b-6735-4980-92a4-328d32ca760e', 'G40.909 New seizure disorder, etiology unknown = G40.909 (epilepsy, unspecified, not intractable, without status epilepticus). R56.9 is for a single isolated seizure, not an ongoing disorder.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6b18aebe-6142-4da7-a39f-d0e856f05a6c', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 30, 'A patient has documented myasthenia gravis with exacerbation. She is receiving HH for medication management. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42007447-8db0-4e59-9680-0d5fe01bdcef', '6b18aebe-6142-4da7-a39f-d0e856f05a6c', 0, 'G70.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d88dcfdb-0bcc-4d30-b3b2-45b15b92874e', '6b18aebe-6142-4da7-a39f-d0e856f05a6c', 1, 'G70.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e79c06ee-33bd-4ef6-a264-e0ae705dd7a3', '6b18aebe-6142-4da7-a39f-d0e856f05a6c', 2, 'G70.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7f2a5fd-b763-4dbe-af1f-1ad2c2141c8d', '6b18aebe-6142-4da7-a39f-d0e856f05a6c', 3, 'G70.01, G73.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6b18aebe-6142-4da7-a39f-d0e856f05a6c', '42007447-8db0-4e59-9680-0d5fe01bdcef', 'G70.01 Myasthenia gravis with exacerbation = G70.01.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('049fa2d9-3a0f-4758-90e0-d34bfa570691', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 31, 'A patient is admitted to HH for PT/OT following a complete spinal cord injury at C6. She is a quadriplegic. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9b5ab9f-f737-4aa8-b897-63f33c44fbc2', '049fa2d9-3a0f-4758-90e0-d34bfa570691', 0, 'S14.106D, G82.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77eb049b-fa7d-4311-886d-a1d7fa4dc1c6', '049fa2d9-3a0f-4758-90e0-d34bfa570691', 1, 'G82.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cffb4231-b50b-4963-8793-bc750c31b5f3', '049fa2d9-3a0f-4758-90e0-d34bfa570691', 2, 'S14.106S, G82.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('006a78e8-e3a4-4aaa-a1fb-7f43a4ea661a', '049fa2d9-3a0f-4758-90e0-d34bfa570691', 3, 'G82.50');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('049fa2d9-3a0f-4758-90e0-d34bfa570691', 'f9b5ab9f-f737-4aa8-b897-63f33c44fbc2', 'S14.106D, G82.51 Complete spinal cord injury at C6 = S14.106D (subsequent encounter). Quadriplegia, C5-C7 complete = G82.51.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b5001fa4-5197-4be3-b808-23b7d75438c2', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 32, 'A patient has Parkinson’s disease (without dyskinesia, without motor fluctuations) with freezing of gait and postural instability. She is receiving PT. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2c28e4b-6c9e-4677-b943-5b586cb542e4', 'b5001fa4-5197-4be3-b808-23b7d75438c2', 0, 'G20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b60fb5e-583c-4db7-a028-86fdaa885192', 'b5001fa4-5197-4be3-b808-23b7d75438c2', 1, 'R26.81, R29.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('001f5f03-6d30-4378-83d8-3c5302d56a98', 'b5001fa4-5197-4be3-b808-23b7d75438c2', 2, 'G20, R26.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8285e212-bf1e-45cc-9ee7-3327e3a730b8', 'b5001fa4-5197-4be3-b808-23b7d75438c2', 3, 'G20.A1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b5001fa4-5197-4be3-b808-23b7d75438c2', '8285e212-bf1e-45cc-9ee7-3327e3a730b8', 'G20.A1 (Parkinson''s disease without dyskinesia, without mention of fluctuations — matching the documented status) is used as M1021 — G20 alone is a non-billable parent and cannot be used as a reportable diagnosis code. Freezing of gait and postural instability are integral symptoms of Parkinson''s disease and are not separately coded with R26.81/R29.3.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1c5974c-5b8b-4450-a818-25f146a59eb5', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 33, 'A patient with ALS is admitted to HH for SLP evaluation and SN for respiratory management. She has dysphagia and is on BiPAP. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('93a51437-f7b5-4a2b-8636-6d7768e5eb0d', 'a1c5974c-5b8b-4450-a818-25f146a59eb5', 0, 'G12.21, R13.10, Z99.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6711dc4e-903e-4241-b004-3542e0acd7d0', 'a1c5974c-5b8b-4450-a818-25f146a59eb5', 1, 'G12.21, I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9113f500-c5d7-4a6e-a8f0-4de60f1b1924', 'a1c5974c-5b8b-4450-a818-25f146a59eb5', 2, 'G12.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e1b41fe-96eb-49f4-ac2e-ae479d6c3b1f', 'a1c5974c-5b8b-4450-a818-25f146a59eb5', 3, 'G12.21, R13.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1c5974c-5b8b-4450-a818-25f146a59eb5', '93a51437-f7b5-4a2b-8636-6d7768e5eb0d', 'G12.21, R13.10, Z99.11 ALS = G12.21. Dysphagia = R13.10 (independently documented and relevant to care). Z99.11 = dependence on ventilator/BiPAP.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9e32013f-7c8e-40a8-8280-588722f1638c', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 34, 'A patient has peripheral neuropathy due to chemotherapy for lymphoma. The lymphoma is in remission. How is the neuropathy coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5449a4e-51aa-44da-a4ca-d8ed751fdb8f', '9e32013f-7c8e-40a8-8280-588722f1638c', 0, 'G62.0, C85.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aaa517af-589e-4abe-891d-a72700bb6d3f', '9e32013f-7c8e-40a8-8280-588722f1638c', 1, 'G62.0, T45.1X5S');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1f5911aa-121a-4016-88d5-a49f9d2cb5be', '9e32013f-7c8e-40a8-8280-588722f1638c', 2, 'G62.0, Z85.79');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2edb8a08-f4d6-46b6-b1a4-d918309096e2', '9e32013f-7c8e-40a8-8280-588722f1638c', 3, 'C85.90, G62.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9e32013f-7c8e-40a8-8280-588722f1638c', 'c5449a4e-51aa-44da-a4ca-d8ed751fdb8f', 'G62.0, C85.90 Chemotherapy-induced peripheral neuropathy = G62.0 (drug-induced polyneuropathy). If the lymphoma is still active/under treatment, C85.90 is used. If truly in remission, Z85.79 would replace it.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0997fe15-e65d-43ea-b029-c4aae80025f9', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 35, 'A patient is admitted to HH post-hospitalization for bacterial meningitis. The meningitis is resolving on IV antibiotics. What code is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9e93e2b-cf7f-4d1b-85da-e2878c0d9a69', '0997fe15-e65d-43ea-b029-c4aae80025f9', 0, 'G00.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e5fe370-bd8c-42be-845f-8dd8786fd0ec', '0997fe15-e65d-43ea-b029-c4aae80025f9', 1, 'G03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db2ea983-676f-4700-8ae7-319324fbcf01', '0997fe15-e65d-43ea-b029-c4aae80025f9', 2, 'The specific organism-based meningitis code (e.g., G00.1 for pneumococcal)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78b66b55-0000-41ac-89e3-bd96abed9060', '0997fe15-e65d-43ea-b029-c4aae80025f9', 3, 'Z87.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0997fe15-e65d-43ea-b029-c4aae80025f9', 'db2ea983-676f-4700-8ae7-319324fbcf01', 'Meningitis should be coded with the specific organism-based code when the organism is documented. G00.9 (unspecified bacterial) is used only when the organism is not specified.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('627c9ecf-3531-4f38-b10d-6d1bb2af0740', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 36, 'A 32-year-old woman is admitted to HH for wound care following cesarean delivery. She is 3 weeks postpartum. The incision is healing normally. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fb3dc360-6d01-4bd8-a5b7-9db693cfd6f7', '627c9ecf-3531-4f38-b10d-6d1bb2af0740', 0, 'Z39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4007eeeb-70e2-49a5-b2b7-aed2fa0bdd01', '627c9ecf-3531-4f38-b10d-6d1bb2af0740', 1, 'O90.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bd7b151-51b0-40b5-90e6-f2eb701f3e5a', '627c9ecf-3531-4f38-b10d-6d1bb2af0740', 2, 'Z48.815');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30af8354-cac6-4844-8810-01c2ca072cfe', '627c9ecf-3531-4f38-b10d-6d1bb2af0740', 3, 'O90.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('627c9ecf-3531-4f38-b10d-6d1bb2af0740', '30af8354-cac6-4844-8810-01c2ca072cfe', 'O90.89 A postpartum patient within 6 weeks of delivery with routine surgical wound care = O90.89 (other complications of the puerperium). Chapter 15 obstetric codes apply during the postpartum period (up to 6 weeks).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 37, 'A postpartum patient (4 weeks post-delivery) develops mastitis of the right breast. She is breastfeeding. What code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0b6b485-d503-4d7f-840e-1d9ba7d778c8', 'b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', 0, 'N61.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67defc05-355b-44ee-9e3a-23f72f241971', 'b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', 1, 'O91.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89375713-84d7-41a4-88f1-3103ac1cddb0', 'b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', 2, 'O91.119');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02d2396f-5b55-489c-8c9a-eb9293f9a803', 'b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', 3, 'N61.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b8f84ffe-6da4-42b3-91bd-dca6cdbf2e8f', '67defc05-355b-44ee-9e3a-23f72f241971', 'O91.12 Mastitis during the puerperium (within 6 weeks postpartum) with breastfeeding = O91.12 (abscess associated with lactation). Chapter 15 codes take precedence during the postpartum period.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d31a08f8-b4ad-45a5-b57f-da8118cb64e0', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 38, 'A patient is 6 weeks postpartum. She had gestational diabetes during pregnancy that has now resolved. She is being monitored with blood glucose checks. How is the GDM coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b066dd9f-bc86-4e29-8844-b693d38db63d', 'd31a08f8-b4ad-45a5-b57f-da8118cb64e0', 0, 'O24.419');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c172c79-295b-461b-8c6b-78b201d92671', 'd31a08f8-b4ad-45a5-b57f-da8118cb64e0', 1, 'Z86.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d38b8428-56c5-4d81-a4e3-74175e92d07d', 'd31a08f8-b4ad-45a5-b57f-da8118cb64e0', 2, 'O24.439');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8ad518e6-2ae6-4784-8255-2577cb226c91', 'd31a08f8-b4ad-45a5-b57f-da8118cb64e0', 3, 'E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d31a08f8-b4ad-45a5-b57f-da8118cb64e0', '1c172c79-295b-461b-8c6b-78b201d92671', 'Z86.32 Resolved gestational diabetes postpartum = Z86.32 (personal history of gestational diabetes). Active GDM codes are not used after delivery when the condition has resolved.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5e94a854-a2df-4066-8f4c-9966e575f63b', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 39, 'A patient delivered a baby with Down syndrome (trisomy 21). The baby is now 3 months old and receiving early intervention PT at home. What is the correct code for the baby?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('297fafd6-57b6-4f34-93f7-f6b018e4f126', '5e94a854-a2df-4066-8f4c-9966e575f63b', 0, 'Q90.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fe222db-ca87-4282-933a-8164a60c9df4', '5e94a854-a2df-4066-8f4c-9966e575f63b', 1, 'Q90.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba974378-8d62-4a87-aa2d-58114b1f1538', '5e94a854-a2df-4066-8f4c-9966e575f63b', 2, 'Z87.79');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e785629-bc68-4b10-9043-6605f7523d7d', '5e94a854-a2df-4066-8f4c-9966e575f63b', 3, 'P00.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5e94a854-a2df-4066-8f4c-9966e575f63b', '297fafd6-57b6-4f34-93f7-f6b018e4f126', 'Q90.9 Down syndrome (trisomy 21) = Q90.9 (unspecified) or Q90.0 (trisomy 21, nonmosaicism). Used regardless of the child’s current age.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 40, 'A 6-month-old infant is admitted to HH for SN management of a congenital heart defect (VSD). The defect is present since birth. What type of code is used?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1dcd6a36-b2af-4251-b465-0ea9d319926a', '468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', 0, 'Q-codes (congenital malformation)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd0fa6c6-9521-4a87-9d0f-74e2b00fb885', '468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', 1, 'P-codes (perinatal)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b731ec03-a290-450f-bdca-33449dfe4289', '468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', 2, 'I-codes (circulatory)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f5a0a92-7887-4aca-a6a8-7b3ae1715845', '468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', 3, 'Z-codes (status)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('468a1fe3-86b2-4d6c-b0a5-77586f2aa7dd', '1dcd6a36-b2af-4251-b465-0ea9d319926a', 'Q-codes Congenital malformations use Chapter 17 Q-codes. P-codes are for conditions originating in the perinatal period, not structural defects.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('94814da1-f86d-417f-9681-d32de7b93363', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 41, 'An infant born at 28 weeks gestation is now 4 months old (adjusted age 1 month). She is receiving HH for growth and development monitoring. Her prematurity-related conditions are still being managed. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88ffa811-9f5f-4f70-ab48-22112466b146', '94814da1-f86d-417f-9681-d32de7b93363', 0, 'P07.31 (28 weeks gestation), P07.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3dae258f-6406-401e-8b0f-cbf8732310a1', '94814da1-f86d-417f-9681-d32de7b93363', 1, 'Z38.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42aadb74-7fd7-41e1-b80f-2bca41934f99', '94814da1-f86d-417f-9681-d32de7b93363', 2, 'P07.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66bc8b61-9f9e-4f05-bb39-b42599f6d14a', '94814da1-f86d-417f-9681-d32de7b93363', 3, 'Z00.111');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('94814da1-f86d-417f-9681-d32de7b93363', '88ffa811-9f5f-4f70-ab48-22112466b146', 'P07.31, P07.02 Prematurity-related conditions still being managed = P07.31 (28 completed weeks of gestation) and P07.02 (extremely low birth weight). Chapter 16 P-codes may be used regardless of age when the condition is still present.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ecde8937-7cf5-4cdb-9398-004f3d5bf139', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 42, 'A patient fell from a step stool at home while changing a light bulb, sustaining a right ankle fracture. She is now in HH for PT. What external cause codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b050b028-922c-436d-a0dc-01e2043fa7d4', 'ecde8937-7cf5-4cdb-9398-004f3d5bf139', 0, 'W11.XXXD, Y93.E9, Y99.8, Y92.009');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a647f70-3301-4fff-a010-0de1913f24a6', 'ecde8937-7cf5-4cdb-9398-004f3d5bf139', 1, 'W11.XXXA, Y93.E9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d9d7c0e-d510-4484-912c-44ecd81adf91', 'ecde8937-7cf5-4cdb-9398-004f3d5bf139', 2, 'W18.09XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7da166ff-7290-45cb-829f-09ae42ae5812', 'ecde8937-7cf5-4cdb-9398-004f3d5bf139', 3, 'W01.0XXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ecde8937-7cf5-4cdb-9398-004f3d5bf139', 'b050b028-922c-436d-a0dc-01e2043fa7d4', 'W11.XXXD, Y93.E9, Y99.8, Y92.009 Fall from step stool = W11 (fall from ladder). Activity = Y93.E9 (other specified). External status = Y99.8 (other). Place = Y92.009 (unspecified place in home). All with 7th character D matching the injury.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 43, 'Per ICD-10-CM guidelines, external cause codes should be sequenced:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ee0dcd6-9e9d-4e18-9ec5-5662393b3fe7', '6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', 0, 'As the primary/first-listed code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08dc478c-82f1-4d2d-a99a-894d05b02de1', '6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', 1, 'After the injury/condition code — never primary');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e7abdd5-cbb0-4555-a26c-3715a3e9848f', '6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', 2, 'In any position');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3540fd3f-7129-4aba-9809-0e2640088d57', '6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', 3, 'Only when mandated by the payer');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6355a8ba-74a3-43b0-8eb1-1650a9f2a2c7', '08dc478c-82f1-4d2d-a99a-894d05b02de1', 'External cause codes are always sequenced after the injury/condition code and are never primary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('65cc033e-5fcf-47f5-81ac-121e431f6059', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 44, 'A home health patient was injured in a motor vehicle accident (passenger in a car that collided with another car). She has a healing femur fracture. What external cause code category applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4728c027-1821-4b93-a816-9893aef2c7fd', '65cc033e-5fcf-47f5-81ac-121e431f6059', 0, 'V43 — car occupant injured in collision with car');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad535eff-8f75-4213-a50e-420c8e2c504e', '65cc033e-5fcf-47f5-81ac-121e431f6059', 1, 'V47 — car occupant injured in collision with fixed object');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62caee49-081e-44f4-9861-c300475bc37f', '65cc033e-5fcf-47f5-81ac-121e431f6059', 2, 'W19 — unspecified fall');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd20da6c-415f-4c77-9ed7-ff67b91f65c5', '65cc033e-5fcf-47f5-81ac-121e431f6059', 3, 'V49 — car occupant injured in other transport accident');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('65cc033e-5fcf-47f5-81ac-121e431f6059', '4728c027-1821-4b93-a816-9893aef2c7fd', 'V43 Car occupant injured in collision with another car = V43 category.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('348773b0-4b8c-4485-8d20-6bc4a637edaa', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 45, 'A patient has a healing wrist fracture sustained when she tripped over her cat at home. What is the external cause code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56625d65-95d5-4b66-a418-c547b87f893f', '348773b0-4b8c-4485-8d20-6bc4a637edaa', 0, 'W01.0XXD — fall on same level from tripping');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('671f3a6e-6e5a-4328-94ea-e25e30e473a9', '348773b0-4b8c-4485-8d20-6bc4a637edaa', 1, 'W18.09XD — other fall on same level');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('126fb35f-e8b4-4d45-b176-bd3873cd55a6', '348773b0-4b8c-4485-8d20-6bc4a637edaa', 2, 'W54.0XXD — bitten by dog');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17189e84-16d0-4749-a77d-2ac7b2a41800', '348773b0-4b8c-4485-8d20-6bc4a637edaa', 3, 'W55.09XD — bitten or struck by other mammals');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('348773b0-4b8c-4485-8d20-6bc4a637edaa', '56625d65-95d5-4b66-a418-c547b87f893f', 'W01.0XXD Fall on same level from tripping (over an object/animal) = W01.0XXD. D for subsequent encounter during HH.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07b482af-eed0-499c-8c0f-10a10f21a5cf', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 46, 'Which of the following statements about external cause codes is TRUE?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63d0082d-8166-449e-be20-676495eb95ed', '07b482af-eed0-499c-8c0f-10a10f21a5cf', 0, 'They are mandatory in all settings');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('deb4ffae-d6ae-401b-9068-a73279ce4603', '07b482af-eed0-499c-8c0f-10a10f21a5cf', 1, 'They describe the cause, place, activity, and status of the injury event');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c083e37-73a7-49cd-8ccf-dadc6c5e6fe5', '07b482af-eed0-499c-8c0f-10a10f21a5cf', 2, 'They can be used as primary diagnosis codes when no injury code exists');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17b48996-0631-45db-8486-83a8d04603ed', '07b482af-eed0-499c-8c0f-10a10f21a5cf', 3, 'Only one external cause code per event is permitted');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('07b482af-eed0-499c-8c0f-10a10f21a5cf', 'deb4ffae-d6ae-401b-9068-a73279ce4603', 'External cause codes describe the cause/mechanism, place of occurrence, activity at the time, and external status of the injury event.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('556596ad-d4dc-4e14-98a9-5c2f051209a2', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 47, 'A patient has a fall history with multiple falls in the past year. She fell at home and sustained a hip fracture. For the current HH episode, how should the fall history be captured?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b36e9ccd-8c14-4106-8949-84944347a067', '556596ad-d4dc-4e14-98a9-5c2f051209a2', 0, 'Z91.81 only');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('87f8d13d-3fe1-41b0-b73d-5d611fa114ee', '556596ad-d4dc-4e14-98a9-5c2f051209a2', 1, 'R29.6, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2131f5be-c1c7-44fc-872c-1eebe7ebf3a9', '556596ad-d4dc-4e14-98a9-5c2f051209a2', 2, 'Z91.81, W19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48d00f9d-47ff-4401-b004-807a0a36474e', '556596ad-d4dc-4e14-98a9-5c2f051209a2', 3, 'R29.6, Z91.81, W18.30XD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('556596ad-d4dc-4e14-98a9-5c2f051209a2', '48d00f9d-47ff-4401-b004-807a0a36474e', 'R29.6, Z91.81, W18.30XD R29.6 (repeated falls, current finding), Z91.81 (history of falling, ongoing risk), plus the external cause code for the current fall event with D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('864fc3a7-59ef-4f6c-9875-e9411f89e31c', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 48, 'A patient has major depressive disorder, recurrent, severe, without psychotic features. She is admitted for SN medication management. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e2d9feb-30b3-458b-9b09-e857b36ee8a0', '864fc3a7-59ef-4f6c-9875-e9411f89e31c', 0, 'F33.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec65fc64-2187-4218-99fe-3925a302e759', '864fc3a7-59ef-4f6c-9875-e9411f89e31c', 1, 'F32.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01610c48-9e9c-4f62-8de3-f5e04de81de0', '864fc3a7-59ef-4f6c-9875-e9411f89e31c', 2, 'F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc6fa4ff-d76c-4875-9c99-1e874eb05365', '864fc3a7-59ef-4f6c-9875-e9411f89e31c', 3, 'F33.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('864fc3a7-59ef-4f6c-9875-e9411f89e31c', '7e2d9feb-30b3-458b-9b09-e857b36ee8a0', 'F33.2 Major depressive disorder, recurrent, severe, without psychotic features = F33.2. F32 is single episode; F33 is recurrent.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d6c6df1b-9f53-4891-9956-c2638e62b050', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 49, 'A patient has bipolar I disorder, current episode manic, severe, with psychotic features. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0b4fc08-e796-43f9-88e2-22aa7eaca9a3', 'd6c6df1b-9f53-4891-9956-c2638e62b050', 0, 'F31.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('375a4c2b-5786-4f30-b7ab-cef9fe5c72ae', 'd6c6df1b-9f53-4891-9956-c2638e62b050', 1, 'F31.13');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc331881-31eb-4f12-8da3-062784c61ab2', 'd6c6df1b-9f53-4891-9956-c2638e62b050', 2, 'F31.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a6c3980d-b692-400c-81c3-bbbdce591744', 'd6c6df1b-9f53-4891-9956-c2638e62b050', 3, 'F31.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d6c6df1b-9f53-4891-9956-c2638e62b050', 'a0b4fc08-e796-43f9-88e2-22aa7eaca9a3', 'F31.2 Bipolar I, current episode manic, severe, with psychotic features = F31.2.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('749254b6-9368-4aac-82c7-3de9a6d19590', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 50, 'A patient has documented PTSD (post-traumatic stress disorder). She is receiving HH for SN psychiatric nursing care. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e9cf0c2a-1bbf-4b31-b1fa-8a2e87b2b23a', '749254b6-9368-4aac-82c7-3de9a6d19590', 0, 'F43.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3c450f5-83eb-4a94-9dff-1da298bbbcb4', '749254b6-9368-4aac-82c7-3de9a6d19590', 1, 'F43.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6feaeb32-5ab4-493d-bb49-00e90047f8ec', '749254b6-9368-4aac-82c7-3de9a6d19590', 2, 'F43.10, Z87.820');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('050d13b1-9061-4142-9995-d514b76090ae', '749254b6-9368-4aac-82c7-3de9a6d19590', 3, 'F43.12, Z91.49');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('749254b6-9368-4aac-82c7-3de9a6d19590', 'e9cf0c2a-1bbf-4b31-b1fa-8a2e87b2b23a', 'F43.10 PTSD = F43.10 (post-traumatic stress disorder, unspecified). F43.12 is chronic PTSD — only assigned when specifically documented as chronic.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eaa9be30-ad15-42ff-9c12-7abb51006378', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 51, 'A patient has alcohol use disorder, moderate, with alcohol-induced persisting dementia. She is admitted for SN medication management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e90d109f-82b0-4872-8803-60c8c83d7675', 'eaa9be30-ad15-42ff-9c12-7abb51006378', 0, 'F10.27');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3effcc1c-9a9b-4eef-be81-14109d110725', 'eaa9be30-ad15-42ff-9c12-7abb51006378', 1, 'F10.20, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ea81575-b680-4d50-8bf7-56cb4164cc07', 'eaa9be30-ad15-42ff-9c12-7abb51006378', 2, 'F10.27, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('181a40e4-e843-4852-8fd8-0dfe9430a128', 'eaa9be30-ad15-42ff-9c12-7abb51006378', 3, 'F10.97');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eaa9be30-ad15-42ff-9c12-7abb51006378', 'e90d109f-82b0-4872-8803-60c8c83d7675', 'F10.27 Alcohol use disorder with alcohol-induced persisting dementia = F10.27 (alcohol dependence with dementia). This combination code captures both conditions.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7fe81697-0708-474b-ac8f-2a86b95e7af5', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 52, 'A home health patient has documented opioid dependence (in remission) on medication-assisted treatment (buprenorphine). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97882a30-64c6-4eb2-a3a4-ed227b602dfb', '7fe81697-0708-474b-ac8f-2a86b95e7af5', 0, 'F11.20, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08383749-af3c-4d0f-903d-e3505adf502f', '7fe81697-0708-474b-ac8f-2a86b95e7af5', 1, 'F11.21, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e9b3a411-54be-4dcb-8e64-8206c98955c2', '7fe81697-0708-474b-ac8f-2a86b95e7af5', 2, 'F11.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c1c26df-5366-4c21-9d58-88d2faf622d5', '7fe81697-0708-474b-ac8f-2a86b95e7af5', 3, 'Z79.891');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7fe81697-0708-474b-ac8f-2a86b95e7af5', '08383749-af3c-4d0f-903d-e3505adf502f', 'F11.21, Z79.891 Opioid dependence in remission = F11.21. Z79.891 = long-term use of opiate analgesic (buprenorphine is an opiate).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('17f535d0-04bb-40fb-a811-6e1d886e2756', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 53, 'A patient has chronic pain syndrome. She also has pain in the right hip and lower back. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d48c8e7a-ea8e-4975-bb50-3807629a299f', '17f535d0-04bb-40fb-a811-6e1d886e2756', 0, 'G89.4, M25.551, M54.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6239a49-aee5-407b-a042-4050a2822826', '17f535d0-04bb-40fb-a811-6e1d886e2756', 1, 'G89.29, M25.551, M54.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5abe4a39-2480-4d80-9eba-9828af683778', '17f535d0-04bb-40fb-a811-6e1d886e2756', 2, 'G89.4, M25.551, M54.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80a71b9e-ea5f-439c-aab0-47f6aa4fa622', '17f535d0-04bb-40fb-a811-6e1d886e2756', 3, 'M25.551, M54.50');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('17f535d0-04bb-40fb-a811-6e1d886e2756', '5abe4a39-2480-4d80-9eba-9828af683778', 'G89.4, M25.551, M54.50 Chronic pain syndrome = G89.4. This is a specific syndrome and is coded separately from G89.29 (other chronic pain). Site-specific pain codes follow.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 54, 'A patient is admitted to HH for physical therapy after a right total knee replacement. She also has chronic pain managed with long-term opioids. What codes apply related to the pain management?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe891434-c063-4a2f-87dd-e407137b75d0', '57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 0, 'G89.29, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69c2bab3-95db-4ab0-9773-0ca8d7560270', '57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 1, 'G89.28, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11b7165c-f7dd-4bfe-922d-862e0ff0f804', '57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 2, 'No pain codes needed — the aftercare code covers it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8e5e7ae-9391-4939-b30a-25b6746928fa', '57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 3, 'M25.561, G89.29, Z79.891');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('57ec8f76-4eaf-4992-af4b-51c3f4fd0c25', 'fe891434-c063-4a2f-87dd-e407137b75d0', 'G89.29, Z79.891 Chronic pain = G89.29 when relevant to the care plan. Z79.891 = long-term opioid use.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b28120de-4093-4b82-b59d-514d58238846', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 55, 'A home health patient has a history of recurrent UTIs. She currently has no active UTI but is on prophylactic antibiotics. How is the history coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1893fc3-bd9f-43b2-aeed-10130afc9a17', 'b28120de-4093-4b82-b59d-514d58238846', 0, 'N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e920369-2702-4758-8798-a1bb170929c5', 'b28120de-4093-4b82-b59d-514d58238846', 1, 'Z87.440');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2fe3585-f54c-492a-a7c5-a591064b8731', 'b28120de-4093-4b82-b59d-514d58238846', 2, 'N30.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d72e917-702d-46d9-b83e-1f171b80d540', 'b28120de-4093-4b82-b59d-514d58238846', 3, 'Z87.440, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b28120de-4093-4b82-b59d-514d58238846', '3d72e917-702d-46d9-b83e-1f171b80d540', 'Z87.440, Z79.2 History of recurrent UTIs (no current UTI) = Z87.440. Long-term prophylactic antibiotics = Z79.2.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 56, 'A patient has anemia due to CKD stage 4. She is receiving EPO injections. For sequencing, which code comes first?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9159474-40df-4a37-bab4-b1617a9ae831', 'ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', 0, 'D63.1 — anemia first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8333399c-c3f5-4858-a2fb-9b9a629f5faa', 'ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', 1, 'N18.4 — CKD first (code first note under D63.1)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf6300f6-ee3d-4000-b681-9f3d05dadd6a', 'ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', 2, 'Either may be first');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00965260-640c-443a-8f02-175e79da1a98', 'ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', 3, 'Z79.899');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ce6806b0-7d03-4a2e-9eab-b5bfc2f2d389', '8333399c-c3f5-4858-a2fb-9b9a629f5faa', 'N18.4 — CKD first D63.1 has a “code first” note directing the underlying CKD to be sequenced first.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c0b3527a-09a6-4ecc-95c8-dd91204fdce6', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 57, 'A patient has iron deficiency anemia due to chronic blood loss from hemorrhoids. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9375b1f6-40d4-4889-b5e6-d1ed6dac86c3', 'c0b3527a-09a6-4ecc-95c8-dd91204fdce6', 0, 'D50.0, K64.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0d4eb75-5cca-4bef-91d9-f405f271cf20', 'c0b3527a-09a6-4ecc-95c8-dd91204fdce6', 1, 'K64.8, D50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b3e46994-19da-4b04-96c9-6fdde6a91f05', 'c0b3527a-09a6-4ecc-95c8-dd91204fdce6', 2, 'D50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('951466c6-9a95-4697-898e-9a77e1a2c5b8', 'c0b3527a-09a6-4ecc-95c8-dd91204fdce6', 3, 'D62, K64.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c0b3527a-09a6-4ecc-95c8-dd91204fdce6', '9375b1f6-40d4-4889-b5e6-d1ed6dac86c3', 'D50.0, K64.8 Iron deficiency anemia due to chronic blood loss = D50.0. The source of blood loss (hemorrhoids K64.8) is coded additionally.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d364b05a-8fcd-43eb-a0a5-990c5ebe64c7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 58, 'A patient with sickle cell disease (Hb SS) is admitted to HH after a pain crisis. The crisis has resolved. She has chronic pain from avascular necrosis of the right hip. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('348bc7ea-402d-43c8-a184-bc550e328c3d', 'd364b05a-8fcd-43eb-a0a5-990c5ebe64c7', 0, 'D57.00, M87.051');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb27e8ef-bdd2-40e6-b213-9a4afc335c53', 'd364b05a-8fcd-43eb-a0a5-990c5ebe64c7', 1, 'D57.01, M87.051');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2702792c-6db4-4777-9da6-d380ed0d4381', 'd364b05a-8fcd-43eb-a0a5-990c5ebe64c7', 2, 'D57.1, G89.29, M87.051');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1aac3353-6ffa-4a25-ab42-0dce52071052', 'd364b05a-8fcd-43eb-a0a5-990c5ebe64c7', 3, 'D57.00, G89.29');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d364b05a-8fcd-43eb-a0a5-990c5ebe64c7', '348bc7ea-402d-43c8-a184-bc550e328c3d', 'D57.00, M87.051 Sickle cell disease Hb SS without crisis (crisis resolved) = D57.00. Avascular necrosis of right hip = M87.051.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7923edda-730b-44ad-bee2-9e3851638af6', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 59, 'A patient has a new diagnosis of type 2 diabetes with diabetic macular edema, right eye. She is on metformin. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03f8db10-94f3-4e4b-adc8-a23d9f8d6062', '7923edda-730b-44ad-bee2-9e3851638af6', 0, 'E11.311, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff3ac7b5-f738-40f3-8660-a911b9db86a1', '7923edda-730b-44ad-bee2-9e3851638af6', 1, 'E11.3211, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8fdebbc5-45e7-4b1e-9a3d-1a7a73b07086', '7923edda-730b-44ad-bee2-9e3851638af6', 2, 'E11.311');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44b03c63-68e9-468e-b260-19924979ea5b', '7923edda-730b-44ad-bee2-9e3851638af6', 3, 'E11.3511, H35.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7923edda-730b-44ad-bee2-9e3851638af6', '03f8db10-94f3-4e4b-adc8-a23d9f8d6062', 'E11.311, Z79.84 Type 2 DM with diabetic macular edema, right eye = E11.311. Z79.84 = long-term oral hypoglycemic use (metformin).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('195ce552-3ef8-4b96-9c54-ea971286a445', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 60, 'A patient with end-stage renal disease is on home hemodialysis. She has an AV graft in the left arm. She is admitted for SN dialysis management. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af002492-89e3-4e05-849d-d819e9270dec', '195ce552-3ef8-4b96-9c54-ea971286a445', 0, 'Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9c746a26-88f0-47dc-9702-cd7d7b56a0fd', '195ce552-3ef8-4b96-9c54-ea971286a445', 1, 'N18.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f69a6475-c433-4de3-8254-25cb705760f2', '195ce552-3ef8-4b96-9c54-ea971286a445', 2, 'N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa25d26b-1d1e-4169-b978-13fe9b6f7625', '195ce552-3ef8-4b96-9c54-ea971286a445', 3, 'Z49.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('195ce552-3ef8-4b96-9c54-ea971286a445', '9c746a26-88f0-47dc-9702-cd7d7b56a0fd', 'N18.6 ESRD = N18.6 as M1021 (the underlying condition driving the need for dialysis management). Z99.2 is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 61, 'A patient is admitted to HH for SN management of congestive heart failure with preserved ejection fraction (diastolic HF). The physician documents it as chronic. What is the correct HF code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f563699a-68a3-4794-8a1e-52d407375ea8', 'ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 0, 'I50.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b93c6024-d772-4cbc-aed5-eee9b42b2031', 'ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 1, 'I50.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54f2e8dd-938c-45a8-be9d-0c0acdfb5873', 'ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 2, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('660a39ee-bd2b-4b5c-9aa1-3853a53a33ce', 'ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 3, 'I50.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ae35e30c-deeb-4e2d-a3bc-b58c344645ef', 'b93c6024-d772-4cbc-aed5-eee9b42b2031', 'I50.32 Chronic diastolic (preserved EF) heart failure = I50.32.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 62, 'A patient has documented “mixed systolic and diastolic heart failure, chronic.” What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf5ea31b-1de8-4cfb-aeab-ec325b434a72', 'df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 0, 'I50.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4dee8253-5d36-42c3-8b19-06909cfa76ac', 'df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 1, 'I50.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('624e7fae-cfd3-426a-a3ae-e116297430b3', 'df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 2, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ee2e692-62e6-49f4-8a87-594427553182', 'df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 3, 'I50.22, I50.32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('df6bb740-fc8a-4a71-90c9-1a0903eb2a8a', 'bf5ea31b-1de8-4cfb-aeab-ec325b434a72', 'I50.42 Chronic combined systolic and diastolic heart failure = I50.42.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ab0aa474-d160-4c38-bdfd-7300bb1abac6', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 63, 'A patient has hypertensive urgency. She is admitted to HH for SN monitoring and medication adjustment. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fc31884-b875-442a-9f30-94a14b145311', 'ab0aa474-d160-4c38-bdfd-7300bb1abac6', 0, 'I16.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3c8ff63-e7f7-495a-abbf-8644cc584cf6', 'ab0aa474-d160-4c38-bdfd-7300bb1abac6', 1, 'I16.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bcfd1ad-e31c-4d65-b31f-99f5efd95303', 'ab0aa474-d160-4c38-bdfd-7300bb1abac6', 2, 'I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b6fd3d9-8797-46f1-aac7-c4fabc94cba8', 'ab0aa474-d160-4c38-bdfd-7300bb1abac6', 3, 'I16.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ab0aa474-d160-4c38-bdfd-7300bb1abac6', '4fc31884-b875-442a-9f30-94a14b145311', 'I16.0 Hypertensive urgency = I16.0. This is distinct from I10 (essential HTN).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a5897c4e-b2d1-472a-b896-296dcd084db0', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 64, 'A patient has a left bundle branch block and atrial flutter. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b24bf0d-4cc0-4c7c-9b2a-0e770b08ce06', 'a5897c4e-b2d1-472a-b896-296dcd084db0', 0, 'I45.7, I48.92');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89b448de-0d51-4446-9293-42460240fc83', 'a5897c4e-b2d1-472a-b896-296dcd084db0', 1, 'I44.7, I48.92');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('faec3f4c-4070-4d20-80a4-edc5dc59f618', 'a5897c4e-b2d1-472a-b896-296dcd084db0', 2, 'I44.7, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0880d7b3-9575-4396-982a-890060c39a5b', 'a5897c4e-b2d1-472a-b896-296dcd084db0', 3, 'I45.7, I48.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a5897c4e-b2d1-472a-b896-296dcd084db0', '89b448de-0d51-4446-9293-42460240fc83', 'I44.7, I48.92 Left bundle branch block = I44.7. Atrial flutter, unspecified = I48.92.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('297b2df2-14dd-4163-a749-44a834bc1b8c', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 65, 'A patient has documented “acute pulmonary edema due to left heart failure.” What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('117830e3-6b94-49ed-8c3f-17a004439fcd', '297b2df2-14dd-4163-a749-44a834bc1b8c', 0, 'J81.0, I50.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e62411f-fae0-4c59-9d71-fe7263d20f8c', '297b2df2-14dd-4163-a749-44a834bc1b8c', 1, 'I50.1, J81.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29f5ab3d-c2c1-430b-a2f6-2b1562bd5e39', '297b2df2-14dd-4163-a749-44a834bc1b8c', 2, 'I50.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6dee0bc9-79ab-46e1-90af-7d5cc6b02f23', '297b2df2-14dd-4163-a749-44a834bc1b8c', 3, 'J81.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('297b2df2-14dd-4163-a749-44a834bc1b8c', '117830e3-6b94-49ed-8c3f-17a004439fcd', 'J81.0, I50.1 Acute pulmonary edema = J81.0. Left heart failure = I50.1. Both are coded per the “code also” instruction.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('501310cb-e50d-4b9f-bec0-af386a6631ac', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 66, 'A home health patient has deep vein thrombosis of the right common iliac vein, chronic. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('921caa52-de90-415c-b285-13c315e265e8', '501310cb-e50d-4b9f-bec0-af386a6631ac', 0, 'I82.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('399c53dc-2413-421a-8376-8bfc8169437c', '501310cb-e50d-4b9f-bec0-af386a6631ac', 1, 'I82.711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76698331-dfb1-46a0-a8f5-135c5bdc2245', '501310cb-e50d-4b9f-bec0-af386a6631ac', 2, 'I82.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88ffd2f1-8dde-404b-9fc1-ee61f0ca6819', '501310cb-e50d-4b9f-bec0-af386a6631ac', 3, 'I82.591');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('501310cb-e50d-4b9f-bec0-af386a6631ac', '399c53dc-2413-421a-8376-8bfc8169437c', 'I82.711 Chronic DVT of right common iliac vein = I82.711. I82.211 is the acute form.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('90025d7d-6c06-4fc2-a037-23a5f13c1c97', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 67, 'A patient is being treated for acute pulmonary embolism with a saddle embolus. She is on heparin transitioning to warfarin. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('482538a3-28ba-4b1c-aa92-689c9ae9b80c', '90025d7d-6c06-4fc2-a037-23a5f13c1c97', 0, 'I26.02, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b462cd4-5bbf-44b1-9412-3559f5cec502', '90025d7d-6c06-4fc2-a037-23a5f13c1c97', 1, 'I26.92, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0dba109d-3b20-41e6-9a4a-38d0dda64d8b', '90025d7d-6c06-4fc2-a037-23a5f13c1c97', 2, 'I26.99, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09dd1596-52cd-4717-9a56-d094f8da5f86', '90025d7d-6c06-4fc2-a037-23a5f13c1c97', 3, 'I26.01, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('90025d7d-6c06-4fc2-a037-23a5f13c1c97', '482538a3-28ba-4b1c-aa92-689c9ae9b80c', 'I26.02, Z79.01 PE with saddle embolus = I26.02. Z79.01 = long-term anticoagulant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0a2fe9dc-ea2e-471e-8d54-0f66993f0168', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 68, 'A patient has Type 1 diabetes with proliferative diabetic retinopathy, bilateral, with documented macular edema. What is the code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f85dff3-b50b-4fed-aee0-78ad214acce8', '0a2fe9dc-ea2e-471e-8d54-0f66993f0168', 0, 'E10.3511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a58748a-149b-4706-9c70-269c47081b1d', '0a2fe9dc-ea2e-471e-8d54-0f66993f0168', 1, 'E10.3513');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0868e163-26b6-46bd-90f8-02274d5ee7a7', '0a2fe9dc-ea2e-471e-8d54-0f66993f0168', 2, 'E10.3593');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f923c588-c36d-431d-9317-aa17bb07960b', '0a2fe9dc-ea2e-471e-8d54-0f66993f0168', 3, 'E10.3213');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0a2fe9dc-ea2e-471e-8d54-0f66993f0168', '2a58748a-149b-4706-9c70-269c47081b1d', 'E10.3513 Type 1 DM with proliferative diabetic retinopathy, bilateral, with macular edema = E10.3513.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ddf76b34-361b-4fe5-98d0-ca54693a5318', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 69, 'A patient has hypothyroidism on levothyroxine. She also has hyperlipidemia. Both are stable. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('18564c7c-acbb-418f-86f8-849f73b1d220', 'ddf76b34-361b-4fe5-98d0-ca54693a5318', 0, 'E03.9, E78.5, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29b449c2-5fa5-4d7e-b886-028449ecc424', 'ddf76b34-361b-4fe5-98d0-ca54693a5318', 1, 'E03.9, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddce41c6-9e76-49b2-a3bd-0346ee65d88e', 'ddf76b34-361b-4fe5-98d0-ca54693a5318', 2, 'E03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5f8a9a7-680c-4dd0-8890-039b9ace9a7a', 'ddf76b34-361b-4fe5-98d0-ca54693a5318', 3, 'E03.9, E78.00');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ddf76b34-361b-4fe5-98d0-ca54693a5318', '18564c7c-acbb-418f-86f8-849f73b1d220', 'E03.9, E78.5, Z79.899 Hypothyroidism = E03.9. Hyperlipidemia = E78.5. Z79.899 = long-term drug therapy (levothyroxine).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc63c422-8b31-4d9f-9251-4a37504ce4db', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 70, 'A patient is admitted to HH for SN management of Addison’s disease (primary adrenal insufficiency) in crisis. What is the code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce722a73-5137-4832-91ac-aae2dc6a084e', 'cc63c422-8b31-4d9f-9251-4a37504ce4db', 0, 'E27.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38ba99ea-6b7f-4f8d-8335-aeb392ea3e62', 'cc63c422-8b31-4d9f-9251-4a37504ce4db', 1, 'E27.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfec2970-3b51-4aaf-a454-da3624e10654', 'cc63c422-8b31-4d9f-9251-4a37504ce4db', 2, 'E27.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef993e6a-5cd7-4331-8eec-b7e560aee213', 'cc63c422-8b31-4d9f-9251-4a37504ce4db', 3, 'E27.2, E27.40');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cc63c422-8b31-4d9f-9251-4a37504ce4db', '38ba99ea-6b7f-4f8d-8335-aeb392ea3e62', 'E27.2 (Addisonian crisis) is the specific, correct code for an acute adrenal crisis — a life-threatening exacerbation of adrenal insufficiency requiring urgent management, which is the documented reason for this SN admission. E27.1 (primary adrenocortical insufficiency, i.e., Addison''s disease in its stable/chronic state) would under-code the documented acute crisis — it describes the underlying chronic condition, not the acute decompensation actually being managed here. E27.40 (unspecified adrenocortical insufficiency) is both less specific and doesn''t capture the crisis state at all. Coding both E27.2 and E27.40 together would be redundant and internally inconsistent — E27.2 already fully specifies both the primary etiology and the acute crisis state in one code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f353db3-3041-430f-af52-5f3dc0a94056', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 71, 'A patient has documented syndrome of inappropriate ADH secretion (SIADH) causing hyponatremia. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0977681-a7a4-414b-89c5-203191c691a1', '0f353db3-3041-430f-af52-5f3dc0a94056', 0, 'E22.2, E87.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3476647d-f0ba-4b69-9648-4976d43f8316', '0f353db3-3041-430f-af52-5f3dc0a94056', 1, 'E87.1, E22.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34b6e64e-3eb4-4b57-b275-491b4c9f93b5', '0f353db3-3041-430f-af52-5f3dc0a94056', 2, 'E22.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7de687af-a31f-4c12-8fce-49c02e426368', '0f353db3-3041-430f-af52-5f3dc0a94056', 3, 'E87.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0f353db3-3041-430f-af52-5f3dc0a94056', 'd0977681-a7a4-414b-89c5-203191c691a1', 'E22.2, E87.1 SIADH = E22.2. Hyponatremia = E87.1 (coded additionally per “code also” note).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e15ec7f6-0ea1-4ef2-b706-217557595629', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 72, 'A patient with schizophrenia (paranoid type) is receiving HH for SN psychiatric nursing. She is stable on medication. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32fd3f5e-d91c-4058-a432-c01d27d2a84a', 'e15ec7f6-0ea1-4ef2-b706-217557595629', 0, 'F20.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('209b3cb0-2406-4dbc-9134-a9e757c1feae', 'e15ec7f6-0ea1-4ef2-b706-217557595629', 1, 'F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee0afa63-6f9e-4102-84a7-d30afe85a065', 'e15ec7f6-0ea1-4ef2-b706-217557595629', 2, 'F20.0, Z79.899');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7283fde1-e02a-41e1-bee1-793c248889fd', 'e15ec7f6-0ea1-4ef2-b706-217557595629', 3, 'F23');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e15ec7f6-0ea1-4ef2-b706-217557595629', '32fd3f5e-d91c-4058-a432-c01d27d2a84a', 'F20.0 (paranoid schizophrenia) is the specific, physician-diagnosed subtype — being clinically stable on medication doesn''t change the underlying diagnosis or downgrade it to something less specific; stability reflects current control, not resolution. F20.9 (schizophrenia, unspecified subtype) would under-code the documented "paranoid type" specificity when the more precise code is available and matches. Adding Z79.899 (other long-term drug therapy) is unnecessary here, since the stem doesn''t specify a distinct maintenance medication requiring separate long-term-therapy documentation — the psychiatric nursing focus is standard follow-up care, not therapeutic drug monitoring. F23 (brief psychotic disorder) is a different, time-limited diagnosis (by definition lasting under a month) and doesn''t match this patient''s established, ongoing schizophrenia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('de5e1121-cfbe-4a79-8c4b-88129f0321c7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 73, 'A patient has documented obstructive sleep apnea. She uses a CPAP machine at home. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a96129d-6d56-4e2a-9d7e-f4474a558bb4', 'de5e1121-cfbe-4a79-8c4b-88129f0321c7', 0, 'G47.33, Z99.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f5a0ca0-d488-479f-a852-551c11044d23', 'de5e1121-cfbe-4a79-8c4b-88129f0321c7', 1, 'G47.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6683b2ed-809b-4ac2-bdb7-87a064dcd6c8', 'de5e1121-cfbe-4a79-8c4b-88129f0321c7', 2, 'G47.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eac42564-a65f-4c68-9f2d-cef8324559c5', 'de5e1121-cfbe-4a79-8c4b-88129f0321c7', 3, 'G47.33, Z99.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('de5e1121-cfbe-4a79-8c4b-88129f0321c7', '3a96129d-6d56-4e2a-9d7e-f4474a558bb4', 'G47.33, Z99.89 Obstructive sleep apnea = G47.33. CPAP dependence = Z99.89 (dependence on other enabling machines and devices).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89db8604-0bd7-4260-a432-5ebc849b3e8d', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 74, 'A patient has a chronic right subdural hematoma (non-traumatic). She is being monitored in HH. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66c4be03-536b-43b3-a707-8a861b241ee8', '89db8604-0bd7-4260-a432-5ebc849b3e8d', 0, 'I62.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4dbf0cbe-1323-4574-bc2a-80980437b14b', '89db8604-0bd7-4260-a432-5ebc849b3e8d', 1, 'S06.5X1D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2741156d-dd98-4d34-9f0c-b75748bfadbb', '89db8604-0bd7-4260-a432-5ebc849b3e8d', 2, 'I62.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78d38f16-ed20-4e2f-9556-503c6567792c', '89db8604-0bd7-4260-a432-5ebc849b3e8d', 3, 'S06.5X0S');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('89db8604-0bd7-4260-a432-5ebc849b3e8d', '66c4be03-536b-43b3-a707-8a861b241ee8', 'I62.01 Non-traumatic chronic subdural hematoma = I62.01. Traumatic codes (S06) are for injury-caused hematomas.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97a0079a-7a7d-4111-92d5-966fe2649c98', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 75, 'For OASIS, which of the following is TRUE about M1033/M1035 (risk for hospitalization)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad8754d6-6ced-4be2-9f93-63cf72455448', '97a0079a-7a7d-4111-92d5-966fe2649c98', 0, 'The items assess only clinical risk factors');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f79c86b-c8ed-4f30-8c3b-4ff548f7c3c5', '97a0079a-7a7d-4111-92d5-966fe2649c98', 1, 'The items assess clinical, functional, and behavioral risk factors for hospitalization');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1c3df44-0439-40dd-953c-753134cda4af', '97a0079a-7a7d-4111-92d5-966fe2649c98', 2, 'The items are completed only at SOC');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b0b9350-5fd8-4919-bda0-8e6983c58da3', '97a0079a-7a7d-4111-92d5-966fe2649c98', 3, 'The items do not affect payment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('97a0079a-7a7d-4111-92d5-966fe2649c98', '0f79c86b-c8ed-4f30-8c3b-4ff548f7c3c5', 'The hospitalization risk items assess clinical, functional, and behavioral risk factors.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 76, 'Per OASIS, when is a Discharge assessment required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('040d5002-7022-46f5-99f0-c13610ab4cc0', '40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', 0, 'On every visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('211b8765-3d51-40eb-8500-035666f5a443', '40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', 1, 'When the patient is formally discharged from the home health agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb9041cc-467e-43c7-92b0-ff434f95e4b4', '40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', 2, 'Only when the patient is transferred to a hospital');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a396cc4b-e642-417c-8343-71547bb93610', '40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', 3, 'At the end of each 60-day episode');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('40bbd7f3-6ec1-46d7-8902-9ac4ce6c385a', '211b8765-3d51-40eb-8500-035666f5a443', 'Discharge OASIS is required when the patient is formally discharged from home health agency services.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 77, 'A patient’s OASIS shows M1021 as I50.22 (chronic systolic heart failure). During the episode, the patient is also diagnosed with pneumonia and COPD. Should M1021 change?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f6a9595-3b56-4878-9894-7520f2b99e9b', '1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', 0, 'No — M1021 remains the CHF unless the pneumonia becomes the chief reason for home health services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9605337c-af4c-4df6-9ab3-e6fd279b2328', '1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', 1, 'Yes — always update to the most acute condition');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3773c5de-ecfd-4ee4-b87e-2e586967bec0', '1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', 2, 'No — M1021 never changes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9c06ef79-c639-449c-ab50-6367ec25e78a', '1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', 3, 'Yes — pneumonia is always higher priority');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1cdc09a1-e4d9-49a2-a45e-09d2a9aa9803', '4f6a9595-3b56-4878-9894-7520f2b99e9b', 'M1021 remains the CHF unless the pneumonia becomes the primary reason for skilled services. Simply having a new diagnosis does not automatically change M1021.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 78, 'For M1023 (secondary diagnoses), what is the maximum number of secondary diagnoses that can be reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79019fe1-d026-4040-b359-a409dfe4e70b', '9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c96196f-f29b-4f21-8969-5719227c6cf9', '9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ffa47b41-812a-494e-b901-d61dd4dfbf4d', '9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f72a58e-2dab-4fec-8ac8-d8c9f7bad1fa', '9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', 3, 'No limit');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9cb4701f-8d9b-4c7c-97e9-9a5867eedf91', '4c96196f-f29b-4f21-8969-5719227c6cf9', '5 M1023 allows up to 5 secondary diagnoses (M1023a through M1023e) plus M1025 (optional payment diagnoses).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('46bd8815-809d-4ef4-baed-5deea92ded22', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 79, 'A patient has a V-code (external cause code) — can it be listed in M1023?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a7c7c2d-2a85-4543-8cd9-d0b912800417', '46bd8815-809d-4ef4-baed-5deea92ded22', 0, 'Yes — external cause codes can be listed in M1023');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6ce75ff-5d0e-4fd1-9aae-32b4282760e8', '46bd8815-809d-4ef4-baed-5deea92ded22', 1, 'No — external cause codes are never listed in M1023');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51321e1c-7c82-4ded-8747-819f0e4d2794', '46bd8815-809d-4ef4-baed-5deea92ded22', 2, 'Only activity codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('184ddba9-053a-4e40-b1d7-114f6a332a35', '46bd8815-809d-4ef4-baed-5deea92ded22', 3, 'Only place of occurrence codes');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('46bd8815-809d-4ef4-baed-5deea92ded22', '1a7c7c2d-2a85-4543-8cd9-d0b912800417', 'External cause codes may be listed in M1023 secondary diagnosis fields when they add relevant clinical information.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('04761642-d3e4-4b24-b133-b29d082afebf', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 80, 'A patient is admitted to home health for wound care. Her M1021 is L89.154 (Stage 4 sacral PU). She also has diabetes, HTN, and COPD. The wound heals completely during the episode. What happens to M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c6d17a4-0d68-440b-bb56-fa1c8c14a5ee', '04761642-d3e4-4b24-b133-b29d082afebf', 0, 'M1021 remains L89.154 through the episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecf9aac9-2754-43ff-ab19-1546b58a3dd0', '04761642-d3e4-4b24-b133-b29d082afebf', 1, 'M1021 should be changed to reflect the next most relevant condition');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27c34b32-de8b-49f7-b1aa-98cd1c1213ff', '04761642-d3e4-4b24-b133-b29d082afebf', 2, 'M1021 is deleted with no replacement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a97451b7-80fd-4ada-b8cc-76d28f759b1a', '04761642-d3e4-4b24-b133-b29d082afebf', 3, 'The episode must be discharged when the wound heals');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('04761642-d3e4-4b24-b133-b29d082afebf', 'ecf9aac9-2754-43ff-ab19-1546b58a3dd0', 'When the primary wound heals, M1021 should be updated to the next most clinically relevant condition driving the home health plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f21accce-00c7-4d05-97f6-b6d63797b95c', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 81, 'Per OASIS guidance, for M1028 (active diagnoses, comorbidities, and co-existing conditions), which conditions should be reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46a3ff7a-007b-4a64-be03-4cac46f7c86e', 'f21accce-00c7-4d05-97f6-b6d63797b95c', 0, 'Only conditions requiring active treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73658d11-2a98-469c-a2f5-df8dcd813457', 'f21accce-00c7-4d05-97f6-b6d63797b95c', 1, 'All conditions that coexist at the time of assessment and have the potential to affect the patient’s responsiveness to treatment, rate of recovery, or need for skilled services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f745484d-27b8-4c33-9936-aeb4494a4f13', 'f21accce-00c7-4d05-97f6-b6d63797b95c', 2, 'Only the top 3 diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36c87c60-8d35-49b6-ae3a-0e074721fab0', 'f21accce-00c7-4d05-97f6-b6d63797b95c', 3, 'Only conditions that affect OASIS scoring');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f21accce-00c7-4d05-97f6-b6d63797b95c', '73658d11-2a98-469c-a2f5-df8dcd813457', 'All conditions that coexist at the time of assessment and could affect treatment response, recovery rate, or need for skilled services should be reported.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 82, 'A patient has urinary incontinence documented as “mixed (stress and urge).” What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fce1e44b-d333-4132-80f8-b12134df399b', '20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 0, 'N39.46');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0df6148-2718-4acb-aaf3-7abf4ae8885b', '20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 1, 'N39.3, N39.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('366cb2b7-fe42-4f42-bddf-0ab971438f85', '20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 2, 'N39.498');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fb3e14b-55a7-4058-bfe0-3bb08e3b6f24', '20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 3, 'R32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('20f7f65c-efab-4c4f-85f8-fdd1f3cdfec7', 'fce1e44b-d333-4132-80f8-b12134df399b', 'N39.46 Mixed incontinence (stress and urge) = N39.46. This combination code captures both types.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e9f89b4-9763-447b-8828-d0d243332d36', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 83, 'A patient has documented “neurogenic bowel” due to spinal cord injury. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75fb0c26-0b66-499d-ba8a-4f1502a371e0', '0e9f89b4-9763-447b-8828-d0d243332d36', 0, 'K59.2, G95.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecaf77a5-00bb-45fc-9167-a133c9daace0', '0e9f89b4-9763-447b-8828-d0d243332d36', 1, 'K59.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97c80cf5-e0b2-4e4a-92f3-24126f9d1aeb', '0e9f89b4-9763-447b-8828-d0d243332d36', 2, 'N31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d692fe9d-6524-4d75-b95e-da43c4501039', '0e9f89b4-9763-447b-8828-d0d243332d36', 3, 'K59.8, G82.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0e9f89b4-9763-447b-8828-d0d243332d36', '75fb0c26-0b66-499d-ba8a-4f1502a371e0', 'K59.2, G95.89 Neurogenic bowel = K59.2 (neurogenic bowel, not elsewhere classified). The underlying spinal cord condition provides the etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb233158-118a-44f3-9556-85f29c8b0a81', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 84, 'A home health patient has a documented DVT of the right leg that occurred during a recent hospitalization. She is now home on anticoagulants. Is this a hospital-acquired condition that affects HH coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5432070-70d9-464b-8ab4-ad789bd7864f', 'eb233158-118a-44f3-9556-85f29c8b0a81', 0, 'Yes — use a code indicating hospital-acquired');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc653ff0-a136-4ca5-8943-6018801f93d0', 'eb233158-118a-44f3-9556-85f29c8b0a81', 1, 'No — in home health, the DVT is coded as an active condition regardless of where it originated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd3621f7-43b2-40d6-aa13-9d9dfe464209', 'eb233158-118a-44f3-9556-85f29c8b0a81', 2, 'Only if it was documented as an adverse event');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee62a39c-a957-4816-8c2c-bd16831cc087', 'eb233158-118a-44f3-9556-85f29c8b0a81', 3, 'Hospital-acquired conditions are not coded in home health');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eb233158-118a-44f3-9556-85f29c8b0a81', 'bc653ff0-a136-4ca5-8943-6018801f93d0', 'In home health, the DVT is coded as an active condition regardless of where it originated. There is no special “hospital-acquired” modifier in HH coding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('057d6911-a96f-4d75-9edf-681dcbacd583', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 85, 'A patient has bilateral cataracts and macular degeneration (dry, bilateral). She is receiving HH for medication management (not eye-related). How should the eye conditions be coded as comorbidities?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51a348ce-6465-479a-90f6-f50827a5b646', '057d6911-a96f-4d75-9edf-681dcbacd583', 0, 'H25.13, H35.3113');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae1b2772-1e20-49b7-a8ac-3344bcfbd649', '057d6911-a96f-4d75-9edf-681dcbacd583', 1, 'H25.9, H35.3193');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fde6d9a4-0ccd-4fb3-bb25-f47ef65014f5', '057d6911-a96f-4d75-9edf-681dcbacd583', 2, 'Do not code — not related to HH services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4d32b82-2c26-49cb-beec-fd8b29dd2229', '057d6911-a96f-4d75-9edf-681dcbacd583', 3, 'H25.813, H35.3113');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('057d6911-a96f-4d75-9edf-681dcbacd583', '51a348ce-6465-479a-90f6-f50827a5b646', 'H25.13, H35.3113 Even if not the reason for HH, comorbidities affecting the patient should be coded. Bilateral cataracts = H25.13. Dry macular degeneration, bilateral = H35.3113.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a05f353d-d79e-461b-9f55-14b08398b611', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 86, 'A patient is admitted to HH for wound care. She has MRSA of the nares (colonization, no active infection). How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31d8cca4-64d6-4326-9dec-ee7d22e5e9bf', 'a05f353d-d79e-461b-9f55-14b08398b611', 0, 'B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ffcbcdb-3f6c-4480-a181-c9a9ed81f107', 'a05f353d-d79e-461b-9f55-14b08398b611', 1, 'Z22.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aaf5d503-9dcc-4b91-8af4-515f915d09a3', 'a05f353d-d79e-461b-9f55-14b08398b611', 2, 'A49.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('200a2a84-06e9-4c17-83e1-d03f71752807', 'a05f353d-d79e-461b-9f55-14b08398b611', 3, 'Do not code — colonization without infection is not coded');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a05f353d-d79e-461b-9f55-14b08398b611', '2ffcbcdb-3f6c-4480-a181-c9a9ed81f107', 'Z22.322 MRSA colonization (carrier status) without active infection = Z22.322.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 87, 'A patient has type 2 DM with documented gastroparesis. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('714148bf-da5c-49ce-ab50-b50d60d1bffc', 'dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', 0, 'E11.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad48fd4c-91ed-4d02-8e85-c9e509694931', 'dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', 1, 'E11.9, K31.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21e77207-9605-4bda-8b8e-a77c9df68df7', 'dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', 2, 'K31.84, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ddb87e0-479b-4838-bc9d-36482be4b91f', 'dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', 3, 'E11.43, K31.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dfdc5efc-bda4-4daa-b9b4-503dfe8c4145', '714148bf-da5c-49ce-ab50-b50d60d1bffc', 'E11.43 Type 2 DM with diabetic gastroparesis = E11.43. The “with” convention presumes the link. This combination code includes both.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb97752f-b078-475f-8719-08efb39a6867', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 88, 'A patient has chronic pancreatitis due to chronic alcoholism. She is admitted for SN pain management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('883b49ca-8d72-415b-af1c-c283d7569c75', 'eb97752f-b078-475f-8719-08efb39a6867', 0, 'K86.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4575a94e-1aa7-4c53-b240-a1012ab7b1fb', 'eb97752f-b078-475f-8719-08efb39a6867', 1, 'K86.1, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66155b76-1313-49b0-934a-b101cb68303f', 'eb97752f-b078-475f-8719-08efb39a6867', 2, 'K86.0, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('748e1cbe-ffa3-4d87-919e-c3df99da4536', 'eb97752f-b078-475f-8719-08efb39a6867', 3, 'K85.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eb97752f-b078-475f-8719-08efb39a6867', '883b49ca-8d72-415b-af1c-c283d7569c75', 'K86.0 Alcohol-induced chronic pancreatitis = K86.0. This combination code includes the alcoholic etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6188e3a4-a4da-49a0-9b81-7e6b9117789d', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 89, 'A patient has documented esophageal varices with bleeding due to portal hypertension from alcoholic cirrhosis. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e48aa987-945c-4f74-8c37-5d265cf13eff', '6188e3a4-a4da-49a0-9b81-7e6b9117789d', 0, 'I85.11, K70.30, K76.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cdf3aca1-9b7b-4a5c-91da-d8d425dd6564', '6188e3a4-a4da-49a0-9b81-7e6b9117789d', 1, 'I85.01, K70.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('946b6a4c-6f9e-42b4-8a21-de6c068863bd', '6188e3a4-a4da-49a0-9b81-7e6b9117789d', 2, 'K70.31, I85.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('545d8860-19d5-4680-b1b9-3a5732bd4c47', '6188e3a4-a4da-49a0-9b81-7e6b9117789d', 3, 'I85.01, K70.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6188e3a4-a4da-49a0-9b81-7e6b9117789d', 'cdf3aca1-9b7b-4a5c-91da-d8d425dd6564', 'I85.01, K70.31 Esophageal varices with bleeding in alcoholic cirrhosis: K70.31 (alcoholic cirrhosis with ascites, or K70.30 without) is coded per “code first” note under I85.01 (esophageal varices with bleeding in diseases classified elsewhere). Verify specific combination per code book.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('770def8f-02cf-4b6a-a2f2-9b2755336afb', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 90, 'A patient has a G-tube for enteral nutrition. She is admitted to HH for G-tube care and feeding management. During a visit, the SN notes the G-tube site is red and has purulent drainage — infection suspected. How should the complication be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e90482fd-8bbc-4475-a77c-6fad3ff82a4b', '770def8f-02cf-4b6a-a2f2-9b2755336afb', 0, 'K94.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2a9fec0-24e0-43af-86a3-c8c5877ec266', '770def8f-02cf-4b6a-a2f2-9b2755336afb', 1, 'T85.79XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8dfbbb7b-2abe-4602-af43-1adeafa0593c', '770def8f-02cf-4b6a-a2f2-9b2755336afb', 2, 'K94.22, T85.79XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29f564f8-4945-4662-bda5-41679d9a73ff', '770def8f-02cf-4b6a-a2f2-9b2755336afb', 3, 'L08.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('770def8f-02cf-4b6a-a2f2-9b2755336afb', 'e90482fd-8bbc-4475-a77c-6fad3ff82a4b', 'K94.22 Infection of gastrostomy = K94.22 (gastrostomy infection). This specific complication code is used for G-tube site infections.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 91, 'A patient has documented reactive arthritis (formerly Reiter’s syndrome) of the right knee. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf59ac6d-abea-4700-af05-66e4bd2b007d', 'b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 0, 'M02.861');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a83f64e-37f6-45b5-b01d-58bccd7b6af8', 'b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 1, 'M02.361');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e63ed88-7ab8-4a30-87be-fdde14ef356a', 'b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 2, 'M02.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f73fb3c-cf1b-4b0f-b662-564faf003fa0', 'b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 3, 'M13.161');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9cb4bd9-f144-42ab-9e60-2258dfc7afb7', 'bf59ac6d-abea-4700-af05-66e4bd2b007d', 'M02.861 Reactive arthritis of right knee = M02.861.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('99926da0-d2a1-42f4-84a3-f8ba95e614cd', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 92, 'A patient has a femoral hernia with obstruction but without gangrene. She is being managed conservatively at home pending surgery. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f521bb61-396e-4c63-832d-efc8f7949a88', '99926da0-d2a1-42f4-84a3-f8ba95e614cd', 0, 'K41.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c12c9761-1749-4e75-9e08-993827677940', '99926da0-d2a1-42f4-84a3-f8ba95e614cd', 1, 'K41.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72f44dc2-70f4-4e7f-ae6a-34aa7d675b0a', '99926da0-d2a1-42f4-84a3-f8ba95e614cd', 2, 'K41.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('960d1347-e5c8-498e-9234-6038465d4a4b', '99926da0-d2a1-42f4-84a3-f8ba95e614cd', 3, 'K40.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('99926da0-d2a1-42f4-84a3-f8ba95e614cd', 'f521bb61-396e-4c63-832d-efc8f7949a88', 'K41.30 Femoral hernia with obstruction without gangrene, unilateral = K41.30.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4313a14a-7902-4c28-b854-92f56fa86974', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 93, 'A patient has chronic obstructive pyelonephritis. She is admitted for IV antibiotic management at home. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b205cca-0dec-4dc1-a747-cf5dedc818d2', '4313a14a-7902-4c28-b854-92f56fa86974', 0, 'N11.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aff0fc77-a024-42d6-92ad-967a1e20f760', '4313a14a-7902-4c28-b854-92f56fa86974', 1, 'N11.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53360f7a-5fa1-46ff-809a-6b641de432e4', '4313a14a-7902-4c28-b854-92f56fa86974', 2, 'N10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67c4901c-a4b4-454d-81a2-77595f470b4a', '4313a14a-7902-4c28-b854-92f56fa86974', 3, 'N11.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4313a14a-7902-4c28-b854-92f56fa86974', '3b205cca-0dec-4dc1-a747-cf5dedc818d2', 'N11.1 (chronic obstructive pyelonephritis) is the specific combination code matching the exact documented diagnosis — pyelonephritis (kidney infection/inflammation) that is both chronic (long-standing, not a new acute infection) and obstructive (caused by a structural blockage impairing urine flow), which is precisely why IV antibiotics are being managed at home for this ongoing condition. N11.0 (nonobstructive reflux-associated chronic pyelonephritis) describes a different mechanism (urine reflux, not obstruction) and is explicitly ruled out by the stem''s "obstructive" documentation. N10 (acute pyelonephritis) is the wrong acuity entirely — this is a chronic, not new acute, condition. N11.8 (other chronic tubulo-interstitial nephritis) is a less specific, catch-all code that doesn''t capture the documented obstructive-pyelonephritis specificity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6889dab1-1281-40b4-9153-b1f73bcaa78e', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 94, 'A home health patient had a kidney stone removed via lithotripsy. She is admitted for SN post-procedure management. She has a ureteral stent in place. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03848349-25b9-455c-8e09-1921c0e5d1ad', '6889dab1-1281-40b4-9153-b1f73bcaa78e', 0, 'Z96.0, Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99220c77-aecf-4109-9861-77c6a3c447cb', '6889dab1-1281-40b4-9153-b1f73bcaa78e', 1, 'Z48.89, N20.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49b2fd28-bd48-42f4-b545-387bd68bf25c', '6889dab1-1281-40b4-9153-b1f73bcaa78e', 2, 'N20.0, T83.192D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1145c5e8-9b6f-47b7-8821-128bb357136b', '6889dab1-1281-40b4-9153-b1f73bcaa78e', 3, 'Z48.89, Z96.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6889dab1-1281-40b4-9153-b1f73bcaa78e', '1145c5e8-9b6f-47b7-8821-128bb357136b', 'Z48.89, Z96.0 Aftercare following lithotripsy = Z48.89 (other surgical aftercare). Z96.0 = presence of urogenital implant (ureteral stent). The stone was removed; N20.0 is no longer coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('69c72ad2-f334-422e-97e0-a62895f72c82', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 95, 'A patient has documented hepatic encephalopathy due to alcoholic cirrhosis. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fec4eccc-7445-49c7-8a7c-6bde850597ce', '69c72ad2-f334-422e-97e0-a62895f72c82', 0, 'K70.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7382a53c-dfb9-44e3-a82c-5befdf81bbe6', '69c72ad2-f334-422e-97e0-a62895f72c82', 1, 'K72.10, K70.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a9430db-2ba3-41a6-8622-b8ccd45640e1', '69c72ad2-f334-422e-97e0-a62895f72c82', 2, 'G92.8, K70.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aeef1150-1a9d-4b6e-8021-d78cce3ed16e', '69c72ad2-f334-422e-97e0-a62895f72c82', 3, 'K70.31, G92.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('69c72ad2-f334-422e-97e0-a62895f72c82', 'fec4eccc-7445-49c7-8a7c-6bde850597ce', 'K70.41 Alcoholic hepatic failure with coma (hepatic encephalopathy) = K70.41. This combination code captures both.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e9171159-1289-40de-83fa-0dfc7146e2b7', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 96, 'A patient is admitted to HH for SN medication management of atrial fibrillation with rapid ventricular response. She is on rate control medication. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('599d9cc3-1af6-4a66-be32-0e9c8e76c797', 'e9171159-1289-40de-83fa-0dfc7146e2b7', 0, 'I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fc9baa8-b4d6-411e-b5a7-f54f4fb793f2', 'e9171159-1289-40de-83fa-0dfc7146e2b7', 1, 'I48.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfdac335-192a-4f91-9c98-57259591c3fd', 'e9171159-1289-40de-83fa-0dfc7146e2b7', 2, 'I48.91, R00.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8cd71a6f-d065-4426-b53e-5c5b2fea8f52', 'e9171159-1289-40de-83fa-0dfc7146e2b7', 3, 'I48.0, R00.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e9171159-1289-40de-83fa-0dfc7146e2b7', '599d9cc3-1af6-4a66-be32-0e9c8e76c797', 'I48.91 Atrial fibrillation, unspecified = I48.91. Rapid ventricular response is a clinical finding integral to the AF and is not separately coded. Specific AF type (paroxysmal, persistent) codes if documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51b72520-6e62-44ed-bcfc-9580864b7818', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 97, 'A patient has documented “pre-sepsis” or “early sepsis.” How should this be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fff3011e-b33f-43b4-9496-5f6d38259fa5', '51b72520-6e62-44ed-bcfc-9580864b7818', 0, 'R65.10 — SIRS without organ dysfunction');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e91bf2cc-5473-4150-9f88-373944bb6f58', '51b72520-6e62-44ed-bcfc-9580864b7818', 1, 'A41.9 — sepsis, unspecified');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb44fd50-7e11-41c0-94e8-b6e31104e959', '51b72520-6e62-44ed-bcfc-9580864b7818', 2, 'Code the documented infection; “pre-sepsis” is not a codeable term — query the physician for clarification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f060745-4f1a-4b38-8d11-8862b54b0e61', '51b72520-6e62-44ed-bcfc-9580864b7818', 3, 'R65.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('51b72520-6e62-44ed-bcfc-9580864b7818', 'cb44fd50-7e11-41c0-94e8-b6e31104e959', '“Pre-sepsis” is not a recognized ICD-10-CM term. Code the documented infection and query the physician for clarification on whether sepsis criteria are met.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4f4ec7c7-f454-491d-99f5-0cdea8975c9f', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 98, 'A patient has chronic pain due to a malignant neoplasm of the pancreas. She is receiving palliative home health care. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('157e1c52-4077-4fa1-a7eb-2a184fee382a', '4f4ec7c7-f454-491d-99f5-0cdea8975c9f', 0, 'G89.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0624061f-5031-4ba2-bd60-d4f8897ec9c3', '4f4ec7c7-f454-491d-99f5-0cdea8975c9f', 1, 'C25.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f94e50f-0937-4642-a9e1-2283f35473bf', '4f4ec7c7-f454-491d-99f5-0cdea8975c9f', 2, 'Z51.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6efd228e-f508-43ae-8716-f973ced82358', '4f4ec7c7-f454-491d-99f5-0cdea8975c9f', 3, 'G89.3, C25.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4f4ec7c7-f454-491d-99f5-0cdea8975c9f', '0624061f-5031-4ba2-bd60-d4f8897ec9c3', 'C25.9 Active pancreatic cancer = C25.9 as M1021. G89.3 (neoplasm-related pain) may be added as secondary. The underlying malignancy is the primary condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dcc9e32a-e92c-4599-ad0c-37f61d6da6be', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 99, 'For OASIS M1800 (grooming), what activities are assessed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f814eab-7d07-4af8-97d0-fee81bccb60b', 'dcc9e32a-e92c-4599-ad0c-37f61d6da6be', 0, 'Only bathing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5bdb33ca-1380-4836-9c84-d9c82c52e5e7', 'dcc9e32a-e92c-4599-ad0c-37f61d6da6be', 1, 'Combing hair, brushing teeth, shaving (males), and applying makeup (females)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df469f0c-4b2d-4b8f-acc2-7010bfc125d5', 'dcc9e32a-e92c-4599-ad0c-37f61d6da6be', 2, 'All ADLs');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ebca03d-d24c-43af-a8ba-f29aeb5ae314', 'dcc9e32a-e92c-4599-ad0c-37f61d6da6be', 3, 'Oral hygiene only');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dcc9e32a-e92c-4599-ad0c-37f61d6da6be', '5bdb33ca-1380-4836-9c84-d9c82c52e5e7', 'M1800 assesses grooming: combing/brushing hair, brushing teeth, shaving (males), and applying makeup (females).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0400a4ce-f34a-4f61-8fbc-292afda5f01b', 'ad0702c1-5849-4c4e-8ad0-6719f57106b3', 100, 'A home health patient has documented “failure to thrive, adult.” She has poor appetite, weight loss, and general debility. What is the ICD-10-CM code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b01641e-1c8b-418c-a18c-5c72c8a5d089', '0400a4ce-f34a-4f61-8fbc-292afda5f01b', 0, 'R62.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88318693-0d48-4023-a472-a4f25ca80c5a', '0400a4ce-f34a-4f61-8fbc-292afda5f01b', 1, 'R53.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e6dd6952-d987-40fd-97eb-ce096930b6e7', '0400a4ce-f34a-4f61-8fbc-292afda5f01b', 2, 'R63.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1052efe-67b0-47a6-8b8f-17ffca28a178', '0400a4ce-f34a-4f61-8fbc-292afda5f01b', 3, 'R64');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0400a4ce-f34a-4f61-8fbc-292afda5f01b', '7b01641e-1c8b-418c-a18c-5c72c8a5d089', 'R62.7 Adult failure to thrive = R62.7. R53.81 = other malaise; R63.6 = underweight; R64 = cachexia.');

-- ---------- Paper 6: BCHH-C Practice Paper 6 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('208962db-1b06-44b8-a7da-683825ef9ac7', 'bchhc-practice-6', 'BCHH-C Practice Paper 6', 'bchhc', ARRAY['Comprehensive Simulation', 'All Domains']::TEXT[], 100, 'standard', true, 6);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('024c7903-5503-4328-b3fc-6a8f5578f0d8', '208962db-1b06-44b8-a7da-683825ef9ac7', 1, 'A 78-year-old is admitted to HH for SN management of new-onset atrial fibrillation with rapid ventricular response. She also has HTN, type 2 DM on metformin, and CKD stage 3. Her physician documents the CKD is NOT related to the diabetes. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('771d212e-6eda-485e-a0ac-34a55738cb53', '024c7903-5503-4328-b3fc-6a8f5578f0d8', 0, 'I48.91, I12.9, N18.3, E11.9, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77fb013f-8d45-4442-8bc2-92e2d1c147c1', '024c7903-5503-4328-b3fc-6a8f5578f0d8', 1, 'I48.91, I10, N18.3, E11.9, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('132f3d4b-c0a1-4d61-8758-96ac22a2d4dc', '024c7903-5503-4328-b3fc-6a8f5578f0d8', 2, 'I48.0, I12.9, N18.30, E11.22, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c732b36-edb3-4cb5-9910-6042dfbda91f', '024c7903-5503-4328-b3fc-6a8f5578f0d8', 3, 'I48.91, I12.9, N18.30, E11.9, Z79.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('024c7903-5503-4328-b3fc-6a8f5578f0d8', '8c732b36-edb3-4cb5-9910-6042dfbda91f', 'I48.91, I12.9, N18.30, E11.9, Z79.84 AF = I48.91. HTN + CKD = I12.9 (presumed relationship) with N18.30. Physician says CKD is NOT related to DM, so E11.9 (without complications) rather than E11.22. Z79.84 = long-term metformin.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bfe4e770-d8b0-428d-9220-5734b40125de', '208962db-1b06-44b8-a7da-683825ef9ac7', 2, 'A patient is admitted to HH for SN wound care of a non-healing right BKA stump. She had the amputation for diabetic gangrene (type 2 DM). She is on insulin. The wound shows exposed bone. What is the correct coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('849e38de-a385-4c5e-ba8e-e742b7baa291', 'bfe4e770-d8b0-428d-9220-5734b40125de', 0, 'T87.31, E11.52, Z89.511, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1304ba24-16c8-4768-b527-0ab62b6626cc', 'bfe4e770-d8b0-428d-9220-5734b40125de', 1, 'Z47.81, E11.52, Z89.511, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7621db2e-ffd9-4901-a1e2-41c30f99962f', 'bfe4e770-d8b0-428d-9220-5734b40125de', 2, 'E11.52, T87.31, Z89.511, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfe9df14-1dad-47f2-8a0e-7cce2024b4ab', 'bfe4e770-d8b0-428d-9220-5734b40125de', 3, 'T87.31, E11.621, Z89.511, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bfe4e770-d8b0-428d-9220-5734b40125de', '849e38de-a385-4c5e-ba8e-e742b7baa291', 'T87.31, E11.52, Z89.511, Z79.4 Non-healing BKA stump = T87.31 (complication of amputation stump, dehiscence/non-healing). DM with diabetic PVD/gangrene = E11.52. Z89.511 = acquired absence below knee, right. Z79.4 = insulin in type 2 DM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10bc6166-b8d6-49cb-91ab-f5a6a3d06786', '208962db-1b06-44b8-a7da-683825ef9ac7', 3, 'A patient has a Stage 3 pressure ulcer of the left hip and a venous stasis ulcer of the right lower leg (breakdown of skin only). She also has varicose veins with inflammation. For OASIS, how many of each wound type?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a054ba62-84fb-4da9-a490-088a4e14a5fb', '10bc6166-b8d6-49cb-91ab-f5a6a3d06786', 0, '1 pressure ulcer, 1 stasis ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c0324b44-ef58-4dd2-bdc2-893a67ea4f6c', '10bc6166-b8d6-49cb-91ab-f5a6a3d06786', 1, '2 pressure ulcers');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aee3026e-1bf5-4f5b-9dcd-5c02a378d7ab', '10bc6166-b8d6-49cb-91ab-f5a6a3d06786', 2, '2 stasis ulcers');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c373b3ad-414d-4d0a-830a-f92bfdfd646d', '10bc6166-b8d6-49cb-91ab-f5a6a3d06786', 3, '1 pressure ulcer, 0 stasis ulcers');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('10bc6166-b8d6-49cb-91ab-f5a6a3d06786', 'a054ba62-84fb-4da9-a490-088a4e14a5fb', '1 pressure ulcer, 1 stasis ulcer The PU goes under OASIS M1311 (pressure ulcer items) and the stasis ulcer goes under M1330 (stasis ulcer items). Each is counted in its appropriate category.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db1bad03-e523-45c5-84eb-212f023ef2cc', '208962db-1b06-44b8-a7da-683825ef9ac7', 4, 'A patient is admitted for management of acute on chronic combined systolic and diastolic heart failure. She has an AICD (implantable cardioverter-defibrillator) in place. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('325cc4c5-2798-4bd5-866d-0b05817a4c2a', 'db1bad03-e523-45c5-84eb-212f023ef2cc', 0, 'I50.41, Z95.810');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bed19b1d-dc64-4ff7-9828-4c4e7a14c6ea', 'db1bad03-e523-45c5-84eb-212f023ef2cc', 1, 'I50.43, Z95.810');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('012ee710-f362-426b-92a6-d0fca2bcc00c', 'db1bad03-e523-45c5-84eb-212f023ef2cc', 2, 'I50.43, Z95.810, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dadb8cda-8cc7-4f85-b301-dfe9ab727d43', 'db1bad03-e523-45c5-84eb-212f023ef2cc', 3, 'I50.42, Z95.810');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('db1bad03-e523-45c5-84eb-212f023ef2cc', 'bed19b1d-dc64-4ff7-9828-4c4e7a14c6ea', 'I50.43, Z95.810 Acute on chronic combined systolic and diastolic HF = I50.43. Z95.810 = presence of AICD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bef077e0-f941-46e5-a5c0-a71881071953', '208962db-1b06-44b8-a7da-683825ef9ac7', 5, 'A patient is being treated for Gram-negative sepsis due to a UTI. She has acute kidney injury as organ dysfunction. What is the correct sequencing?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51c095f0-5879-4496-9c13-e84eed2b67bd', 'bef077e0-f941-46e5-a5c0-a71881071953', 0, 'A41.50, N39.0, R65.20, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40edd037-cd09-447c-8d0f-32b7e2e52e44', 'bef077e0-f941-46e5-a5c0-a71881071953', 1, 'A41.50, R65.20, N17.9, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d7e9db1-3af9-4a1d-b45e-fa9daa8c2994', 'bef077e0-f941-46e5-a5c0-a71881071953', 2, 'N39.0, A41.50, R65.20, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce9cf9e7-649e-4aed-8fc7-5580cdce61bc', 'bef077e0-f941-46e5-a5c0-a71881071953', 3, 'R65.20, A41.50, N17.9, N39.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bef077e0-f941-46e5-a5c0-a71881071953', '51c095f0-5879-4496-9c13-e84eed2b67bd', 'A41.50, N39.0, R65.20, N17.9 Sepsis code first (A41.50), then the underlying infection (N39.0, UTI), then R65.20 (severe sepsis), then the organ dysfunction (N17.9, AKI). Per guidelines, severe sepsis (R65.2-) must be coded as an additional code with sepsis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c8506806-e12d-48bf-849e-4ca64ac2e641', '208962db-1b06-44b8-a7da-683825ef9ac7', 6, 'Which of the following is TRUE about “code first” and “use additional code” notes?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('557170a5-e90f-4b6b-9f17-c9d7dc03ee49', 'c8506806-e12d-48bf-849e-4ca64ac2e641', 0, '“Code first” is optional guidance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02130d8e-4a1e-4eeb-8804-6f4d71d280ba', 'c8506806-e12d-48bf-849e-4ca64ac2e641', 1, '“Use additional code” is mandatory in all cases');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9baac02b-a771-4a82-83b3-eb38e863c138', 'c8506806-e12d-48bf-849e-4ca64ac2e641', 2, 'These are sequencing instructions — “code first” indicates the underlying condition should be sequenced before the manifestation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5a28d35-cc90-43a0-a778-9182bbd6cb28', 'c8506806-e12d-48bf-849e-4ca64ac2e641', 3, 'Both codes are optional');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c8506806-e12d-48bf-849e-4ca64ac2e641', '9baac02b-a771-4a82-83b3-eb38e863c138', '“Code first” and “use additional code” are sequencing instructions. The underlying condition (code first) is sequenced before the manifestation (use additional code).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d8a87985-e4ed-49b7-8a49-8ee80de35a72', '208962db-1b06-44b8-a7da-683825ef9ac7', 7, 'A patient has type 1 DM with diabetic CKD stage 4, proliferative diabetic retinopathy (bilateral), and diabetic polyneuropathy. How many E10 codes are needed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91cc1fae-d94a-4f30-a9f5-4bdfd12f7ff2', 'd8a87985-e4ed-49b7-8a49-8ee80de35a72', 0, '1 — use E10.9 to cover all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ac9a044-6525-4625-95b2-2e8ce352d415', 'd8a87985-e4ed-49b7-8a49-8ee80de35a72', 1, '2 — one for CKD and one for the most severe complication');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('082377b0-538c-466b-b95f-b010dfcb37b0', 'd8a87985-e4ed-49b7-8a49-8ee80de35a72', 2, '3 — one for each body system involvement (E10.22, E10.3513, E10.42)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35edfe1a-c2ec-4b22-ac2d-efa5fa4d3dc0', 'd8a87985-e4ed-49b7-8a49-8ee80de35a72', 3, '4 — one for each complication plus E10.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d8a87985-e4ed-49b7-8a49-8ee80de35a72', '082377b0-538c-466b-b95f-b010dfcb37b0', '3 Each diabetic complication involving a different body system requires its own E10 code: E10.22 (DM-CKD), E10.3513 (proliferative retinopathy bilateral with macular edema), E10.42 (polyneuropathy).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('16d7b6a8-fb09-4bbd-a56c-344f5a41d368', '208962db-1b06-44b8-a7da-683825ef9ac7', 8, 'A patient is on long-term warfarin for a mechanical mitral valve. Her INR is therapeutic. She is admitted for SN INR monitoring. She has no active bleeding. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aaf9a27e-0f4a-470d-8449-99b60d6090a1', '16d7b6a8-fb09-4bbd-a56c-344f5a41d368', 0, 'Z95.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('137013ea-6e66-46d0-9377-6ba3ab8142a4', '16d7b6a8-fb09-4bbd-a56c-344f5a41d368', 1, 'Z51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aee87a3d-2e17-4580-b1ba-c0e17757604a', '16d7b6a8-fb09-4bbd-a56c-344f5a41d368', 2, 'Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bd102b4-14a9-46b2-a344-4fe13e4814a2', '16d7b6a8-fb09-4bbd-a56c-344f5a41d368', 3, 'I34.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('16d7b6a8-fb09-4bbd-a56c-344f5a41d368', '137013ea-6e66-46d0-9377-6ba3ab8142a4', 'Z51.81 Encounter for therapeutic drug monitoring (INR monitoring) = Z51.81 as M1021. Z95.2 (mechanical valve) and Z79.01 (anticoagulant) are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4c04428b-e370-48fe-afbe-f5c13d772f11', '208962db-1b06-44b8-a7da-683825ef9ac7', 9, 'A patient has a documented “complicated UTI.” The physician does not specify what makes it complicated. How should the coder handle this?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cdab1c54-970f-47bf-8098-ebff1a67c45b', '4c04428b-e370-48fe-afbe-f5c13d772f11', 0, 'Code N39.0 and add a complication code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f39a0cff-7c14-4500-bccb-23564a38a5b1', '4c04428b-e370-48fe-afbe-f5c13d772f11', 1, 'Code N39.0 — “complicated” does not change the code without further specification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6790545-f8bd-4a59-a6c3-c800309084ae', '4c04428b-e370-48fe-afbe-f5c13d772f11', 2, 'Query the physician for the specific complication');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8f5cd1d-5dc3-416d-9a28-71f81131049f', '4c04428b-e370-48fe-afbe-f5c13d772f11', 3, 'Code T83.511A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4c04428b-e370-48fe-afbe-f5c13d772f11', 'b6790545-f8bd-4a59-a6c3-c800309084ae', 'Query the physician “Complicated UTI” requires clarification. The coder should query for specifics (pyelonephritis, obstruction, catheter-related, etc.) before coding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cccafd3d-e232-4cd5-8d57-3b19a12fc40a', '208962db-1b06-44b8-a7da-683825ef9ac7', 10, 'A patient is admitted to HH after right TKR. PT and SN are ordered. Two weeks into the episode, she develops a wound infection of the knee incision. Before the infection, M1021 was Z47.33. What should M1021 be changed to?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('391f49e8-b757-4878-a53f-5d6288302188', 'cccafd3d-e232-4cd5-8d57-3b19a12fc40a', 0, 'Keep Z47.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f50e1f1-0f3e-423e-876b-0c55c253641c', 'cccafd3d-e232-4cd5-8d57-3b19a12fc40a', 1, 'T84.54XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c7b502e-2164-4de2-9179-f0e72bcba2c3', 'cccafd3d-e232-4cd5-8d57-3b19a12fc40a', 2, 'T81.41XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f66fae8f-61d4-481c-9633-1b883b6da7a8', 'cccafd3d-e232-4cd5-8d57-3b19a12fc40a', 3, 'L03.116');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cccafd3d-e232-4cd5-8d57-3b19a12fc40a', '5f50e1f1-0f3e-423e-876b-0c55c253641c', 'T84.54XA New wound infection of a prosthetic joint incision = T84.54XA (infection of internal right knee prosthesis). Active treatment of a new infection = 7th character A. M1021 should be updated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4fbdb421-29e6-4add-ae60-37cec435bfca', '208962db-1b06-44b8-a7da-683825ef9ac7', 11, 'A home health patient has bilateral lower extremity edema, CHF, and CKD. The physician documents the edema is due to the CHF. How is the edema coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13b510c1-dd19-468c-b89f-c6a7b0d35f07', '4fbdb421-29e6-4add-ae60-37cec435bfca', 0, 'R60.0 — code the edema separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67518fe3-86c9-4a80-ad86-711a852c9623', '4fbdb421-29e6-4add-ae60-37cec435bfca', 1, 'Do not code the edema — it is an integral symptom of the CHF');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bcf3d7f3-c1a0-4566-82f2-ce017999418b', '4fbdb421-29e6-4add-ae60-37cec435bfca', 2, 'R60.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c241d8d-eca1-40f8-b566-7fab3b1fd100', '4fbdb421-29e6-4add-ae60-37cec435bfca', 3, 'I50.9, R60.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4fbdb421-29e6-4add-ae60-37cec435bfca', '67518fe3-86c9-4a80-ad86-711a852c9623', 'Do not code the edema separately Edema documented as due to CHF is an integral symptom and is not separately coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e3d3ffd3-8216-43bc-870b-8ec8295184d3', '208962db-1b06-44b8-a7da-683825ef9ac7', 12, 'A patient has a chronic tracheostomy for chronic respiratory failure. She is receiving HH for trach care. She has COPD as the underlying cause. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('68ab9e08-cf1e-44ee-87c3-85261616b151', 'e3d3ffd3-8216-43bc-870b-8ec8295184d3', 0, 'Z43.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('720e6d12-24fd-45d4-9039-bfb4f8199d6d', 'e3d3ffd3-8216-43bc-870b-8ec8295184d3', 1, 'J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9253a12d-01eb-4e36-8a86-8c39d0b09942', 'e3d3ffd3-8216-43bc-870b-8ec8295184d3', 2, 'J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa770054-0018-48e6-b45b-5d158507914f', 'e3d3ffd3-8216-43bc-870b-8ec8295184d3', 3, 'Z93.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e3d3ffd3-8216-43bc-870b-8ec8295184d3', '68ab9e08-cf1e-44ee-87c3-85261616b151', 'Z43.0 Encounter for tracheostomy care = Z43.0 as M1021 when trach care is the primary reason for HH. J96.10 and J44.9 are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2deef1f3-ea22-4306-9e05-2113139ba7c2', '208962db-1b06-44b8-a7da-683825ef9ac7', 13, 'A patient is admitted for SN management of a newly diagnosed PE. She has no prior VTE history. She is started on Eliquis. Two weeks later, repeat CT shows the PE is resolving. Does the PE code change?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e60a4bf-4f55-41a4-a951-f2208a434385', '2deef1f3-ea22-4306-9e05-2113139ba7c2', 0, 'Yes — change to Z86.711 (history)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ceecfbf5-f3ad-48e0-80c1-fb8b946dfa0b', '2deef1f3-ea22-4306-9e05-2113139ba7c2', 1, 'No — keep the PE code while still being treated for it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0c59743-7954-4ef4-8716-bbc33c06f774', '2deef1f3-ea22-4306-9e05-2113139ba7c2', 2, 'Yes — change to I27.82 (chronic PE)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e7014f0-a9ae-4ffe-8514-3e89c482f959', '2deef1f3-ea22-4306-9e05-2113139ba7c2', 3, 'No — but add Z86.711 as secondary');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2deef1f3-ea22-4306-9e05-2113139ba7c2', 'ceecfbf5-f3ad-48e0-80c1-fb8b946dfa0b', 'No — keep the PE code while still being treated As long as the PE is being actively treated (anticoagulation), the acute PE code is maintained. It does not change to history until treatment is complete.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6f95db8b-d2af-4968-8741-e9e561c27878', '208962db-1b06-44b8-a7da-683825ef9ac7', 14, 'A patient has a history of breast cancer (right breast, treated 4 years ago, in remission). She now has a NEW primary breast cancer of the LEFT breast, currently under treatment. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5e5f61f-bad6-43d9-9114-0b74a7de7e2d', '6f95db8b-d2af-4968-8741-e9e561c27878', 0, 'C50.912, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8d3e3b5-1586-4413-a4f9-2ce1dea237b1', '6f95db8b-d2af-4968-8741-e9e561c27878', 1, 'C50.912, C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e35e155-7f36-463a-853f-e1169ea195bf', '6f95db8b-d2af-4968-8741-e9e561c27878', 2, 'C50.912, Z85.3, Z90.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b3edb01-c7f6-4397-9b8a-c01462f42aa3', '6f95db8b-d2af-4968-8741-e9e561c27878', 3, 'Z85.3, C50.912');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6f95db8b-d2af-4968-8741-e9e561c27878', '6e35e155-7f36-463a-853f-e1169ea195bf', 'C50.912, Z85.3, Z90.11 Active left breast cancer = C50.912. Previous right breast cancer = Z85.3 (personal history). Z90.11 = acquired absence of right breast (mastectomy).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('342f93f4-09e9-4526-b41d-bb5885778e59', '208962db-1b06-44b8-a7da-683825ef9ac7', 15, 'A 70-year-old patient fell at home from a standing position and sustained a right hip fracture. She is in HH for PT. She has osteoporosis. The physician documents the fracture is pathological due to osteoporosis. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b52b1d8-f8e0-4029-b4d9-ca82bfafaa63', '342f93f4-09e9-4526-b41d-bb5885778e59', 0, 'S72.001D, W18.30XD, M81.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8efefee1-108a-41f8-b7db-b18558dd8f76', '342f93f4-09e9-4526-b41d-bb5885778e59', 1, 'M80.051D, W18.30XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('17d68798-1061-4dd3-9ce8-de8b13b45a21', '342f93f4-09e9-4526-b41d-bb5885778e59', 2, 'M80.051A, W18.30XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9b8180e-247b-4406-b79d-8e073a053430', '342f93f4-09e9-4526-b41d-bb5885778e59', 3, 'S72.001A, M81.0, W18.30XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('342f93f4-09e9-4526-b41d-bb5885778e59', '8efefee1-108a-41f8-b7db-b18558dd8f76', 'M80.051D, W18.30XD Pathological fracture due to osteoporosis of right femur = M80.051. In HH for PT (routine healing) = 7th character D. External cause = W18.30XD (fall, same level). The combination M80 code includes the osteoporosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', '208962db-1b06-44b8-a7da-683825ef9ac7', 16, 'For OASIS M1021/M1023, when a patient has both a V/W/X/Y code (external cause) and an injury code, which should be M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da5fccae-865b-48e0-bd60-4e1bed7cb028', 'f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', 0, 'The external cause code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ae72287-ea59-46d9-9d5b-24ddd4061b2c', 'f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', 1, 'The injury code — external cause codes can never be M1021');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d072b0d-2ad6-40e4-9e6d-ed39a0478e1f', 'f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', 2, 'Either one');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba9fcf56-7ac2-4e93-844f-a38823aed46c', 'f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', 3, 'The more specific code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f0fdf41e-4f7f-44d4-a4d7-f97a1b3c87db', '4ae72287-ea59-46d9-9d5b-24ddd4061b2c', 'The injury code External cause codes (V/W/X/Y) can never be M1021. The injury code is always primary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ecfdbe76-1f05-47d1-b45d-018be264d126', '208962db-1b06-44b8-a7da-683825ef9ac7', 17, 'A patient is admitted to HH with a PEG tube for dysphagia due to stroke sequelae. The stroke occurred 1 year ago. She is receiving SN for PEG care and nutritional support. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ab49c81-6815-431a-98c9-753b9c650b12', 'ecfdbe76-1f05-47d1-b45d-018be264d126', 0, 'Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb8bbe01-580e-4abd-9897-af5f49b5683d', 'ecfdbe76-1f05-47d1-b45d-018be264d126', 1, 'I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb8d7b26-b84a-49d1-bfef-af1448e953ca', 'ecfdbe76-1f05-47d1-b45d-018be264d126', 2, 'R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ead82486-fce1-42cb-9c78-c093cc3a2437', 'ecfdbe76-1f05-47d1-b45d-018be264d126', 3, 'K94.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ecfdbe76-1f05-47d1-b45d-018be264d126', 'eb8bbe01-580e-4abd-9897-af5f49b5683d', 'I69.391 Dysphagia from prior stroke = I69.391 (stroke sequela causing dysphagia). This is the underlying condition driving the need for PEG care and nutritional support. Z43.1 is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('50f1553f-9307-41fc-9daa-8b8a580290aa', '208962db-1b06-44b8-a7da-683825ef9ac7', 18, 'A patient has been on home health for wound care of a diabetic foot ulcer. During a visit, the SN notes new redness and warmth around the wound consistent with cellulitis. The physician confirms cellulitis and starts antibiotics. How should the new cellulitis be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8b65cf3-a2e2-4371-bc35-fbaf07aae697', '50f1553f-9307-41fc-9daa-8b8a580290aa', 0, 'It is included in the diabetic ulcer code — no additional code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96119c82-c63e-4567-a5d6-61ac0b543545', '50f1553f-9307-41fc-9daa-8b8a580290aa', 1, 'L03.115 — code the cellulitis separately as a new diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('814c94d9-1b4c-49c7-bd7f-dbd615e73775', '50f1553f-9307-41fc-9daa-8b8a580290aa', 2, 'L03.116 — cellulitis of the left foot');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d38ed171-28d8-44de-b3fd-dfe354c5ee7f', '50f1553f-9307-41fc-9daa-8b8a580290aa', 3, 'E11.621, L03.115 — both the diabetes and cellulitis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('50f1553f-9307-41fc-9daa-8b8a580290aa', '96119c82-c63e-4567-a5d6-61ac0b543545', 'L03.115 — code the cellulitis separately Cellulitis is not included in the diabetic ulcer code. It is coded separately as L03.115 (right lower leg) and added to the diagnosis list.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9901a69a-6b9a-4f06-bec5-f0d9c7536463', '208962db-1b06-44b8-a7da-683825ef9ac7', 19, 'A patient is admitted for PT after a left ankle ORIF for a bimalleolar fracture. The fracture is in routine healing. She also has hypothyroidism and GERD. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46232926-4483-4400-bfa6-8113d53cea83', '9901a69a-6b9a-4f06-bec5-f0d9c7536463', 0, 'Z47.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('07c0e338-c01b-442b-98a6-fdd104ae8d9d', '9901a69a-6b9a-4f06-bec5-f0d9c7536463', 1, 'S82.102D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4963b0ee-1ae9-4b1d-aa3d-240a13fa9736', '9901a69a-6b9a-4f06-bec5-f0d9c7536463', 2, 'S82.102A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51ca0c01-53e3-4765-97cb-1e2a3a810be2', '9901a69a-6b9a-4f06-bec5-f0d9c7536463', 3, 'Z47.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9901a69a-6b9a-4f06-bec5-f0d9c7536463', '07c0e338-c01b-442b-98a6-fdd104ae8d9d', 'S82.102D Healing bimalleolar fracture of left ankle, routine healing = S82.102D. The fracture code with D is preferred over an aftercare Z code when the specific fracture code is available.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd043780-d912-41c8-a5c9-7daa3fab4a4c', '208962db-1b06-44b8-a7da-683825ef9ac7', 20, 'Per OASIS guidelines, what is the definition of “SOC date”?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('de1578bf-be35-4fb1-bf36-2fe9313d47da', 'bd043780-d912-41c8-a5c9-7daa3fab4a4c', 0, 'The date of the physician’s order');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53406ab8-f5db-4eda-b957-3d543be62ad2', 'bd043780-d912-41c8-a5c9-7daa3fab4a4c', 1, 'The date the first billable service is delivered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f067dd0-8b8a-48c6-9605-5511666e3833', 'bd043780-d912-41c8-a5c9-7daa3fab4a4c', 2, 'The date the patient signs consent');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c0688c6-9978-48b0-8a27-8a7dd317072f', 'bd043780-d912-41c8-a5c9-7daa3fab4a4c', 3, 'The date of hospital discharge');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bd043780-d912-41c8-a5c9-7daa3fab4a4c', '53406ab8-f5db-4eda-b957-3d543be62ad2', 'The date the first billable service is delivered SOC date = the date the first billable skilled service is rendered.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0886d26b-ff60-4ff9-907f-8e7f2a563656', '208962db-1b06-44b8-a7da-683825ef9ac7', 21, 'A patient has a wound VAC on a Stage 4 sacral pressure ulcer. The wound has tunneling. Under OASIS wound assessment, the wound with a VAC is measured:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('775d1088-6173-4cd8-9102-97859b79c541', '0886d26b-ff60-4ff9-907f-8e7f2a563656', 0, 'Only when the VAC is removed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae655737-83aa-448e-bc53-f8cf18a823ed', '0886d26b-ff60-4ff9-907f-8e7f2a563656', 1, 'Each time the VAC dressing is changed — the wound is assessed at those times');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3a227b0-266e-46bf-82bb-38e1649e5e6c', '0886d26b-ff60-4ff9-907f-8e7f2a563656', 2, 'Never — VAC wounds are excluded from OASIS measurement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6867ff5e-b265-424d-90ea-855c9f3280e8', '0886d26b-ff60-4ff9-907f-8e7f2a563656', 3, 'Only at SOC and discharge');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0886d26b-ff60-4ff9-907f-8e7f2a563656', 'ae655737-83aa-448e-bc53-f8cf18a823ed', 'Each time the VAC dressing is changed Wounds under VAC devices should be assessed when the dressing is changed, and OASIS wound measurements reflect findings at those assessments.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d3c16afe-1e3d-4518-82fc-ce6239ad43c5', '208962db-1b06-44b8-a7da-683825ef9ac7', 22, 'A patient is admitted to HH for SN management of a new tracheostomy placed 1 week ago for laryngeal cancer. She is receiving concurrent radiation. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f048cce-be86-4264-abdb-d6cb8791c2de', 'd3c16afe-1e3d-4518-82fc-ce6239ad43c5', 0, 'Z43.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5d65e4b-df98-4738-a923-1e7744c46039', 'd3c16afe-1e3d-4518-82fc-ce6239ad43c5', 1, 'C32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59066a64-4c53-4408-9cdd-73057d596eec', 'd3c16afe-1e3d-4518-82fc-ce6239ad43c5', 2, 'J95.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6eaab50-7a3a-4d91-83e1-23f0ee842709', 'd3c16afe-1e3d-4518-82fc-ce6239ad43c5', 3, 'Z51.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d3c16afe-1e3d-4518-82fc-ce6239ad43c5', 'e5d65e4b-df98-4738-a923-1e7744c46039', 'C32.9 Active laryngeal cancer currently being treated (concurrent radiation) = C32.9 as M1021. Z43.0 (trach care) and Z51.0 (radiation encounter) are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f8444de5-21c4-4549-b642-5b02bc6dcaa2', '208962db-1b06-44b8-a7da-683825ef9ac7', 23, 'A patient has chronic pain in the right knee due to a prior (healed) tibial plateau fracture. She is receiving PT for pain management and mobility. How is the chronic pain coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6ed767a-edb9-4243-9a87-59fa9fbf3f65', 'f8444de5-21c4-4549-b642-5b02bc6dcaa2', 0, 'M25.561');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f9d450f-5815-45db-ad42-b17789fee5f8', 'f8444de5-21c4-4549-b642-5b02bc6dcaa2', 1, 'G89.29, S82.101S');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1dca97fd-5ffc-4e7f-94b1-88cf121db6e1', 'f8444de5-21c4-4549-b642-5b02bc6dcaa2', 2, 'S82.101S');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a62b7a71-6ac6-4296-8930-b68fa6b2323e', 'f8444de5-21c4-4549-b642-5b02bc6dcaa2', 3, 'G89.29, M25.561');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f8444de5-21c4-4549-b642-5b02bc6dcaa2', '5f9d450f-5815-45db-ad42-b17789fee5f8', 'G89.29, S82.101S Chronic pain (G89.29) with the cause identified as sequela of healed tibial plateau fracture (S82.101S). Both are coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', '208962db-1b06-44b8-a7da-683825ef9ac7', 24, 'A patient is admitted for SN medication management of warfarin. She has atrial fibrillation and a recent DVT of the left leg (2 months ago, still acute). What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e50a94e-1d67-4c78-86dd-6a61e4a10ae2', '3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', 0, 'I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea414c68-78e5-4796-8297-6643102f863a', '3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', 1, 'I82.402');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf728ff2-c136-4ff0-9d0e-7a7f021a4d18', '3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', 2, 'Z51.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95cc5bc8-3d26-48ac-88e1-a6ca3f7cf527', '3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', 3, 'Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3f3b9c55-6d4a-4eda-87d6-c3a979c67ee4', 'cf728ff2-c136-4ff0-9d0e-7a7f021a4d18', 'Z51.81 When the encounter is specifically for drug monitoring (INR/anticoagulant management), Z51.81 is M1021. The AF and DVT are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', '208962db-1b06-44b8-a7da-683825ef9ac7', 25, 'A patient has documented “COPD with emphysema.” She is on home oxygen. What is the correct COPD code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f79f6c1-491c-4d72-9d76-adaad71e9204', 'ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', 0, 'J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed4b8262-e999-4567-8ce4-0f002e5bb2ca', 'ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', 1, 'J43.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19e9841a-f375-4277-97e3-2e894a34e2d6', 'ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', 2, 'J44.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0567f0f0-608d-431d-8054-d8df3d935084', 'ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', 3, 'J44.9, J43.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ac64d45f-ebe2-4deb-a86b-f6c0e2a96746', '2f79f6c1-491c-4d72-9d76-adaad71e9204', 'J44.9 COPD with emphysema = J44.9. The emphysema is included in the COPD category. J43 (emphysema alone) has an Excludes1 for COPD (J44.-).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f270af9-115f-4955-b204-9059dbecc61b', '208962db-1b06-44b8-a7da-683825ef9ac7', 26, 'A patient is admitted to HH after discharge from a SNF where she was treated for a hip fracture. She spent 3 weeks in the SNF. The hip fracture is healing. She now has general deconditioning. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('147c3700-93e4-48ee-9502-33fb420c4b06', '5f270af9-115f-4955-b204-9059dbecc61b', 0, 'Z74.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3114885e-a00b-427d-b2d1-1cda036abebc', '5f270af9-115f-4955-b204-9059dbecc61b', 1, 'R53.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('447da480-3a31-44d2-9255-d998b9f92e33', '5f270af9-115f-4955-b204-9059dbecc61b', 2, 'S72.001D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f93fac4-a11c-44ff-bc07-8339fa9feaed', '5f270af9-115f-4955-b204-9059dbecc61b', 3, 'Z47.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5f270af9-115f-4955-b204-9059dbecc61b', '447da480-3a31-44d2-9255-d998b9f92e33', 'S72.001D The healing hip fracture (S72.001D) with 7th character D is M1021 — it is the chief reason for HH services (PT/rehabilitation).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('129e4983-fb6d-4826-b8b1-8b74dffd9113', '208962db-1b06-44b8-a7da-683825ef9ac7', 27, 'A patient has both Type 2 DM with diabetic neuropathy AND gout. The physician prescribes colchicine. Are both conditions coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da499fe0-0688-429b-a179-8b41b3a360e6', '129e4983-fb6d-4826-b8b1-8b74dffd9113', 0, 'Yes — E11.42 and the appropriate gout code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('932f3ce9-faa6-4b3a-946d-81c0791d8bd9', '129e4983-fb6d-4826-b8b1-8b74dffd9113', 1, 'No — only the DM code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fea05c55-1805-426b-af38-619196be6b3d', '129e4983-fb6d-4826-b8b1-8b74dffd9113', 2, 'Yes — but only if both are in the plan of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c7b9b93-0a73-470f-b853-65254cf7b4b9', '129e4983-fb6d-4826-b8b1-8b74dffd9113', 3, 'No — gout is included in the DM code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('129e4983-fb6d-4826-b8b1-8b74dffd9113', 'da499fe0-0688-429b-a179-8b41b3a360e6', 'Yes — E11.42 and the appropriate gout code Diabetic neuropathy and gout are separate conditions. Both are coded when both are present and affect the plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('353cd35e-3025-4ade-a34d-6b5fd2a8353b', '208962db-1b06-44b8-a7da-683825ef9ac7', 28, 'A home health patient on long-term steroids for RA has developed Cushing’s syndrome. She is taking the steroids as prescribed. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7636ddae-bcd3-4e01-bb98-1acb3e26e445', '353cd35e-3025-4ade-a34d-6b5fd2a8353b', 0, 'E24.2, T38.0X5D, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd377b1b-5f7f-4232-a714-ff61abd83a72', '353cd35e-3025-4ade-a34d-6b5fd2a8353b', 1, 'E24.2, T38.0X5A, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63634637-6329-4046-ae78-1ea4487f0da0', '353cd35e-3025-4ade-a34d-6b5fd2a8353b', 2, 'E24.2, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1997738b-79da-48a9-be15-dab300c0d5ab', '353cd35e-3025-4ade-a34d-6b5fd2a8353b', 3, 'T38.0X5A, E24.2, M06.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('353cd35e-3025-4ade-a34d-6b5fd2a8353b', '7636ddae-bcd3-4e01-bb98-1acb3e26e445', 'E24.2, T38.0X5D, M06.9 Drug-induced Cushing’s syndrome = E24.2 (manifestation first). Adverse effect of steroid = T38.0X5D (ongoing use, D). Underlying RA = M06.9.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aabdcf23-d22e-4ca3-a728-498a73e89ea9', '208962db-1b06-44b8-a7da-683825ef9ac7', 29, 'For OASIS, which assessment must be completed within 2 calendar days of an initial or resumption of care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e381cc3c-25a8-4d78-95e4-d52306d2b600', 'aabdcf23-d22e-4ca3-a728-498a73e89ea9', 0, 'The comprehensive assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a133307-f97a-4d59-803d-3e7069d6c2af', 'aabdcf23-d22e-4ca3-a728-498a73e89ea9', 1, 'The medication reconciliation and drug regimen review');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7cb924e9-354f-4845-93a7-be366dd0ccec', 'aabdcf23-d22e-4ca3-a728-498a73e89ea9', 2, 'The discharge assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af3ee873-c04b-4946-913a-be7a8f5b6fa3', 'aabdcf23-d22e-4ca3-a728-498a73e89ea9', 3, 'The transfer assessment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aabdcf23-d22e-4ca3-a728-498a73e89ea9', '3a133307-f97a-4d59-803d-3e7069d6c2af', 'The medication reconciliation and drug regimen review The drug regimen review must be completed within 2 calendar days after the initial/ROC assessment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9176a0bc-2d99-42a0-9500-9186810db39f', '208962db-1b06-44b8-a7da-683825ef9ac7', 30, 'A patient has an ileostomy for Crohn’s disease. She is admitted for SN ostomy teaching. She has an ileostomy malfunction (high output). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('367da503-2255-445e-87b6-49bea1cfb7b0', '9176a0bc-2d99-42a0-9500-9186810db39f', 0, 'K94.13, K50.90, Z93.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ac45b3c-7455-45aa-8baa-45751cbd9106', '9176a0bc-2d99-42a0-9500-9186810db39f', 1, 'Z43.2, K50.90, Z93.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('021408e5-b4c1-482f-a033-a584a45b2edf', '9176a0bc-2d99-42a0-9500-9186810db39f', 2, 'K94.13, Z93.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a4db7cd-8963-499d-b637-7a5054bf9c06', '9176a0bc-2d99-42a0-9500-9186810db39f', 3, 'K94.13, K50.019, Z93.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9176a0bc-2d99-42a0-9500-9186810db39f', '367da503-2255-445e-87b6-49bea1cfb7b0', 'K94.13, K50.90, Z93.2 Ileostomy malfunction = K94.13. Underlying Crohn’s = K50.90. Z93.2 = ileostomy status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b0e48e3-623d-4479-8d47-1ce5f88c60e7', '208962db-1b06-44b8-a7da-683825ef9ac7', 31, 'A patient has documented “bilateral pleural effusions due to CHF.” How is the pleural effusion coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('829e3530-0ece-453e-98b2-0f300d15996a', '1b0e48e3-623d-4479-8d47-1ce5f88c60e7', 0, 'J91.8 — code the effusion separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f79c6d5-d65b-4826-a578-1db67666de2a', '1b0e48e3-623d-4479-8d47-1ce5f88c60e7', 1, 'Do not code — pleural effusion is integral to CHF');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24f2984c-c2fe-49f2-9e24-17115a54c8f0', '1b0e48e3-623d-4479-8d47-1ce5f88c60e7', 2, 'J90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8734cc69-ca93-4fb2-ac6e-f4cda2aea858', '1b0e48e3-623d-4479-8d47-1ce5f88c60e7', 3, 'J91.8, I50.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b0e48e3-623d-4479-8d47-1ce5f88c60e7', '829e3530-0ece-453e-98b2-0f300d15996a', 'J91.8 — code the effusion separately Pleural effusion in CHF should be coded separately with J91.8 (pleural effusion in other conditions classified elsewhere) when it is documented and clinically significant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b2c43ad-f445-4fab-8624-10e19e936f77', '208962db-1b06-44b8-a7da-683825ef9ac7', 32, 'A patient had a PICC line placed for long-term IV antibiotics. She is now admitted to HH for PICC line care and antibiotic administration for osteomyelitis. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a26903a-93c1-4fb8-97db-62757bf0d39d', '1b2c43ad-f445-4fab-8624-10e19e936f77', 0, 'Z45.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c15a76eb-f0f7-472f-977e-8ab4c61e47ec', '1b2c43ad-f445-4fab-8624-10e19e936f77', 1, 'M86.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d29ffc1-4581-42a3-ae8f-f2933f8923fc', '1b2c43ad-f445-4fab-8624-10e19e936f77', 2, 'The specific osteomyelitis code (e.g., M86.171)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63a7bb66-b764-4c0b-b433-bfe06b334cbc', '1b2c43ad-f445-4fab-8624-10e19e936f77', 3, 'T80.219D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b2c43ad-f445-4fab-8624-10e19e936f77', '4d29ffc1-4581-42a3-ae8f-f2933f8923fc', 'The specific osteomyelitis code The osteomyelitis is the underlying condition requiring the PICC and antibiotics. It is M1021. Z45.2 (PICC adjustment) and Z79.2 (long-term antibiotics) are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', '208962db-1b06-44b8-a7da-683825ef9ac7', 33, 'A patient has a Stage 2 pressure ulcer of the right ischial tuberosity that was documented as “healing” at the last assessment. At today’s visit, the wound has worsened — it now shows full-thickness tissue loss (Stage 3). What stage is reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6156a0ec-a7b5-4246-96fb-b338a1323bd9', '5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', 0, 'Stage 2 — do not change');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9620d8cd-7571-4ce8-95cd-4b1674dd3930', '5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', 1, 'Stage 3 — update to the current, worsened stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7526efae-3d2d-4013-b496-cee5b9d2cf36', '5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', 2, 'Unstageable');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a4f63c5-b1a0-4264-a911-6d3be9040842', '5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', 3, 'Stage 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5ead468d-73b7-4a35-b8a7-62f17ffb3fdd', '9620d8cd-7571-4ce8-95cd-4b1674dd3930', 'Stage 3 — update to the current, worsened stage Pressure ulcers may be staged upward (worsening) but never reverse-staged (improvement). Stage 3 reflects the current condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89dd4096-b50c-48fa-80d7-ab7767b378ec', '208962db-1b06-44b8-a7da-683825ef9ac7', 34, 'A patient is admitted for wound care of a second-degree burn of the chest sustained from a hot water spill 2 weeks ago. The burn is healing with routine care. She is also on blood thinners for A-fib. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db1f7c4d-c050-4df7-a48a-b937020d800d', '89dd4096-b50c-48fa-80d7-ab7767b378ec', 0, 'T21.11XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5784f410-52bf-4b97-abd1-2339a67c80f7', '89dd4096-b50c-48fa-80d7-ab7767b378ec', 1, 'T21.11XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b049c8bf-e6ba-4cea-8e36-c2d36b643654', '89dd4096-b50c-48fa-80d7-ab7767b378ec', 2, 'T21.10XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83d82beb-9f01-49c7-be00-51068405d079', '89dd4096-b50c-48fa-80d7-ab7767b378ec', 3, 'L55.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('89dd4096-b50c-48fa-80d7-ab7767b378ec', 'db1f7c4d-c050-4df7-a48a-b937020d800d', 'T21.11XD Second-degree burn of chest, 2 weeks old, healing with routine care = T21.11XD (subsequent encounter). The burn injury code with D is appropriate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87cbf7d5-3616-4058-9e40-55927368502a', '208962db-1b06-44b8-a7da-683825ef9ac7', 35, 'A patient with chronic kidney disease stage 5 on hemodialysis via an AV fistula is admitted for SN management of anemia. She receives EPO injections at home. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('484895d8-fcb6-421b-9f9b-98dc4b8d4684', '87cbf7d5-3616-4058-9e40-55927368502a', 0, 'D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('adc5fe50-0e2e-4d08-ab68-cf707fd3854e', '87cbf7d5-3616-4058-9e40-55927368502a', 1, 'N18.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4401818f-a8de-4aa2-ba4b-2e5c52ffa9f3', '87cbf7d5-3616-4058-9e40-55927368502a', 2, 'Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('10e88638-8365-4df0-9819-4ad2393cde04', '87cbf7d5-3616-4058-9e40-55927368502a', 3, 'D64.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('87cbf7d5-3616-4058-9e40-55927368502a', 'adc5fe50-0e2e-4d08-ab68-cf707fd3854e', 'N18.6 ESRD (N18.6) is M1021 — it is the underlying condition driving the need for dialysis and anemia management. D63.1 and Z99.2 are secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c3097b36-db70-440f-b650-d8f815fe6320', '208962db-1b06-44b8-a7da-683825ef9ac7', 36, 'Which of the following is NOT an acceptable primary diagnosis (M1021) for home health?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5361f77-17fb-4a26-bb13-c0a049647396', 'c3097b36-db70-440f-b650-d8f815fe6320', 0, 'Z51.81 (encounter for therapeutic drug monitoring)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ebba9d8d-5729-4cca-a126-da2eb5acf91e', 'c3097b36-db70-440f-b650-d8f815fe6320', 1, 'Z47.33 (aftercare following knee replacement)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a027f2c-32ef-4716-8c14-088284ef67ed', 'c3097b36-db70-440f-b650-d8f815fe6320', 2, 'V43.52XD (car passenger injured in collision)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4dd2408-e500-4d27-ac0f-753c891f826d', 'c3097b36-db70-440f-b650-d8f815fe6320', 3, 'Z43.0 (encounter for attention to tracheostomy)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c3097b36-db70-440f-b650-d8f815fe6320', '1a027f2c-32ef-4716-8c14-088284ef67ed', 'V43.52XD External cause codes (V, W, X, Y codes) can NEVER be used as M1021/primary diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4788a07c-593b-4cee-a000-0eb6e10e1ba5', '208962db-1b06-44b8-a7da-683825ef9ac7', 37, 'A patient is admitted for SN wound care of a chronic non-healing surgical wound of the left knee following TKR 6 weeks ago. The wound shows signs of dehiscence but no infection. She also has OA and HTN. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe55fd08-6ed5-4fb7-b3c8-b2740387b6c4', '4788a07c-593b-4cee-a000-0eb6e10e1ba5', 0, 'Z47.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c00344b0-53e1-4631-8abd-2b7a4972df01', '4788a07c-593b-4cee-a000-0eb6e10e1ba5', 1, 'T81.31XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da0a2291-a8d5-46b1-85a2-9300960daa8a', '4788a07c-593b-4cee-a000-0eb6e10e1ba5', 2, 'M17.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('331678e8-144a-4997-acbe-6b77a38a9d70', '4788a07c-593b-4cee-a000-0eb6e10e1ba5', 3, 'T81.31XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4788a07c-593b-4cee-a000-0eb6e10e1ba5', 'c00344b0-53e1-4631-8abd-2b7a4972df01', 'T81.31XD Surgical wound dehiscence = T81.31XD as M1021. The dehiscence is the current active problem requiring wound care. D for ongoing treatment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97f3af76-27c4-442b-ad2f-9f9fb2832912', '208962db-1b06-44b8-a7da-683825ef9ac7', 38, 'A patient has a right below-knee prosthetic leg. She has phantom limb pain. She is being treated with gabapentin. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33bc33aa-45ac-44a4-a62b-0d1c7d320117', '97f3af76-27c4-442b-ad2f-9f9fb2832912', 0, 'G54.6, Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e54e1eef-382f-4f21-9c91-a3a48ae82e34', '97f3af76-27c4-442b-ad2f-9f9fb2832912', 1, 'G54.7, Z89.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0cfd2b34-cd14-48b3-8355-bb5045d9f88f', '97f3af76-27c4-442b-ad2f-9f9fb2832912', 2, 'G54.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('18240f12-c28c-468b-bdcf-4f20d55ebfd4', '97f3af76-27c4-442b-ad2f-9f9fb2832912', 3, 'G89.29, Z89.511');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('97f3af76-27c4-442b-ad2f-9f9fb2832912', '33bc33aa-45ac-44a4-a62b-0d1c7d320117', 'G54.6, Z89.511 Phantom limb syndrome with pain = G54.6. Z89.511 = acquired absence of right leg below knee.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e6b2cf0b-97c3-445d-b550-a545ebbfec5c', '208962db-1b06-44b8-a7da-683825ef9ac7', 39, 'A patient has had two separate strokes — one 6 months ago (left CVA) and one 2 years ago (right CVA). She has residual right hemiplegia from the first stroke and residual aphasia from the second. How are the sequelae coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b1b1f7e-6cb7-47ed-94f6-f2754bc4a5d2', 'e6b2cf0b-97c3-445d-b550-a545ebbfec5c', 0, 'I69.351, I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a231a9b-003c-4e1c-bf0a-0411372f6f1c', 'e6b2cf0b-97c3-445d-b550-a545ebbfec5c', 1, 'I69.951, I69.920');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08241db5-af82-48b1-b539-f0e00d68e099', 'e6b2cf0b-97c3-445d-b550-a545ebbfec5c', 2, 'G81.91, R47.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2aa5f9e0-fd86-4424-b8d8-d53e956ab9c2', 'e6b2cf0b-97c3-445d-b550-a545ebbfec5c', 3, 'I69.351, I69.920');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e6b2cf0b-97c3-445d-b550-a545ebbfec5c', '3b1b1f7e-6cb7-47ed-94f6-f2754bc4a5d2', 'I69.351, I69.320 Residual right hemiplegia from left CVA = I69.351 (hemiplegia following cerebral infarction, dominant side). Residual aphasia from right CVA = I69.320. Each stroke’s sequelae are coded separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da48443c-c022-49d6-8419-2e98e78e13ff', '208962db-1b06-44b8-a7da-683825ef9ac7', 40, 'A patient is admitted for SN care after a splenectomy for splenic laceration following a car accident. She is 2 weeks post-op. She now needs immunizations and post-splenectomy education. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5575358e-4b8d-43d8-9267-7184680f2eb5', 'da48443c-c022-49d6-8419-2e98e78e13ff', 0, 'Z48.89, Z90.81, S36.039D, V43.52XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e3e52ce-754a-4b98-9981-ee04b68b83a5', 'da48443c-c022-49d6-8419-2e98e78e13ff', 1, 'D73.0, Z90.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7383a646-3f29-44a3-8706-c1d9dce6e31a', 'da48443c-c022-49d6-8419-2e98e78e13ff', 2, 'Z48.89, Z90.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98fa6cab-c926-45a1-8567-9012c8361bcf', 'da48443c-c022-49d6-8419-2e98e78e13ff', 3, 'S36.039D, Z90.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('da48443c-c022-49d6-8419-2e98e78e13ff', '7383a646-3f29-44a3-8706-c1d9dce6e31a', 'Z48.89, Z90.81 Surgical aftercare = Z48.89. Acquired absence of spleen = Z90.81. The splenic laceration has been treated — use aftercare codes, not the injury code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('136b1ec2-957c-4173-a668-953da75e25ae', '208962db-1b06-44b8-a7da-683825ef9ac7', 41, 'Under ICD-10-CM, when a patient has “suspected” or “probable” diagnosis in the outpatient/HH setting, the coder should:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00ccee6c-4bf6-43a1-9fff-6d656650c7ef', '136b1ec2-957c-4173-a668-953da75e25ae', 0, 'Not code the condition — only confirmed diagnoses are coded in outpatient settings');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('230eb487-ad65-45a3-a9cc-a4a20b021d0a', '136b1ec2-957c-4173-a668-953da75e25ae', 1, 'Code the condition as if it exists');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d8636d9-f647-428b-938b-2329b162a1f5', '136b1ec2-957c-4173-a668-953da75e25ae', 2, 'Use the “unspecified” version of the code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3369b55e-41d1-488c-9000-f868e90215c7', '136b1ec2-957c-4173-a668-953da75e25ae', 3, 'Code only the symptoms');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('136b1ec2-957c-4173-a668-953da75e25ae', '230eb487-ad65-45a3-a9cc-a4a20b021d0a', 'Code the condition as if it exists In the outpatient/HH setting, uncertain diagnoses documented as “probable,” “suspected,” etc. ARE coded as if confirmed (guideline IV.H).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5ebc8bbf-2728-4448-9377-5859481a7bbc', '208962db-1b06-44b8-a7da-683825ef9ac7', 42, 'A patient has a nephrostomy tube for hydronephrosis. She is receiving HH for nephrostomy care. The nephrostomy tube has become blocked. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99289df1-671d-42e1-8176-19e66caae4f8', '5ebc8bbf-2728-4448-9377-5859481a7bbc', 0, 'T83.098D, N13.30, Z43.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57c209ff-b888-4986-97d1-0ab99421f9c8', '5ebc8bbf-2728-4448-9377-5859481a7bbc', 1, 'N13.30, Z43.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e6a817a-3c47-4e9c-b4d0-112f00f0e989', '5ebc8bbf-2728-4448-9377-5859481a7bbc', 2, 'T83.098D, N13.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('035ac5a9-646e-44a8-afd4-d1a027d95ce4', '5ebc8bbf-2728-4448-9377-5859481a7bbc', 3, 'Z43.6, T83.098D, N13.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5ebc8bbf-2728-4448-9377-5859481a7bbc', '99289df1-671d-42e1-8176-19e66caae4f8', 'T83.098D, N13.30, Z43.6 Blocked nephrostomy tube = T83.098D (mechanical complication of urinary device). Hydronephrosis = N13.30. Z43.6 = attention to other artificial openings of urinary tract.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a912241-3fdd-4a11-b7ff-6c037a99eea5', '208962db-1b06-44b8-a7da-683825ef9ac7', 43, 'A home health patient has a documented “stage 4 chronic kidney disease.” Her eGFR is 22 ml/min. The physician hasn’t started dialysis. What code applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f47da8d7-51b1-4e4b-badb-129d069f365d', '9a912241-3fdd-4a11-b7ff-6c037a99eea5', 0, 'N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ced5d25b-bc1b-48ee-bcc9-f1b9f680d014', '9a912241-3fdd-4a11-b7ff-6c037a99eea5', 1, 'N18.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4718ad3-76c5-45c8-b823-60bfbbc210a0', '9a912241-3fdd-4a11-b7ff-6c037a99eea5', 2, 'N18.4, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d2b38fa-a20f-4883-ab88-4714c2b98da9', '9a912241-3fdd-4a11-b7ff-6c037a99eea5', 3, 'N18.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9a912241-3fdd-4a11-b7ff-6c037a99eea5', 'f47da8d7-51b1-4e4b-badb-129d069f365d', 'N18.4 CKD stage 4 = N18.4. The patient is not on dialysis, so Z99.2 is not coded. N18.5 (stage 5) requires eGFR <15.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9e767bb-40f8-4741-b335-c02efc620930', '208962db-1b06-44b8-a7da-683825ef9ac7', 44, 'A patient is admitted to HH for SN management of a new permanent pacemaker placed for sick sinus syndrome. She is 1 week post-implant. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80f67d33-f3af-499d-804f-edbf2116a9cf', 'b9e767bb-40f8-4741-b335-c02efc620930', 0, 'Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ade139a7-8655-4a2e-82f9-849ffbecfb0e', 'b9e767bb-40f8-4741-b335-c02efc620930', 1, 'Z45.018');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f69dd4c-a7b1-47c1-873a-d1f2ce27ee12', 'b9e767bb-40f8-4741-b335-c02efc620930', 2, 'I49.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e09183e-360b-4e3a-b23e-ecfb4c2d1eaf', 'b9e767bb-40f8-4741-b335-c02efc620930', 3, 'Z45.018, I49.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9e767bb-40f8-4741-b335-c02efc620930', 'ade139a7-8655-4a2e-82f9-849ffbecfb0e', 'Z45.018 Encounter for adjustment/management of cardiac pacemaker = Z45.018 as M1021. I49.5 (sick sinus syndrome) is secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d880248d-fba4-462a-9e44-bea04374baed', '208962db-1b06-44b8-a7da-683825ef9ac7', 45, 'A patient has bilateral hip osteoarthritis with a right total hip replacement done 2 weeks ago. The left hip has not been operated on. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('852296d7-c6fb-41b9-b7b3-c4635d20810f', 'd880248d-fba4-462a-9e44-bea04374baed', 0, 'Z47.32, M16.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8746cde5-dd3f-4235-8ae6-24e62f61cc04', 'd880248d-fba4-462a-9e44-bea04374baed', 1, 'Z47.32, M16.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfbb66a2-8276-4e87-887b-1b5de2cbd95e', 'd880248d-fba4-462a-9e44-bea04374baed', 2, 'M16.0, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04f8b64f-427b-4830-8cc9-0b520850680d', 'd880248d-fba4-462a-9e44-bea04374baed', 3, 'Z47.32, M16.12, Z96.641');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d880248d-fba4-462a-9e44-bea04374baed', '852296d7-c6fb-41b9-b7b3-c4635d20810f', 'Z47.32, M16.12 Aftercare following right hip replacement = Z47.32. Left hip OA (not replaced) = M16.12. Z96.641 is included in the aftercare context.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1dd4192b-1d20-4311-9bb9-257ad72ddb3e', '208962db-1b06-44b8-a7da-683825ef9ac7', 46, 'A patient has type 2 DM with chronic diabetic foot ulcer of the right heel that is progressing to osteomyelitis. The physician documents the osteomyelitis is due to the diabetic foot ulcer. What is the complete coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b14e5a16-5528-4878-8959-698474352793', '1dd4192b-1d20-4311-9bb9-257ad72ddb3e', 0, 'E11.618, M86.171, E11.621, L97.411, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e01e1ca2-aa06-4445-a5b2-4e285c1caa11', '1dd4192b-1d20-4311-9bb9-257ad72ddb3e', 1, 'E11.621, L97.411, M86.171, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5aebdc01-9b0d-4c89-9eb6-fc0b1ee0628a', '1dd4192b-1d20-4311-9bb9-257ad72ddb3e', 2, 'M86.171, E11.621, L97.411, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f370150-cf79-4d52-818d-c5b095ff60d1', '1dd4192b-1d20-4311-9bb9-257ad72ddb3e', 3, 'E11.69, M86.171, L97.411, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1dd4192b-1d20-4311-9bb9-257ad72ddb3e', 'b14e5a16-5528-4878-8959-698474352793', 'E11.618, M86.171, E11.621, L97.411, Z79.4 DM with other specified arthropathy (osteomyelitis) = E11.618, M86.171. DM with diabetic foot ulcer = E11.621, L97.411 (right heel, breakdown). Z79.4 for insulin.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('848c7402-3aa6-47c2-9ad6-3231cdf147dd', '208962db-1b06-44b8-a7da-683825ef9ac7', 47, 'A home health patient has a JP drain in place following breast surgery (lumpectomy). Is the JP drain site a surgical wound for OASIS?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d12a8590-6128-4da7-aa11-a23a2a6103e7', '848c7402-3aa6-47c2-9ad6-3231cdf147dd', 0, 'No — drains are not surgical wounds');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('781b5bef-677b-4bd4-a62d-68657e84176b', '848c7402-3aa6-47c2-9ad6-3231cdf147dd', 1, 'Yes — the drain insertion site is a surgical wound while the drain is in place and for the period the site has not fully healed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2cd61a0-bf26-499e-ac6d-014d7f5d9c72', '848c7402-3aa6-47c2-9ad6-3231cdf147dd', 2, 'Only if the drain site is infected');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a84a1b2d-3576-4ed0-977b-b9379c3815ff', '848c7402-3aa6-47c2-9ad6-3231cdf147dd', 3, 'Only after the drain is removed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('848c7402-3aa6-47c2-9ad6-3231cdf147dd', '781b5bef-677b-4bd4-a62d-68657e84176b', 'Yes JP drain insertion sites are surgical wounds per OASIS while the drain is in place and until the site has fully healed after drain removal.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('325f02b3-ca30-4881-a67c-5e3a87751329', '208962db-1b06-44b8-a7da-683825ef9ac7', 48, 'A patient has been admitted to HH after hospitalization for pneumonia. The pneumonia has resolved. She now has generalized weakness and deconditioning. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c75d8415-054f-480b-91ee-30dbdeafdbb0', '325f02b3-ca30-4881-a67c-5e3a87751329', 0, 'J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('451fe6e7-8a5f-402f-99f8-d9ee2a45af56', '325f02b3-ca30-4881-a67c-5e3a87751329', 1, 'R53.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2d451a5-ff00-4401-87f7-7870025f61c3', '325f02b3-ca30-4881-a67c-5e3a87751329', 2, 'Z87.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0a9a61c-3f3e-4607-87ec-92518f2c1a39', '325f02b3-ca30-4881-a67c-5e3a87751329', 3, 'R53.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('325f02b3-ca30-4881-a67c-5e3a87751329', '451fe6e7-8a5f-402f-99f8-d9ee2a45af56', 'R53.81 Resolved pneumonia is not coded. Current condition = generalized weakness/deconditioning = R53.81 (other malaise and fatigue).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd311a3d-93f2-482c-ac25-8eaa5e4846d4', '208962db-1b06-44b8-a7da-683825ef9ac7', 49, 'A patient has documented “uncontrolled” type 2 diabetes. HbA1c is 10.2%. She is on insulin and metformin. How does “uncontrolled” affect the DM code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4bfd97b-1c4c-419e-b07c-ea4b70744bce', 'fd311a3d-93f2-482c-ac25-8eaa5e4846d4', 0, 'Use E11.65 (with hyperglycemia)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5f93e93-a8b5-46dc-9a10-d7c484174794', 'fd311a3d-93f2-482c-ac25-8eaa5e4846d4', 1, 'Use E11.9 — “uncontrolled” does not change the code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('520e2c1b-aec0-4838-b777-8cea07efd552', 'fd311a3d-93f2-482c-ac25-8eaa5e4846d4', 2, 'Use E13.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ccd0bd9-6c34-499d-bf10-87d5a7a1988d', 'fd311a3d-93f2-482c-ac25-8eaa5e4846d4', 3, 'Use E11.65 only if the physician specifically documents hyperglycemia, not just “uncontrolled”');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fd311a3d-93f2-482c-ac25-8eaa5e4846d4', '2ccd0bd9-6c34-499d-bf10-87d5a7a1988d', 'Code E11.65 only if the physician specifically documents hyperglycemia “Uncontrolled” alone does not map to a specific code. The physician must document the specific condition (hyperglycemia, hypoglycemia, or ketoacidosis). If “uncontrolled” with no further specification, use E11.9 and query.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', '208962db-1b06-44b8-a7da-683825ef9ac7', 50, 'A patient has documented hyperlipidemia. The specific type is not documented. What code is assigned?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d043cd2e-6873-4caa-90db-6c9920dfdf21', 'e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', 0, 'E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('337eee44-3730-40c6-b25f-31a9c039edbd', 'e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', 1, 'E78.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fed4b165-51e5-47de-b725-f0657cc939d8', 'e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', 2, 'E78.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50eba6ab-48a9-48bb-9b29-01723cc6ecf0', 'e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', 3, 'E78.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e38cb0ae-9b3f-4924-b0c4-fa6875f35b37', 'd043cd2e-6873-4caa-90db-6c9920dfdf21', 'E78.5 (hyperlipidemia, unspecified) is the correct code when the physician documents "hyperlipidemia" generically without specifying which lipid abnormality is present — coding a more specific subtype would require documentation this stem doesn''t provide. E78.00 (pure hypercholesterolemia) and E78.2 (mixed hyperlipidemia) are both real, valid, more specific diagnoses, but assigning either would mean inventing a level of detail (whether cholesterol alone or both cholesterol and triglycerides are elevated) that the physician never actually documented — the same principle tested throughout this project of matching code specificity to actual documentation, not assuming it. E78.9 (disorder of lipoprotein metabolism, unspecified) is a broader, less precise category than E78.5 and doesn''t match "hyperlipidemia" as specifically as the dedicated E78.5 code does.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('73910528-a725-438b-823a-48ef2702c6dc', '208962db-1b06-44b8-a7da-683825ef9ac7', 51, 'A patient has chronic osteomyelitis of the right tibia with a draining sinus. She is receiving HH for wound care and IV antibiotics. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76a3cc4c-30f6-4923-bccb-e8316957497e', '73910528-a725-438b-823a-48ef2702c6dc', 0, 'M86.361');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d26f423-a6a9-4fe4-8322-254d4e02fc71', '73910528-a725-438b-823a-48ef2702c6dc', 1, 'M86.161');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13747950-459c-466a-9593-00c7fee91620', '73910528-a725-438b-823a-48ef2702c6dc', 2, 'M86.661');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29b44740-48eb-4331-adfd-6cacc998787f', '73910528-a725-438b-823a-48ef2702c6dc', 3, 'M86.261');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('73910528-a725-438b-823a-48ef2702c6dc', '76a3cc4c-30f6-4923-bccb-e8316957497e', 'M86.361 Chronic osteomyelitis of right tibia with draining sinus = M86.361 (chronic osteomyelitis with draining sinus).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b952bdd-5cb9-4d5e-91a9-6c83b0896578', '208962db-1b06-44b8-a7da-683825ef9ac7', 52, 'A patient is on home IV vancomycin via a PICC line for MRSA bacteremia. The blood cultures are still positive. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85948964-953d-40a1-96c0-b5e594736d17', '1b952bdd-5cb9-4d5e-91a9-6c83b0896578', 0, 'A49.02, Z45.2, Z79.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1ab6ecd-339f-42db-9dc3-ef3ae31c449e', '1b952bdd-5cb9-4d5e-91a9-6c83b0896578', 1, 'A41.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dbe77b46-0479-428e-9bc7-87a6dd51e8fb', '1b952bdd-5cb9-4d5e-91a9-6c83b0896578', 2, 'A49.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5b6e76a-538b-4600-9ba9-ba009d129d75', '1b952bdd-5cb9-4d5e-91a9-6c83b0896578', 3, 'A49.02, Z79.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1b952bdd-5cb9-4d5e-91a9-6c83b0896578', 'dbe77b46-0479-428e-9bc7-87a6dd51e8fb', 'A49.02 MRSA bacteremia (blood infection, not sepsis) = A49.02 (MRSA infection, unspecified site). If the physician documents sepsis, A41.02 would apply instead.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2402458d-78ce-4b0c-babf-7a8af1e7b572', '208962db-1b06-44b8-a7da-683825ef9ac7', 53, 'A patient has a Stage 4 sacral pressure ulcer that was surgically debrided (sharp debridement of necrotic tissue — no flap or graft). Two days later, slough has reaccumulated over part of the wound bed. What stage is reported?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28110ed4-b0bc-4b81-8513-1ef50bcc7dec', '2402458d-78ce-4b0c-babf-7a8af1e7b572', 0, 'Unstageable — slough covers the wound bed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77db0319-230a-4f53-aa0d-364372e550f4', '2402458d-78ce-4b0c-babf-7a8af1e7b572', 1, 'Stage 4 — retain the previous staging (sharp debridement does not change classification, and the wound was previously staged)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c57f2580-5675-45e2-bc0b-f8af039fd6e7', '2402458d-78ce-4b0c-babf-7a8af1e7b572', 2, 'Stage 3 — debrided wounds are downstaged');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c26ffebb-f935-405b-9184-1e81ae83c0cb', '2402458d-78ce-4b0c-babf-7a8af1e7b572', 3, 'Unspecified');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2402458d-78ce-4b0c-babf-7a8af1e7b572', '77db0319-230a-4f53-aa0d-364372e550f4', 'Stage 4 — retain the previous staging Sharp debridement does not reclassify a pressure ulcer. The wound was previously staged as Stage 4 and retains that staging even when slough reaccumulates.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bafe668a-4fb3-4177-86bb-9563f1c3c0d0', '208962db-1b06-44b8-a7da-683825ef9ac7', 54, 'A patient is admitted to HH with a new diagnosis of left breast cancer. She had a right mastectomy for right breast cancer 5 years ago (in remission). What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d682a4b4-9318-403c-9fd3-2e81096cab45', 'bafe668a-4fb3-4177-86bb-9563f1c3c0d0', 0, 'C50.912, Z85.3, Z90.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c5fa6cc-eedf-4a53-aadb-990c18934768', 'bafe668a-4fb3-4177-86bb-9563f1c3c0d0', 1, 'C50.912, C50.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b39df2c-5004-480c-abdd-63ca04fac09d', 'bafe668a-4fb3-4177-86bb-9563f1c3c0d0', 2, 'C50.912, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e422453-7fd4-4f17-b693-99bf68cc5ba7', 'bafe668a-4fb3-4177-86bb-9563f1c3c0d0', 3, 'C50.912, Z90.11, Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bafe668a-4fb3-4177-86bb-9563f1c3c0d0', '3e422453-7fd4-4f17-b693-99bf68cc5ba7', 'C50.912, Z90.11, Z85.3 Active left breast cancer = C50.912. Acquired absence of right breast = Z90.11. Personal history of right breast cancer = Z85.3.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb29c90e-e734-45cd-8de9-0298fa93bac5', '208962db-1b06-44b8-a7da-683825ef9ac7', 55, 'A patient has acute exacerbation of COPD with pneumonia. The physician documents the pneumonia is the cause of the exacerbation. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44e59db6-004a-4e78-bdaf-1cf35e53946f', 'fb29c90e-e734-45cd-8de9-0298fa93bac5', 0, 'J44.0, J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c68e1bc8-4754-4837-b66d-bbc201730ba3', 'fb29c90e-e734-45cd-8de9-0298fa93bac5', 1, 'J44.1, J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ade03bbe-dbff-4198-a39a-dd29c3211555', 'fb29c90e-e734-45cd-8de9-0298fa93bac5', 2, 'J18.9, J44.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd468166-90f4-40e3-854d-569eca600b69', 'fb29c90e-e734-45cd-8de9-0298fa93bac5', 3, 'J44.0, J15.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fb29c90e-e734-45cd-8de9-0298fa93bac5', '44e59db6-004a-4e78-bdaf-1cf35e53946f', 'J44.0, J18.9 COPD with acute lower respiratory infection = J44.0. The pneumonia code (J18.9) follows. J44.0 is used when COPD exacerbation is caused by/associated with an infection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49c693d6-3845-4c3e-8fbc-733249ec52f7', '208962db-1b06-44b8-a7da-683825ef9ac7', 56, 'A home health patient has documented “chronic total occlusion of the right coronary artery.” She had a prior CABG. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2484c83-83f0-4d19-bfb3-265b81332cde', '49c693d6-3845-4c3e-8fbc-733249ec52f7', 0, 'I25.82, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('073cbe70-b00b-4d8e-aaaf-b72afced69b2', '49c693d6-3845-4c3e-8fbc-733249ec52f7', 1, 'I25.10, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53c7c932-0ddd-49d3-a5a1-22ab9f77ffef', '49c693d6-3845-4c3e-8fbc-733249ec52f7', 2, 'I25.119, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89df120d-a591-40a3-96c2-e3a2d655b2f1', '49c693d6-3845-4c3e-8fbc-733249ec52f7', 3, 'I25.82, I25.10, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49c693d6-3845-4c3e-8fbc-733249ec52f7', 'c2484c83-83f0-4d19-bfb3-265b81332cde', 'I25.82, Z95.1 Chronic total occlusion of coronary artery = I25.82. Z95.1 = presence of CABG.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6dfe35a9-61ee-4f46-8403-3593bdf16fb3', '208962db-1b06-44b8-a7da-683825ef9ac7', 57, 'Per CoP requirements, who must be involved in developing the plan of care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('561675a5-d17b-4793-8aa4-2833b62e3495', '6dfe35a9-61ee-4f46-8403-3593bdf16fb3', 0, 'Only the physician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('858d6e3d-c539-4d41-8dca-76e5f54c1e21', '6dfe35a9-61ee-4f46-8403-3593bdf16fb3', 1, 'The physician in consultation with the agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('22a227c2-c910-44e6-97fc-57de4c80c14f', '6dfe35a9-61ee-4f46-8403-3593bdf16fb3', 2, 'The physician, the patient, and the agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('559db752-48c6-49b2-887a-da8a9066f02e', '6dfe35a9-61ee-4f46-8403-3593bdf16fb3', 3, 'The agency alone based on the physician’s orders');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6dfe35a9-61ee-4f46-8403-3593bdf16fb3', '22a227c2-c910-44e6-97fc-57de4c80c14f', 'The physician, the patient, and the agency The POC must be established by the physician in collaboration with the agency staff and the patient.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('695330a6-9041-46d0-aa2c-36f5daef8a8a', '208962db-1b06-44b8-a7da-683825ef9ac7', 58, 'A patient has a right below-elbow amputation (traumatic, 6 months ago, healed). She now has a prosthetic arm. She is admitted for OT prosthetic training. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c76b4921-6fe2-4e33-81f7-029452c5b5ee', '695330a6-9041-46d0-aa2c-36f5daef8a8a', 0, 'S58.011S, Z44.011');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('171136d2-3809-411b-a4b9-ba4811df42f9', '695330a6-9041-46d0-aa2c-36f5daef8a8a', 1, 'Z89.011, Z44.011');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15bc0bad-6f40-4692-823f-820167048689', '695330a6-9041-46d0-aa2c-36f5daef8a8a', 2, 'Z44.011');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2381fb92-134b-487e-a2b6-80299861fbd8', '695330a6-9041-46d0-aa2c-36f5daef8a8a', 3, 'Z89.111, Z44.011');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('695330a6-9041-46d0-aa2c-36f5daef8a8a', '171136d2-3809-411b-a4b9-ba4811df42f9', 'Z89.011, Z44.011 Acquired absence of right hand (below elbow) = Z89.011. Encounter for fitting of prosthetic right hand = Z44.011. The traumatic amputation is healed — use acquired absence codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('88b84f55-51bb-4e0d-8226-8235abdb130f', '208962db-1b06-44b8-a7da-683825ef9ac7', 59, 'A patient has a ventricular assist device (LVAD) in place for end-stage heart failure. She is admitted for SN LVAD management. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c5f5de0-c84a-4cc5-b8c7-5504ca7f354d', '88b84f55-51bb-4e0d-8226-8235abdb130f', 0, 'Z95.811, I50.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e09becaf-26a6-447f-afd4-f38c0a2e976c', '88b84f55-51bb-4e0d-8226-8235abdb130f', 1, 'I50.22, Z95.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09857e16-175c-4f36-bba4-9dd55fec1dc8', '88b84f55-51bb-4e0d-8226-8235abdb130f', 2, 'Z95.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19fc83ae-3ce2-4ad0-8f69-b6a80a17d928', '88b84f55-51bb-4e0d-8226-8235abdb130f', 3, 'I50.84, Z95.811');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('88b84f55-51bb-4e0d-8226-8235abdb130f', '0c5f5de0-c84a-4cc5-b8c7-5504ca7f354d', 'Z95.811, I50.22 Presence of LVAD = Z95.811. Chronic systolic HF = I50.22. When the encounter is for LVAD management, Z95.811 is M1021.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', '208962db-1b06-44b8-a7da-683825ef9ac7', 60, 'A patient is admitted for SN management of a central line-associated bloodstream infection (CLABSI). She has a subclavian central line for TPN. The organism is Candida. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('991674fe-dedd-4857-8706-45826f6cc6db', '8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', 0, 'T80.219D, B37.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('404e2473-43a6-47c9-9e29-2df568882ea8', '8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', 1, 'T80.211D, B37.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89760750-a71e-4632-8ef6-8d78e4e13f21', '8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', 2, 'T80.219A, B37.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a073b86e-0bfd-45f9-a52b-b20d41c77afd', '8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', 3, 'B37.7, T80.219D');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8497a6ec-3c9f-4c28-8a52-cf0024fe6feb', '991674fe-dedd-4857-8706-45826f6cc6db', 'T80.219D, B37.7 CLABSI = T80.219D (infection following infusion, unspecified). Candida = B37.7 (candidal septicemia). D for ongoing treatment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fa2d9362-00d7-44ad-a6e1-fbd210040ab6', '208962db-1b06-44b8-a7da-683825ef9ac7', 61, 'A patient has documented atrial fibrillation with a documented history of stroke. She has no current stroke symptoms. She is on anticoagulation. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86c1b334-1071-4f82-98e9-38c69658cc90', 'fa2d9362-00d7-44ad-a6e1-fbd210040ab6', 0, 'I48.91, Z79.01, I63.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08282fd7-a6e1-475b-aff6-286f1191f9ad', 'fa2d9362-00d7-44ad-a6e1-fbd210040ab6', 1, 'I48.91, Z79.01, Z86.73');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e03e7401-5e97-43c3-8d12-75270ef3a41a', 'fa2d9362-00d7-44ad-a6e1-fbd210040ab6', 2, 'I48.91, Z86.73, Z79.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8402b8b4-7bdd-4257-9c03-b164d6557c23', 'fa2d9362-00d7-44ad-a6e1-fbd210040ab6', 3, 'I48.91, Z79.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fa2d9362-00d7-44ad-a6e1-fbd210040ab6', '08282fd7-a6e1-475b-aff6-286f1191f9ad', 'I48.91, Z79.01, Z86.73 AF = I48.91. Anticoagulant = Z79.01. History of stroke (resolved) = Z86.73. The stroke itself is not actively being treated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('23c3a36a-0006-4a25-9f17-fef660e16ab0', '208962db-1b06-44b8-a7da-683825ef9ac7', 62, 'A home health patient fell and hit her head. She developed a traumatic subdural hematoma that was treated conservatively. She is in HH for SN neuro monitoring. The hematoma is resolving. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db7d5e6b-a7e5-4698-9284-f0765478bd0a', '23c3a36a-0006-4a25-9f17-fef660e16ab0', 0, 'S06.5X0D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b286741-e653-416c-826f-fa5e9076d00a', '23c3a36a-0006-4a25-9f17-fef660e16ab0', 1, 'S06.5X0A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da79aaf5-b299-4818-83d2-5ce15950068d', '23c3a36a-0006-4a25-9f17-fef660e16ab0', 2, 'I62.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3c08b44-db86-4ee2-ab8e-23c8823aa7ff', '23c3a36a-0006-4a25-9f17-fef660e16ab0', 3, 'S06.5X0S');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('23c3a36a-0006-4a25-9f17-fef660e16ab0', 'db7d5e6b-a7e5-4698-9284-f0765478bd0a', 'S06.5X0D Traumatic subdural hematoma, resolving, in HH for neuro monitoring = S06.5X0D (subsequent encounter, routine healing).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', '208962db-1b06-44b8-a7da-683825ef9ac7', 63, 'A patient has chronic heart failure, currently stable, and is admitted for SN medication management. During the episode, she develops an acute exacerbation. How should the HF code be updated?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4d170be-5ae9-4f7e-b607-561323dc2b69', '2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', 0, 'Keep the chronic HF code — do not change mid-episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec8ab24d-727d-4586-8318-4216ef1a759d', '2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', 1, 'Update to the acute on chronic code (e.g., I50.23 or I50.33)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bac5a834-861f-41f4-92c1-a6c469762371', '2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', 2, 'Add an acute HF code separately');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b639fa3-b74c-4467-acbc-f469e4dbc2df', '2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', 3, 'Discharge and readmit');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2772e3e9-a2e3-47c0-9b86-91d4a1a51fff', 'ec8ab24d-727d-4586-8318-4216ef1a759d', 'Update to the acute on chronic code When a patient with chronic HF develops an acute exacerbation, the code should be updated to the acute on chronic code (e.g., I50.23, I50.33, I50.43).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('802f7faf-dae2-44b0-81c8-043263b4cf97', '208962db-1b06-44b8-a7da-683825ef9ac7', 64, 'A patient has had bariatric surgery (gastric bypass) 2 years ago. She is admitted for SN management of nutritional deficiencies (B12 and iron deficiency). What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b6cd661-8917-49d7-9dee-a4b1f0396986', '802f7faf-dae2-44b0-81c8-043263b4cf97', 0, 'E53.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2a26112-1582-4639-9d9b-8fff7ea8682c', '802f7faf-dae2-44b0-81c8-043263b4cf97', 1, 'K91.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca5c9297-2257-489d-8a2e-760c2799bc26', '802f7faf-dae2-44b0-81c8-043263b4cf97', 2, 'Z98.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5379453-4424-4c31-91a9-903009f108e0', '802f7faf-dae2-44b0-81c8-043263b4cf97', 3, 'E53.8, D50.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('802f7faf-dae2-44b0-81c8-043263b4cf97', 'f2a26112-1582-4639-9d9b-8fff7ea8682c', 'K91.2 Postsurgical malabsorption (after gastric bypass) = K91.2 as M1021, which captures the underlying cause of the nutritional deficiencies.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', '208962db-1b06-44b8-a7da-683825ef9ac7', 65, 'A patient has documented “mild cognitive impairment.” She is not demented. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('236426ce-3371-4caf-88dc-681c90f743f0', 'e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', 0, 'F03.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfe047fe-1614-4415-8923-27ef2f742328', 'e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', 1, 'G31.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77aa1b70-0503-4099-b28b-da1c05b9586e', 'e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', 2, 'R41.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13b5144c-1828-4074-923c-e08e32cb0bb9', 'e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', 3, 'F06.7');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e813a8bc-a1a6-4e72-ae8e-fa72043b5d97', 'bfe047fe-1614-4415-8923-27ef2f742328', 'G31.84 Mild cognitive impairment (not dementia) = G31.84. F03.90 is unspecified dementia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f24ff57-0597-4376-9b62-9190b243d673', '208962db-1b06-44b8-a7da-683825ef9ac7', 66, 'A patient has a documented “exacerbation of multiple sclerosis.” What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff4d8bdf-c4ee-4c4b-bf42-6241bea9518e', '2f24ff57-0597-4376-9b62-9190b243d673', 0, 'G35');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66bb5b63-ceb2-4f7a-811a-17cf936961ef', '2f24ff57-0597-4376-9b62-9190b243d673', 1, 'G35, G81.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26070641-5bf5-40d4-9125-e2cc9119b821', '2f24ff57-0597-4376-9b62-9190b243d673', 2, 'G37.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f9606f8-25d5-4e7d-8ac6-f547de0f8f10', '2f24ff57-0597-4376-9b62-9190b243d673', 3, 'G35A (relapsing-remitting multiple sclerosis)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2f24ff57-0597-4376-9b62-9190b243d673', '6f9606f8-25d5-4e7d-8ac6-f547de0f8f10', 'G35A (relapsing-remitting multiple sclerosis) is correct. G35 alone is a non-billable parent requiring a specific-course subtype (relapsing-remitting, primary progressive, or secondary progressive). This corrects an outdated assumption: ICD-10-CM previously had no MS-course subdivision, so a rule like "G35 is used regardless of phase" was once accurate, but the code set now specifically subdivides MS by clinical course, and a documented exacerbation is itself the defining feature of the relapsing-remitting course, directly supporting G35A rather than the bare, no-longer-sufficient G35 parent.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fe16b1f4-edae-475d-a891-d9133d30213a', '208962db-1b06-44b8-a7da-683825ef9ac7', 67, 'A patient has bilateral hearing loss documented as sensorineural, moderate. She uses hearing aids. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69766312-adac-4e08-af93-671e94a25ef9', 'fe16b1f4-edae-475d-a891-d9133d30213a', 0, 'H90.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91798271-e8b0-4c62-a14b-6f36a0e7aa76', 'fe16b1f4-edae-475d-a891-d9133d30213a', 1, 'H90.3, Z97.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11e4a78c-8dc4-44e4-a3f3-fe1221706241', 'fe16b1f4-edae-475d-a891-d9133d30213a', 2, 'H91.93');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a50f7245-3d7a-4922-9103-f795fbf218d8', 'fe16b1f4-edae-475d-a891-d9133d30213a', 3, 'H90.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fe16b1f4-edae-475d-a891-d9133d30213a', '69766312-adac-4e08-af93-671e94a25ef9', 'H90.3 Bilateral sensorineural hearing loss = H90.3. Hearing aid use (Z97.4) may be added as secondary.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', '208962db-1b06-44b8-a7da-683825ef9ac7', 68, 'Under OASIS M1242 (frequency of pain interfering with activity or movement), what does this item assess?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d148550a-63b0-42fd-a395-5ab3b724ac72', 'b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', 0, 'Pain severity on a 0-10 scale');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b291679b-7282-432e-9452-4794d0b80917', 'b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', 1, 'How often the patient has pain that interferes with activity or movement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('333a98e3-e7ae-4b79-ac23-7f1534476a8f', 'b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', 2, 'Location of pain');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43cd10aa-f93e-43a8-9655-9f6477ff4e5f', 'b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', 3, 'Type of pain medication used');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b65a62b9-4ac8-495d-9e25-8a5ec84d20eb', 'b291679b-7282-432e-9452-4794d0b80917', 'How often the patient has pain that interferes with activity or movement M1242 assesses the frequency of pain interfering with activity/movement, not severity, location, or medication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('245bb1f3-fe61-4dbe-a109-b09c630ba075', '208962db-1b06-44b8-a7da-683825ef9ac7', 69, 'A patient has chronic venous insufficiency with a healed stasis ulcer. The ulcer is completely epithelialized. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c4e2954-6f0f-4bac-86a8-e770684a6804', '245bb1f3-fe61-4dbe-a109-b09c630ba075', 0, 'I87.2, L97.919');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e50391b-ebef-4954-9533-2b216f014435', '245bb1f3-fe61-4dbe-a109-b09c630ba075', 1, 'I87.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4d3f6a0-4e70-4a07-bdbf-26bd4ce7857a', '245bb1f3-fe61-4dbe-a109-b09c630ba075', 2, 'L97.919');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('614879f5-6969-4de7-9c38-b63a26d7b140', '245bb1f3-fe61-4dbe-a109-b09c630ba075', 3, 'I87.2, Z87.39');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('245bb1f3-fe61-4dbe-a109-b09c630ba075', '0e50391b-ebef-4954-9533-2b216f014435', 'I87.2 When the stasis ulcer has healed (epithelialized), the ulcer code is discontinued. Only the underlying venous insufficiency (I87.2) is coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8bea1729-41e9-477d-8d39-3cacb888a177', '208962db-1b06-44b8-a7da-683825ef9ac7', 70, 'A patient has a spinal cord stimulator in place for chronic pain management. She is admitted for SN management of the stimulator. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d4f33ca-d4a9-4257-9d4c-d7b5e4f474bf', '8bea1729-41e9-477d-8d39-3cacb888a177', 0, 'Z46.89, G89.29');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0121b127-2db9-4885-a899-564d87ab74d5', '8bea1729-41e9-477d-8d39-3cacb888a177', 1, 'G89.29, Z96.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08a3c1c4-85f3-4feb-b1bd-9d63b832402d', '8bea1729-41e9-477d-8d39-3cacb888a177', 2, 'Z46.89, G89.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da55a152-5b48-4d44-92d6-689c690e9174', '8bea1729-41e9-477d-8d39-3cacb888a177', 3, 'G89.29, Z46.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8bea1729-41e9-477d-8d39-3cacb888a177', '0d4f33ca-d4a9-4257-9d4c-d7b5e4f474bf', 'Z46.89, G89.29 Encounter for fitting/management of other device (spinal cord stimulator) = Z46.89. Chronic pain = G89.29.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('11cc8e85-2e45-4622-b4a3-86ddf3d01f01', '208962db-1b06-44b8-a7da-683825ef9ac7', 71, 'A patient has documented “resolving” pneumonia. She is still on antibiotics at home. Should the pneumonia still be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d54965d6-b0fe-41f5-a16c-74c52c30a164', '11cc8e85-2e45-4622-b4a3-86ddf3d01f01', 0, 'No — “resolving” means it is no longer active');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee1a98df-dae7-405b-8e64-f5749ad442b2', '11cc8e85-2e45-4622-b4a3-86ddf3d01f01', 1, 'Yes — code the pneumonia while it is still being treated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('522ddea1-765d-4b5d-8021-a83679fb805c', '11cc8e85-2e45-4622-b4a3-86ddf3d01f01', 2, 'Code Z87.01 (history of pneumonia)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69aec36b-37f4-4a93-850e-e53d25926664', '11cc8e85-2e45-4622-b4a3-86ddf3d01f01', 3, 'Code R06.00 (dyspnea) instead');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('11cc8e85-2e45-4622-b4a3-86ddf3d01f01', 'ee1a98df-dae7-405b-8e64-f5749ad442b2', 'Yes — code the pneumonia while it is still being treated “Resolving” means still present and under treatment. Continue coding the pneumonia until the condition has fully resolved.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', '208962db-1b06-44b8-a7da-683825ef9ac7', 72, 'Under OASIS, which RFA (Reason for Assessment) is used when a patient is being recertified for another 60-day episode?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c53a8301-4065-4262-8a47-024d9f7b568d', 'ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', 0, 'RFA 1 — Start of Care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53985d6b-c20b-4fb7-89e0-666546ccaba1', 'ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', 1, 'RFA 4 — Recertification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb3e1574-a02b-49fe-b33a-f165cf3a5f52', 'ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', 2, 'RFA 5 — Other follow-up');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bccd870d-6564-4e08-b077-838746930367', 'ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', 3, 'RFA 9 — Discharge');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ab5bd6b2-eb33-40e7-b6e6-ec4ad2277d4b', '53985d6b-c20b-4fb7-89e0-666546ccaba1', 'RFA 4 — Recertification RFA 4 is used for the recertification OASIS assessment when a new 60-day episode begins.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ebd190c4-e211-47cb-97b3-f96cbaf1b733', '208962db-1b06-44b8-a7da-683825ef9ac7', 73, 'A patient has documented “chronic systolic heart failure with an ejection fraction of 35%.” What is the correct HF code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00633468-5167-41f6-a11a-bf2137ba3e30', 'ebd190c4-e211-47cb-97b3-f96cbaf1b733', 0, 'I50.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d815474e-06af-45be-8aff-a695288f5371', 'ebd190c4-e211-47cb-97b3-f96cbaf1b733', 1, 'I50.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a33064e9-a0c3-4b00-8dc5-4a715c9d01b1', 'ebd190c4-e211-47cb-97b3-f96cbaf1b733', 2, 'I50.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddd74b84-8f94-44aa-822e-2b3454342680', 'ebd190c4-e211-47cb-97b3-f96cbaf1b733', 3, 'I50.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ebd190c4-e211-47cb-97b3-f96cbaf1b733', '00633468-5167-41f6-a11a-bf2137ba3e30', 'I50.22 Chronic systolic heart failure = I50.22. The EF percentage is clinical detail but does not change the code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e257746b-66de-4ed9-8655-94c948a2e3ed', '208962db-1b06-44b8-a7da-683825ef9ac7', 74, 'A patient is admitted to HH for PT after bilateral TKR. Both knees were replaced in the same surgical session, 3 weeks ago. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d16bc28c-500c-4395-8f7e-d1e0b9376ba8', 'e257746b-66de-4ed9-8655-94c948a2e3ed', 0, 'Z47.33');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f6e5f18-c747-42bf-8883-da234f1c3b0d', 'e257746b-66de-4ed9-8655-94c948a2e3ed', 1, 'Z47.33, Z96.652');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a5024bc-3b16-414d-a3e2-d378eb5e2efc', 'e257746b-66de-4ed9-8655-94c948a2e3ed', 2, 'Z47.33, Z96.651, Z96.652');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e36ea12b-3660-4d76-b74c-83a5703aa64d', 'e257746b-66de-4ed9-8655-94c948a2e3ed', 3, 'Z47.33 (covers bilateral)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e257746b-66de-4ed9-8655-94c948a2e3ed', 'e36ea12b-3660-4d76-b74c-83a5703aa64d', 'Z47.33 (covers bilateral) A single Z47.33 covers aftercare following both knee replacements. No additional Z96 codes are required.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('328559ce-ae14-49b8-aa43-1d49ce3c3656', '208962db-1b06-44b8-a7da-683825ef9ac7', 75, 'A patient has type 2 DM with documented “background diabetic retinopathy” of the right eye. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29bf72bc-3ffa-4312-b6d0-ddb63ae1cb2b', '328559ce-ae14-49b8-aa43-1d49ce3c3656', 0, 'E11.3211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a42a0c0-ff90-46aa-a5c3-cb3390695039', '328559ce-ae14-49b8-aa43-1d49ce3c3656', 1, 'E11.319');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9797fb1f-54d8-406a-8662-c6073ca93069', '328559ce-ae14-49b8-aa43-1d49ce3c3656', 2, 'E11.3111');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cdc0658c-9a28-40d7-b865-a34a845d723e', '328559ce-ae14-49b8-aa43-1d49ce3c3656', 3, 'E11.311');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('328559ce-ae14-49b8-aa43-1d49ce3c3656', '0a42a0c0-ff90-46aa-a5c3-cb3390695039', 'E11.3111 does not exist as a valid ICD-10-CM code — at the general "unspecified type" diabetic retinopathy tier (E11.31x), there is no laterality subdivision, only a with/without-macular-edema split (E11.311 with macular edema, E11.319 without). Since no macular edema is documented here, E11.319 is the billable code that applies. E11.3211 is a real, billable code, but it belongs to a more specific retinopathy-severity tier (mild nonproliferative, with macular edema) that would require the physician to have documented both the mild/background severity grade and macular edema, neither of which is stated in this stem beyond the general term "background."');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f577512-ed9b-4108-a234-06a5b65c7179', '208962db-1b06-44b8-a7da-683825ef9ac7', 76, 'A patient has both acute cystitis due to E. coli and chronic interstitial cystitis. How should both be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5cea1e1-a702-421c-9bd1-844ea9c36ee5', '5f577512-ed9b-4108-a234-06a5b65c7179', 0, 'N30.00, B96.20, N30.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('199a788c-0bc0-464c-96b8-2a74cdea786a', '5f577512-ed9b-4108-a234-06a5b65c7179', 1, 'N30.00, N30.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2cc8571-f0f2-4d7e-9791-b8366a996ec8', '5f577512-ed9b-4108-a234-06a5b65c7179', 2, 'N30.00, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3b6d217-bbc6-426c-abbd-f377b20152f1', '5f577512-ed9b-4108-a234-06a5b65c7179', 3, 'N30.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5f577512-ed9b-4108-a234-06a5b65c7179', 'f5cea1e1-a702-421c-9bd1-844ea9c36ee5', 'N30.00, B96.20, N30.10 Acute cystitis due to E. coli = N30.00 + B96.20. Chronic interstitial cystitis = N30.10. Both conditions are coded when both are present.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('107a3a80-932c-4758-8953-da64d8eccb39', '208962db-1b06-44b8-a7da-683825ef9ac7', 77, 'A patient has a sacral wound that was initially staged as a Stage 2 pressure ulcer. Two weeks later, a DTPI is observed adjacent to the Stage 2 wound (separate wound). How many pressure ulcers?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a69616e-f6a1-4178-9935-8957b85daa7f', '107a3a80-932c-4758-8953-da64d8eccb39', 0, '1 — combine them');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26d7bcd0-aa5c-458b-ab1b-087f3b595bcd', '107a3a80-932c-4758-8953-da64d8eccb39', 1, '2 — the Stage 2 and the DTPI are counted as separate pressure ulcers');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f6f4c16-e93c-454b-9a58-1bfce78f0a15', '107a3a80-932c-4758-8953-da64d8eccb39', 2, '1 — only the Stage 2 counts');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2228aac4-edd8-436d-b18b-a789ac136e87', '107a3a80-932c-4758-8953-da64d8eccb39', 3, '2 — but report both as Stage 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('107a3a80-932c-4758-8953-da64d8eccb39', '26d7bcd0-aa5c-458b-ab1b-087f3b595bcd', '2 The Stage 2 and the DTPI are separate pressure injuries at different locations/types and are counted individually.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79df828f-0ec9-4e84-8cf8-83322e1d93d8', '208962db-1b06-44b8-a7da-683825ef9ac7', 78, 'A patient with heart failure is admitted to HH. She has a documented “Do Not Resuscitate” order. Should DNR status be coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29544a42-6f79-43a8-b676-eae080a42ba7', '79df828f-0ec9-4e84-8cf8-83322e1d93d8', 0, 'Yes — Z66');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d51ed121-6ab5-456d-9bfb-202db8749383', '79df828f-0ec9-4e84-8cf8-83322e1d93d8', 1, 'No — DNR is not coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5be755ff-01b5-4096-a512-135c775b79e8', '79df828f-0ec9-4e84-8cf8-83322e1d93d8', 2, 'Only if the patient requests it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c55c7bb-e731-47c5-ab25-81a9fee66de3', '79df828f-0ec9-4e84-8cf8-83322e1d93d8', 3, 'Only in hospice settings');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('79df828f-0ec9-4e84-8cf8-83322e1d93d8', '29544a42-6f79-43a8-b676-eae080a42ba7', 'Yes — Z66 DNR status is coded with Z66 (do not resuscitate) when documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', '208962db-1b06-44b8-a7da-683825ef9ac7', 79, 'A patient has documented “history of COVID-19, recovered, with residual shortness of breath and fatigue.” What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29a2cb2e-59aa-453f-97dc-5c29b62059e0', '5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', 0, 'U09.9, R06.00, R53.83');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72884204-ec88-41ca-b397-2a9015b02da5', '5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', 1, 'J12.82, R06.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5824862b-d5b8-40ec-b866-f624b695fb70', '5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', 2, 'U09.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3d5c4d5-65ca-41a1-8ade-8beaa46c5b3e', '5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', 3, 'Z86.16, R06.00, R53.83');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5d5b2d2c-688d-4674-ad03-fd21a3d8ac25', '29a2cb2e-59aa-453f-97dc-5c29b62059e0', 'U09.9, R06.00, R53.83 Post-COVID condition = U09.9. The residual symptoms (shortness of breath R06.00, fatigue R53.83) are coded additionally.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('68ca8dc5-0fce-4c23-be25-c1cb57677ed8', '208962db-1b06-44b8-a7da-683825ef9ac7', 80, 'A patient has right carpal tunnel syndrome. She is receiving HH OT. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('668f37d3-8838-4f5c-9f96-052af43d2bdb', '68ca8dc5-0fce-4c23-be25-c1cb57677ed8', 0, 'G56.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('623c7ff7-9e3e-4b36-824a-1c546868a722', '68ca8dc5-0fce-4c23-be25-c1cb57677ed8', 1, 'G56.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c8b7da4-17ab-4078-b3c8-34785e0a9fbe', '68ca8dc5-0fce-4c23-be25-c1cb57677ed8', 2, 'G56.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0268f922-a2d5-47c6-9ee3-d47f19abcdfa', '68ca8dc5-0fce-4c23-be25-c1cb57677ed8', 3, 'M25.531');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('68ca8dc5-0fce-4c23-be25-c1cb57677ed8', '668f37d3-8838-4f5c-9f96-052af43d2bdb', 'G56.01 (carpal tunnel syndrome, right upper limb) is the specific, laterality-matched diagnosis code for the documented right-sided presentation. G56.00 (unspecified upper limb) would under-code the explicitly documented right-sided laterality when the more precise code is available and matches. G56.11 (other lesions of median nerve, right upper limb) is a different, broader median-nerve diagnosis family — carpal tunnel syndrome has its own dedicated code (G56.0x) and is not classified under the "other lesions" category once specifically diagnosed as CTS. M25.531 (pain in right wrist) is a nonspecific symptom code that would under-code the documented specific diagnosis — matching the specific-diagnosis-over-generic-symptom-code principle used throughout this project.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', '208962db-1b06-44b8-a7da-683825ef9ac7', 81, 'Per OASIS guidance, when assessing M1322 (current number of Stage 1 pressure ulcers), what defines Stage 1?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13390722-6643-40e6-a091-ba4a2daac671', '19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', 0, 'Open ulcer with red wound bed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77be564a-fd90-4516-a716-7a29553bb37f', '19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', 1, 'Non-blanchable erythema of intact skin');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f15d32a5-c3ac-4bdc-8849-fe03b178bf05', '19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', 2, 'Partial-thickness skin loss');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('696efb49-92e6-4504-899c-226618eddc5f', '19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', 3, 'Full-thickness skin loss');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('19cc8ac9-cb7c-4ccd-9091-0a2efc1260b0', '77be564a-fd90-4516-a716-7a29553bb37f', 'Non-blanchable erythema of intact skin Stage 1 pressure ulcer = non-blanchable erythema of intact skin.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07ea03f2-95b0-4b67-b6eb-06e219e06c98', '208962db-1b06-44b8-a7da-683825ef9ac7', 82, 'A patient has chronic pain managed by a fentanyl patch. She is admitted for SN pain management. She has documented chronic low back pain and cervical radiculopathy. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f925396d-6b5e-42d0-ac1d-e4bba45207c9', '07ea03f2-95b0-4b67-b6eb-06e219e06c98', 0, 'G89.29, M54.50, M54.12, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49e95e9c-3e06-42b5-89d8-023da869524c', '07ea03f2-95b0-4b67-b6eb-06e219e06c98', 1, 'M54.50, M54.12, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('adf6a6a8-4bee-4cb4-82db-c98ef34f7da6', '07ea03f2-95b0-4b67-b6eb-06e219e06c98', 2, 'G89.29, M54.5, M54.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('664f616e-f830-4bab-a886-eefa48cf337b', '07ea03f2-95b0-4b67-b6eb-06e219e06c98', 3, 'G89.29, M54.50, M54.12');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('07ea03f2-95b0-4b67-b6eb-06e219e06c98', 'f925396d-6b5e-42d0-ac1d-e4bba45207c9', 'G89.29, M54.50, M54.12, Z79.891 Chronic pain (G89.29) when it is the focus of care, with site-specific codes (M54.50 low back, M54.12 cervical radiculopathy) and Z79.891 (long-term opioid use).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1aabab0-2f35-4f37-ab0c-8a0542345101', '208962db-1b06-44b8-a7da-683825ef9ac7', 83, 'A patient has a tracheostomy that is well-established (placed 2 years ago for laryngeal cancer, now in remission). She develops tracheostomy-related mucus plugging during the HH episode. How is this coded?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11a7d664-9d51-4dd1-a0fd-75ef93cb7ff4', 'a1aabab0-2f35-4f37-ab0c-8a0542345101', 0, 'J95.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('441b223d-112d-4d5c-a445-8b2ace4481da', 'a1aabab0-2f35-4f37-ab0c-8a0542345101', 1, 'J95.03');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82c71656-3749-483b-afdb-2f8b7a445559', 'a1aabab0-2f35-4f37-ab0c-8a0542345101', 2, 'J95.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e55fb717-c1d5-447e-a04d-c6e0bfb77125', 'a1aabab0-2f35-4f37-ab0c-8a0542345101', 3, 'J95.04');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1aabab0-2f35-4f37-ab0c-8a0542345101', '11a7d664-9d51-4dd1-a0fd-75ef93cb7ff4', 'J95.09 Tracheostomy complication — mucus plugging of established tracheostomy = J95.09 (other tracheostomy complication).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d30120c-f35f-4f17-80f3-620dff41dd00', '208962db-1b06-44b8-a7da-683825ef9ac7', 84, 'A home health patient has Clostridium difficile colitis documented as “recurrent.” What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32970847-9d56-45aa-b6da-3b5a592daa4d', '2d30120c-f35f-4f17-80f3-620dff41dd00', 0, 'A04.71');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78ef246a-83b5-4272-8b5e-6127d9c4ac69', '2d30120c-f35f-4f17-80f3-620dff41dd00', 1, 'A04.72');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38f8cb45-02f4-40ac-b5ea-0d61536ea11a', '2d30120c-f35f-4f17-80f3-620dff41dd00', 2, 'A04.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05558279-2d16-4a4d-956c-d07e5d223773', '2d30120c-f35f-4f17-80f3-620dff41dd00', 3, 'K52.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d30120c-f35f-4f17-80f3-620dff41dd00', '78ef246a-83b5-4272-8b5e-6127d9c4ac69', 'A04.72 Recurrent C. difficile infection = A04.72 (specific code for recurrent C. diff).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75334e8a-a341-4597-9a0c-e4a63a80a7f7', '208962db-1b06-44b8-a7da-683825ef9ac7', 85, 'A patient has a feeding tube (nasogastric tube) in place. She is admitted for SN tube feeding management and assessment. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('616f5891-13ab-4481-9079-ce877c153ea1', '75334e8a-a341-4597-9a0c-e4a63a80a7f7', 0, 'Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a004e42-364d-4a2b-8c7e-dc84c95d84d5', '75334e8a-a341-4597-9a0c-e4a63a80a7f7', 1, 'Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48a131ff-a4f0-422e-8ea4-fc2fe48f9492', '75334e8a-a341-4597-9a0c-e4a63a80a7f7', 2, 'K94.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('203eb69e-bf0d-48f8-b60f-a3e4abd0af90', '75334e8a-a341-4597-9a0c-e4a63a80a7f7', 3, 'Z46.59');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75334e8a-a341-4597-9a0c-e4a63a80a7f7', '616f5891-13ab-4481-9079-ce877c153ea1', 'Z43.1 Encounter for attention to gastrostomy (nasogastric feeding tube care) = Z43.1 when tube feeding management is the primary reason for HH.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a3734003-fd9c-4672-8dd7-50ce7364f5c6', '208962db-1b06-44b8-a7da-683825ef9ac7', 86, 'A patient had a left CVA with right-sided weakness. She is right-hand dominant. The weakness has not been documented as hemiplegia — only as “right-sided weakness.” Can the coder code hemiplegia?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db0abb36-3095-4769-935e-47fd470e0077', 'a3734003-fd9c-4672-8dd7-50ce7364f5c6', 0, 'Yes — right-sided weakness is the same as hemiplegia');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99b2bb75-2127-4417-a440-559930111c1d', 'a3734003-fd9c-4672-8dd7-50ce7364f5c6', 1, 'No — code only what is documented; code R29.898 (other symptoms involving the musculoskeletal system) or query the clinician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3cf08d5c-b44f-41de-a1c5-3a494d57cdd0', 'a3734003-fd9c-4672-8dd7-50ce7364f5c6', 2, 'Yes — G81.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c0d0a459-d39e-4853-a2f6-105a48370985', 'a3734003-fd9c-4672-8dd7-50ce7364f5c6', 3, 'No — do not code any weakness');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a3734003-fd9c-4672-8dd7-50ce7364f5c6', '99b2bb75-2127-4417-a440-559930111c1d', 'No — code only what is documented “Right-sided weakness” is not the same as hemiplegia. Code only the documented condition. The coder should query the clinician if hemiplegia is suspected but not documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e98fbc3-53a4-4298-8f19-c629446ed037', '208962db-1b06-44b8-a7da-683825ef9ac7', 87, 'A patient is admitted to HH for SN management of dehydration with hypernatremia. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('de11918e-9c56-4f17-9244-95391fd6b5a7', '8e98fbc3-53a4-4298-8f19-c629446ed037', 0, 'E86.0, E87.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b983a83-b8ac-457a-a6c6-e9b003b2b5e3', '8e98fbc3-53a4-4298-8f19-c629446ed037', 1, 'E86.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a85e03b2-e7f7-4d1b-8149-d659d2ba348b', '8e98fbc3-53a4-4298-8f19-c629446ed037', 2, 'E87.0, E86.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2836b3c7-7a72-4455-962d-2bb747417a14', '8e98fbc3-53a4-4298-8f19-c629446ed037', 3, 'E86.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8e98fbc3-53a4-4298-8f19-c629446ed037', 'de11918e-9c56-4f17-9244-95391fd6b5a7', 'E86.0, E87.0 Dehydration = E86.0. Hypernatremia = E87.0. Both are coded.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34bb6fdd-32f4-447c-a18d-5cf866f5fd38', '208962db-1b06-44b8-a7da-683825ef9ac7', 88, 'A patient has a documented sacral coccygeal pilonidal cyst with abscess. She is receiving HH wound care. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9157d904-d249-48e7-93fb-f5aa2f9cbc76', '34bb6fdd-32f4-447c-a18d-5cf866f5fd38', 0, 'L05.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e4bc7e65-0ff4-4974-a257-2eb5a7c020cc', '34bb6fdd-32f4-447c-a18d-5cf866f5fd38', 1, 'L89.150');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e03a1d06-f308-433b-b9dc-b58c0103e6d8', '34bb6fdd-32f4-447c-a18d-5cf866f5fd38', 2, 'L05.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85d153b6-a709-4ad1-bbbf-24ee09dce454', '34bb6fdd-32f4-447c-a18d-5cf866f5fd38', 3, 'L05.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('34bb6fdd-32f4-447c-a18d-5cf866f5fd38', '9157d904-d249-48e7-93fb-f5aa2f9cbc76', 'L05.01 Pilonidal cyst with abscess = L05.01. This is a skin condition, not a pressure ulcer.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('91c12fa1-648a-4173-8bce-158a8a366d01', '208962db-1b06-44b8-a7da-683825ef9ac7', 89, 'A patient has a history of falls with a recent fall resulting in a right wrist fracture (Colles type). She is in HH for PT. The fracture is healing. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb5c5cf7-e305-4420-b27d-39e2a3f41d3d', '91c12fa1-648a-4173-8bce-158a8a366d01', 0, 'S52.531D, R29.6, Z91.81, W01.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c813df8-14dc-44f3-8e3f-b7310af300ea', '91c12fa1-648a-4173-8bce-158a8a366d01', 1, 'S52.531D, W01.0XXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2033ca5c-4016-4332-8b5b-5a6485e3ea29', '91c12fa1-648a-4173-8bce-158a8a366d01', 2, 'S52.531D, Z91.81, W18.30XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3df37bd-5236-48d5-ae7c-7cccd7cbc891', '91c12fa1-648a-4173-8bce-158a8a366d01', 3, 'S52.531A, R29.6, Z91.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('91c12fa1-648a-4173-8bce-158a8a366d01', 'cb5c5cf7-e305-4420-b27d-39e2a3f41d3d', 'S52.531D, R29.6, Z91.81, W01.0XXD Healing Colles fracture = S52.531D. Repeated falls = R29.6. History of falling = Z91.81. External cause = W01.0XXD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8b62e5ba-b365-4d95-b977-8cabcd86dc97', '208962db-1b06-44b8-a7da-683825ef9ac7', 90, 'A patient has a non-pressure chronic ulcer of the right ankle with necrosis of bone. The etiology is documented as diabetes type 2 with PVD. What is the complete coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('236e87d9-f18e-4523-8ee2-200b96c136f1', '8b62e5ba-b365-4d95-b977-8cabcd86dc97', 0, 'E11.51, E11.621, L97.314, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da7df865-4d0a-49d5-b274-e7607016e80a', '8b62e5ba-b365-4d95-b977-8cabcd86dc97', 1, 'E11.621, L97.314, E11.51, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('23415119-c80b-49f4-a825-8ebeebde9791', '8b62e5ba-b365-4d95-b977-8cabcd86dc97', 2, 'E11.51, L97.314, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0403145e-b118-411b-bfee-9bc98a6d8dac', '8b62e5ba-b365-4d95-b977-8cabcd86dc97', 3, 'E11.622, L97.314, I70.233, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8b62e5ba-b365-4d95-b977-8cabcd86dc97', '236e87d9-f18e-4523-8ee2-200b96c136f1', 'E11.51, E11.621, L97.314, Z79.4 DM with PVD = E11.51. DM with foot ulcer = E11.621. Right ankle, bone necrosis = L97.314. Z79.4 for insulin.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eee8dea6-f190-41bf-a7b6-b5bad5defacf', '208962db-1b06-44b8-a7da-683825ef9ac7', 91, 'A patient had a cesarean section 4 weeks ago. She is admitted for SN wound care of the C-section incision, which has partially dehisced. She is within the postpartum period. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fae4f78-7f33-4457-9a5a-6c57e0c8e3d6', 'eee8dea6-f190-41bf-a7b6-b5bad5defacf', 0, 'T81.31XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc02f686-df1f-4a69-9484-5246eae8f4d5', 'eee8dea6-f190-41bf-a7b6-b5bad5defacf', 1, 'O90.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('941d05c0-d4a4-477a-8a08-dc76e7003a59', 'eee8dea6-f190-41bf-a7b6-b5bad5defacf', 2, 'O90.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dce75b5f-2b95-4055-8631-2e7d20407fab', 'eee8dea6-f190-41bf-a7b6-b5bad5defacf', 3, 'O86.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eee8dea6-f190-41bf-a7b6-b5bad5defacf', 'dc02f686-df1f-4a69-9484-5246eae8f4d5', 'O90.0 Disruption of cesarean wound within the postpartum period = O90.0 (Chapter 15 obstetric code applies during the postpartum period).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('472a740c-68b4-47dd-b7b8-d486c1862075', '208962db-1b06-44b8-a7da-683825ef9ac7', 92, 'A home health patient has both urinary and fecal incontinence. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('423397e4-2671-4d6f-91ce-d6be46144009', '472a740c-68b4-47dd-b7b8-d486c1862075', 0, 'N39.498, R15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b04214b-795d-4729-be3c-0e38d0dfaddc', '472a740c-68b4-47dd-b7b8-d486c1862075', 1, 'R32, R15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03fcb6ae-89ac-4f3d-9c7d-caf3f2fc1510', '472a740c-68b4-47dd-b7b8-d486c1862075', 2, 'N39.46, R15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40b57647-cc63-4a0b-befc-d1830e936fc3', '472a740c-68b4-47dd-b7b8-d486c1862075', 3, 'N39.498, K59.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('472a740c-68b4-47dd-b7b8-d486c1862075', '423397e4-2671-4d6f-91ce-d6be46144009', 'N39.498, R15.9 Other specified urinary incontinence = N39.498. Fecal incontinence = R15.9.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f0d2b160-a114-41b0-9bc4-70a16b222c3b', '208962db-1b06-44b8-a7da-683825ef9ac7', 93, 'A patient has severe protein-calorie malnutrition documented by the physician. She is receiving HH for SN nutritional management. She also has CHF and COPD. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df2b5fe4-76ad-4a51-bf85-e41100fd6c73', 'f0d2b160-a114-41b0-9bc4-70a16b222c3b', 0, 'E43, I50.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5fce0745-d156-4430-afb7-86046eff7f1d', 'f0d2b160-a114-41b0-9bc4-70a16b222c3b', 1, 'E46, I50.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d735be5c-3fc4-403c-9559-543a05650f54', 'f0d2b160-a114-41b0-9bc4-70a16b222c3b', 2, 'E44.0, I50.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ccd2bae3-dcb8-4b13-b3e3-36a9ea72b92d', 'f0d2b160-a114-41b0-9bc4-70a16b222c3b', 3, 'E43');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f0d2b160-a114-41b0-9bc4-70a16b222c3b', 'df2b5fe4-76ad-4a51-bf85-e41100fd6c73', 'E43, I50.9, J44.9 Severe protein-calorie malnutrition = E43. CHF = I50.9. COPD = J44.9.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('483c6f16-0383-4136-b543-973666548149', '208962db-1b06-44b8-a7da-683825ef9ac7', 94, 'For OASIS M1860 (ambulation), a patient who requires human assistance and a walker to walk is rated as:');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efd12489-573d-4aab-b9e2-76e13f461726', '483c6f16-0383-4136-b543-973666548149', 0, '0 — able to ambulate independently');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4267e361-a6a2-4c31-99a2-30c35e9de4bb', '483c6f16-0383-4136-b543-973666548149', 1, '2 — requires human supervision or assistance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8c516b1-0583-466c-823a-e35d471e0a9d', '483c6f16-0383-4136-b543-973666548149', 2, '1 — requires use of device');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb99e85c-3c2b-413c-af75-8cd38dde13a6', '483c6f16-0383-4136-b543-973666548149', 3, '3 — able to walk only with the help of another person');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('483c6f16-0383-4136-b543-973666548149', '4267e361-a6a2-4c31-99a2-30c35e9de4bb', '2 — requires human supervision or assistance A patient who requires human assistance and a device to ambulate is rated at the level requiring human help, which supersedes device use alone.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3d206845-5001-4d18-b67d-7cac16ccd4de', '208962db-1b06-44b8-a7da-683825ef9ac7', 95, 'A patient has type 2 diabetes with hyperglycemia. She is on insulin, metformin, and glipizide. What codes apply?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50d5113c-cf64-44c9-95fd-ddfbc1025354', '3d206845-5001-4d18-b67d-7cac16ccd4de', 0, 'E11.65, Z79.4, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e7e7552-cf19-4e95-9a71-f2853522f7c4', '3d206845-5001-4d18-b67d-7cac16ccd4de', 1, 'E11.65, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c273d55-2854-4aa2-9492-897bd7921794', '3d206845-5001-4d18-b67d-7cac16ccd4de', 2, 'E11.9, Z79.4, Z79.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b0fa2a7-2b28-4aab-b5ed-292902d1f538', '3d206845-5001-4d18-b67d-7cac16ccd4de', 3, 'E11.65, Z79.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3d206845-5001-4d18-b67d-7cac16ccd4de', '50d5113c-cf64-44c9-95fd-ddfbc1025354', 'E11.65, Z79.4, Z79.84 DM with hyperglycemia = E11.65. Z79.4 = insulin use (type 2). Z79.84 = long-term oral hypoglycemic.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dcb63bde-250c-4f8a-8f8f-2c85a49a4705', '208962db-1b06-44b8-a7da-683825ef9ac7', 96, 'A patient has acute bronchitis. She does not have COPD. What is the correct code?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51a74e82-85e9-4e53-8776-a56fd6826e6e', 'dcb63bde-250c-4f8a-8f8f-2c85a49a4705', 0, 'J20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3875fbc3-977f-4fb5-aba3-6e86779e9aec', 'dcb63bde-250c-4f8a-8f8f-2c85a49a4705', 1, 'J44.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e651f29c-d41a-4c1e-bd78-40c9e0faebe7', 'dcb63bde-250c-4f8a-8f8f-2c85a49a4705', 2, 'J40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61272729-d8c9-477b-94f9-d7f97909a7ab', 'dcb63bde-250c-4f8a-8f8f-2c85a49a4705', 3, 'J06.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dcb63bde-250c-4f8a-8f8f-2c85a49a4705', '51a74e82-85e9-4e53-8776-a56fd6826e6e', 'J20.9 Acute bronchitis without COPD = J20.9. J44.0 is only used when acute bronchitis occurs WITH documented COPD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f6994874-0eff-401c-be5a-50199d8c3ff7', '208962db-1b06-44b8-a7da-683825ef9ac7', 97, 'Under the OASIS guidance, what is the purpose of the M1028 item (active diagnoses)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('615532ec-eb8d-4276-bf8c-196ad715e0e5', 'f6994874-0eff-401c-be5a-50199d8c3ff7', 0, 'To list only the primary and secondary diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1c34d0d-81d8-4d48-bdc5-bc1031f5c606', 'f6994874-0eff-401c-be5a-50199d8c3ff7', 1, 'To capture all active diagnoses, comorbidities, and co-existing conditions relevant to the plan of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8f5c455-f8ca-4424-b661-acadef27245d', 'f6994874-0eff-401c-be5a-50199d8c3ff7', 2, 'To document only surgical diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a00c96b1-804e-43b4-af7a-ba771fe27abb', 'f6994874-0eff-401c-be5a-50199d8c3ff7', 3, 'To record only diagnoses that affect payment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f6994874-0eff-401c-be5a-50199d8c3ff7', 'f1c34d0d-81d8-4d48-bdc5-bc1031f5c606', 'M1028 captures all active diagnoses, comorbidities, and co-existing conditions relevant to the plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8b5c44f3-c35a-4554-8946-cd3487a66cd9', '208962db-1b06-44b8-a7da-683825ef9ac7', 98, 'A patient has documented “neuropathic foot ulcer” without documentation of diabetes or vascular disease. What should the coder do?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8a5da37-20f6-42d9-bede-46bf5c3aeb78', '8b5c44f3-c35a-4554-8946-cd3487a66cd9', 0, 'Assume it is diabetic and code E11.621');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26f7173d-0287-4ec0-84f6-49aaffc72fbf', '8b5c44f3-c35a-4554-8946-cd3487a66cd9', 1, 'Code L97.511 and query the physician for the underlying etiology');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1170ddf8-29c0-4540-9342-8b267dc44614', '8b5c44f3-c35a-4554-8946-cd3487a66cd9', 2, 'Code as a pressure ulcer');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('663dcc63-34b8-4849-8ecc-697578b31a28', '8b5c44f3-c35a-4554-8946-cd3487a66cd9', 3, 'Code L98.499');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8b5c44f3-c35a-4554-8946-cd3487a66cd9', '26f7173d-0287-4ec0-84f6-49aaffc72fbf', 'Code L97.511 and query the physician “Neuropathic foot ulcer” without documented etiology should be coded with the wound code and the physician queried for the underlying cause (diabetes, other neuropathy, etc.).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', '208962db-1b06-44b8-a7da-683825ef9ac7', 99, 'A patient is admitted for HH after hospitalization for acute respiratory failure due to COPD exacerbation. The respiratory failure has resolved. The COPD exacerbation is still being treated. What is M1021?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf2237f6-a8bc-4aa0-9b6f-e3e612ca148a', '2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', 0, 'J96.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('136aabba-4978-4e9b-968e-02774e722c0c', '2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', 1, 'J44.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe1b9c7e-033a-47ce-891a-38e1850ded71', '2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', 2, 'J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33878ab3-b5df-4a38-8c2b-eeb3e6da5437', '2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', 3, 'J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2f9bbd4a-b1b7-4eab-91bf-7a9a10e418de', '136aabba-4978-4e9b-968e-02774e722c0c', 'J44.1 Resolved respiratory failure is not coded. Active COPD with acute exacerbation = J44.1 as M1021.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9ac6e32b-70c6-4592-af9f-fa809a4031c3', '208962db-1b06-44b8-a7da-683825ef9ac7', 100, 'Per OASIS, when should a significant change in condition (SCIC) OASIS assessment be completed?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8ba28a36-3027-48ac-91a9-367fb37b9922', '9ac6e32b-70c6-4592-af9f-fa809a4031c3', 0, 'A SCIC OASIS was eliminated and is no longer a valid RFA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fae41e14-3e4c-4470-baaa-a16479c1972e', '9ac6e32b-70c6-4592-af9f-fa809a4031c3', 1, 'Within 5 days of the significant change');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d2a7bb4-9ef5-4434-84e4-475263a5bb5e', '9ac6e32b-70c6-4592-af9f-fa809a4031c3', 2, 'At the next scheduled visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d903c0aa-5f42-403a-851f-6dc1108a71f1', '9ac6e32b-70c6-4592-af9f-fa809a4031c3', 3, 'Within 48 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9ac6e32b-70c6-4592-af9f-fa809a4031c3', '8ba28a36-3027-48ac-91a9-367fb37b9922', 'A SCIC OASIS was eliminated and is no longer a valid RFA The Significant Change in Condition (SCIC) OASIS assessment was eliminated effective January 1, 2019. It is no longer a valid RFA.');
