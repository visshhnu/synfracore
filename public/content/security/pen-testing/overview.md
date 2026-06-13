# Penetration Testing — Overview

Penetration testing is the authorized simulation of an attack on a system to find vulnerabilities before attackers do.

## Test Types

| Type | Scope | Tools |
|---|---|---|
| Network | Ports, services, firewall | Nmap, Nessus, Metasploit |
| Web App | OWASP Top 10, APIs | Burp Suite, ZAP, SQLMap |
| Social Engineering | Phishing, physical | GoPhish, SET |
| Cloud | AWS/Azure misconfigs | ScoutSuite, Prowler |
| Red Team | Full adversary simulation | All tools + custom |

## Phases: PTES Methodology

```
1. Reconnaissance  — Passive OSINT (Shodan, LinkedIn, DNS, GitHub)
2. Scanning        — Nmap ports/services, Nessus vulnerabilities
3. Exploitation    — Metasploit, custom exploits, manual testing
4. Post-Exploit    — Privilege escalation, lateral movement, persistence
5. Reporting       — CVSS scores, PoC evidence, remediation steps
```

Always obtain written authorization defining scope before any testing.
