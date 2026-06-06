# Medical Coding Guidelines — Official Rules

Understanding and applying official coding guidelines is the foundation of accurate medical coding. These guidelines come from several authoritative sources that coders must follow.

## Authoritative Sources

```
ICD-10-CM Official Guidelines for Coding and Reporting
  → Published by: CDC, CMS, AHA, AHIMA jointly
  → Updated: Annually (October 1)
  → Applies to: All ICD-10-CM code assignment

CPT Guidelines
  → Published by: AMA
  → Located in: Front of CPT code book, per-section
  → Updated: Annually (January 1)

UHDDS (Uniform Hospital Discharge Data Set)
  → Applies to: Inpatient hospital reporting
  → Defines: Principal diagnosis, additional diagnoses

OGCR (Official Guidelines for Coding and Reporting)
  → The "Bible" for ICD-10-CM coding
  → All coders must follow these guidelines
```

## ICD-10-CM OGCR — Section I: Conventions

### Alphabetic Index vs Tabular List

```
ALWAYS verify in Tabular List after finding code in Index.
The Alphabetic Index is a guide, not the final authority.

Reasons to always check Tabular:
1. Verify correct code (Index can be misleading)
2. Read instructional notes (Includes, Excludes, Use additional)
3. Check for required additional characters
4. Identify required 7th character
5. Read Excludes1 and Excludes2 notes
```

### Placeholder Character (X)

```
Some codes require a placeholder "X" to allow for future expansion
or to fill positions before a 7th character.

Examples:
T14.90XA  Injury, unspecified — initial encounter
          ↑
          X is placeholder for position 6

T33.01XA  Superficial frostbite of right ear, initial
T33.01XD  same code, subsequent encounter
T33.01XS  same code, sequela

Rules:
- X has no meaning by itself
- MUST be used exactly where the guideline specifies
- Cannot be omitted to shorten a code
```

### Abbreviations

```
NEC = Not Elsewhere Classifiable
  → Used when documentation is specific but no specific code exists
  → Coder must use "other specified" category
  → Example: "Type of arthritis not classified elsewhere"

NOS = Not Otherwise Specified
  → Equivalent to "unspecified" in code description
  → Use when documentation doesn't provide enough specificity
  → Example: Pneumonia NOS = J18.9

Important: Code to the highest specificity POSSIBLE based on documentation
If documentation just says "pneumonia" without organism — J18.9 is correct
If documentation says "staphylococcal pneumonia" — must code to J15.20
```

## Section II: Selection of Principal Diagnosis (Inpatient)

### The Principal Diagnosis Rule

```
Definition: "The condition established after study to be chiefly 
responsible for occasioning the admission of the patient to the 
hospital for care."

Key points:
✓ "After study" — final confirmed diagnosis after tests
✓ "Chiefly responsible" — the main reason for admission
✓ Not necessarily the patient's most severe condition
✓ Not the patient's primary or chronic condition
   (unless that is what brought them in)

Example 1:
Patient admitted with chest pain, rule out MI.
Final diagnosis: ST-elevation MI
Principal diagnosis: I21.3 (the MI — confirmed diagnosis after study)

Example 2:
Patient with COPD and diabetes admitted for acute COPD exacerbation.
Principal diagnosis: J44.1 (COPD with exacerbation — reason for admission)
Additional: E11.9 (Type 2 DM — complicating condition affecting care)
```

### Uncertain Diagnoses — Inpatient Only Rule

```
Inpatient: MAY code "possible," "probable," "suspected," "likely,"
           "questionable," "rule out," or "working diagnosis"
           AS IF CONFIRMED.

Outpatient: NEVER code uncertain diagnoses.
            Code the sign/symptom instead.

Inpatient example:
Documentation: "Possible pulmonary embolism"
Code: I26.99 (Other pulmonary embolism without acute cor pulmonale)
NOT: R07.9 (chest pain) — don't code the symptom in inpatient

Outpatient example:
Documentation: "Possible pulmonary embolism"
Code: R07.9 (chest pain) or appropriate symptom
NOT: I26.99 — never code uncertain diagnoses outpatient
```

### Sequencing Rules for Common Conditions

#### Sepsis Sequencing

```
Case 1: Sepsis is the reason for admission
Sequence: Sepsis code first → Source of infection second

A41.9    Sepsis, unspecified organism
J18.9    Pneumonia, unspecified (source)
N17.9    Acute kidney injury (complication)
R65.20   Severe sepsis without septic shock (if applicable)

Case 2: Patient admitted for localized infection that DEVELOPS into sepsis
Sequence: Sepsis first (now the reason for continued stay)

A41.01   Sepsis due to MRSA
L03.111  Cellulitis of right arm (original infection)

Case 3: Postprocedural sepsis
T81.44XA Sepsis following a procedure — initial encounter
A41.9    Sepsis, unspecified (code the organism additionally)
```

