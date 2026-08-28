# Penetration Testing — Overview

**Before you start:** basic networking and Linux command-line familiarity is assumed. No prior offensive-security experience is required.

## What is Penetration Testing?

Penetration testing (pen testing) is an authorized simulated cyberattack on a computer system to evaluate its security. The goal: find vulnerabilities before real attackers do.

**Key distinction from hacking:** Pen testing is LEGAL and AUTHORIZED. Always get written permission before testing any system. Testing without authorization is illegal under the Computer Fraud and Abuse Act (US), IT Act (India), and similar laws worldwide.

## Why This Exists (The Hook)

A structured methodology exists because "try to hack it and see what happens" is neither repeatable nor defensible — a real engagement needs a documented scope (so the tester and client agree on exactly what's in bounds), a consistent phase-by-phase process (so nothing important gets skipped), and a report the client's engineers can actually act on. PTES exists to standardize that process across the industry, the same way a structured audit methodology makes a financial audit's findings trustworthy and comparable, rather than one auditor's ad-hoc impressions.

**Analogy** — Think of PTES like a structured home inspection before a house sale, not a casual walkthrough. A professional inspector doesn't just wander around noting whatever catches their eye — they follow a defined checklist (foundation, electrical, plumbing, roof) so nothing gets missed, and they produce a written report the buyer can act on. PTES is that same discipline applied to a network: a defined sequence of checks, not an improvised poke-around, producing a report the client's engineers can actually use.

**Try it (2 minutes)** — Reason through why "Remediation verify" is its own final phase, separate from reporting, without looking anything up: if a pen test report says "SQL injection found in the login form, fix by using parameterized queries," and the development team applies a fix, how would anyone actually confirm the fix worked correctly — by trusting the developer's word, or by literally re-attempting the same exploit? What real-world case would explain why a "fixed" vulnerability sometimes isn't actually fixed?

## Types of Pen Tests

```conceptgrid
{
  "boxes": [
    { "title": "Black Box", "description": "No prior knowledge -- simulates an external attacker", "color": "slate" },
    { "title": "White Box", "description": "Full access (source code, architecture) -- most thorough", "color": "blue" },
    { "title": "Grey Box", "description": "Partial information -- e.g. user credentials but no source code", "color": "purple" },
    { "title": "External vs Internal", "description": "From outside the perimeter, or simulating a compromised insider", "color": "amber" }
  ]
}
```

**Black Box** — Tester has no prior knowledge (simulates an external attacker)

**White Box** — Tester has full access (source code, architecture diagrams) — most thorough

**Grey Box** — Tester has partial information (e.g., user credentials but no source code)

**External** — Attack from outside the network perimeter

**Internal** — Simulates a compromised insider or breached network

## Methodology: PTES (Penetration Testing Execution Standard)

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Pre-Engagement", "sublabel": "Scope, rules, authorization -- get it in writing", "color": "blue" },
    { "label": "Recon + Scanning", "sublabel": "Passive info gathering, then active probing", "color": "purple" },
    { "label": "Exploitation", "sublabel": "Attempt to compromise targets", "color": "red" },
    { "label": "Post-Exploitation", "sublabel": "Maintain access, pivot, escalate", "color": "amber" },
    { "label": "Reporting + Verify", "sublabel": "Document findings, then retest after fixes", "color": "green" }
  ]
}
```

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
