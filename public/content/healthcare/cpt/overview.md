# CPT — Current Procedural Terminology

CPT codes are used to report medical, surgical, and diagnostic procedures performed by physicians and other healthcare providers. Maintained by the American Medical Association (AMA) and updated annually.

## What is CPT?

CPT (Current Procedural Terminology) is a standardized code set that describes medical services and procedures. Every billable service a provider performs has a CPT code — from a routine office visit to complex surgery to laboratory tests.

**Key facts:**
- Published and maintained by the **AMA**
- Updated annually — new edition effective January 1st
- Required for all outpatient claims to payers
- 5-digit numeric codes (some alphanumeric in Category II/III)
- Different from ICD-10-CM (diagnoses) — CPT is WHAT was done, ICD-10-CM is WHY

## CPT Code Categories

**Category I** — Main codes describing procedures and services
**Category II** — Supplemental tracking codes (performance measures, optional, end in F)
**Category III** — Temporary codes for new/experimental technologies (end in T)

## Code Structure — Category I

```
CPT codes are grouped into 6 sections:

99202-99499    Evaluation and Management (E/M)
00100-01999    Anesthesia
10004-69990    Surgery
70010-79999    Radiology
80047-89398    Pathology and Laboratory
90281-99199    Medicine
```

## Evaluation & Management (E/M) — Most Used

E/M codes represent office visits, hospital visits, consultations. They are the most commonly used and most audited CPT codes.

### Office/Outpatient Visit Codes (2021 Guidelines)

| Code | New Patient | Level | Typical Time |
|------|-------------|-------|-------------|
| 99202 | New | Low complexity | 15-29 min |
| 99203 | New | Low complexity | 30-44 min |
| 99204 | New | Moderate complexity | 45-59 min |
| 99205 | New | High complexity | 60-74 min |
| 99211 | Established | Minimal | May not need MD |
| 99212 | Established | Low complexity | 10-19 min |
| 99213 | Established | Low complexity | 20-29 min |
| 99214 | Established | Moderate complexity | 30-39 min |
| 99215 | Established | High complexity | 40-54 min |

**New vs Established Patient:**
- **New patient** — has not received professional services from the physician (or physician of same specialty in same group practice) within the past **3 years**
- **Established patient** — has received professional services within the past 3 years

### Medical Decision Making (MDM) — Key to E/M Selection

Since 2021, E/M level is based on either **MDM** OR **total time**:

**MDM has 3 elements (need 2 of 3 to meet level):**

1. **Number and complexity of problems addressed**
2. **Amount and/or complexity of data reviewed**
3. **Risk of complications and/or morbidity or mortality**

| Level | Problems | Data | Risk |
|-------|---------|------|------|
| **Low** | 2 stable chronic | Limited | Low (OTC drugs, minor surgery) |
| **Moderate** | 1 undiagnosed new problem | Moderate | Moderate (Rx drugs, minor surgery with risk) |
| **High** | 1 chronic with severe exacerbation | Extensive | High (drug therapy requiring monitoring) |

## Surgery Section — Key Concepts

### Global Surgical Package

When you bill a surgical code, it includes:
- Pre-operative visit (1 day before major surgery, same day for minor)
- The operation itself
- Post-operative visits for the **global period**
  - Minor surgery: 10 days
  - Major surgery: 90 days

**What is NOT included (can bill separately):**
- Treatment of unrelated conditions during global period
- Complications requiring return to OR
- Diagnostic tests, lab work
- Assistant surgeon services

### Modifiers — Critical for Surgery

```
-22  Increased procedural services (unusual complexity — needs documentation)
-24  Unrelated E/M during postoperative period
-25  Significant, separately identifiable E/M same day as procedure
-26  Professional component only (radiology reads)
-47  Anesthesia by surgeon
-50  Bilateral procedure
-51  Multiple procedures (applied to secondary procedures)
-52  Reduced services
-53  Discontinued procedure
-57  Decision for surgery (E/M on day before or day of major surgery)
-58  Staged/related procedure during postop period
-59  Distinct procedural service (override bundling)
-TC  Technical component only
-76  Repeat procedure by same physician
-78  Unplanned return to OR during postop period
-79  Unrelated procedure during postop period
-80  Assistant surgeon
-RT  Right side
-LT  Left side
```

## Common CPT Code Examples

### Office Procedures
```
10060   Incision and drainage of abscess (simple)
10061   I&D abscess (complicated)
11100   Biopsy of skin (first lesion)
11055   Paring/cutting of benign hyperkeratotic lesion (1-4)
17000   Destruction of premalignant lesion (first lesion)
17110   Destruction of benign lesions (up to 14)
```

### Injections
```
20610   Arthrocentesis, aspiration/injection major joint (knee, shoulder, hip)
20600   Arthrocentesis small joint (finger, toe)
96372   Therapeutic injection IM or SubQ
96374   Therapeutic injection IV push, single drug
90471   Immunization administration (first vaccine)
90472   Each additional vaccine administration
```

### Common Surgical
```
27447   Total knee arthroplasty (TKA)
27130   Total hip arthroplasty (THA)
43239   Upper GI endoscopy with biopsy
45378   Colonoscopy, diagnostic
45380   Colonoscopy with biopsy
49505   Repair inguinal hernia (age 5+, initial, reducible)
```

### Radiology
```
71046   Chest X-ray, 2 views
72148   MRI lumbar spine without contrast
70553   MRI brain with and without contrast
93000   Electrocardiogram (EKG/ECG)
93306   Echocardiography with Doppler
```

## Bundling and NCCI Edits

The **National Correct Coding Initiative (NCCI)** identifies procedure code pairs that should not be billed together because one is considered part of the other.

```
Example bundles (cannot bill both):
- 27447 (TKA) includes 27370 (inject knee during surgery)
- 45378 (colonoscopy) includes 45380 (biopsy) — NO
  Actually: 45380 REPLACES 45378 when biopsy performed

Use modifier -59 (or XS, XE, XP, XU) to override when procedures
are truly distinct and separate
```

## CCI Modifier Indicators

```
0 = Never use modifier to override (can never bill together)
1 = May use modifier to override if clinically appropriate
9 = N/A
```

## Interview Questions

**What is the difference between CPT modifier -25 and -57?**
Both are used when an E/M is billed on the same day as a procedure. Modifier **-25** is used when the E/M is a significant, separately identifiable service on the same day as a **minor** procedure (10-day global or 0-day global). Modifier **-57** is used when the E/M led to the decision to perform a **major** surgery (90-day global period) — it can be used on the day of or day before major surgery.

**What does "new vs established patient" mean for E/M coding?**
A new patient has NOT received professional services from the physician or another physician of the same specialty in the same group practice within the past 3 years. An established patient HAS received such services within 3 years. If uncertain, default to new patient. The distinction matters because new patient codes (99202-99205) generally pay higher than established (99212-99215) and have different documentation requirements.

**What is the global surgical package?**
The global surgical package is the bundled payment for surgical services. It includes the pre-op visit (1 day for major, same day for minor), the surgery itself, and all routine post-op visits during the global period (90 days for major surgery, 10 days for minor). Billing a separate E/M for a routine post-op visit during the global period is incorrect. You CAN bill separately for complications, unrelated conditions, diagnostic tests, and staged procedures (modifier -58).
