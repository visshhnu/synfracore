# BCHHC Fundamentals

**Analogy** — The four coverage criteria below work like the legs of a table — remove any one and the whole thing collapses, regardless of how solid the other three are. A patient can be genuinely homebound and have a genuine skilled need, but without a signed physician's plan of care, the claim still doesn't stand.

## Medicare Home Health — Four Coverage Criteria
ALL four must be met simultaneously:
1. **Homebound**: Leaving home requires considerable effort due to illness/injury
2. **Skilled service**: Requires SN, PT, OT, or SLP
3. **Physician's care**: Certified plan of care (Form 485) every 60 days
4. **Reasonable and necessary**: Appropriate for condition and goals

## Who Fills OASIS?
| Clinician | Can Complete OASIS |
|-----------|------------------|
| SN (RN/LPN) | ✅ Yes |
| PT | ✅ Yes |
| SLP/ST | ✅ Yes |
| OT | ❌ No — cannot independently complete OASIS |

## OASIS Assessment Types
| Type | Trigger | Required Timing |
|------|---------|----------------|
| SOC (Start of Care) | First skilled visit | Within 5 calendar days |
| ROC (Resumption of Care) | Returns from inpatient | Within 48 hours (2 calendar days) |
| REC (Recertification) | Episode renewal | Near end of 60-day episode |
| SCIC (Significant Change in Condition) | Acute change, no hospitalisation | Within episode |
| DC (Discharge) | Last visit | At discharge |

## ICD-10-CM Key Conventions
- **NEC** (Not Elsewhere Classified): specific documentation, no specific code
- **NOS** (Not Otherwise Specified): vague documentation, use unspecified code
- **Excludes1**: cannot code together — mutually exclusive
- **Excludes2**: separate conditions — CAN code both if both present
- **Code first**: underlying condition before manifestation
- **Use additional code**: add detail (organism, laterality, drug use)

## Primary Diagnosis Selection (Home Health)
- Must DIRECTLY relate to the skilled service need
- Must SUPPORT homebound status
- Must be the condition the skilled service is ACTIVELY TREATING
- Wrong primary diagnosis → wrong PDGM clinical group → wrong reimbursement

## OASIS Data Collection Protocol

### Start of Care (SOC)
The SOC OASIS captures baseline functional status when a patient first begins home health. The clinician assesses:
- Functional abilities (ambulation, transferring, bathing, dressing, eating, toileting)
- Cognitive and behavioral patterns
- Pain, vision, hearing, skin integrity
- Medications and medication management ability
- Equipment and supplies needed

### OASIS M Codes — High-Yield Items
| OASIS Item | What it Captures | PDGM Impact |
|-----------|-----------------|-------------|
| M1800-M1860 | ADL/IADL function | Functional level (Low/Medium/High) |
| M1021/M1023 | Primary/secondary diagnosis | Clinical group assignment |
| M1033 | Risk for hospitalization | Comorbidity adjustment |
| M0090 | Response date | Episode timing |

## Homebound Status — Documentation Standards

### What Qualifies
A patient is homebound when leaving home requires a **considerable and taxing effort** due to illness, injury, or functional limitation. CMS requires specific documentation:
- The **specific limitation** (non-weight-bearing, severe dyspnea, cognitive impairment)
- The **effort required** (requires wheelchair, two-person assist, significant fatigue)
- Not just "patient is weak" or "patient is elderly"

### Allowable Absences
Homebound patients may leave for:
- Medical appointments (physician, therapy, dialysis, chemotherapy)
- Religious services
- Adult day care programs
- Infrequent, short duration outings (barber, family event)
These do not break homebound status if documented appropriately.

## ICD-10-CM — Quick Reference for Home Health

### Code Structure Review
- Positions 1-3: Category (e.g., I50 = Heart failure)
- Position 4: Etiology or body part
- Position 5: Severity or laterality
- Position 6: Additional specificity
- Position 7: 7th character extensions (encounter type, laterality)

### Placeholder X
When a code requires a 7th character but has fewer than 6 characters, the letter X fills empty positions:
```
T45.X1XA — Poisoning by unspecified drugs, accidental (initial encounter)
```
The first X fills position 4, the second X fills position 5.

## Try It (2 Minutes)

Using the Who Fills OASIS table above:

1. A physical therapist wants to independently complete a patient's SOC OASIS. Is that allowed?
2. An occupational therapist wants to do the same. Is that allowed?
3. If only OT services are ordered for a patient (no SN, PT, or SLP), who would need to be involved to get the OASIS completed?

You should land on: yes for PT — explicitly listed as able to complete OASIS; no for OT — explicitly excluded, even though OT is a legitimate skilled service in other contexts; and if only OT is ordered, an SN, PT, or SLP would still need to be brought in specifically to complete the OASIS, since OT alone cannot do it independently.
