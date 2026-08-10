# SOC & SIEM — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, de-duplicated, and corrected where source files disagreed or were out of date (each correction noted inline).

---

## Core Concepts

```
SOC: Team + process + technology monitoring/detecting/responding 24/7

Tiers:
  L1 (Triage):      monitor SIEM queue, initial triage (TP or FP?), escalate
  L2 (Investigate):  deep dive, correlate across sources, determine scope
  L3 (Hunt/IR):      major incidents, forensics, threat hunting, build new rules

SIEM: collects logs from every source, normalizes, correlates, alerts
  Log sources: network (firewall/IDS/VPN), endpoint (EDR/event logs),
               cloud (CloudTrail/Azure Activity/GCP Audit), identity (AD/Okta)

SIEM vs EDR (not interchangeable — see this course's FAQ for the full distinction):
  SIEM: cross-source correlation, long-term retention, compliance reporting
  EDR:  deep single-endpoint telemetry + direct response action on that host
  → EDR telemetry is typically ONE of the sources feeding a SIEM
```

## Metrics — CORRECTED (source files disagreed; presenting as an honest range, not a single invented number)

```
MTTD (Mean Time to Detect): sources in this course ranged from "<1hr critical/
  <24h high" to "<24h" flat — there is no single universal target; use it as
  a range depending on severity tier, not one fixed number.

MTTR (Mean Time to Respond): target <4hr for critical is the most consistent
  figure across sources.

False Positive Rate: sources ranged from <20% to <30% — 20-30% is a
  reasonable real-world benchmark band, not a hard target; a well-tuned SOC
  aims for the low end, but even 30%+ is common without active tuning effort.

Alert volume: <100 alerts/analyst/day cited as manageable — this is the
  number worth protecting, since sustained volume above it is a direct
  driver of the "close it fast without full investigation" failure mode
  covered in this course's Real World Scenarios file.

Dwell time — CORRECTED: this course's own files cited both "21 days" and
  "200+ days industry average," neither of which matches current data.
  Per Mandiant's M-Trends 2026 report (2025 investigation data, the most
  current available industry benchmark): GLOBAL MEDIAN DWELL TIME IS 14
  DAYS (up from 11 in 2024) — but this masks a real split:
    - Ransomware-related intrusions: median dropped to ~9 days (attackers
      moving FASTER to monetize)
    - Long-term espionage / DPRK IT-worker intrusions: median 122 days
      (some persisting undetected for a year+)
  "Attackers are faster" and "attackers are stealthier" are BOTH true —
  just for different attacker categories with different goals. Don't quote
  a single dwell-time number without specifying which category it's for.
```

## Incident Response Lifecycle (PICERL)

```
1. Preparation:    IR plan, playbooks, tools ready, asset inventory
2. Identification: detect, determine scope, declare incident + severity
3. Containment:    short-term (isolate — do NOT power off, preserves
                    memory evidence) + long-term (patch the actual hole)
4. Eradication:    remove malware/backdoors, reset compromised creds,
                    rebuild if deeply compromised (don't trust "cleaned")
5. Recovery:       restore from verified-good backups, monitor closely
6. Lessons Learned: blameless post-incident review, root cause (5 whys),
                    update playbooks — blameless framing isn't just
                    culture, it's what keeps future reports honest
                    (see this course's FAQ for why)

Severity tiers (consistent across sources):
  P1/Critical: active breach/ransomware/exfil in progress → immediate page
  P2/High:     confirmed intrusion, no active exfil → escalate <1hr
  P3/Medium:   suspicious activity, malware detected → investigate <4hr
  P4/Low:      anomaly, policy violation → next business day
```

## MITRE ATT&CK — CORRECTED tactic IDs

```
This course's own overview.md lists tactics as sequential "T1" through
"T14" — THIS IS WRONG. Real ATT&CK tactic IDs are non-sequential "TA00XX"
codes (verified against attack.mitre.org):

TA0043  Reconnaissance
TA0042  Resource Development
TA0001  Initial Access
TA0002  Execution
TA0003  Persistence
TA0004  Privilege Escalation
TA0005  Defense Evasion
TA0006  Credential Access
TA0007  Discovery
TA0008  Lateral Movement
TA0009  Collection
TA0011  Command and Control   (NOT "T12" — note it's out of numeric order)
TA0010  Exfiltration          (NOT "T13" — also out of numeric order)
TA0040  Impact

Using the wrong ID format makes it harder to actually cross-reference
attack.mitre.org — this isn't just a labeling nitpick.

Common technique IDs (verified, safe to use as-is):
  T1059.001  PowerShell (sub-technique of T1059 Command/Scripting Interpreter)
  T1566      Phishing
  T1078      Valid Accounts
  T1548      Abuse Elevation Control Mechanism (parent of UAC bypass sub-techniques)
  T1003      OS Credential Dumping
  T1486      Data Encrypted for Impact (ransomware)
  T1071      Application Layer Protocol (C2)

D3FEND: MITRE's companion framework mapping DEFENSIVE countermeasures to
ATT&CK techniques. ATT&CK tells you what an attacker is doing; D3FEND is
the piece that tells you what to actually do about it.
```

