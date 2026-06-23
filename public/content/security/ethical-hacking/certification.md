# Ethical Hacking Certification Guide

## Top Certifications

| Cert | Provider | Level | Cost | Format |
|------|----------|-------|------|--------|
| **CEH (Certified Ethical Hacker)** | EC-Council | Intermediate | ~$1,200 | 125 MCQ, 4 hrs |
| **OSCP (Offensive Security Certified Professional)** | OffSec | Advanced | $1,499 | 24hr hands-on lab |
| **PNPT (Practical Network Penetration Tester)** | TCM Security | Intermediate | $399 | 5-day practical |
| **eJPT (eLearnSecurity Junior PT)** | INE | Beginner | $200 | Practical |
| **CompTIA PenTest+** | CompTIA | Intermediate | $392 | MCQ + performance |

**Industry ranking:** OSCP > CEH for serious red team roles. OSCP is hands-on (real boxes); CEH is theory-heavy MCQ.

---

## CEH Exam Domains

| Domain | Weight |
|--------|--------|
| Introduction to Ethical Hacking | 6% |
| Footprinting and Reconnaissance | 9% |
| Scanning Networks | 9% |
| Enumeration | 6% |
| Vulnerability Analysis | 5% |
| System Hacking | 7% |
| Malware Threats | 3% |
| Sniffing | 5% |
| Social Engineering | 4% |
| Denial of Service | 4% |
| Session Hijacking | 4% |
| Evading IDS/Firewalls | 4% |
| Web Server/Application Hacking | 12% |
| SQL Injection | 5% |
| Wireless Networks | 5% |
| Cloud/IoT Hacking | 5% |

---

## Core Tools to Know

```bash
# Reconnaissance
whois target.com
nslookup target.com
dig target.com ANY
theHarvester -d target.com -b google   # Email/subdomain harvesting
maltego                                 # Visual intelligence gathering

# Scanning
nmap -sV -sC -O 192.168.1.0/24        # Service + OS detection
nmap -p- -T4 target                    # All ports fast scan
nmap --script vuln target              # Vulnerability scripts
masscan -p80,443,22 192.168.1.0/24 --rate=10000

# Enumeration
enum4linux -a 192.168.1.100            # SMB/Windows enumeration
nikto -h http://target.com             # Web server scan
gobuster dir -u http://target -w /usr/share/wordlists/dirb/common.txt
ffuf -w wordlist.txt -u http://target/FUZZ   # Fuzzing

# Exploitation
msfconsole                             # Metasploit
searchsploit apache 2.4               # Search exploit-db
sqlmap -u "http://target/page?id=1" --dbs   # SQL injection
hydra -l admin -P passwords.txt ssh://192.168.1.100  # Brute force

# Post-exploitation
whoami /all                            # Windows privilege check
sudo -l                                # Linux sudo permissions
linpeas.sh                             # Linux privilege escalation
winpeas.exe                            # Windows privilege escalation
```

---

## OSCP Preparation Path

```
OSCP is entirely hands-on — no MCQ. 24-hour exam on a lab network.
Must own 3 machines (get flags) + submit report.

Recommended path (4-6 months):
  Week 1-4:   TryHackMe — learning paths (Jr Penetration Tester)
  Week 5-8:   HackTheBox — easy/medium machines
  Week 9-12:  TCM Security courses (Practical Ethical Hacking)
  Week 13-20: OffSec PEN-200 course + labs (included with OSCP)
  Week 21-24: Proving Grounds Practice boxes

Key skills:
  Buffer overflows (x86) | Active Directory attacks | Web app testing
  Privilege escalation (Linux + Windows) | Port forwarding / tunneling

Report writing: documenting every step is as important as the exploit
```

---

## Study Resources

- **TryHackMe** (tryhackme.com) — beginner-friendly, browser-based labs
- **HackTheBox** (hackthebox.com) — intermediate/advanced, real machines
- **TCM Security** (academy.tcm-sec.com) — best value paid courses
- **PortSwigger Web Academy** (portswigger.net/web-security) — free, best for web app
- **VulnHub** — free downloadable vulnerable VMs

## Revision Notes
```
CEH: theory-heavy MCQ. Know attack phases, tools, countermeasures.
OSCP: pure hands-on. No MCQ. Most respected by employers.
PNPT: practical, cheaper alternative to OSCP.

ATTACK PHASES (CEH framework):
  Reconnaissance → Scanning → Enumeration → Vulnerability Analysis
  → Exploitation → Post-Exploitation → Reporting

KEY TOOLS:
  Recon: theHarvester, Maltego, whois, dig
  Scan: nmap (know all flags!), masscan, Nessus
  Web: Burp Suite, nikto, gobuster, sqlmap
  Exploit: Metasploit, exploit-db, searchsploit
  PrivEsc: linPEAS, winPEAS, GTFObins, LOLBAS
```
