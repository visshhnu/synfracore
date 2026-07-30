# BCHHC — Home Health Coding Certification

## What is BCHHC?

The **BCHHC / BCHH-C (Board Certified Home Health Coder)** is a professional certification for home health medical coders. It validates expertise in ICD-10-CM coding for home health, OASIS assessments, and the PDGM payment model.

*Needs verification: which organization currently administers this credential and under what name. Sources associate it variously with the Board of Medical Specialty Coding & Compliance (BMSCC), the Association of Home Care Coding & Compliance (AHCC), and WellSky's credentialing program — this space has seen naming/administration changes. Confirm the current certifying body, exam format, and registration process directly before treating any of the details below as current.*

---

## BCHHC Exam Overview

| Detail | Info |
|--------|------|
| Certifying Body | Verify current administering organization (see note above) before relying on this |
| Exam Format | Multiple choice, case-based scenarios (verify current format) |
| Prerequisites | Experience in home health coding recommended |
| Renewal | Every 2 years with continuing education (verify current requirement) |
| Focus Areas | ICD-10-CM, OASIS, PDGM, coding guidelines |

---

## Core Knowledge Areas

### 1. ICD-10-CM for Home Health
- Code structure and conventions (NEC, NOS, Excludes1, Excludes2)
- Principal/primary diagnosis selection
- Sequencing rules for home health setting
- Combination codes (HTN+HF+CKD, DM+CKD)
- Wound coding: pressure (L89), non-pressure (L97), post-surgical (T81)
- 7th character selection: A (active treatment), D (subsequent), S (sequela)

### 2. OASIS Assessments
| Type | Trigger | Timing |
|------|---------|--------|
| SOC | First skilled visit | Within 5 days |
| ROC | Returns from hospital | Within 48 hours (2 calendar days) |
| REC | Recertification | Near end of 60-day episode |
| SCIC | Acute change in condition | Within episode |
| DC | Discharge | At last visit |

**Who fills OASIS:** SN (RN/LPN), PT, SLP — OT cannot fill independently.

### 3. PDGM — Patient-Driven Groupings Model
Five classification factors per 30-day payment period:
1. **Timing** — Early (1st period) vs Late (subsequent)
2. **Admission source** — Community vs Institutional (post-hospital)
3. **Clinical grouping** — 12 groups based on primary ICD-10-CM code
4. **Functional level** — Low/Medium/High from OASIS functional items
5. **Comorbidity adjustment** — None/Low/High from secondary diagnoses

**12 PDGM Clinical Groups (corrected to match official CMS naming — verify against current CMS PDGM documentation):**
Musculoskeletal Rehabilitation · Neuro/Stroke Rehabilitation · Wounds · MMTA–Surgical Aftercare · MMTA–Cardiac and Circulatory · MMTA–Endocrine · MMTA–GI/GU · MMTA–Infectious Disease, Neoplasms, Blood-Forming Diseases · MMTA–Respiratory · MMTA–Other · Behavioral Health · Complex Nursing Interventions

### 4. Homebound Documentation
- Leaving home requires considerable effort due to illness/injury
- Brief absences allowed: medical appointments, religious services, adult day care
- Must document specific limitation, distance/effort to leave, assistance needed
- Examples: SOB on exertion, non-weight-bearing, severe cognitive impairment

---

## High-Yield Coding Scenarios

### HTN + CHF + CKD Stage 3
```
I13.0   HTN with HF and CKD stages 1–4
I50.22  Chronic systolic heart failure
N18.3   CKD stage 3
Z79.4   Long-term insulin use (if applicable)
```
Never code I10 separately when I13.0 applies.

### CVA Sequela in Home Health
```
I69.354  Hemiplegia left non-dominant (default if dominance not documented)
I69.320  Aphasia following cerebral infarction
```
Never code the acute stroke (I63-) — sequela codes imply post-infarction.

### Wound Dehiscence with Wound VAC
```
T81.31XA  Disruption of external operation wound — 7th char A (active treatment)
Z48.89    Aftercare following surgery
```
Wound VAC present = active treatment = A. No wound VAC = D.

### Diabetes Full Scenario
Patient: T2DM + CKD stage 3 + anemia of CKD + insulin
```
E11.22  T2DM with diabetic CKD
N18.3   CKD stage 3
D63.1   Anemia in CKD
Z79.4   Long-term insulin use
```

---

## Exam Preparation Strategy

### 6-Week Study Plan
| Week | Focus |
|------|-------|
| 1–2 | ICD-10-CM conventions, NEC/NOS, Excludes1/2, combination codes |
| 3 | OASIS types, timing, who fills, clinical documentation |
| 4 | PDGM — 5 factors, 12 clinical groups, LUPA thresholds |
| 5 | High-frequency coding scenarios: wounds, CVA, diabetes, HTN combos |
| 6 | Mock exams + timed practice cases |

### Key Resources
- AAPC Home Health coding curriculum
- CMS ICD-10-CM Official Guidelines (free on CMS.gov)
- CMS PDGM Final Rule and fact sheets
- OASIS Data Specifications (current version)

---

## Practice Questions

**Q: A patient had a stroke 4 months ago. She now has right hemiplegia (non-dominant). What code?**
I69.351 — Hemiplegia and hemiparesis following cerebral infarction, right non-dominant side.

**Q: Wound VAC is removed. Dressing changes only. Which 7th character?**
D — Subsequent encounter. No active wound VAC = routine healing.

**Q: OT evaluates a patient for home health. Can OT complete the OASIS?**
No. OT cannot independently complete the OASIS. SN, PT, and SLP can.

**Q: Patient has HTN + ESRD + CHF. Which combination code?**
I13.11 — Hypertensive heart and chronic kidney disease, heart failure, ESRD.

**Q: Primary diagnosis places patient in Wound Care clinical group. What is needed?**
A wound-related primary ICD-10-CM code — such as L89.x (pressure ulcer), L97.x (non-pressure ulcer), or T81.31xD (surgical wound dehiscence).
