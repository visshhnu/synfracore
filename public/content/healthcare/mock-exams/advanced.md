# Medical Coding Mock Exams Advanced Topics

## Advanced Coding Scenarios

```
NEOPLASM CODING:
  Step 1: Determine behavior — malignant primary, malignant secondary, in situ, benign, uncertain
  Step 2: Find in Neoplasm Table by site
  Step 3: Select appropriate column
  Step 4: Verify in Tabular List
  
  SEQUENCING FOR MALIGNANCY:
    Primary site actively treated: sequence primary first
    Metastatic site being treated: sequence metastasis + primary secondary
    History of cancer, no current treatment: use Z85.xxx (personal history)
    Prophylactic surgery (family history): Z80.xxx (family history)
  
  CODING TREATMENT COMPLICATIONS:
    Anemia due to chemotherapy: D64.81 (anemia) + T45.1x5A (adverse effect)
    Nausea from chemo: R11.0 + T45.1x5A (adverse effect, initial encounter)
    Dehydration after radiation: E86.0 + Y84.2 (radiation therapy complication)

OBSTETRIC CODING (O codes):
  7th character = trimester:
    1 = first (< 14 weeks) | 2 = second (14-27 weeks)
    3 = third (28+ weeks) | 0 = unspecified trimester
    A/B/C: fetus (for multiple gestations, identify which fetus affected)
  
  At delivery: O codes sequenced first (even if C/S complication is reason for admission)
  O80: normal delivery (all criteria must be met: single liveborn, no complications)
  O82: cesarean section (use when no specific complication code exists)
  
  Z3A.xx: Weeks of gestation (use as additional code when O code present)
  Z37.0: Single liveborn infant, born in hospital (required at delivery)

HIV CODING:
  B20: HIV disease (symptomatic) — sequence FIRST even if treating another condition
  Z21: Asymptomatic HIV infection — positive status, no symptoms or AIDS
  Do NOT code inconclusive test as B20 — code the test result or symptom instead
  Confirmation: by provider statement, not just lab result
```

## Compliance and Audit Readiness

```
DOCUMENTATION AUDIT CHECKLIST:
  ☐ Legible, dated, signed with credentials
  ☐ Chief complaint/reason for visit documented
  ☐ Diagnoses supported by documentation (not just in problem list)
  ☐ Procedures match operative report and claim
  ☐ Modifiers supported by documentation
  ☐ E&M level supported by MDM or total time documented
  ☐ No copy-paste without update (EHR cloning risk)
  ☐ Addenda properly dated, signed, and labelled

RAC AUDIT RED FLAGS:
  High-level E&M for all visits (99215 every encounter)
  Billing both global and component procedure codes
  Unbundled procedures (NCCI violation)
  Modifier -25 without supporting documentation
  Diagnoses not reflecting current visit (using inactive problem list)
  
INTERNAL AUDIT PROCESS:
  Pre-payment: before claim submission (most effective)
  Post-payment: random sample of paid claims (retrospective)
  Targeted: focus on high-risk areas identified by OIG Work Plan
  External: hire outside firm for objective assessment
  Track: denial rate, error rate by coder, by payer, by procedure type
```

## Study Resources
- **OIG Work Plan** (oig.hhs.gov/reports-and-publications/workplan) — annual audit targets
- **AHA Coding Clinic** — quarterly ICD-10-CM guidance (subscription)
- **CPT Assistant** (AMA) — monthly CPT guidance (subscription)
- **AAPC Medical Coding Solutions** — practice management and compliance tools