#### Obstetric Coding Rules

```
For obstetric patients: ALWAYS sequence the obstetric condition first
even if the non-obstetric condition required more care.

Chapter 15 (O00-O9A) codes always take sequencing priority.

Example: Pregnant patient admitted for appendectomy:
O28.0    Encounter for supervision of normal first pregnancy
K35.80   Acute appendicitis (additional code)

7th character for obstetric codes:
0 = unspecified trimester
1 = first trimester  
2 = second trimester
3 = third trimester
9 = not applicable/unspecified
```

## Section III: Reporting Additional Diagnoses

```
Report additional diagnoses when they:
1. Affect patient care during the stay
   (monitoring, evaluation, treatment, increase in nursing care)
2. Are present and affect management
3. Require additional nursing care or monitoring
4. Extend length of stay

DO NOT report:
- Conditions previously treated and no longer active
- Incidental findings not affecting management
- Conditions ruled out (for inpatient, only if not confirmed)
```

## Section IV: Outpatient Guidelines

### First-Listed Diagnosis (Outpatient Equivalent of Principal)

```
For outpatient visits, sequence the diagnosis, condition, 
problem, or other reason for the encounter.

Specific rules:
1. Code confirmed diagnoses, NOT "possible/probable/suspected"
2. Code chronic conditions treated at every visit
3. For preventive visits: use Z code as principal
4. For diagnostic tests: code reason for the test

Examples:
Office visit for type 2 diabetes management:
E11.9    Type 2 diabetes mellitus without complications (first-listed)
Z79.4    Long-term use of insulin (additional)

Radiology — chest X-ray for shortness of breath, no diagnosis given:
R06.00   Dyspnea, unspecified (first-listed, the reason for the test)
```

### Signs and Symptoms Rule

```
Code signs and symptoms when:
- No diagnosis has been established
- Signs/symptoms are not routinely associated with the condition

Do NOT code signs/symptoms when:
- Definitive diagnosis explains them
- They are integral to the confirmed diagnosis

Correct:
Diagnosed with COPD → Code J44.1 (COPD)
Do NOT add R06.00 (dyspnea) — it's a routine sign of COPD

Correct:  
Chest pain, no diagnosis established → Code R07.9 (chest pain)
```

## High-Risk Coding Areas (Audit Targets)

```
1. Sepsis — incorrect sequencing, using "urosepsis"
2. Pressure ulcers — stage documentation required
3. Malnutrition — must be documented by physician
4. Respiratory failure — when to add code
5. BMI/Obesity — must be documented by physician (Z68 codes)
6. POA indicators — incorrect assignment
7. CC/MCC capture — documentation doesn't support the code
8. Unspecified codes — when specific codes available
9. Incorrect principal diagnosis — changes DRG, reimbursement
10. Missing codes — HCC capture for Medicare Advantage
```

## HCC Coding — Medicare Advantage

```
HCC = Hierarchical Condition Category
Used by Medicare Advantage plans for risk adjustment.
More HCCs documented = higher risk score = more Medicare payment.

High-value HCC diagnoses:
- Diabetes with complications (better than without)
- Chronic kidney disease (stage matters)
- Congestive heart failure (specify type)
- COPD (specify severity)
- Major depressive disorder (specify type)
- Ischemic heart disease

RAF score = Risk Adjustment Factor
Higher RAF = Higher payment to health plan = Better care resources

Key principle: Code the highest specificity DOCUMENTED.
"Diabetes" vs "Type 2 DM with stage 3 CKD and neuropathy"
— dramatically different RAF scores, dramatically different payment
```

## Interview Questions

**What are the UHDDS guidelines and why do they matter?**
UHDDS (Uniform Hospital Discharge Data Set) defines standard data elements for inpatient hospital reporting, including the definition of principal and additional diagnoses. The definition of principal diagnosis ("established after study to be chiefly responsible for occasioning the admission") comes from UHDDS. These guidelines directly impact DRG assignment and hospital reimbursement. Incorrect principal diagnosis sequencing is one of the most common compliance issues in hospital coding.

**What is the difference between inpatient and outpatient coding rules for uncertain diagnoses?**
Inpatient (acute care): Code uncertain diagnoses (probable, possible, suspected, rule out, working diagnosis) as if confirmed. This is because the physician is making a clinical judgment that will be tested and confirmed before discharge. Outpatient: NEVER code uncertain diagnoses — only code confirmed conditions or the symptom/sign that brought the patient in. Outpatient encounters have limited time and testing — a "probable UTI" might be a wrong assumption. Code what you know: the symptom (R30.0 dysuria) not the uncertainty (not UTI).
