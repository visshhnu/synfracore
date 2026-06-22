# Penetration Testing Interview Questions

## Core Concepts

**Q: What is penetration testing? Types?**

Authorised, simulated attack to find exploitable vulnerabilities before real attackers.

Types: Black box (no info), White box (full info), Grey box (partial). Scope: network, web app, mobile, social engineering, red team (full adversary simulation).

**ALWAYS get written authorisation first** — never test without explicit permission.

---

**Q: Pen testing phases (PTES methodology).**

```
1. Pre-engagement: written auth, scope, rules of engagement, emergency contact
2. Reconnaissance: OSINT — whois, DNS, shodan, theHarvester
3. Scanning: nmap -sV -sC | nikto | gobuster
4. Vulnerability ID: Nessus, nuclei, manual analysis
5. Exploitation: Metasploit, manual exploits (SQLi, SSRF, etc.)
6. Post-exploitation: privilege escalation, lateral movement, demonstrate impact
7. Reporting: exec summary + technical findings + remediation
```

---

**Q: Key tools.**

```bash
nmap -sV -sC -O -p- target.com    # Port scan + version + OS detection
nikto -h https://target.com        # Web vulnerability scanner
gobuster dir -u https://target.com -w wordlist.txt  # Directory enumeration
sqlmap -u "https://target.com/page?id=1"            # SQL injection test
burpsuite                          # Web proxy: intercept, modify, replay
msfconsole                         # Metasploit exploitation framework
```

---

**Q: OWASP Top 10 (2021) — must know.**

1. Broken Access Control (IDOR, privilege escalation)
2. Cryptographic Failures (weak crypto, plaintext sensitive data)
3. Injection (SQLi, command injection, XSS)
4. Insecure Design (missing threat modelling)
5. Security Misconfiguration (default creds, exposed admin)
6. Vulnerable Components (known CVEs in dependencies)
7. Auth Failures (weak passwords, no MFA)
8. Software Integrity Failures (unsigned updates)
9. Logging/Monitoring Failures (no audit logs)
10. SSRF (server-side request forgery)

---

**Q: Report structure.**

1. Executive summary (business risk, not technical)
2. Finding title + CVSS score
3. Affected system(s)
4. Evidence (screenshot showing exploitation)
5. Business impact
6. Remediation recommendation (specific, actionable)

Immediately notify client for: active exploitation evidence, critical data exposure, safety-impacting systems.

## Revision Notes
```
PEN TEST: authorised attack simulation. WRITTEN PERMISSION first.
TYPES: Black(no info) | White(full info) | Grey(partial)

PHASES: Pre-engagement → Recon → Scan → Vuln ID → Exploit → Post-exploit → Report

TOOLS:
nmap(ports) | nikto(web vulns) | gobuster(directories)
Burp Suite(web proxy) | SQLMap(SQLi) | Metasploit(exploitation)

OWASP TOP 10: Access Control | Crypto | Injection | Design | Misconfiguration
Old Components | Auth | Integrity | Logging | SSRF

REPORT: Exec summary + CVSS score + evidence + impact + remediation
Immediate escalation for: active attack evidence, critical data exposure
```
