# HCPCS Level II Fundamentals

## What is HCPCS Level II?
Healthcare Common Procedure Coding System Level II — maintained by CMS. Alphanumeric codes (single letter + 4 digits) for products and services not adequately covered by CPT (Level I). Required for Medicare/Medicaid claims for DME, injectable drugs, ambulance, orthotics, prosthetics, and related supplies.

## Structure: Letter + 4 Digits
E0601 = CPAP device | J0171 = Epinephrine 0.1 mg | A0427 = ALS ambulance
Updated quarterly for drug codes (J codes); annually for all others (effective January 1).

## Sections Quick Reference
| Section | Range | Content |
|---------|-------|---------|
| A | A0000-A9999 | Ambulance; medical and surgical supplies |
| B | B4000-B9999 | Enteral and parenteral nutrition |
| C | C1000-C9999 | Hospital outpatient PPS codes |
| D | D0000-D9999 | Dental procedures |
| E | E0100-E9999 | Durable Medical Equipment (DME) |
| G | G0000-G9999 | Professional procedures and services |
| H | H0001-H2037 | Behavioural health services |
| J | J0000-J9999 | Injectable and infusible drugs |
| K | K0000-K9999 | Temporary DME codes |
| L | L0000-L9999 | Orthotics and prosthetics |
| Q | Q0000-Q9999 | Temporary codes (miscellaneous) |
| T | T1000-T5999 | Medicaid state agency services |
| V | V0000-V5999 | Vision, hearing, and speech |

## Four Medicare DME Coverage Criteria
ALL four must be met simultaneously:
1. Medically necessary — physician-ordered for documented medical condition
2. Used in the home — patient's place of residence (not a hospital or nursing facility)
3. Serves a medical purpose — not primarily for comfort or convenience
4. Durable — can withstand repeated use (generally expected life >3 years)

## Certificate of Medical Necessity (CMN)
Required for: oxygen equipment, power wheelchairs, hospital beds, CPAP/BiPAP, enteral nutrition, pneumatic compression devices.
Physician must sign — cannot be backdated or signed by NP/PA in most cases.
Without valid, timely CMN: Medicare will not reimburse regardless of medical need.

## J Code Drug Calculation
Each J code specifies a drug and a per-unit dose amount.
Units to bill = Total prescribed dose ÷ dose per J code unit
Example: J0171 = Epinephrine 0.1 mg per unit. If 0.3 mg ordered → bill 3 units.
Always combine J code with the appropriate drug administration CPT code.

## Home Health G Codes
| Code | Service |
|------|---------|
| G0180 | Physician certification for home health (initial) |
| G0179 | Physician recertification for home health |
| G0151 | Physical therapy services in home health |
| G0152 | Occupational therapy services in home health |
| G0153 | Speech-language pathology services in home health |
| G0162 | Skilled nursing services in home health |

## Fundamentals

### What You Need to Know First
These are the building blocks. Master these before moving to intermediate topics. Every expert skipped fundamentals at some point and paid for it later.

### Core Concepts

**Architecture Overview**
Understanding how a system is structured helps you reason about its behaviour. Know the main components, how they interact, and what each is responsible for. Draw it out — if you cannot sketch the architecture, you do not understand it yet.

**The Basic Unit of Work**
Every technology operates on some fundamental unit: a container, a query, a message, a record, a request. Understanding what this unit is and its lifecycle (creation → processing → completion/failure) explains most of the technology's behaviour.

**Configuration Fundamentals**
Defaults are chosen to be safe, not optimal. Know the defaults, understand what they mean, and know when to change them. Keep configuration in version control. Separate configuration from code.

**Error Handling Basics**
Read error messages completely — they almost always tell you exactly what is wrong. Know where logs are and how to read them. Understand the difference between transient errors (retry) and permanent errors (fix the code or config).

### Hands-On Exercises
1. Install and run the technology locally following the official getting-started guide
2. Run the simplest possible working example
3. Break it intentionally — introduce an error and read the error message
4. Check the logs and understand what they show
5. Change one configuration value and observe the effect

### Key Terminology
| Term | Definition |
|------|-----------|
| Node / Instance | A single running copy of the service |
| Cluster | Multiple nodes working together |
| Replica | A copy of data or a service for redundancy |
| Partition | A subdivision of data or work |
| Leader/Primary | The authoritative instance for writes |
| Follower/Replica | Secondary instance that replicates from leader |

### First 30 Minutes Checklist
- [ ] Verified installation works
- [ ] Read the architecture overview in the official docs
- [ ] Ran a hello-world example successfully
- [ ] Understood what the example actually does
- [ ] Located where logs are written
- [ ] Found the configuration file and read what the main settings do
