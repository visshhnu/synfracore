# SIEM — Advanced + Interview + Cheatsheet

## SOAR Integration

```python
# Automated phishing response
def handle_phishing_alert(alert):
    email_gw.quarantine(alert['message_id'])
    email_gw.block_sender(alert['sender'])
    if alert.get('attachment_hash'):
        if virustotal.check(alert['attachment_hash'])['malicious'] > 3:
            active_directory.disable_account(alert['recipient'])
    return ticketing.create_incident(title=f"Phishing - {alert['sender']}", severity="High")
```

## Interview Questions

```
Q: SIEM vs SOAR?
A: SIEM = detect and alert. SOAR = automate the response.

Q: How to reduce alert fatigue?
A: Tune rules, add allowlists, use risk-based alerting,
   correlation rules, automate obvious false positives.

Q: What is MITRE ATT&CK?
A: Matrix of 14 adversary tactics (Recon to Impact) with
   hundreds of techniques. Map rules to ATT&CK for coverage.

Q: Most critical log sources?
A: Active Directory (logins, group changes), Firewall,
   DNS (all queries), VPN, EDR, Cloud API logs.
```

## Cheatsheet

```
Critical detections:
  Brute force:       >10 failed logins from same IP in 5 min
  Password spray:    Failures to many accounts, one IP
  Privilege escalation: User added to admin group
  Lateral movement:  RDP/SMB to 5+ hosts
  Data exfiltration: Large outbound transfer (>100MB)
  C2 beacon:         Regular small outbound, consistent interval
  Impossible travel: Login from 2 IPs more than 1000km apart in <1h
```
