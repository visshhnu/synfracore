# BCHHC Fundamentals

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
| ROC (Resumption of Care) | Returns from inpatient | Within 24 hours |
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
