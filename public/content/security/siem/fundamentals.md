# SIEM — Fundamentals

SIEM (Security Information and Event Management) collects logs from every system, correlates events, and alerts the security team when attack patterns are detected.

## What SIEM Does

```
Collect:    Logs from firewall, AD, servers, cloud, endpoints
Normalize:  Convert all formats to common schema
Correlate:  Match patterns across sources (10 failed logins = alert)
Alert:      Notify SOC analysts of suspicious activity
Investigate: Search and timeline reconstruction
Report:     Compliance evidence (SOC2, PCI-DSS, ISO27001)
```

## Major SIEM Platforms

| Platform | Type | Best For |
|---|---|---|
| Splunk | Commercial | Large enterprises, powerful SPL |
| Microsoft Sentinel | Cloud | Azure environments |
| Elastic SIEM | Open source | Cost-conscious, ELK teams |
| Wazuh | Open source | SMBs, endpoint focus |
