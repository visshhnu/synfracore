# SIEM — Intermediate

## Splunk SPL Detections

```spl
* Brute force: many failures then success
index=windows EventCode=4625
| stats count as failures by src_ip, user
| where failures > 10
| join src_ip [search index=windows EventCode=4624 | stats count by src_ip]
| table src_ip, user, failures

* Lateral movement: scanning many internal hosts  
index=network dest_port IN (3389, 445, 22)
| stats dc(dest_ip) as targets count by src_ip
| where targets > 5

* DNS tunneling: long queries from one source
index=dns
| eval qlen=len(query)
| stats avg(qlen) as avg_len count by src_ip
| where avg_len > 50 AND count > 100
```

## Elastic SIEM + Filebeat

```yaml
filebeat.modules:
  - module: system
    syslog: {enabled: true}
    auth:   {enabled: true}
  - module: auditd
    log: {enabled: true}
output.elasticsearch:
  hosts: ["elasticsearch:9200"]
# Kibana: Security → Rules → Enable built-in MITRE ATT&CK rules
```
