# Incident Response — Overview

## What is Incident Response?

Incident Response (IR) is the organized approach to addressing and managing the aftermath of a security breach or cyberattack. The goal is to handle the situation in a way that limits damage and reduces recovery time and costs.

---

## NIST IR Framework — 4 Phases

```
Preparation → Identification → Containment/Eradication/Recovery → Post-Incident
     ↑                                                                    ↓
     └────────────────────────────────────────────────────────────────────┘
                        (Lessons Learned loop back to Preparation)
```

### Phase 1: Preparation
- Build and train the IR team (roles: IR Lead, Forensics, Communications, Legal)
- Create runbooks for common incident types (ransomware, data breach, DDoS, insider threat)
- Deploy logging infrastructure (SIEM, EDR, SOAR)
- Establish communication templates and escalation matrix
- Practice with tabletop exercises (quarterly)

### Phase 2: Identification (Detection & Analysis)
- Detect via: SIEM alerts, IDS/IPS, EDR, user reports, threat intel feeds
- Classify severity:

| Severity | Definition | Response SLA |
|---------|-----------|-------------|
| P1 Critical | Active breach, data exfiltration, ransomware | 15 minutes |
| P2 High | Suspicious activity, potential compromise | 1 hour |
| P3 Medium | Policy violation, failed attack attempt | 4 hours |
| P4 Low | Informational, no active threat | 24 hours |

- Document: What happened? What systems affected? What data at risk?
- Preserve evidence: Disk images, memory dumps, log exports BEFORE containment

### Phase 3: Containment
**Short-term** (stop the bleeding):
```bash
# Isolate compromised host immediately
aws ec2 modify-instance-attribute --instance-id i-xxx --groups sg-isolated-only
# OR in Azure
az network nic update --resource-group RG --name NIC --network-security-group isolated-nsg
# Block IP at firewall
iptables -A INPUT -s <attacker-ip> -j DROP
```

**Long-term** (stable state while investigating):
- Move to isolated network segment
- Reset all credentials for affected accounts
- Revoke active sessions (OAuth tokens, API keys)

### Phase 4: Eradication
- Remove malware: Run EDR full scan, compare file hashes to known-good baseline
- Patch the vulnerability that was exploited
- Remove unauthorized accounts / persistence mechanisms
- Confirm attacker has no remaining access

### Phase 5: Recovery
- Restore from clean backup (verify backup integrity FIRST)
- Rebuild systems from known-good images where possible
- Gradual return to production with enhanced monitoring
- Monitor for signs of re-infection for 30+ days

### Phase 6: Post-Incident Activity
- Write incident report (timeline, impact, root cause, lessons learned)
- Update runbooks based on gaps found
- Brief leadership and legal (especially if data breach notification required)
- Track improvement actions with owners and due dates

---

## Common Incident Types and Playbooks

### Ransomware
1. **Identify**: Which hosts? What files encrypted? Is encryption still running?
2. **Isolate immediately**: Cut network — pull Ethernet, disable WiFi. Do NOT reboot.
3. **Do NOT pay** without legal/executive decision
4. **Assess backups**: Are they infected? Offline backups available?
5. **Notify**: Legal, CISO, leadership, affected customers (if data breach), regulators

### Phishing → Credential Theft
1. Identify affected user accounts from email logs
2. Force password reset for all affected accounts
3. Revoke all active sessions (MFA, OAuth tokens)
4. Check for mail forwarding rules (attacker persistence)
5. Review MFA bypass (attacker may have registered new MFA device)
6. Audit for emails sent by attacker from compromised account

### Data Breach
1. What data? PII, financial, health records, credentials?
2. How much? How many individuals?
3. Was it exfiltrated or just accessible?
4. Legal obligation to notify: GDPR (72 hours), HIPAA (60 days), RBI DPDP Act (India)
5. Preserve all logs and evidence (legal hold)

---

## Tools for Incident Response

| Category | Tool | Purpose |
|---------|------|---------|
| SIEM | Splunk, Azure Sentinel, Elastic SIEM | Log aggregation, alert correlation |
| EDR | CrowdStrike, SentinelOne, Microsoft Defender | Endpoint detection + response |
| SOAR | Splunk SOAR, Palo Alto XSOAR | Automated playbook execution |
| Forensics | Volatility (memory), Autopsy (disk), Wireshark (network) | Digital forensics |
| Threat Intel | VirusTotal, Shodan, AlienVault OTX | IoC lookup |
| Communication | PagerDuty, Slack IR channel, Zoom bridge | Team coordination |
