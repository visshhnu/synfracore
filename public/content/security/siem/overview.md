# SIEM — Security Information and Event Management

SIEM is the central nervous system of a Security Operations Center (SOC). It collects logs from every system in your infrastructure, correlates events across sources, detects threats, and enables incident response. Every enterprise security team runs a SIEM.

## What SIEM Does

```
Log Sources → SIEM → Correlation Engine → Alerts → SOC Analyst

Log sources:
  Firewalls, IDS/IPS, endpoints (EDR), servers, cloud (CloudTrail, Azure Monitor),
  Active Directory / LDAP, applications, email gateways, network devices

SIEM functions:
  Collection:    Ingests logs from all sources
  Normalization: Converts different log formats into common schema
  Correlation:   Matches events across sources to detect attack patterns
  Alerting:      Generates alerts when correlation rules trigger
  Investigation: Analyst can search, pivot, timeline across all events
  Compliance:    Stores logs for audit requirements (PCI DSS, HIPAA, ISO 27001)
  Reporting:     Dashboards, scheduled reports for management
```

## Major SIEM Platforms

```
Splunk Enterprise Security:
  Industry leader, most deployed in enterprises
  Powerful SPL (Search Processing Language)
  App ecosystem, extensive integrations
  On-premise and cloud (Splunk Cloud)
  Cost: Expensive (per GB ingested pricing)

IBM QRadar:
  Strong network flow analysis (QFlow)
  Good at insider threat detection
  Common in financial services, healthcare
  
Microsoft Sentinel (Azure):
  Cloud-native, SIEM + SOAR combined
  Deep integration with Microsoft 365, Azure AD
  Pay per GB, scales elastically
  KQL (Kusto Query Language)

Elastic SIEM (on ELK Stack):
  Open-source base, free tier available
  Excellent scalability
  EQL (Event Query Language)

Chronicle (Google):
  Petabyte-scale, flat pricing
  Threat intelligence built-in

Wazuh:
  Open-source, free, widely used
  Good for smaller organisations, compliance
```

## Splunk — Deep Dive

### Core Concepts
```
Index: Where data is stored (like a database table)
  _internal: Splunk's own logs
  main: Default index
  Custom: security, network, windows, linux (best practice)

Sourcetype: What kind of data (determines parsing)
  access_combined, syslog, WinEventLog:Security

Source: Where data came from (filename, host:port)

Host: Machine that generated the log

Time: @timestamp — everything in Splunk is time-series
```

### SPL — Splunk Processing Language
```
Basic search syntax:
  index=security sourcetype=WinEventLog:Security EventCode=4625
  (Search Windows failed logons)
  
  index=firewall action=blocked | stats count by src_ip
  (Count blocked connections by source IP)

Core commands:
  search:  index=web status=404 | head 20
  stats:   | stats count, avg(bytes) by host
  timechart: | timechart span=1h count by action
  table:   | table _time, src_ip, dest_ip, action
  sort:    | sort -count (descending by count)
  top:     | top 10 src_ip (most frequent values)
  rare:    | rare dest_port (least frequent — anomaly detection)
  rex:     | rex field=_raw "Failed login for (?<username>\w+)"
  eval:    | eval MB=bytes/1024/1024
  where:   | where count > 100
  dedup:   | dedup src_ip
  join:    | join src_ip [search index=threat_intel]
  lookup:  | lookup geoip src_ip OUTPUT country, city

Threat hunting SPL examples:
  
  // Brute force detection
  index=security EventCode=4625
  | stats count by src_ip, user
  | where count > 10
  | sort -count
  
  // Privileged account usage
  index=security EventCode=4672
  | stats count by user, ComputerName
  | where user!="SYSTEM"
  
  // Large data exfiltration
  index=proxy
  | stats sum(bytes_out) as total_bytes by src_ip, domain
  | where total_bytes > 1073741824
  | eval GB=round(total_bytes/1073741824, 2)
  | sort -GB
  
  // PowerShell execution
  index=endpoint EventCode=4103 OR EventCode=4104
  | search ScriptBlockText="*Invoke-*" OR ScriptBlockText="*EncodedCommand*"
  | table _time, ComputerName, User, ScriptBlockText
```

## Microsoft Sentinel

### Architecture
```
Workspace → Connectors → Analytic Rules → Incidents → SOAR Playbooks

Connectors bring in data:
  Microsoft: Azure AD, M365 Defender, Azure Activity, Defender for Cloud
  Third-party: Check Point, Cisco, Fortinet, Palo Alto
  Custom: Log Analytics Agent (Windows/Linux), Syslog, CEF

Data types:
  SigninLogs: Azure AD authentication
  AuditLogs: Azure AD admin actions
  SecurityEvent: Windows Security events
  Syslog: Linux systems
  AzureActivity: Azure resource operations
  OfficeActivity: M365 activity
```

