# HCPCS — Healthcare Common Procedure Coding System

HCPCS (pronounced "hick-picks") is a coding system used primarily for Medicare and Medicaid billing. It codes services not covered by CPT — primarily supplies, equipment, drugs, and non-physician services.

## HCPCS Structure

HCPCS has two levels:

**Level I — CPT Codes**
- 5-digit numeric codes
- Maintained by AMA
- Used for physician services and procedures
- (Covered in CPT module)

**Level II — HCPCS Codes**
- Alphanumeric: one letter followed by 4 digits
- Maintained by CMS
- Used for: durable medical equipment, prosthetics, supplies, drugs, ambulance, non-physician services
- Updated quarterly (major updates January 1)

```
Format: [Letter][0000-9999]
A0000-A9999    Transportation services (Ambulance)
B0000-B9999    Enteral and parenteral therapy
C0000-C9999    Outpatient PPS (Hospital OPPS temporary)
D0000-D9999    Dental procedures (CDT codes)
E0000-E9999    Durable Medical Equipment (DME)
G0000-G9999    Procedures/Professional services (temporary)
H0000-H9999    Behavioral health services
J0000-J9999    Drugs administered other than oral method
K0000-K9999    Temporary DME codes
L0000-L9999    Orthotic and prosthetic procedures
M0000-M9999    Medical services
P0000-P9999    Pathology and laboratory
Q0000-Q9999    Temporary codes (miscellaneous)
R0000-R9999    Diagnostic radiology
S0000-S9999    Private payer temporary codes
T0000-T9999    State Medicaid agency codes
V0000-V9999    Vision/hearing services
```

## Key HCPCS Code Categories

### E Codes — Durable Medical Equipment (DME)

DME must meet four criteria:
1. Durable (withstands repeated use)
2. Used for medical purpose
3. Not useful to person without illness/injury
4. Used in the home

```
Common E Codes:
E0100    Cane, includes canes of all materials
E0105    Cane, quad or tri (broad-based)
E0114    Crutches, underarm, pair
E0116    Crutch, underarm, each
E0130    Walker, rigid (pickup)
E0135    Walker, folding (pickup)
E0141    Walker, wheeled, without seat
E0143    Walker, folding wheeled
E0170    Commode chair
E0260    Hospital bed, semi-electric
E0601    CPAP device
E0627    Seat lift mechanism
E1150    Wheelchair, adult (standard)
E1161    Manual adult size wheelchair
E1390    Oxygen concentrator, single delivery port
```

### J Codes — Injectable Drugs

J codes identify drugs administered by injection in physician offices and outpatient settings. Units represent specific quantities.

```
J0130    Abciximab, 10 mg
J0171    Adrenalin epinephrine, 0.1 mg
J0585    Botulinum toxin A per unit
J0702    Betamethasone acetate/sodium phosphate, 3 mg
J1020    Methylprednisolone acetate 20 mg
J1030    Methylprednisolone acetate 40 mg
J1040    Methylprednisolone acetate 80 mg
J1644    Heparin sodium, per 1000 units
J2001    Lidocaine HCl 10 mg
J2250    Midazolam HCl per 1 mg
J2405    Ondansetron HCl (Zofran) 1 mg
J2469    Palonosetron HCl 0.25 mg
J3030    Sumatriptan succinate 6 mg
J3301    Triamcinolone acetonide 10 mg
J3302    Triamcinolone acetonide 40 mg
J7030    Normal saline 500 mL
J9035    Bevacizumab (Avastin) 10 mg
```

### G Codes — CMS Temporary Codes

Used for services that don't fit existing CPT codes, often Medicare preventive services.

```
G0008    Administration of influenza virus vaccine
G0009    Administration of pneumococcal vaccine
G0010    Administration of hepatitis B vaccine
G0101    Cervical or vaginal cancer screening (pelvic exam)
G0102    Prostate cancer screening, digital rectal exam
G0103    Prostate cancer screening, PSA test
G0121    Colorectal cancer screening, colonoscopy (not high risk)
G0202    Screening mammography
G0439    Annual wellness visit, subsequent
G0444    Annual depression screening
G0446    Annual face-to-face intensive behavioral therapy

MIPS Quality Reporting (G-codes):
G8420    Oncology measures
G9143    Patient on warfarin
```

