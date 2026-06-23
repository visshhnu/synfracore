# SOC Analyst Certification Guide

## Top SOC Certifications

| Cert | Provider | Level | Cost | Format |
|------|----------|-------|------|--------|
| **CompTIA CySA+ (CS0-003)** | CompTIA | Intermediate | $392 | MCQ + performance, 165 min |
| **EC-Council CND** | EC-Council | Entry | $350 | MCQ |
| **SC-200 Sentinel Analyst** | Microsoft | Intermediate | $165 | MCQ |
| **BTL1 (Blue Team Labs Level 1)** | Security Blue Team | Intermediate | $520 | 24hr practical |
| **IBM Cybersecurity Analyst** | IBM/Coursera | Entry | ~$300 | Project-based |
| **GIAC GCIH** | SANS | Advanced | $979 | MCQ |

---

## SOC Analyst Core Skills

```
SOC TIERS:
  Tier 1 (Alert Analyst): monitor SIEM alerts, initial triage, escalate
  Tier 2 (Incident Responder): investigate escalated incidents, deep analysis
  Tier 3 (Threat Hunter): proactively hunt for threats, create detection rules

INCIDENT RESPONSE PROCESS:
  1. Preparation:   IR plan, tools, team training
  2. Identification: detect & confirm incident (is this a true positive?)
  3. Containment:   isolate affected systems (short-term + long-term)
  4. Eradication:   remove malware, patch vulnerabilities, reset credentials
  5. Recovery:      restore systems, monitor for recurrence
  6. Lessons Learned: what happened? how to prevent? update playbooks

TRIAGE CHECKLIST for an alert:
  □ Is this a true positive or false positive?
  □ What is the affected asset (host, user, network)?
  □ What is the timeline of events?
  □ Is there lateral movement (other systems affected)?
  □ Is there data exfiltration evidence?
  □ What is the severity (critical/high/medium/low)?

COMMON THREAT INDICATORS:
  Network: unusual outbound connections, beaconing, DNS tunneling
  Host: unusual processes, persistence mechanisms, credential dumping
  User: impossible travel, off-hours login, mass file access
  Email: phishing links, suspicious attachments, spoofed domains
```

---

## Key Tools for SOC Analysts

```bash
# Log Analysis
grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -rn
# Find top failed login IPs

journalctl -u sshd --since "1 hour ago" | grep -E "failed|invalid"

# Windows Event Log (PowerShell)
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 50 | 
  Select TimeCreated, Message | Format-List

# Network Analysis
tcpdump -i eth0 -w capture.pcap                    # Capture traffic
tcpdump -r capture.pcap 'tcp port 443'             # Read capture file
tshark -r capture.pcap -T fields -e ip.dst -e tcp.dstport | sort | uniq -c | sort -rn

# File Analysis
file malware.exe                                    # Identify file type
md5sum malware.exe && sha256sum malware.exe        # Hash for IoC sharing
strings malware.exe | grep -E "http|ftp|\\[A-Z]"  # Extract strings
# Online: VirusTotal, Any.run, Hybrid Analysis

# Memory Analysis (Volatility)
volatility -f memory.dmp imageinfo
volatility -f memory.dmp --profile=Win10x64 pslist   # Running processes
volatility -f memory.dmp --profile=Win10x64 netscan  # Network connections

# Threat Intel
# Search IoCs: VirusTotal, OTX (AlienVault), MISP, Shodan
curl -s "https://otx.alienvault.com/api/v1/indicators/IPv4/1.2.3.4/general"   -H "X-OTX-API-KEY: $OTX_KEY"
```

---

## CompTIA CySA+ Domain Focus

```
Threat Intelligence (10%):
  IoC types: IP, domain, hash, URL, email, TTPs
  MITRE ATT&CK framework — map detections to techniques
  STIX/TAXII for threat intel sharing

Vulnerability Management (22%):
  CVE, CVSS scoring (0-10 scale)
  Vulnerability scanning: Nessus, OpenVAS, Qualys
  Prioritise: CVSS + asset criticality + exploitability

Incident Response (29%):
  Phases, evidence collection, chain of custody
  Digital forensics: acquire (dd/FTK) → analyse → report

Security Architecture (16%):
  Network segmentation, zero trust, defense in depth
  Cloud security controls

Reporting and Communication (23%):
  Technical vs executive reports
  Metrics: MTTD (Mean Time to Detect), MTTR (Mean Time to Respond)
```

## Revision Notes
```
SOC TIERS: Tier1=triage/alert | Tier2=investigate | Tier3=hunt/engineer

IR PHASES (PICERL):
  Preparation → Identification → Containment → Eradication → Recovery → Lessons

TRIAGE QUESTIONS: true positive? affected assets? timeline? lateral movement? exfil?

KEY TOOLS:
  SIEM: Splunk, Sentinel, QRadar — correlation and detection
  EDR: CrowdStrike, Defender, SentinelOne — endpoint telemetry
  Network: Wireshark, Zeek, Suricata — packet/flow analysis
  Forensics: Volatility (memory), Autopsy (disk), FTK

METRICS:
  MTTD: time from compromise to detection (goal: < 24hr)
  MTTR: time from detection to containment/resolution

CySA+: 165 min, MCQ + performance, 750/900 passing
BTL1: 24-hour practical exam — highly respected for hands-on proof
```
