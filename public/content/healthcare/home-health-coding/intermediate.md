# Home Health Coding Intermediate Topics

## OASIS Data Items for Coding

```
DIAGNOSIS ITEMS:
  M1010: Inpatient diagnoses (past 14 days) — up to 6 ICD-10-CM codes
  M1016: Diagnoses requiring medical or treatment regimen change past 14 days
  M1021: Primary diagnosis — most responsible for home health need
  M1023: Other diagnoses — up to 5 additional relevant diagnoses
  
  CODING RULES FOR M1021/M1023:
    Code to highest specificity (7th character, laterality, etc.)
    No aftercare Z codes as primary (use underlying condition when active)
    Symptom codes (R codes) acceptable if underlying etiology not established
    Sequencing: primary first, then most relevant secondary conditions

FUNCTIONAL ASSESSMENT ITEMS (M1800-M1860):
  Each item scored 0-6:
    0 = Able to independently; 1 = Guidance/cueing only needed
    2 = Minimum assistance; 3 = Moderate assistance
    4 = Maximum assistance; 5 = Complete dependence
    6 = Patient activity did not occur during assessment period
  
  Items assessed:
    M1800: Grooming (hair, teeth, nails)
    M1810/1820: Upper/lower body dressing
    M1830: Bathing
    M1840: Toilet transferring
    M1845: Toileting hygiene
    M1850: Transferring (bed to chair)
    M1860: Ambulation

WOUND AND SKIN ITEMS:
  M1300-1342: Pressure ulcer status (stage, worsening, new)
  M1350: Skin lesion status | M1400: Dyspnea status
  
  PRESSURE ULCER STAGING FOR OASIS AND ICD-10:
    Stage 1: Non-blanchable erythema | L89.x1x
    Stage 2: Partial thickness skin loss | L89.x2x
    Stage 3: Full thickness skin loss | L89.x3x
    Stage 4: Full thickness tissue loss | L89.x4x
    Unstageable: eschar covering | L89.x0x (unstageble) or L89.x5x (deep tissue)
```

## Common Coding Scenarios

```
SCENARIO 1: Post-Hip Replacement
  Patient: 75-year-old, 1 week post right total hip replacement, PT/OT for rehabilitation
  M1021 Primary: Z96.641 (Presence of right artificial hip joint)
  Or: M96.671 (Fracture of right femur following insertion of orthopedic implant)
  M1023: M16.11 (Primary osteoarthritis, right hip) — why surgery done
  
  Note: Z47.1 (Aftercare following joint replacement) often appropriate when rehab is primary need

SCENARIO 2: CHF Exacerbation
  Patient: 68-year-old, admitted from hospital, skilled nursing for medication management and education
  M1021 Primary: I50.23 (Acute-on-chronic systolic (congestive) heart failure)
  M1023: I10 (Essential hypertension) | E11.9 (Type 2 diabetes without complications)
  
  Education coding: skilled need documented when RN provides disease management education

SCENARIO 3: Diabetic Wound
  Patient: 72-year-old, skilled nursing for wound care to left foot ulcer, Type 2 DM
  M1021 Primary: E11.621 (Type 2 diabetes mellitus with foot ulcer)
  Use additional code: L97.421 (Non-pressure chronic ulcer of left heel and midfoot with fat layer exposed)
  M1023: I10 (Hypertension) | Z79.4 (Long-term insulin use)
```

## Study Resources
- **OASIS Certificate of Training** (cms.gov) — free CMS training modules
- **HCS-D Study Materials** (nahc.org) — NAHC certification prep
- **PDGM Grouper Tool** (cms.gov) — test how codes affect reimbursement
- **HomeHealthCoding.com** — blog with case studies and coding guidance
