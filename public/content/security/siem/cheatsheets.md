# SIEM — Cheatsheet

```splunk
-- ── SPLUNK SEARCH PATTERNS ────────────────────────────────
-- Basic search
index=windows earliest=-1h EventCode=4625
| stats count by src_ip, user | sort -count | head 20

-- Time functions
earliest=-24h latest=now
earliest=-1d@d latest=@d    -- Yesterday exactly
| bucket span=1h _time       -- Group into 1h buckets
| timechart count            -- Chart over time

-- Stats functions
stats count, sum(bytes), avg(duration), dc(user), values(action) by src_ip
dedup src_ip, user           -- Remove duplicates
streamstats count as seq by src_ip  -- Sequential numbering per group

-- Joins
| join src_ip [search index=threat_intel]

-- Regex extraction
| rex field=message "user=(?P<username>[^,]+),ip=(?P<ip>[\d.]+)"

-- Geolocation
| iplocation src_ip
| geostats count by Country

-- ── ELASTIC KQL PATTERNS ──────────────────────────────────
event.code: "4625"
source.ip: 192.168.* AND NOT destination.port: 443
@timestamp >= "now-1h"
process.name: "powershell.exe" AND NOT process.parent.name: "explorer.exe"
event.action: "user-login" AND event.outcome: "failure"

-- ── TOP 20 DETECTION RULES ────────────────────────────────
1.  Brute force: >10 failed logins per IP per 5 min
2.  Password spray: 1 password, many accounts, same IP
3.  Credential stuffing: many accounts, many passwords
4.  Successful login after brute force
5.  Admin login outside business hours
6.  New admin account created
7.  User added to privileged group (EventCode 4732)
8.  Scheduled task created (EventCode 4698)
9.  Service installed (EventCode 7045)
10. PowerShell with encoded command
11. Large outbound transfer (>100MB)
12. DNS query to known malicious domain
13. Process spawned by Office application
14. LSASS access (credential dumping)
15. RDP to multiple internal hosts
16. SMB lateral movement
17. Kerberoasting (many TGS-REQ)
18. Golden ticket (TGT >10yr)
19. Log clearing (EventCode 1102)
20. Security tools disabled

-- ── INCIDENT TIMELINE RECONSTRUCTION ─────────────────────
-- Find all events for a compromised IP, sorted by time
index=* src_ip="192.168.1.100" OR dest_ip="192.168.1.100"
| sort _time
| table _time, index, sourcetype, action, src_ip, dest_ip, user, message
```