### A Codes — Transportation and Supplies

```
Ambulance:
A0425    Ground mileage, per statute mile
A0426    Ambulance service, ALS 1, emergency
A0427    Ambulance service, ALS 1, emergency (400 lb+)
A0428    Ambulance service, BLS, non-emergency
A0429    Ambulance service, BLS, emergency
A0430    Air ambulance, fixed wing

Supplies:
A4206    Syringe with needle, sterile (each)
A4207    Syringe with needle sterile, 2cc
A4245    Alcohol wipes, per box
A4253    Blood glucose test strips, per 50
A4259    Lancets, per box of 100
A6196    Alginate dressing, wound cover (per 6 sq in)
A6260    Wound cleanser, any type, any size
```

## HCPCS Modifiers

HCPCS modifiers are two-digit alphanumeric codes appended to clarify services.

```
Anatomical modifiers:
-E1    Upper left, eyelid
-E2    Lower left, eyelid
-E3    Upper right, eyelid
-E4    Lower right, eyelid
-FA    Left hand, thumb
-F1    Left hand, second digit
-F2    Left hand, third digit
-F3    Left hand, fourth digit
-F4    Left hand, fifth digit
-F5 to F9  Right hand digits
-TA    Left foot, great toe
-T1 through T9  Other toe designations
-LC    Left circumflex
-LD    Left anterior descending
-RC    Right coronary artery

DME modifiers:
-KX    Requirements specified in LCD are met
-GZ    Item expected to be denied as not reasonable/necessary
-GA    Advance Beneficiary Notice (ABN) on file
-GY    Item not covered by Medicare (statutory exclusion)

Symmetrical body parts:
-LT    Left side
-RT    Right side
-50    Bilateral procedure

Service level:
-UA    Medicaid level of care 1
-UB    Medicaid level of care 2
-TC    Technical component
-26    Professional component
```

## Coverage Determinations

```
National Coverage Determinations (NCDs):
- CMS sets national coverage policy
- Applies to all Medicare Administrative Contractors
- Example: NCD for CPAP (240.4) — must have sleep study
  showing AHI ≥ 15, or AHI ≥ 5 with symptoms

Local Coverage Determinations (LCDs):
- MAC (Medicare Administrative Contractor) sets local policy
- Varies by geographic region
- Specifies ICD-10-CM codes that support medical necessity
- Example: LCD for glucose monitors requires diabetes diagnosis

Always verify:
1. Is it covered by Medicare?
2. Are there frequency limitations?
3. What ICD-10-CM codes support medical necessity?
4. Is prior authorization required?
```

## Advance Beneficiary Notice (ABN)

```
ABN required when:
- Medicare may not cover the service
- Provider thinks it might be denied

ABN must include:
- Specific service expected to be denied
- Why Medicare may not pay
- Estimated cost
- Patient choice options

Patient options:
Option 1: Want item, bill Medicare, pay if denied
Option 2: Want item, don't bill Medicare, pay now
Option 3: Don't want item

Modifier codes for ABN:
-GA: ABN on file (mandatory claim submission)
-GX: ABN given voluntarily (optional services)
-GZ: Item likely non-covered, no ABN (provider absorbs cost)
-GY: Statutory exclusion (not covered by any Medicare benefit)
```

## Interview Questions

**What is the difference between CPT and HCPCS Level II?**
CPT (Level I HCPCS) codes services and procedures performed by physicians — office visits, surgeries, diagnostic tests. These are 5-digit numeric codes maintained by the AMA and used universally. HCPCS Level II codes things CPT doesn't cover — durable medical equipment (walkers, wheelchairs, CPAP), injectable drugs by J-code, ambulance services, prosthetics and orthotics, and certain preventive services. Level II codes are alphanumeric, maintained by CMS, and primarily used for Medicare and Medicaid billing. Both may be used on the same claim.

**When would you use HCPCS modifier -KX?**
Modifier -KX is used for DME claims to indicate that the patient meets all the coverage criteria listed in the applicable Local Coverage Determination (LCD). For example, when billing for a power wheelchair, -KX indicates that documentation supports that the patient meets Medicare's functional and clinical criteria. Without -KX when required, the claim will be denied. -KX is essentially the provider's attestation that all LCD requirements are satisfied and documentation is in the medical record.
