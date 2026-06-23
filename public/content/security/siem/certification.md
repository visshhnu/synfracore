# SIEM Certification Guide

## Top SIEM Certifications

| Cert | SIEM Platform | Level | Cost |
|------|---------------|-------|------|
| **Splunk Core Certified User** | Splunk | Beginner | $130 |
| **Splunk Core Certified Power User** | Splunk | Intermediate | $130 |
| **Splunk Enterprise Certified Admin** | Splunk | Advanced | $130 |
| **IBM QRadar SIEM Analyst** | IBM QRadar | Intermediate | Varies |
| **Microsoft SC-200** | Microsoft Sentinel | Intermediate | $165 |
| **Elastic Security Analyst** | Elastic SIEM | Intermediate | $400 |

---

## Splunk — Core Concepts for Certification

```spl
| BASIC SEARCH |
index=web_logs status=500
index=web_logs status>=400 | stats count by status
index=security sourcetype=syslog "failed login"

| TIME MODIFIERS |
index=web_logs earliest=-24h latest=now
index=web_logs earliest=-7d@d latest=@d

| FIELDS & EVAL |
index=web_logs | fields host, status, bytes
index=web_logs | eval size_mb = bytes/1024/1024
index=web_logs | rename clientip as src_ip

| STATS COMMANDS |
index=web_logs | stats count by status                    | group and count
index=web_logs | stats avg(bytes) as avg_size by host      | average per host
index=web_logs | stats dc(src_ip) as unique_ips            | distinct count
index=web_logs | stats count by status | sort -count       | sort desc

| TIMECHART |
index=web_logs | timechart span=1h count by status         | time-series chart

| REX — extract fields with regex |
index=web_logs | rex "user=(?<username>\w+)"

| TRANSACTION — group related events |
index=web_logs | transaction session_id maxspan=30m

| LOOKUP |
index=web_logs | lookup ip_reputation.csv src_ip OUTPUT risk_score
| where risk_score > 8

| COMMON SECURITY SEARCHES |
index=windows EventCode=4625                               | failed logins
index=windows EventCode=4624 LogonType=3                  | network logons
index=firewall action=blocked | stats count by src_ip | sort -count  | top blocked IPs
index=web NOT status=200 | rare url                        | unusual URLs
```

---

## Microsoft Sentinel (SC-200) Key Concepts

```kusto
// KQL — Kusto Query Language (Sentinel/Defender)
// Failed sign-ins
SigninLogs
| where ResultType != 0
| summarize FailCount = count() by UserPrincipalName, IPAddress
| where FailCount > 10
| order by FailCount desc

// Suspicious process creation
SecurityEvent
| where EventID == 4688
| where CommandLine contains "powershell" and CommandLine contains "-enc"
| project TimeGenerated, Account, CommandLine, Computer

// Data connectors: Office 365, Azure AD, Defender, Syslog, CEF
// Analytics rules: scheduled queries → alerts → incidents
// Workbooks: dashboards using KQL
// Playbooks: Logic Apps for automated response (SOAR)
```

---

## SIEM Core Functions

```
DATA COLLECTION:
  Agents on endpoints | Syslog (UDP 514) for network devices
  API connectors for cloud services | Log forwarders (Beats, Fluentd)

NORMALISATION:
  Map different log formats to common schema
  CIM (Common Information Model) in Splunk
  ASIM (Advanced SIEM Information Model) in Sentinel

CORRELATION:
  Match events across sources to detect attack patterns
  Example: failed logins + privilege escalation + data exfiltration

DETECTION RULES:
  Threshold: >10 failed logins in 5 min from same IP
  Pattern: login at 2am from unusual country
  Anomaly: 10x normal data transfer for this user
  MITRE ATT&CK mapping: tie detections to known TTP codes

INCIDENT RESPONSE WORKFLOW:
  Alert → Triage → Investigation → Containment → Resolution
  SOAR: automate playbooks (block IP, disable user, create ticket)
```

---

## Study Path

```
Beginner → Splunk Core User:
  Free: Splunk training portal (education.splunk.com) — free courses
  Practice: Splunk free trial (500MB/day) | BOTS (Boss of the SOC) CTF

Intermediate → Splunk Power User / SC-200:
  Practice KQL: Microsoft Sentinel free trial
  TryHackMe: SOC Level 1 path (covers Splunk + ELK)
  Blue Team Labs Online: hands-on SIEM scenarios

BOTS (Boss of the SOC): free annual CTF using Splunk, great practice
```

## Revision Notes
```
SPLUNK COMMANDS (must memorise):
  search → stats/timechart/chart → eval/rex/lookup → table/fields/rename
  | stats count by field | timechart span=1h count | rare url | top src_ip

KQL (Sentinel): summarize count() by field | where field == value | project fields
SIEM workflow: collect → normalise → correlate → alert → respond

SC-200 covers: Sentinel + Defender (XDR) + Purview (DLP)
  Data connectors | Analytics rules | Workbooks | Playbooks (SOAR)

MITRE ATT&CK: map your detections to tactics/techniques
  Initial Access → Execution → Persistence → Privilege Escalation
  → Defense Evasion → Credential Access → Discovery → Lateral Movement
  → Collection → Exfiltration → Command & Control
```
