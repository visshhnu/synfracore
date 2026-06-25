# ICD-10-CM Cheatsheet

## Code Structure
```
S72.001A
│  ────── S72 = Fracture of femur (3-char category)
│        .0  = Femoral head
│          01 = Unspecified fracture
│             A = Initial encounter
```

## Chapter Letter Guide
| Letter | Chapter |
|--------|---------|
| A-B | Infectious/parasitic |
| C-D | Neoplasms |
| E | Endocrine/metabolic |
| F | Mental/behavioral |
| G | Nervous system |
| I | Circulatory |
| J | Respiratory |
| K | Digestive |
| L | Skin |
| M | Musculoskeletal |
| N | Genitourinary |
| R | Signs/symptoms |
| S-T | Injuries |
| Z | Status/history/screening |

## 7th Character Reference
| 7th | Meaning | When to Use |
|----|---------|------------|
| A | Initial encounter | Active treatment |
| D | Subsequent encounter | Routine healing |
| S | Sequela | Late effect |
| G | Delayed healing | Subsequent, healing not proceeding |
| K | Nonunion | Fracture not united |
| P | Malunion | Fracture united abnormally |

## Diabetes Quick Codes
| T2DM Complication | Code |
|------------------|------|
| With nephropathy | E11.21 |
| With CKD | E11.22 |
| With retinopathy unspecified | E11.319 |
| With neuropathy unspecified | E11.40 |
| With foot ulcer | E11.621 |
| With hyperglycemia | E11.65 |
| Ketoacidosis without coma | E11.10 |
| Insulin use (Type 2) | Z79.4 |

## HTN Combination Codes
| Condition | Code |
|-----------|------|
| HTN only | I10 |
| HTN + HF | I11.0 |
| HTN + CKD 1-4 | I12.9 |
| HTN + CKD 5 | I12.0 |
| HTN + HF + CKD 1-4 | I13.0 |
| HTN + HF + ESRD | I13.11 |

## Placeholder X Rule
Code needs 7th character but has <6 characters → insert X
T40.1X1A = Heroin poisoning, accidental, initial
(without X: T40.11A — X fills position 5)
