# Incident Response — Notes

## Core mental model

- IR is organized around 6 phases: Preparation → Identification → Containment → Eradication → Recovery → Post-Incident, with lessons learned looping back to Preparation.
- A pre-agreed, memorized severity scale (P1-P4) exists specifically so a team doesn't waste time debating classification during an actual, time-pressured incident.
- Evidence preservation must happen BEFORE containment — reversing this order can permanently destroy volatile evidence (memory, active connections), especially for fileless malware that may exist only in memory.

## Evidence handling

- Chain of custody (who collected what, when, how, every subsequent access) determines whether evidence is usable in a later legal/regulatory proceeding — undocumented evidence can't be retroactively fixed once the moment has passed.
- Never analyze original evidence directly — always work against a verified, hash-matched copy, preserving the original untouched.
- A "hands off" rule (no remediation actions on a suspected-compromised host until forensics confirms evidence capture is complete) needs to be a memorized runbook rule, not something looked up mid-incident.

## Detection and hunting

- SIEM correlation rules that combine multiple weak signals into one higher-confidence alert reduce alert fatigue far more effectively than tuning individual rule thresholds — a single failed login is weak signal; failed logins followed by success from a new IP is much stronger.
- Alert fatigue is a systemic correlation-rule tuning problem, not an individual analyst attentiveness problem.
- Threat hunting is the proactive complement to reactive IR — working from a hypothesis to find compromise that hasn't triggered any existing alert, specifically valuable against living-off-the-land techniques using legitimate tools in anomalous patterns.
- IOCs found during an incident should always be fed back into detection systems before closing the incident — otherwise the same attacker/infrastructure could succeed again undetected.

## Automation and exercises

- SOAR should automate well-understood, safe, reversible actions (password resets, session revocation) and route higher-risk/irreversible decisions to a human analyst with context pre-gathered — the same automation-safety discipline as SRE automation generally.
- Purple team exercises (red and blue working together in real time, immediately tuning detection for any gap found) close detection gaps faster and more specifically than a traditional adversarial red-team engagement reviewed only in a post-exercise debrief.

## Backups and recovery

- Online, continuously-connected backups can be compromised by the same incident (especially ransomware) that affected production — always verify backup integrity and a clean scan before restoring, never assume a backup is safe just because it exists.
- Offline/immutable backups are a deliberate architectural decision that needs to be made before an incident, not assumed to exist during one.

## Legal and regulatory

- Multi-jurisdiction breaches trigger different, sometimes conflicting notification obligations (GDPR 72h, HIPAA 60d, DPDP Act) — which regulations could apply should be pre-identified during Preparation, not determined for the first time during an active, time-pressured breach.
- Legal needs to be a defined IR team role engaged early in an actual incident, not brought in only once a notification deadline is already at risk.

## Post-incident discipline

- Blameless post-incident review (focused on system/process gaps, not individual blame) produces more honest, complete findings than a fault-focused review culture.
- The value of a post-incident review is entirely in follow-through — action items need a named owner, a deadline, and regular tracking to completion, not just documentation in a report that's never revisited. A pattern of recurring similar incidents usually traces back to this follow-through gap, not a failure to identify the right root cause in the first place.
