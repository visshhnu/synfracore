# Healthcare Administration Cheatsheet

## Medicare Parts Quick Reference
| Part | Covers | Payment Model |
|------|--------|--------------|
| A | Inpatient hospital, SNF, hospice, home health | DRG (hospital), per diem (SNF) |
| B | Physician, outpatient, preventive, DME | RBRVS fee schedule; APC (hospital outpatient) |
| C | Medicare Advantage — private plans | Capitation (PMPM) |
| D | Prescription drugs | Formulary-based; premiums + copays |

## Revenue Cycle KPIs
| Metric | Target |
|--------|--------|
| Days in Accounts Receivable | <50 days |
| Clean claim rate (first submission) | >95% |
| Denial rate | <5% |
| Net collection rate | >95% |
| Denial overturn rate | >50% |
| First-pass resolution rate | >90% |

## Claim Forms
| Form | Used By |
|------|---------|
| CMS-1500 (02/12) | Physicians, NPPs, outpatient clinics |
| UB-04 / CMS-1450 | Hospitals, SNFs, home health agencies (institutional claims) |
| ADA Dental Claim Form | Dental providers |

## HIPAA Key Rules Summary
| Rule | Core Requirement |
|------|----------------|
| Privacy | PHI protection; patient access rights; minimum necessary standard |
| Security | ePHI: administrative, physical, technical safeguards |
| Breach Notification | Notify individuals + HHS within 60 days of discovery |
| Transactions | ANSI X12 EDI: 837P/I (claims), 835 (remittance), 270/271 (eligibility) |
| Enforcement | Civil: $100–$50K/violation; Criminal: up to $250K + 10 yrs imprisonment |

## DRG Inpatient Payment Formula
```
Payment = DRG base rate × DRG relative weight × wage index adjustment
CC  = Complication or Comorbidity → moderate DRG weight increase
MCC = Major CC → significant DRG weight increase
Outlier: When actual cost greatly exceeds DRG payment → additional outlier payment
Hospital receives same DRG amount regardless of actual LOS or resource use
→ Incentivises efficiency and shorter stays
```

## Key Healthcare Compliance Laws
| Law | Core Prohibition / Requirement |
|-----|-------------------------------|
| False Claims Act | No false claims to government; 3× damages + per-claim fines |
| Anti-Kickback Statute | No remuneration to induce federal programme referrals (criminal) |
| Stark Law (Self-Referral) | No physician self-referral for designated health services (civil, strict liability) |
| EMTALA | Emergency screening and stabilisation — regardless of ability to pay |
| HIPAA | Privacy, security, electronic transaction standards |
| 21st Century Cures Act | Information blocking prohibited; FHIR patient access APIs required |

## Common Denial Reason Codes
| Code | Reason | Typical Cause |
|------|--------|---------------|
| CO-4 | Procedure inconsistent with modifier | Modifier applied incorrectly |
| CO-11 | Diagnosis not covered by procedure | Wrong ICD-10 code selected |
| CO-16 | Claim lacks required information | Missing NPI, date of service, etc. |
| CO-97 | Bundled service | Procedure included in another code |
| CO-167 | Non-covered diagnosis | ICD-10 code not on LCD |
| PR-96 | Non-covered charge | Excluded service |
| CO-50 | Not medically necessary | Diagnosis doesn't support procedure |
