# SOC Operations — Fundamentals

## What is a SOC

```
Security Operations Center: Team + processes + technology that monitors,
detects, analyzes, and responds to security incidents 24/7.

Tiers:
  L1 Analyst: Alert triage, initial investigation, close or escalate
  L2 Analyst: Deep investigation, incident response, threat hunting
  L3 Analyst: Advanced threats, custom detection, threat intelligence
  SOC Manager: Process, metrics, team management
  Threat Hunter: Proactively search for hidden threats

Key metrics:
  MTTD: Mean Time to Detect (from breach to detection)
  MTTR: Mean Time to Respond (from detection to containment)
  False positive rate: % of alerts that aren't real threats
  Alert volume: total alerts per day
  
Industry targets:
  MTTD: < 1 hour for critical, < 24h for high
  MTTR: < 4 hours for critical
  False positive rate: < 30% (most SOCs struggle with this)
```

## Alert Triage Process

```
1. Receive alert from SIEM
2. Gather initial context:
   - What is the alert? (rule name, description)
   - Which asset? (hostname, IP, user, criticality)
   - When? (time, duration)
   - What data? (logs, packet captures)

3. Determine: True Positive or False Positive?

   False positive indicators:
   - Known administrative activity (patching, scans, backups)
   - Matches maintenance window
   - Behavior matches user's role/location
   
   True positive indicators:
   - Anomalous time (3am for a 9-5 employee)
   - Unusual source location (new country, Tor)
   - Behavior matches known attack patterns
   - Multiple correlated alerts

4. If True Positive:
   - Escalate to L2 with your findings
   - Do NOT investigate further without authorization
   - Preserve evidence (don't touch the system)

5. If False Positive:
   - Document why
   - Close the alert
   - Tune the rule to reduce future false positives
```

## Incident Response Lifecycle

```
1. PREPARATION
   - IR plan documented and tested
   - Playbooks for common scenarios (ransomware, phishing, data breach)
   - Tools ready (forensics tools, communication channels, legal contacts)
   - Asset inventory, network diagrams, data classification

2. IDENTIFICATION
   - Detect the incident (alert, user report, threat intel)
   - Determine scope: what's affected?
   - Declare incident, assign severity
   - Notify stakeholders per severity level

3. CONTAINMENT
   Short-term: Stop bleeding — isolate affected systems
     Network isolation: disconnect from network (not shutdown — preserve evidence)
     Account lockout: disable compromised credentials
     Block IOCs: firewall rules to block C2 IPs/domains
   Long-term: prevent reinfection — patch the vulnerability

4. ERADICATION
   Remove malware, backdoors, persistence mechanisms
   Reset all credentials that may be compromised
   Rebuild systems if deeply compromised (don't trust cleaned systems)

5. RECOVERY
   Restore from known-good backups (verify backup integrity)
   Monitor closely for reinfection
   Gradual return to production with enhanced monitoring

6. LESSONS LEARNED
   Post-incident review within 2 weeks
   Root cause analysis (5 whys)
   Update IR plan, playbooks, detection rules
   Share with team (blameless culture)
```

## Common Attack Patterns (Detection Focus)

```
Initial Access:
  Phishing: unusual email attachment → macro execution → PowerShell
  Brute force: many failed logins then success from same IP
  Exposed RDP: login from external IP on 3389

Execution:
  PowerShell: encoded commands, download cradles
  WMI: lateral movement and persistence
  Scheduled tasks: persistence mechanism

Persistence:
  New service created (Event 7045)
  Registry run key modified
  Scheduled task created

Credential Access:
  LSASS memory access (mimikatz)
  Shadow copy deletion (ransomware prep)
  DCSync (domain controller credential dump)

Lateral Movement:
  Pass-the-hash: successful login with NTLM from workstation
  PsExec / WMIExec to other hosts
  RDP lateral movement

Exfiltration:
  Large HTTPS uploads to unknown domains
  DNS tunneling: high query rate to single domain
  Unusual cloud storage uploads (OneDrive, Dropbox)
```

## Key Tools

```
SIEM:           Splunk, Microsoft Sentinel, IBM QRadar, Elastic SIEM
EDR:            CrowdStrike Falcon, SentinelOne, Microsoft Defender
NDR:            Darktrace, Vectra, Cisco StealthWatch
Threat Intel:   MISP, VirusTotal, Shodan, AlienVault OTX
Forensics:      Autopsy, Volatility (memory), Wireshark, FTK
Ticketing:      ServiceNow, Jira, TheHive (open source)
SOAR:           Splunk SOAR, Palo Alto XSOAR, Microsoft Sentinel playbooks
```
