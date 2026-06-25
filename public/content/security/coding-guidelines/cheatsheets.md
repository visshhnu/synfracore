# Coding Guidelines Cheatsheet

## Core Conventions
| Convention | Meaning |
|-----------|---------|
| NEC | Not Elsewhere Classified — specific info, no specific code |
| NOS | Not Otherwise Specified — vague documentation |
| Excludes1 | Mutually exclusive — CANNOT code together |
| Excludes2 | Separate conditions — CAN code both if both present |
| Code first | Sequence underlying condition before manifestation |
| Use additional | Add detail code (organism, laterality) |

## Outpatient vs Inpatient Rules
| Rule | Outpatient | Inpatient |
|------|-----------|----------|
| First code | First-listed dx (reason for visit) | Principal dx (after study) |
| Uncertain dx | Code signs/symptoms ONLY | May code as confirmed |
| "Probable" | Never coded as confirmed | Code as if confirmed |

## POA Indicators
| Code | Definition |
|------|-----------|
| Y | Present at admission |
| N | Not present — developed after admission |
| U | Unknown — insufficient documentation |
| W | Clinically undetermined |
| 1 | Exempt from POA reporting |

## Signs and Symptoms Rule
```
Code sign/symptom when: No definitive diagnosis established
Do NOT code when: Integral to a confirmed diagnosis
Do code when: Additional sign NOT routinely associated with confirmed dx
```

## Neoplasm Sequencing
| Scenario | Principal Code |
|---------|--------------|
| Active treatment for neoplasm | Neoplasm first |
| Complication is reason | Complication first |
| History only | Z85 personal history |
| Anemia due to neoplasm | Neoplasm first, D63.0 secondary |

## HTN Combination Codes
| Combo | Code |
|-------|------|
| HTN alone | I10 |
| HTN + HF | I11.0 |
| HTN + CKD 1-4 | I12.9 |
| HTN + CKD 5 | I12.0 |
| HTN + HF + CKD 1-4 | I13.0 |
| HTN + HF + ESRD | I13.11 |

## Code Selection Steps
1. Identify main term from documentation
2. Look up in Alphabetic Index → tentative code
3. NEVER assign from Index alone — verify in Tabular List
4. Read all notes, Excludes, 7th character requirements
5. Select most specific code supported by documentation
6. Apply sequencing rules per setting (inpatient/outpatient)
