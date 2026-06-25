# Home Health Coding Advanced Topics

## PDGM Deep Dive

### Five PDGM Classification Factors
1. **Timing**: Early (1st 30-day period) vs Late (2nd+ periods) — early pays more
2. **Admission source**: Community (higher payment) vs Institutional (post-hospital)
3. **Clinical grouping**: 12 groups based on primary diagnosis code
4. **Functional level**: Low/Medium/High from OASIS functional items (ambulation, transfers, ADLs)
5. **Comorbidity adjustment**: None/Low/High from secondary diagnoses

### Clinical Groupings (12 Groups)
- Musculoskeletal Rehab | Neuro/Stroke Rehab | Wound Care
- Complex Medical/Surgical | Respiratory | Endocrine
- Infectious Disease/Neoplasms | Cardiac/Circulatory | MMTA (Medication Mgmt)
- Behavioural Health | Immobility | GI/GU

### Low Utilization Payment Adjustment (LUPA)
- If visits fall below LUPA threshold per 30-day period, payment switches to per-visit rate
- Thresholds vary by clinical group (2-6 visits)
- LUPA significantly reduces payment — avoid unnecessary LUPAs

## Complex Coding Scenarios

### CVA/Stroke in Home Health
- Acute CVA (I60-I63): NEVER coded in home health — acute hospital setting only
- Post-CVA home health: use I69.x sequela codes
- I69.3-: Following cerebral infarction
- I69.1-: Following non-traumatic subarachnoid hemorrhage
- I69.2-: Following intracerebral hemorrhage
- Code specific residuals: hemiplegia (I69.35x), aphasia (I69.32x), dysphagia (I69.39x)
- 7th character for laterality and dominance in I69.35x codes

### Wound Coding 7th Character Rules
- **A** (Initial encounter): Active treatment — wound VAC, antibiotics for infection
- **D** (Subsequent): Routine care during normal healing — no active treatment
- **S** (Sequela): Late effect after acute phase
- Key: Wound VAC presence changes D → A even if wound is healing

### Diabetes and Wounds
```
E11.621  T2DM with foot ulcer (left foot)
L97.412  Non-pressure chronic ulcer, left heel, fat layer exposed
Z79.4    Long-term insulin use (if applicable)
```
Never code E11.9 (unspecified DM) when wound present — specificity required for PDGM comorbidity.

## Home Health Compliance

### OIG Focus Areas for Home Health
- Homebound status documentation: most common audit finding
- Physician oversight: timely 485 certifications and signatures
- Therapy necessity: documentation supporting skilled therapy need
- Duplicate billing: same patient billed by multiple agencies

### Documentation Audit Trail
Every visit note must independently support:
- Skilled need for THAT visit (not just "see care plan")
- Specific skilled interventions performed
- Patient's response and progress toward goals
- Ongoing need for skilled services
- Homebound status indicators

## Coding for Common HH Conditions

### Wound Categories
| Code | Type | Example |
|------|------|---------|
| L89.x | Pressure ulcer | Sacral stage 3 |
| L97.x | Non-pressure lower limb | Diabetic foot |
| T81.x | Post-procedural | Surgical wound dehiscence |
| I83.x | Varicose veins with ulcer | Venous stasis |

### HTN Combination Codes
| Combination | Code |
|-------------|------|
| HTN + HF only | I11.0 (with HF) |
| HTN + CKD 1-4 | I12.9 |
| HTN + CKD 5/ESRD | I12.0 |
| HTN + HF + CKD 1-4 | I13.0 |
| HTN + HF + ESRD | I13.11 |
