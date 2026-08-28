# Incident Response — Overview

**Before you start:** the concepts in [SOC](/academies/security/soc/overview) (how alerts get triaged and escalated) are assumed — incident response is what happens after an alert is confirmed as a real incident.

## What is Incident Response?

Incident Response (IR) is the organized approach to addressing and managing the aftermath of a security breach or cyberattack. The goal is to handle the situation in a way that limits damage and reduces recovery time and costs.

## Why This Exists (The Hook)

The moment a breach is confirmed is the worst possible moment to start figuring out who does what — should this host be unplugged or left running to preserve evidence? Who has authority to notify customers? Which backup is actually clean? Under real pressure, with the CEO asking for updates every ten minutes, an undocumented, improvised response reliably makes things worse — reconnecting a "cleaned" system too early, destroying the forensic evidence that would have shown how the attacker got in, or notifying regulators late enough to trigger additional penalties. Incident response exists as a rehearsed, written-down process precisely so none of those decisions get made for the first time during an actual crisis.

**Analogy** — Think of an IR plan like an aircraft's emergency checklist, not a first-timer's improvisation. Pilots don't figure out engine-failure procedures in the moment — they've drilled a specific checklist so often that, under real stress, they execute it almost automatically, in the right order, without missing a step. An IR runbook is that same checklist for a ransomware outbreak or a data breach: written and rehearsed long before the real incident, so the team executes it rather than debates it while the damage is still spreading.

**Try it (2 minutes)** — Reason through why "Preserve evidence" comes explicitly BEFORE containment actions in the Identification phase, without looking anything up: if a compromised server is immediately rebooted or wiped to "clean it up" before anyone captures a memory dump or disk image, what forensic evidence about how the attacker got in, what they touched, and whether they're still present elsewhere is permanently lost — and why would that matter even after the immediate threat is contained?

## NIST IR Framework — 4 Phases

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Preparation", "sublabel": "Team, runbooks, logging, tabletop exercises", "color": "blue" },
    { "label": "Identification", "sublabel": "Detect, classify severity, preserve evidence", "color": "purple" },
    { "label": "Containment/Eradication/Recovery", "sublabel": "Isolate, remove threat, restore clean state", "color": "red" },
    { "label": "Post-Incident", "sublabel": "Report, lessons learned -- loops back to Preparation", "color": "green" }
  ]
}
```

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

```conceptgrid
{
  "boxes": [
    { "title": "P1 Critical", "description": "Active breach, data exfiltration, ransomware -- 15 minute SLA", "color": "red" },
    { "title": "P2 High", "description": "Suspicious activity, potential compromise -- 1 hour SLA", "color": "amber" },
    { "title": "P3 Medium", "description": "Policy violation, failed attack attempt -- 4 hour SLA", "color": "purple" },
    { "title": "P4 Low", "description": "Informational, no active threat -- 24 hour SLA", "color": "slate" }
  ]
}
```

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
