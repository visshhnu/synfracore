# SOC (Security Operations Centre) Interview Questions

## Core Concepts

**Q: What is a SOC and its key functions?**

SOC = dedicated team monitoring, detecting, investigating, and responding to threats 24/7.

Functions: continuous monitoring, threat detection (SIEM/UEBA), incident response, threat hunting, vulnerability management, compliance reporting.

Tiers: L1 (triage, escalate), L2 (investigate, handle incidents), L3 (threat hunt, advanced IR, rule development).

---

**Q: Key SOC metrics.**

| Metric | Definition | Target |
|---|---|---|
| MTTD | Mean Time to Detect | Minutes to hours |
| MTTR | Mean Time to Respond/Remediate | Hours |
| False positive rate | % of alerts not real threats | < 30% |
| Dwell time | How long before attacker detected | Target < 24h (industry avg: 200+ days) |

---

**Q: Threat hunting.**

Proactive search for threats that bypassed automated detection.

```
1. Hypothesis: "APT may use LOL (living-off-the-land) techniques"
2. Hunt: search SIEM for unusual PowerShell, scheduled tasks, DNS beaconing
3. Query: index=windows EventCode=4688 | where CommandLine contains "EncodedCommand"
4. Investigate findings → escalate if confirmed attack
5. Create detection rule to automate for future
```

---

**Q: Incident severity classification.**

- **P1 Critical**: Active attack, exfiltration, ransomware spreading → 15 min response
- **P2 High**: Confirmed compromise, no active exfiltration → 1 hour
- **P3 Medium**: Suspicious activity, potential compromise → 4 hours
- **P4 Low**: Policy violation, low-risk anomaly → next business day

---

**Q: SOAR — Security Orchestration, Automation and Response.**

Automates repetitive SOC tasks:
```
Trigger: Alert "suspicious IP scanning ports"
Auto: 1) lookup IP in VirusTotal 2) if malicious: block at firewall (API)
      3) search for other hosts that talked to IP
      4) isolate if internal host communicated (EDR API)
      5) create ServiceNow ticket 6) notify Slack
Manual: analyst reviews isolation decision
```

Tools: Splunk SOAR, Palo Alto XSOAR, Microsoft Sentinel Playbooks.

## Revision Notes
```
SOC: 24/7 Monitor + Detect + Investigate + Respond
L1(triage) | L2(investigate) | L3(hunt + advanced IR)

METRICS:
MTTD: time to detect | MTTR: time to remediate
Dwell time: how long before detection (industry avg 200+ days, target <24h)
False positive rate: <30% target

THREAT HUNTING: hypothesis-driven, proactive search
Query SIEM/EDR → investigate → create detection rule

SEVERITY: P1(15min) P2(1hr) P3(4hr) P4(next day)
SOAR: automate IP lookup + block + ticket + notify = reduce MTTR
```
