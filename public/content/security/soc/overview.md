# SOC & SIEM — Security Operations

**Before you start:** basic networking and general IT-operations familiarity is assumed. No prior security-operations experience is required — this page's companion technology, SIEM, goes deeper on the platform itself.

A Security Operations Center (SOC) is the team and technology responsible for monitoring, detecting, analyzing, and responding to cybersecurity threats in real time. SIEM (Security Information and Event Management) is the core platform SOC analysts use to do their work.

## Why This Exists (The Hook)

An attacker doesn't announce themselves — a compromised account looks like a normal login, a data exfiltration attempt looks like normal network traffic, until someone is actively watching for the pattern that gives it away. A SOC exists because "we'll notice if something's wrong" isn't a real strategy at any meaningful scale — someone has to be continuously watching millions of log events, most of which are completely normal, to find the handful that indicate an actual attack in progress.

**Analogy** — Think of a SOC like an air traffic control tower, not a single security guard. A control tower doesn't watch one plane — it continuously monitors every aircraft in its airspace, using radar (SIEM) to see patterns no single person could track by eye, with different controllers (L1/L2/L3 analysts) handling routine traffic versus a genuine emergency. Most blips on the radar are completely normal; the tower's entire job is reliably telling the rare real emergency apart from routine traffic, fast enough to act on it.

**Try it (2 minutes)** — Reason through why SOC analysts are tiered (L1/L2/L3) instead of one analyst handling everything, without looking anything up: a SOC might see thousands of alerts a day, and the vast majority turn out to be false positives after a few minutes of checking. If your most experienced (and most expensive) analysts spent their whole day triaging routine alerts instead of investigating genuinely serious incidents, what would that do to how quickly a real breach gets a skilled responder's attention?

## What is a SOC?

The SOC is your organization's cyber defense nerve center. It operates 24/7, monitoring everything — network traffic, endpoint activity, cloud infrastructure, application logs — and responding to threats before they cause damage.

```conceptgrid
{
  "boxes": [
    { "title": "Monitor", "description": "Watch all logs, alerts, and network traffic continuously", "color": "blue" },
    { "title": "Detect", "description": "Identify anomalies and potential threats using rules and ML", "color": "purple" },
    { "title": "Analyze", "description": "Triage alerts, distinguish true threats from false positives", "color": "amber" },
    { "title": "Respond", "description": "Contain, eradicate, and recover from incidents", "color": "green" }
  ]
}
```

**SOC Functions:**
- **Monitor** — Watch all logs, alerts, and network traffic continuously
- **Detect** — Identify anomalies and potential threats using rules and ML
- **Analyze** — Triage alerts, distinguish true threats from false positives
- **Respond** — Contain, eradicate, and recover from incidents
- **Hunt** — Proactively search for hidden threats (threat hunting)

## SOC Team Structure

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "L1 Analyst — Triage", "sublabel": "Monitor alerts, initial true/false positive call", "color": "blue" },
    { "label": "L2 Analyst — Investigation", "sublabel": "Deep dive, correlate events, determine scope", "color": "purple" },
    { "label": "L3 Analyst / Incident Responder", "sublabel": "Major incidents, forensics, threat hunting", "color": "red" },
    { "label": "Threat Intel / Security Engineer / SOC Manager", "sublabel": "Rule maintenance, strategy, oversight", "color": "amber" }
  ]
}
```

```
L1 Analyst (Triage)
  ↓ Escalate if needed
L2 Analyst (Investigation)
  ↓ Escalate complex/critical
L3 Analyst / Incident Responder
  ↓
Threat Intelligence Team
Security Engineer (maintain SIEM rules, tools)
SOC Manager
```

**L1 — Triage Analyst:**
- Monitor SIEM dashboard and alerts queue
- Initial triage: is this a true positive or false positive?
- Create incident tickets for confirmed threats
- Escalate to L2 if needed

**L2 — Investigation Analyst:**
- Deep dive into escalated incidents
- Correlate events across multiple sources
- Determine scope and impact
- Contain immediate threats

**L3 — Incident Responder:**
- Handle major incidents and breaches
- Forensic investigation
- Threat hunting — proactive search
- Develop new detection rules from incidents

## SIEM — What It Does

SIEM collects logs from every source in your environment, normalizes them to a common format, correlates events across sources, and generates alerts when suspicious patterns are detected.

```
Log Sources:
├── Network:      Firewalls, IDS/IPS, routers, switches, VPN
├── Endpoints:    Windows Event Logs, Linux syslogs, EDR
├── Cloud:        AWS CloudTrail, Azure Activity Log, GCP Audit
├── Applications: Web servers, databases, auth systems
└── Identity:     Active Directory, Azure AD, Okta

     ↓  All logs ingested
     
