# ICD-10-CM Fundamentals

**Analogy** — Looking up a code is like using a store directory then walking to the actual aisle. The Alphabetic Index is the directory board at the entrance — fast, but only a pointer ("Diabetes → aisle 4"). It doesn't show you what's actually on the shelf. The Tabular List is the aisle itself, where the real product details live (instructional notes, required extra characters, exclusions). Checking the directory and stopping there — never walking to the aisle — is exactly how a coder ends up confidently wrong.

*Note: this course targets the FY2026 guideline cycle. See the Overview section's "Recent Guideline Changes (FY 2026)" for substantive revisions (HIV sequencing, BMI/Z68, SDoH codes, new diabetes-remission code, expanded R10 pain codes) since older FY2023-era material.*

## How to Look Up a Code

The ICD-10-CM manual has two parts:
1. **Alphabetic Index** — Look up conditions by name → gets you to a code
2. **Tabular List** — Verify the code, check for required characters, read notes

**Always verify in the Tabular List.** Never code from the Alphabetic Index alone.

### Step-by-Step Process

```
Step 1: Identify the main term from the diagnosis
Step 2: Look up the main term in the Alphabetic Index
Step 3: Review any subterms (qualifiers, sites, type)
Step 4: Note the suggested code
Step 5: Turn to the Tabular List and verify
Step 6: Read all includes, excludes, and notes
Step 7: Assign additional characters as required
Step 8: Confirm code to highest level of specificity
```

### Example: Coding Acute Appendicitis

```
Diagnosis: Acute appendicitis with perforation

Step 1: Main term = "Appendicitis"
Step 2: Alphabetic Index → Appendicitis → acute → with peritonitis
Step 3: Index suggests K35.2
Step 4: Tabular List: K35.2 = "Other and unspecified acute appendicitis"
        K35.20 = Acute appendicitis with perforation, without abscess
        K35.21 = Acute appendicitis with perforation and localized peritonitis
Step 5: Select K35.20 (perforation, no abscess documented)
```

## Common Conditions and Codes

### Diabetes Mellitus

| Code | Description |
|------|-------------|
| E10._ | Type 1 diabetes mellitus |
| E11._ | Type 2 diabetes mellitus |
| E11.9 | Type 2 DM without complications |
| E11.65 | Type 2 DM with hyperglycemia |
| E11.649 | Type 2 DM with hypoglycemia without coma |
| E11.40 | Type 2 DM with diabetic neuropathy, unspecified |
| E11.311 | Type 2 DM with unspecified diabetic retinopathy with macular edema |
| E11.22 | Type 2 DM with diabetic chronic kidney disease, stage 3 |

> **Key rule:** Diabetes codes require coding the type first. Always code the manifestation with a Use Additional Code note.

### Hypertension

| Code | Description |
|------|-------------|
| I10 | Essential (primary) hypertension |
| I11.0 | Hypertensive heart disease with heart failure |
| I11.9 | Hypertensive heart disease without heart failure |
| I12.9 | Hypertensive chronic kidney disease with stage 1-4 CKD |
| I13.10 | Hypertensive heart and CKD without heart failure, stage 1-4 |

> **Key rule:** ICD-10-CM assumes a causal relationship between hypertension and heart disease and between hypertension and CKD. Code with combination codes.

### Respiratory

| Code | Description |
|------|-------------|
| J06.9 | Acute upper respiratory infection, unspecified |
| J18.9 | Pneumonia, unspecified organism |
| J44.0 | COPD with acute lower respiratory infection |
| J44.1 | COPD with acute exacerbation |
| J45.20 | Mild intermittent asthma, uncomplicated |
| J45.51 | Severe persistent asthma with acute exacerbation |

### Mental Health

| Code | Description |
|------|-------------|
| F32.9 | Major depressive disorder, single episode, unspecified |
| F33.0 | Major depressive disorder, recurrent, mild |
| F41.1 | Generalized anxiety disorder |
| F10.20 | Alcohol use disorder, moderate |
| F17.210 | Nicotine dependence, cigarettes, uncomplicated |

## Z Codes — Factors Influencing Health

Z codes are used when a patient has no illness but needs healthcare, or for factors affecting health:

```
Z00.00   Encounter for general adult medical examination without abnormal findings
Z23      Encounter for immunization
Z51.11   Encounter for antineoplastic chemotherapy
Z79.4    Long-term (current) use of insulin
Z87.891  Personal history of nicotine dependence
Z82.49   Family history of ischemic heart disease
Z96.641  Presence of right artificial hip joint
```

## Sequencing Rules

**Inpatient (UHDDS Guidelines):**
1. Principal diagnosis = condition after study chiefly responsible for admission
2. Sequence complication codes after the underlying condition
3. For DRG, sequence the code that drives the highest reimbursement (when equal clinical validity)

**Outpatient:**
1. Code the reason for the visit (chief complaint if diagnosis not confirmed)
2. Use "possible," "probable," "suspected" diagnoses only in inpatient settings
3. For outpatient: code to highest degree of certainty documented

**Signs and Symptoms:**
- Code signs/symptoms when no definitive diagnosis established
- Do NOT code symptoms when they are routinely associated with the confirmed diagnosis
  - Example: Chest pain is symptom of MI — don't code both for inpatient

## Practice Case 1

**Documentation:** 65-year-old male admitted for acute anterior ST elevation MI. He also has type 2 diabetes managed with insulin and stage 3 chronic kidney disease secondary to diabetic nephropathy. Has been a smoker for 30 years.

**Codes:**
```
I21.09   ST elevation (STEMI) myocardial infarction involving other coronary artery of anterior wall
E11.22   Type 2 diabetes mellitus with diabetic chronic kidney disease, stage 3
N18.3    Chronic kidney disease, stage 3 (moderate)
Z79.4    Long-term (current) use of insulin
F17.210  Nicotine dependence, cigarettes, uncomplicated
```

**Rationale:**
- STEMI is the principal diagnosis (reason for admission)
- Combination code E11.22 captures DM + CKD relationship
- N18.3 required as "use additional code" per E11.22 instructions
- Z79.4 required for insulin use per diabetes guidelines
- Tobacco use coded as an additional diagnosis affecting management

## Try It (2 Minutes)

Follow the 8-step process above for this diagnosis: "Type 2 diabetes mellitus with diabetic neuropathy."

1. What's the main term you'd look up in the Alphabetic Index — "diabetes" or "neuropathy"?
2. Using the Diabetes Mellitus table above, which code matches "Type 2 DM with diabetic neuropathy, unspecified"?
3. Per the Key Rule under that table, is neuropathy coded as a separate second code, or does one combination code capture both?

You should land on: main term is "diabetes" (the underlying condition, not the manifestation); E11.40; and it's a single combination code — diabetes codes are structured so the complication is built into the same code, not billed as two separate ones.
