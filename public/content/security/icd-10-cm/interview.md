# ICD-10-CM Interview Q&A

**Q: What is the structure of an ICD-10-CM code?**
3-7 alphanumeric characters. First character always a letter. Decimal point after the 3rd character. Characters 4-7 add specificity: laterality, severity, encounter type, or complication detail. Placeholder X inserted when a 7th character is needed but the code is shorter than 6 characters (e.g., T40.1X1A — X fills position 5). Example: E11.621A = Type 2 DM with left foot ulcer, initial encounter.

**Q: When should Z codes be used?**
For factors influencing health status when patient does NOT have an active disease: screenings, immunizations, family history (Z80-Z84), personal history (Z85-Z87), long-term drug use (Z79), social determinants of health (Z55-Z65), follow-up visits, BMI (with obesity code E66 first).
Avoid as principal diagnosis for inpatient: when an active condition explains the admission. Never use Z codes as the only code when an active condition is the reason for the encounter.

**Q: How do you code Type 2 DM with CKD stage 3 and hypertension?**
I12.9 (HTN with CKD stages 1-4 — combination code; do NOT code I10 separately) + E11.22 (T2DM with diabetic CKD — presumes causal relationship) + N18.3 (CKD stage 3 — add for specificity) + Z79.4 (if insulin-dependent). ICD-10-CM assumes HTN causes CKD and DM causes CKD when both conditions are documented — always use available combination codes.

**Q: What is the difference between 7th characters A, D, and S for injury codes?**
A (Initial encounter): Patient is actively receiving treatment — surgery, casting, antibiotics, wound VAC, active wound care.
D (Subsequent encounter): Routine care during NORMAL healing — dressing changes, cast checks, physical therapy during healing.
S (Sequela): A LATE EFFECT occurring AFTER the acute phase has resolved — post-traumatic arthritis following an old fracture, scar contracture after a healed burn.

**Q: How are burns coded?**
By degree: 1st (superficial, epidermis only, .0), 2nd (partial thickness, .1), 3rd (full thickness, .2). By body site with laterality. Corrosions (chemical burns) coded separately (T26-T28 vs T20-T25). Add T31 TBSA codes when 3rd-degree burns involve ≥20% body surface area or when total extent is significant for monitoring. External cause codes identify the heat source.

**Q: What are COVID-19 codes?**
U07.1: COVID-19 — confirmed by positive test OR clinical diagnosis. Active infection.
U09.9: Post-COVID condition — residual symptoms after acute COVID has resolved (fatigue, dyspnoea, brain fog, etc.).
Z20.822: Exposure or contact with COVID-19 — no infection confirmed, no symptoms.
Z86.16: Personal history of COVID-19 — fully resolved, no ongoing conditions attributed to it.
M35.81: Multisystem inflammatory syndrome (MIS) associated with COVID-19.

**Q: How do you code sepsis with organ dysfunction?**
Step 1: Code the sepsis with organism: A41.9 (unspecified), A41.01 (MRSA), A41.1 (gram-negative), etc.
Step 2: Add R65.20 (severe sepsis without septic shock) or R65.21 (severe sepsis with septic shock) if applicable.
Step 3: Code each organ dysfunction separately: N17.9 (acute kidney injury), J96.00 (acute respiratory failure), etc.
Sequencing: sepsis code FIRST, then severity modifier, then organ dysfunctions. Never sequence organ dysfunction before the sepsis code.

**Q: What are the 7th character options for fracture codes and when is each used?**
For traumatic fractures: A (initial encounter — active treatment: surgery, casting, reduction); D (subsequent encounter — routine healing: cast checks, follow-up); G (subsequent encounter, delayed healing); K (subsequent encounter, nonunion — fracture failed to unite); P (subsequent encounter, malunion — healed in abnormal position); S (sequela — late effect after healing complete).
For pathological fractures (M84.5-): A/D/G/K/P/S apply similarly. The distinction between A and D is TREATMENT PHASE, not number of visits — multiple visits for active wound care = all coded A.

**Q: How do you code external cause codes and what are they used for?**
External cause codes (V00-Y99) identify: HOW an injury occurred (mechanism — fall, motor vehicle, assault), WHERE it occurred (activity and place of occurrence), and the patient's status at the time (activity code). Never used as the principal/first-listed diagnosis — always additional codes. Required for: trauma, poisonings, adverse effects, burns, and other external cause conditions. Used for: injury surveillance, public health epidemiology, workers' compensation, legal purposes, quality improvement. Always assign the most specific external cause code available based on documentation.

**Q: How do you code a drug adverse effect vs poisoning vs underdosing?**
Adverse effect: drug taken correctly (correct dose, route, substance) but causes a harmful reaction. Code the manifestation FIRST, then the adverse effect code (T36-T65 with 5th character 5). Example: patient taking warfarin correctly develops GI bleed → K92.1 (GI bleed) + T45.515A (adverse effect of anticoagulants).
Poisoning: drug taken incorrectly, intentionally or accidentally overdosed, or wrong drug given. Code poisoning FIRST (T36-T65 with 5th character 1-4), then manifestation. Example: accidental acetaminophen overdose → T39.1X1A (poisoning, accidental) + K72.00 (hepatic failure).
Underdosing: patient taking LESS than prescribed. Code the medical condition that worsened, then underdosing code (5th character 6). Example: seizure due to patient skipping epilepsy medication.
