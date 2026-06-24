# Home Health Coding Certification Guide

## Top Certifications

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **CPC-H (Home Health)** | AAPC | $399 | 150 MCQ, 5h40m |
| **HCS-D (Home Care Specialist – Documentation)** | NAHC | $375 | MCQ |
| **HCS-O (OASIS)** | NAHC | $375 | MCQ |
| **COS-C (OASIS Specialist – Clinical)** | NAHC | $350 | MCQ |
| **RHIT** | AHIMA | $229 | MCQ |

---

## Home Health Coding Overview

```
HOME HEALTH PPS (Prospective Payment System):
  PDGM (Patient-Driven Groupings Model): current payment model since Jan 2020
  30-day payment periods (replaced 60-day episodic under old PPS)
  Groups patient by: admission source, timing, clinical grouping, functional level, comorbidities
  
OASIS (Outcome and Assessment Information Set):
  Comprehensive assessment tool for Medicare home health patients
  Completed at: start of care, resumption, follow-up, transfer, discharge
  Drives: patient grouping, reimbursement, quality measures
  
  Key OASIS Items for Coding:
    M1000: Prior care setting | M1011-M1017: Inpatient diagnoses
    M1021/1023: Primary/other diagnoses (ICD-10-CM codes required)
    M1030-1033: Therapies | M1041: Influenza vaccine
    M1800-1860: Functional status items (ADLs: bathing, dressing, toileting)

ICD-10-CM IN HOME HEALTH:
  Primary diagnosis: condition most responsible for home care need
  Sequencing: follow ICD-10-CM official guidelines + PDGM grouping logic
  V codes (Z codes): visit reason codes when no active disease
  Secondary diagnoses: comorbidities that affect plan of care
  Code to highest specificity — OASIS M1021 accepts up to 6 diagnoses
```

---

## High-Frequency Home Health Diagnoses

```
WOUND CARE:
  L89.xxx: Pressure ulcer (stage I-IV, unstageable, deep tissue)
  L97.xxx: Non-pressure ulcer of lower limb
  Z48.xxx: Encounter for aftercare following surgery (post-op wound)
  
CARDIAC/RESPIRATORY:
  I50.xx: Heart failure (systolic, diastolic, combined)
  J44.1: COPD with acute exacerbation
  J96.xx: Respiratory failure

NEUROLOGICAL:
  G20: Parkinson's disease | G35: Multiple sclerosis
  I69.xxx: Sequelae of stroke (specify deficits: hemiplegia, aphasia, dysphagia)
  
DIABETES:
  E11.xxx: Type 2 DM (with complications specified)
  E10.xxx: Type 1 DM
  Common complications: neuropathy (E11.40), foot ulcer (E11.621), kidney (E11.21)

ORTHOPEDIC/REHAB:
  Z96.641: Presence of right artificial hip joint (post-hip replacement)
  Z47.1: Aftercare following joint replacement surgery
  M16.x: Osteoarthritis of hip | M17.x: Osteoarthritis of knee
```

## Revision Notes
```
HOME HEALTH vs HOSPICE: home health = curative goal | hospice = comfort/palliative
MEDICARE HOME HEALTH ELIGIBILITY: homebound status + skilled need + physician order
HOMEBOUND: leaving home requires considerable effort; can leave briefly (e.g., medical appt)
SKILLED NEED: requires skilled nurse or therapist (not just aide or companion)

PDGM CLINICAL GROUPS (12 groups by primary diagnosis):
  MMTA (Medical Management, Treatment, Assessment) | Neuro/Stroke Rehab
  Wound Care | Complex Medical/Surgical | Behavioral Health | Musculoskeletal Rehab

PAYMENT ADJUSTMENTS: comorbidities add to payment | functional impairment affects grouping
LUPA (Low Utilization Payment Adjustment): fewer visits than threshold → reduced payment
