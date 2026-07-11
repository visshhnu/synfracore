# Incident Response — Advanced

## SOAR: automating the repeatable parts of response, not the judgment calls

Security Orchestration, Automation, and Response (SOAR) platforms automate the mechanical, repeatable steps of an incident response playbook, freeing analyst time for the parts that genuinely require human judgment:

```python
# Conceptual SOAR playbook — automated first-response actions,
# triggered directly from a SIEM alert, before human analysis begins
def phishing_response_playbook(alert):
    affected_user = alert["user"]

    # Automated, low-risk, reversible actions — safe to run without a human gate
    force_password_reset(affected_user)
    revoke_active_sessions(affected_user)
    quarantine_email(alert["message_id"])

    # Enrichment — gather context automatically, but don't act on it yet
    ioc_reputation = check_threat_intel(alert["sender_domain"])

    # Escalate to human analyst with full context already assembled —
    # do NOT auto-disable the account or take irreversible action without review
    escalate_to_analyst(affected_user, ioc_reputation, alert)
```
The same automation-safety discipline covered in this platform's SRE Automation content applies directly here: automate actions that are well-understood, safe, and reversible (forcing a password reset, revoking sessions — genuinely low-risk even if the alert turns out to be a false positive), and route anything higher-risk or requiring judgment (permanently disabling an account, notifying customers, engaging legal) to a human analyst with context already gathered by the automation. A SOAR playbook that auto-executes an irreversible action on an unconfirmed alert risks causing real harm faster than a human ever would have — the value of SOAR is speed on the safe, mechanical steps, not removing human judgment from consequential decisions.

## Purple team exercises: red and blue working together, deliberately

A traditional red team exercise (offensive team attempts to breach, defensive team responds, results compared afterward) tests detection and response capability, but the adversarial structure means findings often surface only in a post-exercise debrief, well after the actual detection gaps occurred. A purple team exercise runs red and blue teams together, in real time, with immediate feedback:

```
Purple team exercise structure:
1. Red team executes one specific technique (e.g. a specific MITRE
   ATT&CK technique — T1055 process injection)
2. Blue team immediately reports what they detected, in real time
3. If undetected, red and blue jointly investigate WHY —
   was there no relevant log source? A detection rule gap? An alert
   that fired but was missed?
4. Blue team builds/tunes a detection rule for that specific gap,
   immediately
5. Red team re-runs the same technique to confirm the new
   detection actually works
```
This structure closes detection gaps immediately and specifically, rather than producing a general "we should improve detection" finding in a report reviewed weeks later — the real-time, collaborative format is what makes purple teaming a genuinely faster feedback loop for improving actual detection coverage than a traditional adversarial red-team engagement, at the cost of testing team readiness/response process under a more realistic adversarial pressure, which a traditional red team exercise more faithfully simulates.

## IR metrics that actually drive improvement, versus vanity numbers

```
MTTD (Mean Time to Detect) — from compromise to detection
MTTR (Mean Time to Respond/Recover) — from detection to full recovery
Dwell time — how long an attacker had undetected access (closely related to MTTD)
```
These metrics only drive real improvement when tracked per-incident-type and reviewed for trend, not as one blended organization-wide average that obscures what's actually happening — a blended MTTD that looks acceptable can hide a genuinely severe gap in detecting one specific attack pattern (say, insider threats, which are notoriously harder to detect than external network intrusions) being masked by strong detection of a different, more common pattern. The actionable version of this metric work: track MTTD/MTTR separately by incident type and by detection source (which alert/tool actually caught it), and specifically investigate outliers — an incident with a dwell time far longer than the organization's typical average is exactly the case worth a deep root-cause review, more so than the incidents that resolved quickly and unremarkably.

## Cross-jurisdictional regulatory complexity in a real breach

A data breach affecting individuals across multiple jurisdictions triggers genuinely different, sometimes conflicting notification obligations simultaneously — this is real legal complexity that IR planning needs to account for structurally, not discover mid-incident:

```
GDPR (EU)         — 72 hours to notify the relevant supervisory authority
HIPAA (US health) — 60 days to notify affected individuals
India's DPDP Act   — notification timelines and specifics still evolving;
                     Data Protection Board oversight
State-level US laws — vary significantly by state, some stricter than
                      federal requirements
```
The practical implication: an organization operating across multiple jurisdictions needs its IR runbook and legal escalation path to already have pre-identified which regulations could apply *before* an incident occurs — determining this for the first time during an active breach, under the pressure of GDPR's genuinely tight 72-hour window, is a real, avoidable source of delay and risk. This is exactly why the Preparation phase (Overview tab) explicitly includes legal as a defined IR team role from the start — legal counsel needs to be looped in early enough in an actual incident to make jurisdiction-specific notification-timeline decisions correctly, not brought in only once notification is already overdue.

## Post-incident review: extracting the maximum value from a bad situation

A post-incident report that only documents what happened, without driving concrete change, wastes the one genuine silver lining of an incident — the specific, hard-won knowledge of exactly where detection or response fell short. A blameless post-incident review (the same underlying principle as blameless postmortems covered elsewhere in this platform's SRE content) focused specifically on system and process gaps, not individual blame, produces the kind of honest, complete account that a review culture focused on assigning fault reliably suppresses — people are far more forthcoming about what they missed or didn't know when the review's explicit purpose is fixing the gap, not identifying who to blame for it. The concrete output that actually matters: specific, owned, dated action items (not vague "improve monitoring" bullet points) tracked to completion — a lessons-learned document that's written, filed, and never revisited again is a wasted opportunity that the next, similar incident will simply repeat.