## Alert Triage — Quick Reference

```
False positive indicators: known admin activity, matches maintenance
  window, behavior matches user's normal role/location
True positive indicators: anomalous time, new/unrecognized location or
  device, matches known TTP, multiple correlated alerts

"True positive" ≠ "confirmed malicious" — a true positive means the rule
correctly matched what it was built to detect; whether that activity is
actually malicious is a separate judgment call (see this course's FAQ).

Impossible travel — check BEFORE confirming malicious: new device
  fingerprint? MFA satisfied (and was the approval itself suspicious —
  push-bombing pattern)? subsequent suspicious activity in-session?
Impossible travel — check BEFORE dismissing as benign: actual travel
  record if available, and VPN/corporate proxy routing (a common boring
  cause of false "impossible travel" alerts)
```

## Threat Hunting

```
Hypothesis-driven, PROACTIVE (vs. reactive alert-reading):
1. Hypothesis: "attacker may be using living-off-the-land technique X"
2. Hunt: query raw telemetry directly for that pattern
3. Investigate findings → escalate if confirmed
4. Build a new detection rule so it auto-fires next time
   (hunting and automated detection reinforce each other over time)

CORRECTED example command — this course's own intermediate.md example
(`ss -tlnp | grep -v -E "(80|443|22|25|53|3306|5432)"`) has a real bug:
`-tlnp` only shows LISTENING sockets, not active outbound connections —
it can't actually catch a process beaconing OUT to a C2 server, which
is the whole point of that hunt. Corrected version:
  ss -tnp | grep -v -E ":(80|443|22|25|53|3306|5432)\s"
(drops the `-l`, so it captures established connections too)
```

## Key Tools

```
SIEM:        Splunk (SPL), Microsoft Sentinel (KQL), IBM QRadar (AQL),
             Elastic SIEM (KQL/Lucene), Google Chronicle (YARA-L)
EDR:         CrowdStrike Falcon, SentinelOne, Microsoft Defender for Endpoint
NDR:         Darktrace, Vectra, Cisco StealthWatch
Threat Intel: MISP, VirusTotal, Shodan, AlienVault OTX
Forensics:   Autopsy (disk), Volatility3 (memory), Wireshark, FTK
SOAR:        Splunk SOAR, Palo Alto XSOAR, Microsoft Sentinel Playbooks
Ticketing:   ServiceNow, Jira, TheHive (open source)
```

## Certifications — CORRECTED (time-sensitive: exam version changed 3 weeks before this note was written)

```
CompTIA CySA+ — this course's own certification.md still references
CS0-003. AS OF JUNE 23, 2026, CompTIA retired CS0-003 and launched
CS0-004 as the current live exam (confirmed on CompTIA's own site).

CURRENT (CS0-004): 85 questions max, 165 min, 750/900 passing (unchanged
  format), 4 domains rebalanced from CS0-003:
    Security Operations:            34% (was 33%)
    Vulnerability Management:       26% (was 30%)
    Incident Response & Management: 24% (was 20% — biggest single shift)
    Reporting & Communication:      16% (was 17%)
  New in CS0-004: explicit AI content (AI use in SOC ops, AI governance,
  AI-specific risks) — CS0-003 had no direct AI coverage at all.
  Voucher price: ~$425 (third-party sources show some variance $370-$439;
  confirm current price directly at CompTIA's store before purchasing).

Other SOC-relevant certs (pricing/format not re-verified this pass —
  confirm before relying on if planning to sit these):
  EC-Council CND, SC-200 (Microsoft Sentinel), BTL1 (24hr practical,
  well-regarded for hands-on proof), IBM Cybersecurity Analyst, GIAC GCIH
```

## Debugging / Investigation Checklist

```
Alert fires → gather context (who/what/when/where) → TP or FP? →
  if TP: escalate, preserve evidence, do NOT investigate further without
  authorization on your own if it's beyond your tier
  if FP: document why, close, tune the rule

Phishing investigation: headers → originating IP reputation → did
  anyone click/download? → hash attachments, check VirusTotal → if
  clicked: check for submitted creds (proxy logs), check EDR telemetry
  → scope lateral spread → contain (isolate, block, reset passwords)
```
