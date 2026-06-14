# SIEM — Advanced

## Threat Hunting with SIEM

Threat hunting is proactive — searching for threats that haven't triggered alerts.

```splunk
# Hunt: find beaconing (C2 communication pattern)
# Beacons communicate at regular intervals
index=proxy
| bin span=1m _time
| stats count by src_ip, dest_domain, _time
| stats stdev(count) as variance, avg(count) as avg_requests, count as intervals by src_ip, dest_domain
| where intervals > 50 AND variance < 2
| sort +variance

# Hunt: detect DGA (Domain Generation Algorithm) C2 domains
index=dns
| eval domain_length = len(query)
| eval has_hyphens = if(match(query, "-"), 1, 0)
| eval consonant_ratio = ... 
| where domain_length > 12 AND consonant_ratio > 0.7

# Hunt: process injection (malware technique)
index=windows EventCode=8  # CreateRemoteThread
| where NOT process IN ("svchost.exe", "csrss.exe")  # Normal injectors
| stats count by src_process, target_process, host
```

## MITRE ATT&CK-Based Detection Coverage

Map your detections to MITRE ATT&CK framework:

```
Detection Coverage Matrix:
Tactic              | Technique            | Detection Status
--------------------|----------------------|-----------------
Initial Access      | Phishing (T1566)     | COVERED - email gateway logs
Execution           | PowerShell (T1059.001) | COVERED - EDR + Sysmon
Persistence         | Scheduled Task (T1053)| PARTIAL - Windows event only
Privilege Escalation| UAC Bypass (T1548)   | NOT COVERED
Defense Evasion     | Log Clearing (T1070) | COVERED - EventCode 1102
Credential Access   | Kerberoasting (T1558)| COVERED - 4769 anomaly
Lateral Movement    | Pass-the-Hash (T1550)| COVERED - anomalous NTLM
C&C                 | DNS Tunneling (T1071.004)| PARTIAL - DNS logs only
```

## Sentinel Detection Rules (KQL)

```kql
// Microsoft Sentinel - KQL based
// Detect impossible travel (login from distant locations)
let timeframe = 1h;
SigninLogs
| where TimeGenerated > ago(1d)
| project TimeGenerated, UserPrincipalName, IPAddress, Location
| join kind=inner (
    SigninLogs
    | where TimeGenerated > ago(1d)
    | project TimeGenerated2=TimeGenerated, UserPrincipalName, IPAddress2=IPAddress, Location2=Location
) on UserPrincipalName
| where IPAddress != IPAddress2
| where abs(datetime_diff('minute', TimeGenerated, TimeGenerated2)) < 60
| where Location != Location2
| project User=UserPrincipalName, Location1=Location, Location2, TimeDiff=abs(datetime_diff('minute', TimeGenerated, TimeGenerated2))
```
