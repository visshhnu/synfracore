# Incident Response — Fundamentals

## Chain of custody: why evidence handling has rules, not just intuition

Any evidence collected during an incident — a disk image, a memory dump, a log export — needs a documented chain of custody: who collected it, exactly when, how, and every person who has touched it since. This isn't bureaucratic overhead; it's what determines whether that evidence is usable in a legal proceeding or regulatory investigation later:

```
Evidence log entry — minimum required fields:
  - Item description (e.g. "Memory dump, host WEB-03")
  - Collected by (name), date/time (with timezone)
  - Collection method (tool + version, e.g. "Volatility 3, live acquisition")
  - Storage location + hash (SHA-256) at time of collection
  - Every subsequent access: who, when, why
```
A memory dump collected without documentation might be entirely legitimate and correctly analyzed — but without a chain of custody, its integrity can be challenged later, and "we believe this is accurate" is a much weaker position than a documented, hash-verified chain proving the evidence hasn't been altered since collection. This matters even for incidents that seem unlikely to end up in litigation at the time — the decision to pursue legal action or notify regulators often comes later, after evidence handling is already complete, and evidence collected without proper chain of custody from the start can't be retroactively fixed.

## Preserving evidence before containment — the order that matters

The Overview tab's Phase 2 explicitly calls out preserving evidence *before* containment — this ordering is deliberate and easy to get backward under pressure:

```bash
# WRONG order under pressure — jump straight to isolating the host
# This can lose volatile evidence (running processes, network connections,
# memory contents) that would have been captured by a live acquisition first

# RIGHT order — capture volatile evidence, THEN contain
volatility3 -f memory.raw windows.pslist    # capture running process list
netstat -ano > network_connections.txt       # capture active connections
# THEN isolate the host from the network
```
Memory is volatile — it's lost the moment a host is powered off or, in some cases, meaningfully altered by actions taken during containment itself (killing a process, disconnecting network, even just running additional commands on the host). The specific reason this order matters: an attacker's malware might exist only in memory (fileless malware, a technique that leaves minimal or no disk artifacts), and containing the host too early — pulling the network cable before capturing memory — can permanently destroy the only evidence that would have revealed exactly what the attacker was doing.

## Severity classification: a shared, unambiguous scale under pressure

```
P1 Critical — Active breach, data exfiltration, ransomware   — 15 min SLA
P2 High     — Suspicious activity, potential compromise      — 1 hour SLA
P3 Medium   — Policy violation, failed attack attempt        — 4 hour SLA
P4 Low      — Informational, no active threat                — 24 hour SLA
```
The real value of a pre-defined severity scale isn't the specific SLA numbers — it's having an agreed-upon, unambiguous classification *before* an actual incident, when there's no time to debate what counts as "critical" while an active breach is unfolding. A team without a pre-agreed scale wastes real, costly time during an actual incident arguing about severity classification instead of responding — the scale needs to be memorized and immediately applicable under pressure, not looked up mid-incident.

## Your first triage: turning an alert into a documented incident

```
Initial triage checklist, on receiving an alert:
1. What triggered this alert? (specific rule/signature, not just "SIEM alert")
2. What system(s) are affected?
3. Is this confirmed malicious, or still unconfirmed/suspicious?
4. What's the potential blast radius if this IS malicious?
5. Assign severity (P1-P4) based on the answers above
6. Document a timeline entry — timestamp, what's known, what's still unknown
```
The habit worth building from the very first alert triaged: start a timestamped timeline immediately, even before the incident's full scope is known — "14:32 — SIEM alert fired for unusual outbound traffic from WEB-03, investigating" is a real, useful timeline entry even though almost nothing is confirmed yet. Reconstructing a timeline after the fact, from memory, once an incident is resolved, is measurably less accurate and complete than one built in real time — and an accurate timeline is what the post-incident report (Phase 6) and any regulatory notification ultimately depend on.

## Building your first incident runbook

A runbook for a specific incident type (ransomware, phishing, data breach — the Overview tab's playbooks are a strong starting template) should be specific enough that someone under real pressure, at 2am, can follow it without having to make judgment calls about what to do next at each step:

```
Runbook structure that actually works under pressure:
1. Trigger conditions — exactly what alert/observation starts this runbook
2. Immediate actions — the first 3-5 concrete steps, in order, with exact commands
3. Escalation criteria — when to page who, with contact info inline (not "see wiki")
4. Evidence preservation steps — specific to this incident type
5. Communication template — who gets notified, with what initial message
```
A runbook that says "isolate the affected system" without the actual command to run, or "notify the right people" without naming exactly who and how, isn't actually usable during a real incident — the value of a runbook is precisely in removing decision-making burden during a high-stress moment, and a vague runbook fails at exactly the moment it's needed most.