SIEM Processing:
1. Collect & normalize (parse into common schema)
2. Correlate (connect related events)
3. Alert (trigger on suspicious patterns)
4. Visualize (dashboards for analysts)
5. Investigate (search, timeline, context)
6. Report (compliance, executive summaries)
```

## Popular SIEM Platforms

```conceptgrid
{
  "boxes": [
    { "title": "Splunk", "description": "Large enterprises, powerful analytics -- SPL query language", "color": "blue" },
    { "title": "Microsoft Sentinel", "description": "Azure/Microsoft shops, cloud-native -- KQL query language", "color": "purple" },
    { "title": "Elastic SIEM", "description": "Open source, flexible -- KQL/Lucene query language", "color": "green" },
    { "title": "IBM QRadar", "description": "Traditional enterprises -- AQL query language", "color": "amber" }
  ]
}
```

| SIEM | Best For | Query Language |
|------|---------|---------------|
| **Splunk** | Large enterprises, powerful analytics | SPL (Splunk Query Language) |
| **Microsoft Sentinel** | Azure/Microsoft shops, cloud-native | KQL (Kusto Query Language) |
| **IBM QRadar** | Traditional enterprises | AQL |
| **Elastic SIEM** | Open source, flexible | KQL/Lucene |
| **Datadog Security** | Cloud-native, already using Datadog | Log query |
| **Google Chronicle** | Google Cloud, massive scale | YARA-L |

## Splunk — Core Queries for SOC

```spl
| index=main sourcetype=access_combined
| stats count by status
| where status>=400
| sort -count

index=windows EventCode=4625
| stats count by Account_Name, Source_Network_Address
| where count > 10
| sort -count

index=network src_ip!=10.0.0.0/8
| eval is_known=if(dest_port IN (80,443,22,53),"known","unusual")
| where is_known="unusual"
| table _time, src_ip, dest_ip, dest_port, bytes

index=cloudtrail eventName=ConsoleLogin
| where errorCode="Failed authentication"
| stats count by userIdentity.userName, sourceIPAddress
| where count > 5

index=main sourcetype=syslog "sudo"
| rex "sudo:\s+(?<user>\w+)\s+:"
| stats count by user, host
| sort -count
```

## Microsoft Sentinel — KQL Queries

```kql
// Failed logins by user and IP
SigninLogs
| where ResultType != 0
| where TimeGenerated > ago(1h)
| summarize FailedAttempts = count() by UserPrincipalName, IPAddress
| where FailedAttempts > 10
| order by FailedAttempts desc

// Impossible travel detection
SigninLogs
| where ResultType == 0
| project TimeGenerated, UserPrincipalName, Location, IPAddress
| sort by UserPrincipalName, TimeGenerated asc
| serialize
| extend PrevTime = prev(TimeGenerated), PrevLocation = prev(Location)
| where UserPrincipalName == prev(UserPrincipalName)
| where Location != PrevLocation
| extend TimeDiff = datetime_diff('minute', TimeGenerated, PrevTime)
| where TimeDiff < 60    // Same user in different location within 1 hour

// New admin account created
AuditLogs
| where OperationName == "Add member to role"
| where TargetResources[0].modifiedProperties[0].newValue contains "Global Administrator"
| project TimeGenerated, InitiatedBy.user.userPrincipalName, TargetResources

