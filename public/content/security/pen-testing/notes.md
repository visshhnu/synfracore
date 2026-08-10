# Penetration Testing — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview material (its "Revision Notes" section), expanded, and corrected where source content was out of date.

---

## Core Concepts

```
PEN TEST: authorized, simulated attack to find vulnerabilities before real
  attackers do. ALWAYS requires WRITTEN authorization first — testing
  without it is illegal (US: Computer Fraud and Abuse Act; India: IT Act;
  similar laws essentially everywhere).

TYPES:
  Black box:  no prior info  (simulates external attacker)
  White box:  full info/access (source, architecture) — most thorough
  Grey box:   partial info (e.g., credentials but no source)
  External:   attack from outside the perimeter
  Internal:   simulates a compromised insider / breached network

PEN TEST vs VULNERABILITY ASSESSMENT vs RED TEAM (three genuinely
different things, not a difficulty ladder — see this course's FAQ):
  Vuln assessment: catalog potential weaknesses, no exploitation attempt
  Pen test:        exploit within a scope, find as many vulns as possible,
                    typically announced to the defending team in advance
  Red team:        long campaign, specific objective, tests DETECTION AND
                    RESPONSE capability — often unannounced to blue team,
                    since foreknowledge would defeat the point
```

## Methodology (PTES)

```
1. Pre-engagement:    written auth, scope, rules of engagement, EMERGENCY
                       CONTACT (this exists specifically for when something
                       goes wrong or scope becomes ambiguous mid-engagement)
2. Reconnaissance:    passive first (whois, DNS, Shodan, theHarvester —
                      no contact with target)
3. Scanning:          active probing (nmap, nikto — may trigger IDS)
4. Vulnerability ID:  Nessus, nuclei, manual analysis
5. Exploitation:      Metasploit, manual exploits — AUTHORIZED TARGETS ONLY
6. Post-exploitation: privilege escalation, lateral movement, demonstrate
                      real impact
7. Reporting:         exec summary + technical findings + remediation
8. Remediation verify: retest after client fixes issues
```

## Key Tools — Quick Reference

```
Recon:        nmap, Shodan, theHarvester, Recon-ng, dnsrecon, amass
Web testing:  Burp Suite, OWASP ZAP, nikto, gobuster, ffuf
Exploitation: Metasploit (msfconsole), sqlmap
Password:     Hashcat, John the Ripper, Hydra
Wireless:     Aircrack-ng, Kismet
AD-specific:  BloodHound (attack path viz), Rubeus, mimikatz, GetUserSPNs.py
Privesc:      linpeas.sh (Linux), winPEAS.exe (Windows), GTFOBins (lookup)
Reporting:    Dradis, Faraday, or plain Markdown

nmap -sn 192.168.1.0/24        ping sweep (host discovery)
nmap -sV -sC target            service/version + default scripts
nmap -p- --min-rate 5000       all 65535 ports, fast
nmap -A target                 OS detection + traceroute + scripts
```

## OWASP Top 10 — CORRECTED: 2025 edition is current

```
This course's own overview.md and interview.md present the 2021 list,
with interview.md even explicitly (and now incorrectly) labeled "(2021)."
OWASP released the Top 10:2025 (finalized January 2026) — first major
revision since 2021:

A01:2025  Broken Access Control        (stable at #1, now ABSORBS SSRF —
                                         SSRF is not less relevant, just
                                         re-categorized)
A02:2025  Security Misconfiguration    (jumped #5 → #2)
A03:2025  Software Supply Chain Failures    (NEW)
A04:2025  Cryptographic Failures       (was #2)
A05:2025  Injection                    (was #3)
A06:2025  Insecure Design              (was #4)
A07:2025  Authentication Failures      (stable)
A08:2025  Software/Data Integrity Failures  (stable)
A09:2025  Security Logging & Alerting Failures (renamed from Monitoring)
A10:2025  Mishandling of Exceptional Conditions (NEW — replaces the old
                                         standalone SSRF slot)
```

## Web Application Testing — Quick Patterns

