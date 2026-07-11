# Cloud Security — Certification Guide

## Certifications directly relevant to this technology

Cloud security has some of the most directly relevant, widely-recognized certification options of any technology on this site — this is genuinely a case where certification is a strong, standard signal, not a substitute for missing standardization.

- **AWS Certified Security – Specialty** — the most directly relevant AWS credential for exactly this page's content: IAM, detection services (GuardDuty, Security Hub), encryption, incident response, and compliance, all AWS-specific.
- **Microsoft Certified: Azure Security Engineer Associate (AZ-500)** — Azure's equivalent, covering Microsoft Defender for Cloud, Entra ID security, and Azure-specific network security controls.
- **Google Cloud Professional Cloud Security Engineer** — GCP's equivalent track.
- **(ISC)² CCSP (Certified Cloud Security Professional)** — vendor-neutral, broader cloud security credential covering architecture, governance, and risk across providers rather than one provider's specific tooling — a reasonable complement to a provider-specific certification rather than a replacement for one.

> **Note (unverified numbers):** exam question counts, duration, passing scores, and pricing for all of the above change periodically — verify current figures directly on each certifying body's official page before treating any specific number as current; this page deliberately avoids stating exam-format specifics that could go stale.

## What these exams actually test, relative to this page's structure

AWS Security Specialty and AZ-500 both lean heavily on scenario-based questions ("given this finding/incident, what's the correct remediation") that map closely to this page's Intermediate (triage frameworks) and Advanced (incident response process) sections — more than pure recall of service names and their one-line descriptions. CCSP, being vendor-neutral, leans more toward governance, risk, and compliance concepts (see this page's Advanced compliance-automation section) alongside technical controls.

## A specific caution worth naming directly

Cloud security certifications, more than most technical certifications, test knowledge that goes stale relatively fast — cloud providers add and rename security services regularly, and specific service capabilities change. Study materials more than 12-18 months old for these specific exams carry real risk of testing outdated service names or capabilities; verify your study source's currency against the certifying body's official, current exam guide before relying heavily on it.

## Suggested preparation order given this page's structure

1. Build genuine hands-on familiarity first (see Installation and Projects) — cloud security certifications specifically penalize theoretical-only preparation, since the scenario questions assume you've actually configured the controls being asked about, not just read a description of them.
2. Work through Fundamentals and Intermediate for the conceptual foundation (shared responsibility model, IAM precision, triage frameworks) the scenario questions build on.
3. Use official practice exams close to your exam date to calibrate specifically against the scenario-question format these exams use.
