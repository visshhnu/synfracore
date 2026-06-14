# SIEM — Fundamentals

## What is SIEM?

SIEM (Security Information and Event Management) is a platform that:
- **Collects** logs from across your environment (servers, firewalls, cloud, apps)
- **Correlates** events to detect attack patterns no single log would reveal
- **Alerts** security teams to suspicious activity in near-real-time
- **Stores** logs for compliance (often 1-7 years)
- **Investigates** incidents with search and visualization

## Common SIEM Platforms

| Platform | Type | Strength |
|---|---|---|
| Splunk | Commercial | Most powerful search, expensive |
| Elastic SIEM | Open source + commercial | Flexible, integrates with ELK |
| Microsoft Sentinel | Cloud-native (Azure) | Best for Azure/M365 environments |
| IBM QRadar | Commercial | Strong correlation engine |
| LogRhythm | Commercial | Built-in SOAR |

## Core Components

**Log Sources (inputs)**:
- Endpoints: Windows Event Logs, Linux syslog
- Network: Firewall logs, IDS/IPS, DNS, VPN
- Cloud: CloudTrail, Azure Monitor, GCP Audit Logs
- Applications: web server access logs, auth logs

**Log Collection**: Agents (Filebeat, Splunk UF), API polling, syslog receivers

**Indexing**: Raw logs parsed, structured, stored in searchable format

**Correlation Engine**: Rules that match patterns across multiple log sources

**Alerting**: Trigger when rules match, send to Slack/email/PagerDuty/ticketing

## Basic Splunk Search

```splunk
# Search last 24 hours
index=windows EventCode=4625
| stats count by src_ip, user
| where count > 10
| sort -count
```

## Log Formats to Know

**Common Log Format (Apache/Nginx)**:
`127.0.0.1 - frank [10/Oct/2000:13:55:36] "GET /apache_pb.gif HTTP/1.0" 200 2326`

**Windows Event Log key codes**:
- 4624: Successful login
- 4625: Failed login  
- 4648: Login with explicit credentials
- 4720: User account created
- 4732: User added to privileged group

**Syslog severity**: 0=Emergency, 1=Alert, 2=Critical, 3=Error, 4=Warning, 5=Notice, 6=Info, 7=Debug
