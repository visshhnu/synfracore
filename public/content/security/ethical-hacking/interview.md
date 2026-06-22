# Ethical Hacking Interview Questions

## Core Concepts

**Q: What is ethical hacking? Legal and ethical considerations?**

Ethical hacking = authorised attempt to penetrate systems to identify vulnerabilities. Also called "white hat" hacking.

Legal requirements:
- Written permission from system owner (Rules of Engagement)
- Defined scope — what systems can be tested
- Time window — when testing is permitted
- Emergency contact — who to call if critical finding
- Data handling — what to do with discovered data

**Code of ethics**: Do no harm beyond what's needed to demonstrate vulnerability. Maintain confidentiality. Report all findings honestly.

---

**Q: Reconnaissance techniques.**

Passive recon (no direct contact with target):
```bash
whois target.com                    # Domain registration info
dig target.com any                  # DNS records
theHarvester -d target.com -b google  # Emails, subdomains
shodan search hostname:target.com   # Internet-exposed assets
# LinkedIn, GitHub for employee info, code leaks
# Google dorks: site:target.com filetype:pdf
```

Active recon (direct contact):
```bash
nmap -sn 192.168.1.0/24     # Ping sweep (live hosts)
nmap -sV target.com          # Service version detection
```

---

**Q: Common exploitation techniques.**

**SQL Injection:**
```sql
-- Input: ' OR 1=1--
SELECT * FROM users WHERE username = '' OR 1=1--' AND password = '...'
-- Always true → bypass auth
-- Fix: parameterised queries / prepared statements
```

**Cross-Site Scripting (XSS):**
```html
<!-- Input: <script>document.cookie</script> stored in DB -->
<!-- Victim visits page → script executes in their browser -->
<!-- Fix: output encoding, Content-Security-Policy header -->
```

**Command Injection:**
```bash
# Input: ; cat /etc/passwd
ping -c 1 8.8.8.8; cat /etc/passwd
# Fix: never pass user input to shell, use parameterised APIs
```

---

**Q: Post-exploitation — privilege escalation.**

Linux privilege escalation:
```bash
sudo -l                          # What can current user sudo?
find / -perm -4000 2>/dev/null  # SUID binaries (run as owner)
cat /etc/crontab                 # Writable cron jobs running as root?
ls -la /etc/passwd /etc/shadow  # Readable shadow file?
linpeas.sh                       # Automated privesc enumeration
```

Windows privilege escalation:
```powershell
whoami /priv                    # Current privileges
Get-LocalGroupMember Administrators  # Who is admin?
winpeas.exe                     # Automated enumeration
```

---

**Q: Covering tracks and reporting.**

Ethical hackers: document everything (screenshots, commands, timestamps). Do NOT cover tracks — you need evidence for the report.

Post-engagement cleanup: remove any tools uploaded, shells created, users added. Restore system to original state.

## Revision Notes
```
ETHICAL HACKING: authorised, documented, do no harm
LEGAL: written permission + scope + time window + emergency contact

RECON:
Passive: whois, dig, shodan, theHarvester, Google dorks
Active: nmap, service detection (only after authorisation)

EXPLOITATION:
SQLi: OR 1=1-- | Fix: parameterised queries
XSS: <script> in input | Fix: output encoding + CSP
Command injection: ; cat /etc/passwd | Fix: no shell with user input

POST-EXPLOITATION:
Linux: sudo -l, SUID binaries, writable crontabs, linpeas.sh
Windows: whoami /priv, winpeas.exe

REPORT: Document everything. Screenshots + commands + timestamps.
Cleanup: remove tools/shells/accounts. Restore to original state.
```
