# ICD-10-CM — Complete Coding Guide (FY2026)

## What is ICD-10-CM?

ICD-10-CM (International Classification of Diseases, 10th Revision, Clinical Modification) is the US standard diagnostic coding system used for:
- Medical billing (claims to Medicare, Medicaid, private insurance)
- Statistical tracking and public health reporting
- Home health documentation (OASIS + PDGM)
- Inpatient and outpatient facility coding

**Code structure:** Alphanumeric, 3–7 characters
- Character 1: Letter (A–Z)
- Characters 2–3: Numbers (subcategory)
- Character 4+: Specificity (etiology, anatomic site, severity, laterality)

---

## ICD-10-CM Chapter Structure (A–Z)

| Chapter | Categories | Subject |
|---------|-----------|---------|
| 1 | A00–B99 | Infectious and Parasitic Diseases |
| 2 | C00–D49 | Neoplasms |
| 3 | D50–D89 | Blood Diseases |
| 4 | E00–E89 | **Endocrine, Nutritional, Metabolic** (Diabetes here) |
| 5 | F01–F99 | Mental & Behavioral |
| 6 | G00–G99 | Nervous System |
| 7 | H00–H59 | Eye and Adnexa |
| 8 | H60–H95 | Ear and Mastoid |
| 9 | I00–I99 | **Circulatory System** (HTN, Heart disease) |
| 10 | J00–J99 | **Respiratory System** (COPD, Pneumonia) |
| 11 | K00–K95 | Digestive System |
| 12 | L00–L99 | Skin and Subcutaneous |
| 13 | M00–M99 | **Musculoskeletal** (Arthritis, fractures) |
| 14 | N00–N99 | Genitourinary |
| 15 | O00–O9A | Pregnancy, Childbirth |
| 16 | P00–P96 | Perinatal |
| 17 | Q00–Q99 | Congenital malformations |
| 18 | R00–R99 | **Symptoms, Signs** (unspecified — avoid when specific known) |
| 19 | S00–T88 | **Injuries, Poisoning** |
| 20 | V00–Y99 | External causes (cause of injury) |
| 21 | Z00–Z99 | **Factors Influencing Health** (Z codes — history, status) |

---

## Coding Conventions — Must Know

### Alphabetic Index vs Tabular List
1. **Always use Alphabetic Index FIRST** — find the term, locate the code suggestion
2. **Verify in Tabular List** — never code from the index alone; tabular has instructional notes

### Key Conventions

**Etiology/Manifestation (E/M) Convention:**
- When a disease causes another condition, code the **underlying disease first**, then the manifestation
- Manifestation codes are in **[brackets]** in the index
- Example: Diabetic retinopathy — code diabetes first (E11.3-), then retinopathy

**Code first (CF):** Instructional note at manifestation code — sequence this code after the underlying condition

**Use additional code:** Add a code to provide further detail (e.g. body mass index, smoking status, resistance to antibiotics)

**Excludes 1:** Codes should NEVER be used together (mutually exclusive)
**Excludes 2:** Condition may coexist — patient may have both conditions

**NOS (Not Otherwise Specified):** Use when documentation is insufficient to assign a more specific code. Equivalent to "unspecified."

**NEC (Not Elsewhere Classified):** Use when a specific code exists but not for this particular condition.

---

## High-Complexity Coding Areas

### Diabetes Mellitus (Chapter 4)
Most common coding scenario — must get right every time.

**Type 1 vs Type 2 vs Secondary:**
- E10- : Type 1 Diabetes Mellitus (insulin-dependent, autoimmune)
- E11- : Type 2 Diabetes Mellitus (most common; may or may not use insulin)
- E13- : Other specified diabetes (secondary to another condition, drug-induced)
- O24- : Diabetes in pregnancy (separate category — O codes)

**"Diabetes with" rule:** ICD-10 Official Guidelines — if patient has diabetes AND a condition commonly associated with diabetes, assume a causal relationship unless documented otherwise (no need for physician to explicitly say "due to diabetes").

