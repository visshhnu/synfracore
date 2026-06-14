# SOC Operations — Cheatsheet

```bash
# ── INCIDENT RESPONSE CHECKLIST ──────────────────────────
# P1 CRITICAL (Active Breach):
# 1. [ ] Page CISO + Legal + Senior Analyst immediately
# 2. [ ] Isolate affected system(s) - disable network or block at switch
# 3. [ ] Preserve evidence - memory dump, disk image before cleanup
# 4. [ ] Check: is this lateral movement? Scope other systems
# 5. [ ] Notify management (15 min), Legal (30 min if data involved)
# 6. [ ] Create incident ticket with timeline
# 7. [ ] Document every action taken (legal/audit requirement)

# ── LOG ANALYSIS ONE-LINERS ──────────────────────────────
# Top IPs by failed SSH logins
grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn | head -20

# Successful logins from previously failing IPs
grep "Accepted password" /var/log/auth.log | awk '{print $(NF-3), $9}' > success.txt
grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort -u > failed_ips.txt
grep -f failed_ips.txt success.txt

# Recent sudo usage
grep sudo /var/log/auth.log | grep COMMAND | tail -50

# Large file transfers in web logs
awk '$10 > 1000000 {print $1,$7,$10/1048576"MB"}' /var/log/nginx/access.log | sort -k3 -rn

# Active network connections by process
ss -tnp | awk 'NR>1 {print $5, $6}' | sort | uniq -c | sort -rn | head -20

# ── THREAT HUNTING QUERIES ────────────────────────────────
# Splunk: detect PowerShell with encoded command (evasion)
index=windows EventCode=4104
| where like(ScriptBlockText, "%EncodedCommand%") OR like(ScriptBlockText, "%-enc %")

# Splunk: impossible travel (same user, 2 countries, 1 hour)
index=auth action=success
| bucket span=1h _time
| stats values(src_country) as countries, dc(src_country) as dc_countries by user, _time
| where dc_countries > 1

# Splunk: beaconing detection (regular interval outbound)
index=proxy
| bin span=5m _time
| stats count by src_ip, dest_domain, _time
| stats stdev(count) as variance by src_ip, dest_domain
| where variance < 1

# ── MITRE ATT&CK QUICK REFERENCE ─────────────────────────
# T1059.001 PowerShell: look for -enc, -nop, -w hidden, bypass
# T1566 Phishing: email attachments, suspicious sender domains
# T1078 Valid Accounts: login from unusual location/time
# T1548 UAC Bypass: process elevation without UAC prompt
# T1003 Credential Dumping: LSASS access, mimikatz
# T1486 Ransomware: mass file changes, shadow copy deletion
# T1071 C2: beaconing, DNS tunneling, HTTP to unusual domains

# ── USEFUL TOOLS ─────────────────────────────────────────
# volatility: memory forensics
volatility -f memory.dump --profile=Win10x64 pslist
volatility -f memory.dump --profile=Win10x64 netscan

# strings: find readable text in binaries
strings -n 8 malware.exe | grep -i "http\|cmd\|powershell"

# VirusTotal: check file hash
curl -s "https://www.virustotal.com/api/v3/files/$HASH" -H "x-apikey: $VT_KEY"
```
