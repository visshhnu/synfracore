# SIEM Interview Questions

## Core Concepts

**Q: What is SIEM?**

SIEM = Security Information and Event Management. Collects security events from across the environment, correlates them to detect attack patterns, and generates alerts.

Problems solved: single pane of glass for security events, detect multi-system attacks (lateral movement), compliance evidence (SOC 2, PCI DSS require log retention), reduce Mean Time to Detect (MTTD).

Popular tools: Splunk, Microsoft Sentinel, IBM QRadar, Elastic SIEM.

---

**Q: SIEM data sources.**

```
Network:   Firewalls, IDS/IPS, switches (syslog, NetFlow)
Identity:  Active Directory / Azure Entra (logins, group changes)
Endpoint:  EDR tools (CrowdStrike, Defender) — processes, file changes
Cloud:     AWS CloudTrail, Azure Activity Log, GCP Audit Logs
Apps:      Web servers, databases (failed logins, errors)
Threat:    Threat intel feeds (malicious IPs, domains, hashes)
```

Log normalisation: different formats → common schema (CEF, ECS, OCSF).

---

**Q: Detection — correlation rules vs ML (UEBA).**

```
Correlation rule: "Brute force"
IF same IP + EventID 4625 (failed login) COUNT > 10 in 5 min
THEN alert "Brute force from $ip"

Rule: "Impossible travel"
IF user login from US at 08:00 AND login from China at 08:45
THEN alert "Impossible travel for $user"
```

UEBA (User Entity Behaviour Analytics): ML baselines normal behaviour, alerts on deviations.
"User X always logs in from UK 9-5 weekdays. Alert: login from Russia at 3am."

---

**Q: SIEM tuning — reducing false positives.**

False positives = alert fatigue = real threats ignored.

Strategies:
- Whitelist known-safe IPs, users, scanners
- Tune thresholds (10 failed logins → increase to 20 if too noisy)
- Time-based suppression (maintenance windows)
- Risk scoring (combine signals, alert only above threshold)
- SOAR automation (auto-close low-confidence alerts)

---

**Q: SOC workflow.**

```
Alert → L1 triage (true/false positive?) → escalate → L2 investigate
→ Contain (isolate systems, block IPs) → Eradicate → Recover → Post-mortem
```

MITRE ATT&CK: maps attack techniques to detection opportunities.

## Revision Notes
```
SIEM: Collect + Correlate + Alert + Investigate
DATA: Firewalls, AD, EDR, Cloud audit logs, Apps, Threat feeds

DETECTION:
Correlation rules: signature-based (brute force, impossible travel)
UEBA: ML baseline + anomaly (unusual hours, new location, unusual outbound)

TUNING: whitelist + thresholds + time suppression + risk scoring
False positives = alert fatigue — tune aggressively

SOC: Alert → Triage → Investigate → Contain → Eradicate → Recover
MITRE ATT&CK: catalogue of attack techniques → detection coverage map
```