**Commonly linked diabetic complications:**
- E11.65 = Type 2 DM with hyperglycemia
- E11.40 = Type 2 DM with diabetic neuropathy, unspecified
- E11.311 = Type 2 DM with unspecified diabetic retinopathy with macular edema
- E11.621 = Type 2 DM with foot ulcer (also add L97.- for site and severity)
- E11.641 = Type 2 DM with hypoglycemia with coma
- E11.9 = Type 2 DM without complications

### Hypertension (Chapter 9)
- I10: Essential (primary) hypertension — single code for most patients
- **HTN + Heart disease = Hypertensive Heart Disease (I11-)** — causal relationship assumed
  - I11.0 = Hypertensive heart disease with heart failure (also code I50.- for type of HF)
  - I11.9 = Hypertensive heart disease without heart failure
- **HTN + CKD = Hypertensive CKD (I12-)** — causal relationship assumed
  - I12.9 + N18.3 = HTN with CKD Stage 3
- **HTN + Heart + CKD = I13-** (combination code for all three)
- Secondary hypertension (I15-): Due to renovascular, endocrine, etc. — code underlying cause first

### Sepsis
Sepsis coding is complex — requires careful application of guidelines.

**Sepsis:** Life-threatening organ dysfunction due to dysregulated host response to infection.

**Severe Sepsis:** Sepsis + acute organ dysfunction

**Septic Shock:** Severe sepsis + vasopressor requirement despite adequate fluid resuscitation

**Coding sepsis:**
1. **Primary/Admitted for sepsis:** Code sepsis first + the organism
   - A41.9 + causative organism (A41.01 for MRSA sepsis)
2. **Sepsis develops during hospitalization:** Code the condition causing hospitalization first, then sepsis as complication
3. **Severe sepsis:** Code sepsis + R65.20 (without septic shock) or R65.21 (with septic shock)

**Note:** Sepsis code NEVER goes as principal diagnosis when caused by postprocedural infection — code the complication code first.

---

## OASIS (Outcome and Assessment Information Set)

OASIS is required for Medicare/Medicaid home health patients to determine PDGM payment group.

**Key OASIS data items for coding:**
- M1021/M1023: Primary/secondary diagnoses — must reflect patient's current conditions
- M1033: Risk of hospitalization
- M1800-M1870: Functional status (bathing, dressing, grooming, mobility)
- M2020: Management of oral medications
- M2200: Therapy need

**PDGM (Patient Driven Groupings Model):**
Payment system since January 2020 for 30-day home health periods:
1. **Timing:** Early (first 30 days) or Late (subsequent)
2. **Admission source:** Community or Institutional (hospital/SNF)
3. **Clinical grouping:** 9 categories (MMTA, Behavioral Health, Complex Nursing, etc.)
4. **Functional impairment:** Low, Medium, High
5. **Comorbidity adjustment:** None, Low, High

These 5 factors determine one of **432 PDGM groups** and the base payment rate.

---

## Coding Scenarios — Practice

**Scenario 1:** Patient admitted for right lower extremity cellulitis. MRSA confirmed.
- L03.115 (Cellulitis of right lower limb) + B95.62 (MRSA as cause)

**Scenario 2:** Home health patient, Type 2 DM with diabetic peripheral neuropathy and Stage 3 CKD.
- E11.40 (T2DM with neuropathy) + N18.3 (CKD Stage 3) + I12.9 (hypertensive CKD, if HTN present)

**Scenario 3:** Fall from ladder at home; fracture left distal radius.
- S52.501A (Unspecified fracture of lower end of left radius, initial encounter)
- W11.XXXA (Fall on/from ladder, initial encounter)
- Y93.89 (Activity, other specified)

**Scenario 4:** Patient with COPD exacerbation and pneumonia (organism not identified).
- J44.1 (COPD with acute exacerbation) + J18.9 (Pneumonia, unspecified)
- Note: When COPD and pneumonia coexist, both are coded. The reason for the visit determines sequencing.
