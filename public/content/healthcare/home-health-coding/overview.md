# Home Health Coding — OASIS, PDGM & Billing

Home health coding is a specialized and growing field. With an aging population and CMS's shift to value-based care, accurate home health documentation and coding directly impacts payment and quality scores.

## What is Home Health?

Home health services are skilled medical services provided in a patient's home by a Medicare-certified home health agency (HHA). Covered services:
- Skilled nursing visits
- Physical/Occupational/Speech therapy
- Medical social services
- Home health aide services

**Key requirement:** Patient must be **homebound** — leaving home requires considerable effort and a medical reason.

## PDGM — Patient-Driven Groupings Model

Since January 1, 2020, home health is paid under PDGM (replacing PPS). PDGM pays per 30-day period (not 60-day episodes).

```
Payment Calculation:
Base Payment Rate
  × Clinical Grouping weight
  × Functional Impairment Level weight
  × Comorbidity Adjustment
  ± Admission Source Adjustment (community vs institutional)
  ± Timing Adjustment (early vs late period)
  = Final 30-day payment
```

### PDGM Clinical Groupings (6 Groups)

| Group | Primary Diagnosis Category |
|-------|---------------------------|
| MMTA | Medication Management, Teaching, Assessment |
| Neuro/Stroke | Neurological and stroke conditions |
| Wound | Complex medical wounds, non-surgical |
| Surgical | Post-surgical wound care |
| Behavioral Health | Mental health, substance abuse |
| Musculoskeletal | Orthopedic, mobility conditions |

**Principal diagnosis = the reason for the home health episode**

```
Example principal diagnosis coding:
Post-hip replacement:       M16.11 (or affected side)
→ Surgical group (high weight)

COPD exacerbation:         J44.1
→ MMTA group

Stroke with hemiplegia:    I69.354 (right hemiplegia)
→ Neuro/Stroke group
```

## OASIS — Outcome and Assessment Information Set

OASIS is the standardized assessment tool completed by clinicians at:
- **Start of Care (SOC)** — within 5 days of admission
- **Resumption of Care (ROC)** — after hospital stay
- **Recertification (REC)** — every 60 days
- **Follow-Up (FU)** — during the episode when clinical status changes
- **Transfer to Inpatient** — when patient goes to hospital
- **Discharge (DC)** — at end of care

### Critical OASIS Items for Coding

```
M1021 - Primary Diagnosis:
  The condition most responsible for the need for home health
  Must be coded to highest specificity

M1023 - Other Diagnoses:
  Up to 5 additional diagnoses actively being treated
  Comorbidities affect payment (comorbidity adjustment)

M1033 - Risk for Hospitalization:
  0-8 risk factors including:
  - History of falls (2+ in past 12 months)
  - Weight loss
  - Multiple hospitalizations (2+ in last 6 months)
  - 5+ medications
  - Poorly managed diabetes
  - Dependence in 3+ ADLs

M1242 - Frequency of Pain:
  0 = No pain
  1 = Less often than daily
  2 = Daily but not constantly
  3 = All of the time (constantly)

M1800-M1870 - ADL/IADL Functional Items:
  0 = Independent
  1 = Requires supervision/cueing
  2 = Requires some assistance
  3 = Requires much assistance
  4 = Fully dependent

M2200 - Therapy Need:
  Number of therapy visits needed
  Affects PDGM functional impairment level
```

## HIPPS Codes

HIPPS (Health Insurance Prospective Payment System) codes are 5-character codes generated from OASIS data. They determine payment.

```
Position 1: Clinical Grouping
  A = MMTA Low
  B = MMTA Medium  
  C = MMTA High
  D = Neuro/Stroke Low
  ... (and so on through all groups/levels)

Position 2: Functional Impairment Level
  F = Low (minimal ADL impairment)
  G = Medium
  H = High (significant ADL impairment)

Position 3: Comorbidity Adjustment
  Z = No comorbidity adjustment
  Q = Low comorbidity
  R = High comorbidity

Positions 4-5: Timing and Source
  1A = Community early
  1B = Community late
  2A = Institutional early
  2B = Institutional late
```

