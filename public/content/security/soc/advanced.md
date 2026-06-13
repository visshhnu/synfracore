# SOC Operations — Advanced

## Digital Forensics

```bash
# Memory forensics with Volatility
# Capture memory: winpmem.exe -o memory.dmp (Windows)
# or: avml /proc/kcore memory.dmp (Linux)

# Analyze with Volatility3
python3 vol.py -f memory.dmp windows.pslist     # Running processes
python3 vol.py -f memory.dmp windows.netscan    # Network connections
python3 vol.py -f memory.dmp windows.cmdline    # Command line args
python3 vol.py -f memory.dmp windows.malfind    # Injected code
python3 vol.py -f memory.dmp windows.dlllist --pid 1234  # DLLs for process

# Linux memory
python3 vol.py -f memory.dmp linux.pslist
python3 vol.py -f memory.dmp linux.bash        # Bash history from memory

# Disk forensics with Autopsy
# Timeline analysis: when files were created/modified/accessed
# Keyword search in unallocated space
# Recover deleted files
# Email/browser artifact extraction
```

## SOC Cheatsheet + Interview

```
# ── SOC TOOLS ─────────────────────────────────────────────
SIEM:     Splunk, Microsoft Sentinel, Elastic SIEM
EDR:      CrowdStrike Falcon, SentinelOne, Microsoft Defender for Endpoint
NDR:      Darktrace, Vectra, Cisco StealthWatch
Threat Intel: MISP, VirusTotal, Shodan, AlienVault OTX
Forensics:   Autopsy, Volatility, Wireshark
SOAR:     Splunk SOAR, Palo Alto XSOAR, Sentinel Playbooks

# ── IR CHECKLIST ──────────────────────────────────────────
Identification:
  □ Which systems are affected?
  □ How was initial access gained?
  □ What data may have been accessed?
Containment:
  □ Isolate affected systems from network
  □ Block C2 IPs/domains at firewall
  □ Disable compromised accounts
  □ Preserve evidence before wiping
Eradication:
  □ Remove malware/backdoors
  □ Patch exploited vulnerability
  □ Reset all potentially compromised credentials
Recovery:
  □ Restore from known-good backups
  □ Monitor closely for 72h post-recovery
Post-incident:
  □ Root cause analysis
  □ Update IR playbooks
  □ Implement detection for this attack pattern

# ── INTERVIEW QUESTIONS ───────────────────────────────────
Q: Walk me through a phishing investigation
A: Get the email headers → identify originating IP →
   Check IP reputation (VirusTotal, AbuseIPDB) →
   Check if anyone clicked links (proxy logs) or downloaded files →
   Hash any attachments, check VirusTotal →
   If user clicked: check for credentials submitted (proxy logs),
   check endpoint for malware (EDR telemetry) →
   Scope: did malware spread laterally? →
   Contain: isolate endpoint, block domains, reset passwords.

Q: What is the difference between EDR and AV?
A: AV uses signatures to detect known malware. EDR (Endpoint Detection
   and Response) records all endpoint activity (processes, network,
   files, registry) and uses behavioral analytics + ML to detect
   unknown threats. EDR provides forensic telemetry for investigation.
   All modern endpoints should have EDR, not just AV.
```