// Data exfiltration — large outbound transfers
AzureNetworkAnalytics_CL
| where FlowDirection_s == "O"
| where BytesSent_d > 1000000000    // >1GB outbound
| summarize TotalBytes = sum(BytesSent_d) by SrcIP_s, DestIP_s
| order by TotalBytes desc
```

## MITRE ATT&CK Framework

The MITRE ATT&CK framework is a knowledge base of adversary tactics, techniques, and procedures (TTPs). SOC analysts map detected behaviors to ATT&CK to understand what attackers are doing and what comes next.

```
Tactics (the "why" — adversary goal):
T1 — Reconnaissance
T2 — Resource Development
T3 — Initial Access          ← How they got in
T4 — Execution               ← Running malicious code
T5 — Persistence             ← Staying in the environment
T6 — Privilege Escalation    ← Getting more access
T7 — Defense Evasion         ← Hiding from detection
T8 — Credential Access       ← Stealing passwords
T9 — Discovery               ← Learning about environment
T10 — Lateral Movement       ← Moving to other systems
T11 — Collection             ← Gathering target data
T12 — Command & Control (C2) ← Attacker maintaining control
T13 — Exfiltration           ← Stealing the data
T14 — Impact                 ← Ransomware, destruction
```

## Alert Triage Process

```
Alert received in SIEM
        │
   Is it a FP?  ─── Yes ──→ Tune rule, document, close
        │ No
        ▼
  Gather context
  (Who? What? When? Where? How?)
        │
   Is it critical? ─── Yes ──→ Declare Incident, escalate to L2/L3
        │ No                    Page on-call, activate playbook
        ▼
  Investigate:
  - Check IP reputation (VirusTotal, AbuseIPDB)
  - Check user behavior baseline
  - Correlate with other events (30 min window)
  - Check asset criticality
        │
   Confirmed threat? ─── Yes ──→ Contain → Eradicate → Recover
        │ No
        ▼
   Document, close, monitor
```

## Incident Response Playbooks

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "1. Isolate", "sublabel": "Disconnect from network -- do NOT power off (preserve memory)", "color": "red" },
    { "label": "2. Identify Scope", "sublabel": "Affected systems, encrypted data, patient zero", "color": "amber" },
    { "label": "3. Preserve Evidence", "sublabel": "Memory dump, disk image, 7 days of logs", "color": "purple" },
    { "label": "4. Notify", "sublabel": "CISO, Legal, PR within 1 hour; law enforcement/regulators if required", "color": "blue" },
    { "label": "5. Eradicate", "sublabel": "Remove ransomware, check persistence, patch entry vector", "color": "red" },
    { "label": "6. Recover", "sublabel": "Restore from clean backups, verify integrity, monitor 30 days", "color": "green" },
    { "label": "7. Post-Incident", "sublabel": "Report, root cause analysis, tabletop exercise update", "color": "slate" }
  ]
}
```

```
Playbook: Ransomware Detected
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. ISOLATE immediately
   - Disconnect from network (physical or via EDR)
   - Do NOT turn off (preserve memory evidence)

2. IDENTIFY scope
   - Which systems are affected?
   - What data was encrypted?
   - Patient zero — first infected system

3. PRESERVE evidence
   - Memory dump of infected systems
   - Disk image before any remediation
   - Collect logs: 7 days prior

4. NOTIFY
   - CISO, Legal, PR within 1 hour
   - Law enforcement if required
   - Customers/regulators per breach notification laws

5. ERADICATE
   - Identify and remove ransomware
   - Check for persistence mechanisms
   - Patch the vulnerability used for initial access

6. RECOVER
   - Restore from clean backups
   - Verify integrity of restored data
   - Monitor closely for 30 days

7. POST-INCIDENT
   - Full incident report
   - Root cause analysis
   - Security improvements
   - Tabletop exercise update
```

## Key Metrics for SOC

```
MTTD  — Mean Time to Detect        (target: <24 hours)
MTTR  — Mean Time to Respond       (target: <4 hours for critical)
MTTC  — Mean Time to Contain       (target: <1 hour for critical)
FPR   — False Positive Rate        (target: <20% of alerts)
Alert volume per analyst per day   (manageable: <100)
Dwell time — Time attacker in env  (industry avg: 21 days — minimize!)
```

## Interview Questions

**What is the difference between IDS and IPS?**
IDS (Intrusion Detection System) monitors traffic and generates alerts but takes no action — it's passive. IPS (Intrusion Prevention System) sits inline in the traffic path and can actively block or drop malicious traffic. SIEM ingests alerts from both. In cloud environments, AWS GuardDuty acts as an IDS; WAF and Security Groups act as IPS.

**A user reports their account is locked out. How do you investigate?**
Check Active Directory/Azure AD audit logs for lockout events, note source IP and timestamps. Look for password spray patterns — multiple accounts from same IP. Check if IP is on threat intel feeds. Review user's recent logins — is the lockout from an unrecognized location/device? If malicious: reset credentials, check for persistence, review user's recent file access and email activity. If legitimate: unlock account, educate user, enable MFA.
