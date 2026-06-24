# ICD-10-CM Certification Guide

## Top Certifications

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **CPC (Certified Professional Coder)** | AAPC | $399 | 150 MCQ, 5 hrs 40 min |
| **CCS (Certified Coding Specialist)** | AHIMA | $299 | MCQ + coding, 4 hrs |
| **RHIT (Registered Health Info Technician)** | AHIMA | $229 | MCQ, 3 hrs 30 min |
| **CIC (Certified Inpatient Coder)** | AAPC | $399 | 150 MCQ |

---

## ICD-10-CM Structure

```
FORMAT: Letter + 2 digits + decimal + up to 4 more characters
EXAMPLE: J18.9 = Pneumonia, unspecified organism
  J   = Chapter 10 (Respiratory diseases)
  18  = Pneumonia
  .9  = Unspecified organism

CHAPTERS (1-21):
  A00-B99  Infectious and parasitic diseases
  C00-D49  Neoplasms
  D50-D89  Blood and immune disorders
  E00-E89  Endocrine, nutritional, metabolic
  F01-F99  Mental and behavioral
  G00-G99  Nervous system
  H00-H59  Eye and adnexa
  H60-H95  Ear and mastoid
  I00-I99  Circulatory system
  J00-J99  Respiratory system
  K00-K95  Digestive system
  L00-L99  Skin and subcutaneous tissue
  M00-M99  Musculoskeletal and connective tissue
  N00-N99  Genitourinary system
  O00-O9A  Pregnancy, childbirth, puerperium
  P00-P96  Perinatal conditions
  Q00-Q99  Congenital malformations
  R00-R99  Symptoms and signs NEC
  S00-T88  Injury, poisoning, external causes
  V00-Y99  External causes of morbidity
  Z00-Z99  Factors influencing health status

CODING GUIDELINES:
  Code to highest level of specificity always
  Principal diagnosis: condition after study chiefly responsible for admission
  First-listed: outpatient — condition chiefly responsible for visit
  Sequence: principal dx first, then comorbidities, then complications
  Exclude1: cannot be coded together with code listed
  Exclude2: condition not included here, code separately if present
  Use additional code: required secondary codes
  Code first: underlying disease must be coded first
```

---

## Common Code Categories

```
DIABETES:
  E11   Type 2 diabetes mellitus
  E11.9 Without complications
  E11.65 With hyperglycemia
  E11.649 With hypoglycemia without coma
  E13   Other specified diabetes

HYPERTENSION:
  I10   Essential (primary) hypertension
  I11   Hypertensive heart disease
  I12   Hypertensive chronic kidney disease
  I13   Hypertensive heart and CKD combined

HEART CONDITIONS:
  I21   Acute myocardial infarction (STEMI/NSTEMI)
  I25.10 Atherosclerotic heart disease
  I50.9 Heart failure, unspecified
  I48   Atrial fibrillation and flutter

RESPIRATORY:
  J18.9  Pneumonia, unspecified
  J44.1  COPD with acute exacerbation
  J45.20 Mild intermittent asthma, uncomplicated
  J96.00 Acute respiratory failure, unspecified

INJURIES (7th character):
  A = Initial encounter
  D = Subsequent encounter
  S = Sequela
```

## Revision Notes
```
ICD-10-CM: diagnosis coding (WHY patient was seen)
ICD-10-PCS: inpatient procedure coding (WHAT was done)
CPT: outpatient procedure coding

CODE FIRST / USE ADDITIONAL CODE: sequencing instructions
EXCLUDES1: mutually exclusive (cannot code together)
EXCLUDES2: not included here — code separately when present
7TH CHARACTER: required for injury codes — A/D/S (initial/subsequent/sequela)
```
