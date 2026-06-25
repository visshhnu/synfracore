# BCHHC Advanced — Complex Coding Scenarios

## HTN Combination Codes

Never code I10 (HTN alone) when combination codes exist:

| Combination | Code |
|------------|------|
| HTN + HF only | I11.0 |
| HTN + CKD stages 1–4 | I12.9 |
| HTN + CKD stage 5/ESRD | I12.0 |
| HTN + HF + CKD stages 1–4 | I13.0 |
| HTN + HF + ESRD | I13.11 |

### Full Complex Scenario
Patient with CHF monitoring + T2DM on insulin + CKD stage 3 + anemia of CKD:
```
I13.0   Hypertensive heart and CKD with HF, CKD stages 1–4
I50.22  Chronic systolic heart failure
E11.22  T2DM with diabetic CKD
N18.3   CKD stage 3
D63.1   Anemia in CKD
Z79.4   Long-term insulin use
```

## CVA / Stroke in Home Health

**Rule**: Acute CVA (I60–I63) is NEVER coded in home health. Always code sequela:

| Residual | Code |
|---------|------|
| Hemiplegia, right non-dominant | I69.351 |
| Hemiplegia, left non-dominant | I69.354 |
| Aphasia following cerebral infarction | I69.320 |
| Dysphagia following cerebral infarction | I69.391 |

Default to non-dominant if dominance not documented.

## Wound Coding — 7th Character Rules

| 7th Character | When to Use | Example |
|-------------|------------|---------|
| A (Initial) | Active treatment: wound VAC, antibiotics active | Wound VAC in place |
| D (Subsequent) | Routine healing, dressing changes only | No active treatment |
| S (Sequela) | Late effect after acute phase resolves | Contracture from old burn |

**Key rule**: Wound VAC presence = active treatment = A, even if wound is healing.

## Pressure Ulcer vs Non-Pressure Chronic Ulcer
| Code | Type | Trigger |
|------|------|---------|
| L89.x | Pressure ulcer | Bony prominence, sustained pressure |
| L97.x | Non-pressure chronic ulcer (lower limb) | Diabetic foot, venous stasis, arterial |
| T81.x | Post-procedural wound | Surgical wound complications |

## Diabetes — Specificity Requirements

Always code to highest specificity — DO NOT use E11.9 (unspecified) when complications documented:

| Condition | Code |
|----------|------|
| T2DM with CKD | E11.22 |
| T2DM with foot ulcer | E11.621 |
| T2DM with retinopathy, unspecified | E11.319 |
| T2DM with neuropathy, unspecified | E11.40 |
| T2DM with hyperglycemia | E11.65 |
| Insulin use (T2DM) | Z79.4 |

## A and B Codes in Infection Coding
- A codes: bacterial and parasitic infections (Chapter 1)
- B codes: viral and other organism infections
- When organism identified: code primary infection + B code for organism
- Example: B96.89 (other specified bacterial agents) as additional code for organism identification
