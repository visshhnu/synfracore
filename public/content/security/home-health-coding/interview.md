# Home Health Coding — BCHHC Interview Q&A

## OASIS and Episode Management

**Q: What are the OASIS assessment types and when is each done?**
SOC (Start of Care): within 5 days of first visit — opens the 60-day episode.
REC (Recertification of Care): when HH goals not met in 60 days — extends episode.
ROC (Resumption of Care): within 24 hours of patient returning from hospital within an episode.
SCIC (Significant Change in Condition): within 60 days of SOC, acute change, no hospitalisation.
Discharge OASIS: at end of each episode.

**Q: Who can fill the OASIS assessment?**
Skilled Nurse (SN — RN/LPN), Speech Therapist (ST/SLP), Physical Therapist (PT).
OT (Occupational Therapist) CANNOT fill OASIS independently.
OASIS must be completed at each required assessment point.

**Q: What is the PDGM and how does primary diagnosis affect payment?**
Patient-Driven Groupings Model — replaced PPS in January 2020. Payment per 30-day period (not 60-day). Five factors: timing (early/late), admission source (community/institutional), clinical grouping (12 groups from primary Dx), functional level (OASIS items), comorbidity adjustment (secondary diagnoses).
Primary diagnosis determines clinical group — wrong primary = wrong clinical group = wrong reimbursement.

## ICD-10-CM Coding — Core Rules

**Q: What is the difference between NEC and NOS?**
NEC = Not Elsewhere Classified: more documentation is given BUT no specific code exists. The condition is more specific than the code. Example: DM due to hyperlipidemia → E11.69, E78.5.
NOS = Not Otherwise Specified: LESS information in documentation; vague or unspecified. Specific codes exist but documentation doesn't support using them. Example: Pneumonia NOS → J18.9.
Memory: NEC = more info, no specific code. NOS = not enough info in the documentation.

**Q: Explain Excludes1 vs Excludes2 with examples.**
Excludes1 = "NOT coded here" — two conditions CANNOT be coded together at the same encounter (mutually exclusive). Example: J44.9 COPD Excludes1 J42 chronic bronchitis — cannot code both.
Excludes2 = "Not included here" — conditions are separate but CAN coexist; code both when both are present. Example: F02 dementia Excludes2 F01 vascular dementia — code both if patient has both.

**Q: How do you code HTN + CHF + CKD stage 3?**
Use combination code I13.0 (HTN with CHF and CKD stages 1-4). Never code I10 separately when combination codes exist.
Full sequence: I13.0 + I50.22 (chronic systolic CHF) + N18.3 (CKD stage 3).
If also DM type 2 with CKD and anaemia: add E11.22 + D63.1 + Z79.4 (if on insulin).
Rule: HTN combination code changes based on CKD stage.

## BCHHC Advanced Scenarios

**Q: Patient had CVA 3 months ago with left hemiplegia and aphasia. How do you code for home health?**
Three-month-old CVA = sequela phase. DO NOT code acute CVA (I60-I63).
Code residual deficits from I69.3- series (following cerebral infarction):
- Hemiplegia left non-dominant: I69.354 (default if dominance not documented)
- Aphasia following cerebral infarction: I69.320
These are primary/additional diagnoses. Do NOT add original stroke code — sequela codes imply post-infarction.
If haemorrhagic stroke: use I69.1- or I69.2- series instead.

**Q: Surgical wound dehiscence with wound VAC, no infection — codes and 7th character?**
Code: T81.31XA (disruption of external operation wound).
7th character A: wound VAC present = active wound care/treatment (not just routine care).
If wound VAC absent: use D (subsequent encounter, routine healing).
Key rule: Active wound treatment (wound VAC, active antibiotics) = A. Routine care without active treatment = D.
Secondary: Z48.89 (aftercare following surgery) or Z47.89 (orthopaedic).

**Q: Patient on HH for CHF monitoring, also has T2DM on insulin, CKD stage 3, anaemia of CKD. Full coding?**
Primary: I13.0 (HTN + HF + CKD stages 1-4 combination)
Heart failure type: I50.22 (chronic systolic CHF)
DM with CKD: E11.22
CKD stage: N18.3
Anaemia of CKD: D63.1
Insulin use: Z79.4
Do NOT code I10 separately — I13.0 includes HTN.
Do NOT omit N18.3 — needed to specify CKD stage even with I13.0.

**Q: What A and B codes are used in home health infection coding?**
A codes = bacterial and parasitic infections (Chapter 1).
B codes = viral and other organism infections.
Common home health codes: cellulitis L03.-, UTI N39.0, wound infections T81.4-.
B codes used for organism identification: if localised infection + known causal organism, code 1° infection + 2° B code for organism. Example: B96.89 (other specified bacterial agents) with puerperal sepsis.
Common: B96.89 for organism specification in secondary position.

## Wound and Skin Coding

**Q: How do you code pressure ulcers vs non-pressure chronic ulcers?**
Pressure ulcers (L89.-): caused by sustained pressure on bony prominences. Code by stage (1-4, unstageable) and body site.
Non-pressure chronic ulcers (L97.-): lower limbs — diabetic foot, venous stasis, arterial ulcers. Code by site and severity.
Key: L89 = pressure (positional). L97 = non-pressure (vascular/metabolic).
If DM with foot ulcer: E11.621 (DM + foot ulcer) + L97.- (specific ulcer).

**Q: What is homebound status and how must it be documented?**
Homebound = leaving home requires considerable effort due to illness/injury.
Documentation must show: specific limitation, distance/effort to leave, what assistance needed.
Brief absences allowed: medical appointments, religious services, adult day care.
Examples of valid homebound: severe COPD with SOB on exertion, severe weakness post-surgery, non-weight-bearing on lower extremity, cognitive impairment requiring supervision.

**Q: What are the 12 PDGM clinical groups?**
Musculoskeletal Rehab, Neuro/Stroke Rehab, Wound Care, Complex Medical/Surgical, Respiratory, Endocrine, Infectious Disease/Neoplasms/Blood, Cardiac/Circulatory, Medication Management/Teaching/Assessment (MMTA), Behavioural Health, Immobility, GI/GU.
Getting wrong primary Dx → wrong clinical group → wrong reimbursement.