## High-Priority Diagnoses for Home Health

```
Wound Care:
L89.313  Pressure ulcer right hip, stage 3
L89.323  Pressure ulcer left hip, stage 3
L97.509  Non-pressure ulcer, unspecified site
I83.009  Varicose ulcer, unspecified

Diabetes with complications (HH-specific):
E11.649  T2DM with hypoglycemia without coma
E11.51   T2DM with peripheral angiopathy
E11.621  T2DM with foot ulcer → add L97.4xx for site
         + Z79.4 if on insulin

Post-surgical (high payment weight):
Z48.01   Encounter for wound care after surgery
M16.11   Unilateral primary osteoarthritis, right hip (post THR)
M17.11   Primary osteoarthritis, right knee (post TKR)

Stroke/Neuro:
I69.354  Hemiplegia following cerebral infarction
I69.391  Dysphagia following cerebral infarction
G20      Parkinson's disease

COPD:
J44.1    COPD with acute exacerbation
J44.0    COPD with acute lower respiratory infection
```

## Documentation Requirements

For Medicare to pay, documentation must support:

```
1. HOMEBOUND STATUS — clinician must document:
   What makes patient homebound?
   → "Patient ambulates with significant difficulty using walker,
      leaving home requires maximum assistance and taxing effort"
   → "Patient is post-op day 14, unable to drive, no caregiver to transport"

2. SKILLED NEED — why does patient need skilled nursing?
   → Teaching insulin administration to newly diagnosed diabetic
   → Wound assessment and treatment requiring clinical judgment
   → IV medication administration
   NOT skilled: simple dressing changes patient/family can do,
                medication reminders (unless complex regimen)

3. PHYSICIAN ORDERS — verbal orders must be signed within 30 days

4. PLAN OF CARE — must include:
   → Diagnoses
   → Mental status
   → Types of services/frequency/duration
   → Medications
   → Safety measures
   → Prognosis
```

## Common Coding Errors to Avoid

```
❌ Coding "aftercare" when active condition is present
   Wrong: Z48.01 (wound care aftercare) when wound has infection
   Right: L03.115 (cellulitis of right lower limb) + Z48.01

❌ Using unspecified codes when specificity is documented
   Wrong: I10 (hypertension) when chart says "hypertensive heart disease"
   Right: I11.9 (hypertensive heart disease without HF)

❌ Missing Z codes that affect PDGM
   Always code Z79.4 for long-term insulin use with diabetes
   Z87.39 Personal history of other endocrine disease

❌ Incorrect laterality
   Document and code LEFT vs RIGHT for:
   → Hip/knee replacements
   → Stroke-related deficits
   → Wound locations

❌ Not coding comorbidities
   PDGM pays more with qualifying comorbidities
   Code all conditions being actively treated or monitored
```

## Interview Questions

**What is PDGM and how does it differ from the old PPS?**
PDGM (Patient-Driven Groupings Model) replaced the Home Health PPS in 2020. Under PPS, payment was per 60-day episode based primarily on therapy visit thresholds — agencies were incentivized to provide more therapy visits. PDGM pays per 30-day period based on the patient's clinical condition (diagnosis), functional status (OASIS), comorbidities, and admission source — not therapy visit volume. This shifted focus from volume to patient need and clinical outcomes.

**What makes a patient homebound for Medicare home health?**
Homebound status requires two elements: (1) the patient has a condition due to illness or injury that restricts their ability to leave home, AND (2) leaving home requires considerable and taxing effort. The patient can occasionally leave for medical appointments, adult day care, or religious services without losing homebound status. Coders must ensure clinician documentation clearly states the specific reason for homebound status — vague documentation like "patient is homebound" is insufficient for audits.