```
SQL injection test progression:
  ' OR '1'='1                    basic auth bypass test
  ' AND 1=1--  vs  ' AND 1=2--    boolean-based blind (compare responses)
  ' AND SLEEP(5)--                time-based blind (delay confirms SQLi)
  UNION SELECT username,password FROM users--   direct extraction, if
                                                  error-based/visible

XSS test payloads: <script>alert(1)</script> | <img src=x onerror=alert(1)>
  Real impact: session cookie theft, redirect, keylogging — NOT just
  a popup box; the alert is a confirmation signal, not the actual risk

IDOR: /api/orders/1234 → /api/orders/5678 (someone else's data)
  Fix: authz check on EVERY request, GUIDs instead of sequential IDs

SSRF: server fetches a URL you control → point it at cloud metadata
  endpoint (169.254.169.254 on AWS) or internal services (Redis, etc.)
  Fix: allowlist destinations (blocklists get bypassed via DNS rebinding);
  IMDSv2 on AWS specifically hardens against basic GET-only SSRF
```

## Active Directory Attacks

```
Kerberoasting:  request TGS for a SERVICE account (has an SPN), crack
                its password hash offline — targets service accounts
                specifically because they often have weaker/older
                passwords than regular user accounts under normal policy
Pass-the-Ticket: reuse an exported Kerberos ticket (mimikatz/Rubeus)
DCSync:          dump ALL domain hashes — requires Domain Admin or
                 equivalent rights already
BloodHound:      visualizes the shortest attack path to Domain Admin
                 from a given starting foothold
```

## Privilege Escalation — Quick Checks

```
Linux:
  sudo -l                          what can I run as root?
  find / -perm /4000 2>/dev/null   SUID binaries
  cat /etc/cron*                   cron jobs running as root
  GTFOBins (gtfobins.github.io)    lookup: does this binary + sudo/SUID
                                    grant a shell?

Windows:
  Unquoted service paths: C:\Program Files\App\svc.exe (no quotes) →
    Windows tries C:\Program.exe first if writable — ONLY exploitable
    because of the unquoted path + spaces combination
  AlwaysInstallElevated, weak service permissions, token impersonation
  winPEAS.exe → automated check script
```

## Report Structure

```
1. Executive Summary   (non-technical, business impact, ~2 pages)
2. Scope & Methodology (what was tested, how)
3. Findings, each with:
   Title | Severity | CVSS score | Description | Evidence (screenshot/
   HTTP req-resp) | Impact | Remediation (specific, actionable)
4. Attack Narrative     (the STORY of how findings chained together —
                         often more persuasive to stakeholders than any
                         single finding's severity score alone)
5. Appendix             (raw tool output, versions used)

Immediate client escalation triggers: active exploitation evidence,
critical data exposure, safety-impacting systems — don't wait for the
final report to flag these.
```

## CVSS Severity — note both versions currently in use

```
Ratings (same scale, both versions): Critical 9.0-10.0 | High 7.0-8.9 |
  Medium 4.0-6.9 | Low 0.1-3.9 | Info 0.0

CVSS v3.1 remains the MORE WIDELY DEPLOYED version as of 2026 (NVD's
primary published score), but CVSS v4.0 (released Nov 2023) now runs
alongside it on NVD's own pages — v4.0 restructures into Base/Threat/
Environmental/Supplemental groups and drops the old, often-confusing
Scope metric. Expect to see and interpret both for the next several
years during the industry-wide transition; don't assume every score
you encounter is v3.1 by default going forward.
```

## Bug Bounty / Responsible Disclosure

```
Platforms: HackerOne, Bugcrowd, Synack (invite-only, paid), Intigriti

Best beginner targets: web apps (SQLi, XSS, IDOR, SSRF), API endpoints,
  auth flows

Critical practice: document EVERYTHING with screenshots and raw HTTP
  traffic. The gap between "I found something real" and "triage accepts
  it on the first submission" is almost always evidence quality, not
  technical skill (see this course's Real World Scenarios for the full
  version of this).

Ethics: responsible disclosure — report immediately, don't exploit
  further. If a program's policy restricts tools (e.g., "no automated
  scanners") and you used one anyway, disclose that honestly rather
  than concealing it — concealment risks program access entirely.
```
