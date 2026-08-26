# CCS Quick Reference Cheatsheet

## CCS Exam Vitals

```
Certifying body:   AHIMA
Total questions:   107 (97 scored + 10 unscored pretest)
Time allowed:      4 hours
Passing score:     300 (scaled, not raw percent)
Delivery:          Computer-based, Pearson VUE
Code sets tested:  ICD-10-CM + ICD-10-PCS + CPT/HCPCS
Scope:             INPATIENT and OUTPATIENT
```
`(needs verification — recheck against current ahima.org exam details before relying on these figures)`

## ICD-10-PCS — 7-Character Structure

```
Position 1: Section           (0 = Medical/Surgical, by far most common)
Position 2: Body System
Position 3: Root Operation    (the exam's real center of gravity)
Position 4: Body Part
Position 5: Approach
Position 6: Device            (Z = No Device is the most common value)
Position 7: Qualifier         (Z = No Qualifier is common when N/A)
```

## Approach Values (Position 5)

```
0 = Open
3 = Percutaneous
4 = Percutaneous Endoscopic
7 = Via Natural or Artificial Opening
8 = Via Natural or Artificial Opening Endoscopic
F = Via Natural or Artificial Opening With Percutaneous Endoscopic
    Assistance
X = External
```
`(needs verification — recheck exact letter/number assignments against the current PCS Reference Manual)`

## Root Operations — Quick Distinguishing Questions

```
Excision vs Resection      → PORTION removed, or ALL of the body part?
Excision vs Destruction    → Tissue taken OUT, or eradicated IN PLACE?
Excision vs Extirpation    → Body part itself, or ABNORMAL solid matter
                              (clot/stone/foreign object)?
Insertion vs Replacement   → Device ADDS a function, or TAKES THE PLACE
                              of a body part?
Repair                     → Fallback ONLY if no more specific root
                              operation applies
```

## UHDDS Principal Diagnosis — Key Phrase Breakdown

```
"AFTER STUDY"                → use everything known by discharge,
                                 not just the admitting diagnosis
"CHIEFLY RESPONSIBLE FOR
 ADMISSION"                  → the reason for THIS admission,
                                 not necessarily the most severe
                                 condition or the one using the
                                 most resources during the stay
```

## POA Indicators

```
Y = Present at admission
N = NOT present at admission (developed during stay)
U = Documentation insufficient to determine
W = Clinically undetermined
1 = Exempt from POA reporting
```

## DRG Assignment — What Feeds Into It

```
Principal diagnosis
  + secondary diagnoses (CC / MCC status matters — can raise DRG tier)
  + principal procedure (from ICD-10-PCS)
  + patient factors (age, discharge status, in some groupings)
  = MS-DRG → fixed payment for the entire inpatient stay
```

## Inpatient vs. Outpatient — Setting Recognition First

```
INPATIENT stay procedures         → ICD-10-PCS
OUTPATIENT facility procedures    → CPT/HCPCS (same as CPC-level coding)
DIAGNOSIS coding (either setting) → ICD-10-CM, but sequencing rules
                                     differ (UHDDS principal diagnosis
                                     for inpatient vs. first-listed
                                     diagnosis for outpatient)
```

## Revision Priority (final weeks)

```
1. Root operation distinguishing questions — drill until automatic
2. Build 3-5 full 7-character PCS codes from scratch, position by
   position, from realistic operative notes
3. UHDDS principal-diagnosis worked scenarios ("after study" cases)
4. POA indicator assignment on mixed inpatient case scenarios
5. Timed full-length practice exam under real 4-hour conditions
```
