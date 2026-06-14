# SIEM — Intermediate

## Detection Rule Writing

Good detection rules balance: precision (few false positives) + recall (catch real threats).

```splunk
# Brute force: >10 failed logins from same IP in 5 min
index=auth action=failed
| bucket span=5m _time
| stats count by src_ip, _time
| where count > 10
| eval severity="HIGH"
| table _time, src_ip, count, severity

# Lateral movement: same user logging into many machines
index=windows EventCode=4624
| bucket span=1h _time
| stats dc(dest_host) as hosts_accessed by user, _time
| where hosts_accessed > 5

# Data exfiltration: large response sizes
index=proxy
| eval mb = bytes_out / 1048576
| where mb > 100
| stats sum(mb) as total_gb, dc(dest_domain) as domains by src_ip
| sort -total_gb
```

## Log Enrichment

Raw logs become more useful when enriched with context:

```splunk
# Enrich IP with geolocation
index=auth
| iplocation src_ip
| table src_ip, City, Country, lat, lon, action

# Enrich with threat intelligence
| lookup threat_intel_lookup ip AS src_ip OUTPUT threat_category, confidence_score
| where threat_category != ""

# Enrich with asset database
| lookup asset_db ip AS src_ip OUTPUT hostname, owner, criticality
```

## Alert Tuning

Alert tuning reduces false positives without missing real threats:

1. **Whitelisting**: Exclude known-good IPs, users, processes
2. **Threshold tuning**: Adjust count thresholds based on observed baseline
3. **Time windows**: Alerts only during business hours or off-hours
4. **Correlation**: Require multiple signals (not just one)

```splunk
# Tuned brute force: exclude service accounts and monitoring IPs
index=auth action=failed
| where NOT user IN ("svc_monitor", "backup_agent")
| where NOT src_ip IN ("10.0.0.50", "10.0.0.51")
| stats count by src_ip, user, span=5m
| where count > 20
```

## SOAR Integration

SOAR (Security Orchestration, Automation, Response) automates repetitive tasks:

- Alert received in SIEM
- SOAR enriches: lookup IP reputation, get user details from AD
- If confidence high: auto-block IP on firewall
- Create ticket in Jira with all context
- Page on-call if P1
- All in seconds, without human intervention
