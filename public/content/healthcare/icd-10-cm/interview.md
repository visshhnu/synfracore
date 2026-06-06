# ICD-10-CM Interview Questions & Advanced Coding

## Beginner Questions

**What is the difference between ICD-10-CM and ICD-10-PCS?**
ICD-10-CM (Clinical Modification) is used to code **diagnoses** — what the patient has. It's used by all healthcare settings: physician offices, hospitals, outpatient facilities. ICD-10-PCS (Procedure Coding System) is used to code **inpatient procedures** — what was done to the patient in a hospital setting. PCS is only used for hospital inpatient claims. Outpatient procedures use CPT codes.

---

**What does "code to the highest level of specificity" mean?**
Always use the most specific code available that is supported by the documentation. If a code has 4, 5, 6, or 7 characters available, you must use all required characters. Choosing a less specific code when a more specific one exists is called "undercoding" and can result in claim denials and compliance issues. Example: M79.3 is "Panniculitis, unspecified" — if the documentation specifies the site, you must code to the site-specific code.

---

**What is the significance of the first-listed diagnosis in outpatient coding?**
For outpatient encounters, the first-listed diagnosis (not "principal diagnosis" — that term is only for inpatient) is the condition established to be chiefly responsible for the visit. In outpatient, do NOT code "probable" or "suspected" diagnoses — only code confirmed conditions or the symptom/sign. The first-listed diagnosis drives reimbursement and reporting.

---

## Intermediate Questions

**Explain the coding for diabetes mellitus with complications.**

Diabetes codes are combination codes — one code captures both the diabetes type AND the complication. Key rules:

1. First identify the type: Type 1 (E10), Type 2 (E11), Other (E13), unspecified (E14)
2. The 5th character indicates the complication
3. Many complications require additional codes per "Use additional code" notes
4. Always code long-term insulin use (Z79.4) for Type 2 patients on insulin

```
E11.40  Type 2 DM with diabetic neuropathy, unspecified
E11.42  Type 2 DM with diabetic polyneuropathy
E11.649 Type 2 DM with hypoglycemia without coma
E11.65  Type 2 DM with hyperglycemia
E11.22  Type 2 DM with diabetic CKD, stage 3
        + N18.3 (CKD stage 3) — required additional code
E11.311 Type 2 DM with unspecified diabetic retinopathy with macular edema
        + Z79.4 if on insulin
```

---

**What is the sequencing rule for sepsis?**

Sepsis sequencing is a high-stakes coding scenario:

**Sepsis as principal diagnosis:**
- Code first: the sepsis code (A41.9 Sepsis, unspecified, or specific organism)
- Then: the underlying localized infection (e.g., J18.9 Pneumonia) as additional
- Then: organ dysfunction codes if applicable (e.g., N17.9 Acute kidney failure)

**Sepsis present on admission with a localized infection:**
```
Sequence:
1. A41.01 Sepsis due to MRSA (or appropriate organism code)
2. J18.9  Pneumonia, unspecified (the source)
3. N17.9  Acute kidney injury (if present)
```

**Severe sepsis:** Code A41.xx + R65.20 (Severe sepsis without septic shock) OR R65.21 (with septic shock)

**Critical rule:** Never code "urosepsis" — it is not an accepted term. Query the physician.

---

**When do you use Z codes?**

Z codes (Z00-Z99) classify factors influencing health status when no illness or injury is present, or to provide additional information:

```
Category          Example codes
Encounters:       Z00.00  General adult exam, no abnormal findings
                  Z23     Immunization encounter
                  Z51.11  Antineoplastic chemotherapy

History:          Z85.3   Personal history of malignant neoplasm of breast
                  Z82.49  Family history of ischemic heart disease
                  Z87.891 Personal history of nicotine dependence

Status codes:     Z79.4   Long-term use of insulin
                  Z96.641 Presence of right artificial hip joint
                  Z99.11  Dependence on respirator [ventilator]

Screening:        Z12.31  Encounter for screening mammogram
                  Z13.220 Encounter for screening colonoscopy

Contact:          Z20.828 Contact with/exposure to COVID-19
```

