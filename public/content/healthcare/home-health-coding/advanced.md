# Home Health Coding Advanced Topics

## PDGM Deep Dive

```
PDGM PAYMENT CALCULATION:
  Base payment rate × PDGM case-mix weight × geographic wage index
  
  Case-mix determined by:
    1. Admission source: community vs institutional (hospital/SNF in past 14 days)
    2. Timing: early (first 30-day period) vs late (subsequent periods)
    3. Clinical grouping: 12 groups based on primary diagnosis
    4. Functional impairment: OASIS functional score (low/medium/high)
    5. Comorbidity adjustment: none, low, or high (based on secondary diagnoses)
  
  COMORBIDITY ADJUSTMENT CATEGORIES:
    Low: presence of specific secondary diagnoses from CMS list
    High: two qualifying secondary diagnoses from different body systems
    Check CMS PDGM grouper tool for current comorbidity lists

  THERAPIES IN PDGM:
    Therapy minutes NO LONGER drive payment (changed from old PPS)
    Therapies still required if clinically indicated
    Therapy disciplines: PT, OT, SLP
    Clinical grouping considers need for therapy but not visit count

LUPA (Low Utilization Payment Adjustment):
  Applies when visits < threshold for the period
  Threshold: 2-6 visits depending on PDGM case-mix group
  LUPA payment = per-visit rate × actual visits (much lower than full episode rate)
  Prevention: ensure minimum visits per group threshold are met when clinically justified
```

## OASIS Accuracy and Coding

```
OASIS M1021 PRIMARY DIAGNOSIS:
  Must reflect the primary reason for home health services
  Use ICD-10-CM code most responsible for current home care need
  NOT necessarily the reason for hospitalization
  
  Common M1021 errors:
    Sequencing cardiac diagnosis when wound care is primary need
    Using unspecified codes when specific code available (e.g., E11.9 vs E11.40)
    Using surgical aftercare Z code when active wound requires wound care code first

FUNCTIONAL SCORING (affects payment):
  M1800-1860: assess ADLs using 0-6 scale (0=independent, 6=total dependence)
  Items: grooming, upper body dressing, lower body dressing, bathing, toileting, transferring
  Functional impairment score: sum of functional OASIS items
  Low (0-6) | Medium (7-9) | High (10+) — higher impairment = higher payment

DIAGNOSIS CODING TIPS FOR HOME HEALTH:
  Wound diagnoses: always include laterality and stage/depth
  Sequelae of CVA (I69.xxx): must specify affected side and type of deficit
  V-A-C (vacuum-assisted closure) therapy: document device; affects code selection
  Diabetes with complications: always code the specific complication, not just diabetes
  Pain: not typically used as primary; code underlying condition instead
```

## Quality Measures and Star Ratings

```
HOME HEALTH COMPARE STAR RATINGS (CMS public reporting):
  Based on OASIS outcomes + process measures + patient satisfaction (HHCAHPS)
  
  KEY OUTCOME MEASURES:
    Improvement in ambulation | Improvement in bed transferring
    Improvement in bathing | Improvement in pain | Improvement in shortness of breath
    Hospitalization (unplanned) | Emergency department use without hospitalization
  
  PROCESS MEASURES:
    Influenza immunization provided
    Pneumococcal vaccination received
    Depression assessment conducted
    Drug education provided
    Fall risk assessment conducted
  
  HHCAHPS (patient satisfaction):
    Care of patients | Communication between providers and patients
    Specific care issues | Overall rating of home health agency

IMPACT ON REIMBURSEMENT:
  VBP (Value-Based Purchasing): performance adjustments to Medicare payment
  CMS reduces/increases payment based on quality performance
  Accurate OASIS = accurate quality measure calculation = correct star rating
```

## Study Resources
- **CMS PDGM Resources** (cms.gov/pdgm) — official grouper tool, payment files
- **NAHC (National Association for Home Care)** — certification resources
- **Coding Clinic for OASIS** — guidance for specific OASIS coding scenarios
- **AAPC Home Health Coding Certification** — study guide and practice exams
