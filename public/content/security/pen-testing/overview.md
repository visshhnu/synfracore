# Penetration Testing — Overview

## What is Penetration Testing?

Penetration testing (pen testing) is an authorized simulated cyberattack on a computer system to evaluate its security. The goal: find vulnerabilities before real attackers do.

**Key distinction from hacking:** Pen testing is LEGAL and AUTHORIZED. Always get written permission before testing any system. Testing without authorization is illegal under the Computer Fraud and Abuse Act (US), IT Act (India), and similar laws worldwide.

## Types of Pen Tests

**Black Box** — Tester has no prior knowledge (simulates an external attacker)

**White Box** — Tester has full access (source code, architecture diagrams) — most thorough

**Grey Box** — Tester has partial information (e.g., user credentials but no source code)

**External** — Attack from outside the network perimeter

**Internal** — Simulates a compromised insider or breached network

## Methodology: PTES (Penetration Testing Execution Standard)

```
1. Pre-Engagement     → Scope, rules, authorization (get it in writing!)
2. Reconnaissance     → Gather info without touching target (passive)
3. Scanning           → Active probing (may trigger IDS)
4. Exploitation       → Attempt to compromise targets
5. Post-Exploitation  → Maintain access, pivot, escalate
6. Reporting          → Document findings, severity, remediation
7. Remediation verify → Retest after fixes
```

## Essential Tools

| Category | Tools |
|---|---|
| Reconnaissance | nmap, Shodan, theHarvester, Recon-ng |
| Web App Testing | Burp Suite, OWASP ZAP, nikto |
| Exploitation | Metasploit, Cobalt Strike |
| Password | Hashcat, John the Ripper, Hydra |
| Wireless | Aircrack-ng, Kismet |
| Reporting | Dradis, Faraday, plain Markdown |

## OWASP Top 10 (Web Applications)
The most critical web security risks every pen tester must know:
1. Broken Access Control
2. Cryptographic Failures
3. Injection (SQL, NoSQL, Command)
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable and Outdated Components
7. Identification and Authentication Failures
8. Software and Data Integrity Failures
9. Security Logging and Monitoring Failures
10. Server-Side Request Forgery (SSRF)

## Legal Resources
- **OWASP** — owasp.org (free security standards)
- **CEH** — Certified Ethical Hacker certification
- **OSCP** — Offensive Security Certified Professional (hands-on)
- **HackTheBox / TryHackMe** — legal practice labs
