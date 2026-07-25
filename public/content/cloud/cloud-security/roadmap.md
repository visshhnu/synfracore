# Cloud Security — Learning Roadmap

## Estimated Time to Job-Ready
**7-9 weeks** of consistent learning (2-3 hours/day), assuming baseline familiarity with at least one cloud provider's IAM and networking already — cloud security is genuinely cross-cutting, so this roadmap builds on IAM, VPC, and general cloud fundamentals rather than teaching them from scratch.

## Phase 1: Foundation (Week 1-2)

- The shared responsibility model: the provider secures the cloud (physical infrastructure, hypervisor), you secure what you put in the cloud (configuration, data, access control) — and why nearly every real incident happens on the customer's side of that line
- Why identity, not a network perimeter, is the primary security boundary in cloud environments — every resource is reachable via an API call, not just through a single physical gate
- The top-10 real misconfiguration classes: public storage buckets, open SSH/RDP, unencrypted data at rest, missing MFA, over-permissive IAM policies
- CSPM (Cloud Security Posture Management) tools (Security Hub, Defender for Cloud, Security Command Center) as the automated version of what a manual audit checks

**Checkpoint:** can you explain, using the Capital One 2019 breach as a concrete example, why "AWS wasn't breached, the customer's configuration was" is the actual lesson, not just a technicality?

## Phase 2: Identity-Centric Security (Week 2-4)

- Least-privilege IAM design as the single highest-leverage cloud security practice — scoping permissions to exactly what's needed, not what's convenient
- Evidence-based permission tightening using actual access/audit logs (CloudTrail, Activity Log, Cloud Audit Logs) rather than guessing what a role "probably" needs
- Detecting and reducing blast radius: what a compromised credential could actually reach, and why that number should be as small as possible by design
- Complete Portfolio Project 1 (CSPM scanner) and Project 2 (least-privilege policy generator) from this course's Projects section

**Checkpoint:** given a role with 40 granted permissions where audit logs show only 12 were ever actually used over 90 days, can you explain the real security argument for removing the other 28, beyond "it's tidier"?

## Phase 3: Detection and Response (Week 4-6)

- Cloud-native threat detection (GuardDuty, Defender for Cloud alerts, Security Command Center findings) and what each is actually looking for
- Event-driven security automation: detecting a specific misconfiguration or suspicious event and triggering an automatic remediation within minutes, not hours
- The real tradeoff in automated remediation: speed of response versus the risk of an automated action breaking a legitimate use case — and why a full audit trail matters regardless
- Complete Portfolio Project 3 (automated detection-to-remediation pipeline)

**Checkpoint:** can you explain a concrete scenario where automated remediation is clearly the right call, and a different scenario where it's genuinely risky enough to require a human approval step instead?

## Phase 4: Governance and Interview Readiness (Week 6-9)

- Guardrails at the organization level (SCPs, Azure Policy, GCP Organization Policies) as preventive controls distinct from detective controls that fire after the fact
- Compliance frameworks (SOC 2, HIPAA, PCI-DSS) and how cloud security controls map to real regulatory requirements an organization might need to satisfy
- Data protection: encryption at rest and in transit as a baseline, and key management (KMS) as the actual mechanism behind "encrypted," not just a checkbox
- Review this course's Interview Q&A material, particularly the shared-responsibility-model and least-privilege-reasoning questions

## Common Pitfalls Specific to Cloud Security

- **Treating cloud security as primarily a network-perimeter problem** — in a cloud environment, identity and API access control matter more than network topology alone
- **Granting broad permissions "to be safe" or "to move faster"** — this is precisely backwards; broad permissions increase blast radius without a corresponding security benefit
- **Building detection without response, or response without an audit trail** — a detection that never triggers action, or an automated action with no record of what it did and why, both undermine the actual goal
- **Assuming a CSPM tool alone is sufficient** — these tools surface findings; someone still has to triage, prioritize, and actually remediate them

## Getting Your First Cloud-Security-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (misconfiguration detection, evidence-based least-privilege design, automated detection-to-remediation)
2. **Resume:** be specific — "built an automated remediation pipeline reducing mean-time-to-fix for public-bucket misconfigurations from hours to under 5 minutes" is far stronger than "experience with cloud security"
3. **Know the shared responsibility model cold, with a real incident example:** interviewers frequently probe whether a candidate can explain a real breach's actual root cause, not just recite the model abstractly
4. **Certifications, if pursuing one:** AWS Security Specialty, Azure Security Engineer Associate, and GCP Professional Cloud Security Engineer are the major provider-specific options — see this course's own Certification Guide for current format and pricing