### KQL — Kusto Query Language
```
// Syntax very similar to SQL but pipeline-based

// Failed logins in last 24 hours
SigninLogs
| where TimeGenerated > ago(24h)
| where ResultType != "0"
| summarize FailureCount=count() by UserPrincipalName, IPAddress
| where FailureCount > 10
| order by FailureCount desc

// Impossible travel detection
SigninLogs
| where TimeGenerated > ago(1d) and ResultType == "0"
| summarize Locations=make_set(Location), 
            Countries=make_set(LocationDetails.countryOrRegion)
            by UserPrincipalName
| where array_length(Countries) > 1

// Privileged role assignments
AuditLogs
| where OperationName == "Add member to role"
| extend Role = tostring(TargetResources[0].displayName)
| where Role contains "admin" or Role contains "Global"
| project TimeGenerated, InitiatedBy, TargetUser=tostring(TargetResources[1].userPrincipalName), Role

// Anomalous Azure resource creation (potential crypto mining)
AzureActivity
| where OperationNameValue contains "virtualMachines/write"
| where ActivityStatus == "Success"
| summarize VMs=count() by Caller, bin(TimeGenerated, 1h)
| where VMs > 5
```

## Correlation Rules and Detection Logic

### MITRE ATT&CK Framework
```
SIEM rules are mapped to MITRE ATT&CK tactics:

T1078 Valid Accounts: Detect logons from unusual locations/times
T1110 Brute Force: High-frequency failed authentications
T1021 Remote Services: RDP/SSH from external IPs
T1003 OS Credential Dumping: LSASS access, mimikatz patterns
T1486 Data Encrypted for Impact: Ransomware file extension changes
T1071 Application Layer Protocol: DNS tunnelling, unusual HTTP
T1041 Exfiltration over C2 Channel: Beaconing traffic patterns

Good rule = Low False Positives + High True Positive rate
"Alert fatigue" kills SOC effectiveness — too many false positives
mean analysts ignore alerts
```

### Writing Effective Detection Rules
```
Rule anatomy:
  Trigger condition: What events to look for
  Threshold: How many/how fast triggers the alert
  Enrichment: Add context (user, asset criticality, threat intel)
  Suppression: Exclude known-good (maintenance windows, pentest)

Example: Lateral Movement Detection
  Trigger: Authentication from one internal host to many other hosts
  Threshold: >10 unique destinations in 1 hour
  Enrichment: Is source host a jump server? (known good)
  Suppression: Exclude IT admin accounts, patch management servers
  Alert priority: High if source = normal workstation

Rule tuning process:
  Week 1: Alert fires 100 times (mostly noise)
  Week 2: Analyze what's triggering, add exclusions
  Week 3: Alert fires 10 times (80% are real threats)
  Goal: Every alert is actionable
```

## Log Sources — What Each One Tells You

```
Windows Security Events (critical ones):
  4624: Successful logon — WHO logged into WHAT, HOW (local/network/RDP)
  4625: Failed logon — brute force detection
  4648: Logon with explicit credentials — lateral movement indicator
  4672: Special privileges assigned — admin/service account use
  4688: Process creation — new process and parent (malware execution)
  4698: Scheduled task created — persistence mechanism
  4720: User account created — unauthorized account creation
  4732: Member added to security-enabled local group (Administrators group)
  7045: New service installed — persistence, rootkit indicator
  
Linux/Syslog:
  /var/log/auth.log: SSH attempts, sudo usage, su commands
  /var/log/syslog: System events
  auditd: Detailed syscall auditing (file access, network, process)
  
Firewall:
  Blocked connections: What's trying to reach out?
  Allowed connections to suspicious IPs: Threat intel matches
  Traffic volume: Data exfiltration detection
  
DNS:
  Query frequency: DNS tunnelling (high query rate to same domain)
  NX domain queries: Malware trying to reach C2, DGA domains
  New domains: First-seen domains in last 24h
  
Proxy/Web:
  User agent analysis: Malicious tools have distinctive user agents
  Category violations: Users accessing blocked categories
  POST to unusual destinations: Data exfiltration
```

## SOC Workflow with SIEM

```
L1 Analyst: Alert Triage
  1. Receive alert from SIEM
  2. Initial investigation: True positive or false positive?
  3. Gather context: Timeline, impacted systems, user info
  4. If true positive: Escalate to L2 with initial findings
  5. If false positive: Close and tune rule to prevent recurrence

L2 Analyst: Incident Response
  1. Receive escalation from L1
  2. Deep investigation: Full attack timeline, blast radius
  3. Contain threat: Isolate systems, reset credentials
  4. Evidence collection: Export logs, preserve forensics
  5. Eradication: Remove malware, close attack vector
  6. Recovery: Restore systems, verify clean state
  7. Documentation: Incident report, lessons learned

Metrics SOC tracks:
  MTTD: Mean Time to Detect (lower is better)
  MTTR: Mean Time to Respond
  Alert volume and false positive rate
  Incidents per week by severity
```

## Interview Questions

**What is the difference between SIEM and SOAR?**
SIEM collects and correlates logs to detect threats and generate alerts — it is a detection and investigation platform. SOAR (Security Orchestration, Automation and Response) automates the response to those alerts — it can automatically block IPs, isolate hosts, create tickets, and notify teams based on playbooks. They are complementary: SIEM detects, SOAR responds. Microsoft Sentinel combines both; Splunk SIEM is often paired with Splunk SOAR (formerly Phantom).

**How do you reduce alert fatigue in a SIEM?**
Alert fatigue happens when too many alerts are generated, most being false positives, causing analysts to ignore or dismiss alerts habitually. Fix it by: tuning rules to exclude known-good activity, increasing thresholds, using risk-based alerting (score events, alert on score rather than individual events), suppressing alerts during maintenance windows, and creating tiered severity levels so only high-severity alerts demand immediate attention. The goal is every alert being actionable.
