# Penetration Testing — Prerequisites

## What You Need Before Starting

Penetration testing sits near the top of the security skill stack — it assumes solid networking, OS administration, and general security fundamentals already, then applies an attacker's mindset on top of that foundation. This is genuinely not a good first stop in security if you're starting from zero; trying to learn "how attackers find vulnerabilities" before you understand how the underlying systems normally work makes both harder to learn at once, and most professional pathways (OSCP included) explicitly assume this groundwork already exists.

### 1. Solid networking fundamentals (required)

You should already be comfortable with, not just vaguely aware of:
- TCP/IP fundamentals: ports, protocols, the three-way handshake, common protocols and their default ports (this course's own material references dozens of these — 22, 80, 443, 3389, 445, and more — assuming you already know roughly what each is for)
- Reading and interpreting `nmap` output confidently — this course's fundamentals section jumps straight into `nmap -sV -sC -A` without re-explaining basic port scanning concepts
- Basic packet capture concepts (what a Wireshark capture shows, at least conceptually)

### 2. Genuine comfort with both Linux and Windows administration (required)

Pen testing content in this course spans both operating systems interchangeably (Linux privilege escalation via SUID/cron, Windows privilege escalation via unquoted service paths/token impersonation), and real engagements essentially always involve both. You should be able to:
- Navigate, manage permissions, and understand process/service management on Linux
- Navigate, manage permissions, and understand service/scheduled-task configuration on Windows
- Use the command line confidently on both — not just through a GUI

If you're solid on only one OS family, that's a real gap worth closing before this material, not something to work around — a meaningful share of both the OSCP exam and real engagements depend on comfort with whichever OS a specific target happens to be running.

### 3. Security fundamentals (required — this course's own related technology, not optional background reading)

Before this material, you should already understand: the CIA triad, common attack categories (SQLi, XSS, CSRF, IDOR, SSRF) at a conceptual level, encryption/hashing basics, and authentication/authorization concepts. This course's own Security Fundamentals technology covers exactly this ground — treat it as a genuine prerequisite technology to complete first, not background trivia, since Pen Testing's material builds directly on top of it (e.g., assuming you already know what SSRF *is* conceptually before showing you how to actively test for it).

### 4. Basic scripting — Python and Bash (strongly recommended, close to required for anything beyond guided labs)

You don't need to write exploits from scratch to start (see this course's own FAQ on this point), but comfort reading and lightly modifying scripts is close to unavoidable — automated enumeration scripts (linpeas, winPEAS), exploit proof-of-concept code from sources like searchsploit, and basic custom tooling for parsing output all assume you can read Python/Bash without it being new syntax on top of new security concepts. If you have zero scripting background, get comfortable with basic Python and Bash fundamentals in parallel with, or ideally before, diving deep into this material.

### 5. A dedicated, isolated practice environment (required — this is not optional reading, it's how this material has to be learned)

Reading about SQL injection and actually finding it in something aren't the same skill, and there's no substitute for hands-on practice specifically in an environment you're explicitly authorized to test:
- **HackTheBox** and **TryHackMe** — both explicitly named in this course's own material as legal practice platforms, with structured learning paths at multiple difficulty levels
- **A local lab** (VirtualBox/VMware with intentionally vulnerable VMs from VulnHub, or Metasploitable) — useful for offline practice and understanding exactly what you're doing without any ambiguity about authorization
- **OffSec's Proving Grounds** — closer to OSCP-exam-style machines specifically, useful once you're past the absolute basics

### 6. What you do *not* need yet

- A specific certification already — Security+ or an equivalent foundational credential is commonly recommended before OSCP, but it's not a hard technical prerequisite for starting to learn pen testing concepts
- Exploit development / binary exploitation expertise — see this course's own FAQ; this matters for specific specializations, not for starting out or for most general pen testing roles
- Prior professional security experience — many successful pen testers come from general IT/sysadmin/developer backgrounds and build this skill set specifically, rather than requiring prior security-titled roles

### Quick self-check

Given the sentence "the target's SSH service on port 22 responded to a version scan revealing OpenSSH 7.2, which has a known CVE for username enumeration" — does every part of that sentence make sense without needing a definition (port, service, version scan, CVE)? If yes, you're ready for the Fundamentals section. If any of those terms needed unpacking, spend more time on prerequisite #1 and #3 first — this course's material moves quickly past this vocabulary rather than re-teaching it.