**Key rules for Z codes:**
- Some are principal/first-listed only
- Some are additional codes only
- Some can be either
- Check the Tabular List for guidance on each specific code

---

## Advanced Questions

**Explain POA (Present on Admission) reporting.**

POA indicates whether a diagnosis was present at the time of inpatient admission. CMS requires POA reporting on Medicare/Medicaid inpatient claims to distinguish hospital-acquired conditions (HACs) from pre-existing ones.

| POA Indicator | Meaning |
|--------------|---------|
| **Y** | Present at the time of admission |
| **N** | Not present at time of admission |
| **U** | Documentation insufficient to determine |
| **W** | Provider is unable to clinically determine |
| **1** | Exempt from POA reporting (Z codes, injuries, etc.) |

**Why it matters:** CMS does not pay the higher DRG rate for HACs that are not POA. For example, a pressure ulcer that developed during the hospital stay (N) will not increase reimbursement — but a pressure ulcer present on admission (Y) can be counted.

---

**Code this complex case:**

*"65-year-old female admitted with acute exacerbation of COPD. She is a current smoker. She also has stage 3 CKD secondary to hypertension. Blood pressure is 168/94 on admission. Chest X-ray shows right lower lobe pneumonia. She is on insulin for her Type 2 diabetes."*

```
Principal Diagnosis (caused the admission):
J44.1   COPD with acute exacerbation

Additional Diagnoses:
J18.1   Lobar pneumonia, unspecified organism (concurrent condition)
I12.9   Hypertensive chronic kidney disease with stage 1-4 CKD
N18.3   Chronic kidney disease, stage 3
E11.9   Type 2 diabetes mellitus without complications
F17.210 Nicotine dependence, cigarettes, uncomplicated
Z79.4   Long-term (current) use of insulin

Rationale:
- COPD exacerbation is principal (reason for admission)
- Pneumonia coded separately (documented concurrent condition)
- Hypertension + CKD → combination code I12.9 (assumed causal relationship)
- N18.3 required per I12.9 "Use additional code" instruction
- T2DM without specified complications — documentation doesn't specify
- Current smoker coded with tobacco dependence category
- Insulin use required per diabetes guidelines
- Blood pressure elevation captured by I12.9 (hypertension always included)
```

---

**What is the difference between Excludes1 and Excludes2?**

This is one of the most tested concepts:

**Excludes1** — Mutually exclusive. The two conditions CANNOT occur together (they are the same condition). Do NOT use both codes.
```
Example:
F41.0 Panic disorder [episodic paroxysmal anxiety]
  Excludes1: panic disorder with agoraphobia (F40.01)
→ A patient CANNOT have both F41.0 AND F40.01
```

**Excludes2** — The excluded condition is NOT included in this code, but may coexist. CAN use both codes if both conditions are documented.
```
Example:
J44 COPD
  Excludes2: asthma (J45.-)
→ A patient CAN have both COPD (J44.x) AND Asthma (J45.x)
   Code both if both are documented and treated
```

**Memory trick:** 
- Excludes**1** = **1** code only (can't use together)
- Excludes**2** = can use **2** codes (both acceptable)

---

## Coding Practice Cases

**Case 1:** Patient with chest pain, rule out MI. Tests negative, final diagnosis: Chest pain due to GERD.

*Answer:* R07.9 Chest pain, unspecified is WRONG. The final diagnosis is GERD (K21.9). Code the confirmed diagnosis, not the symptom. The "rule out MI" is not coded — outpatient rule.

**Case 2:** Patient presents with infected diabetic foot ulcer, Type 2 DM, insulin-dependent.

```
E11.621  Type 2 DM with foot ulcer
L97.509  Non-pressure chronic ulcer of other part of unspecified foot, unspecified severity
L08.9    Local infection of the skin and subcutaneous tissue (if cellulitis: L03.115)
Z79.4    Long-term use of insulin
```

**Case 3:** Outpatient encounter. Documentation: "Probable UTI."

*Answer:* Do NOT code N39.0 (UTI) for outpatient. Code the symptom instead: R30.0 (Dysuria), R35.0 (Frequency), or whatever symptom brought the patient in. "Probable" diagnoses are INPATIENT only.
