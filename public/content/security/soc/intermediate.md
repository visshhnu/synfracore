# SOC Operations — Intermediate

## Incident Response Deep Dive

```
Severity Classification:
  P1/Critical: Active breach, ransomware, data exfiltration in progress
               → Page all senior analysts + CISO + Legal immediately
               → Isolate affected systems NOW, preserve evidence
  
  P2/High:     Confirmed intrusion, privilege escalation, C2 communication
               → Page on-call analyst, escalate to L2 within 30 min
  
  P3/Medium:   Suspicious activity, policy violation, malware detected
               → Ticket, L1 investigates within 4 hours
  
  P4/Low:      Anomaly, failed attack, compliance alert
               → Ticket, investigated during business hours
```

```python
# Incident timeline reconstruction
class IncidentTimeline:
    def __init__(self, incident_id: str):
        self.id = incident_id
        self.events = []
    
    def add_event(self, timestamp: str, source: str, description: str, ioc: str = None):
        self.events.append({
            'time': timestamp, 'source': source,
            'description': description, 'ioc': ioc
        })
        self.events.sort(key=lambda x: x['time'])
    
    def find_patient_zero(self) -> dict:
        """Find the first infected system."""
        return min(self.events, key=lambda x: x['time'])
    
    def get_iocs(self) -> set:
        """Extract all Indicators of Compromise."""
        return {e['ioc'] for e in self.events if e['ioc']}
    
    def to_report(self) -> str:
        lines = [f"Incident {self.id} Timeline", "="*50]
        for e in self.events:
            lines.append(f"[{e['time']}] {e['source']}: {e['description']}")
            if e['ioc']:
                lines.append(f"  IOC: {e['ioc']}")
        return "\n".join(lines)
```

## Threat Hunting

```bash
# Proactive search for threats that bypassed automated detection

# Hunt 1: Look for PowerShell downloading from internet
grep -i "downloadstring\|downloadfile\|webrequest\|invoke-expression" \
    /var/log/powershell/operational.log

# Hunt 2: Unusual processes spawned by Office applications
# Look for: winword.exe → cmd.exe, powershell.exe, wscript.exe, etc.
# This indicates document-based malware (macro execution)

# Hunt 3: Processes connecting to non-standard ports
ss -tlnp | grep -v -E "(80|443|22|25|53|3306|5432)"

# Hunt 4: New scheduled tasks (persistence mechanism)
schtasks /query /fo LIST /v | grep -i "task name\|status\|run as"

# Hunt 5: Look for processes with no parent (orphaned processes can indicate injection)
ps -axo ppid,pid,cmd | awk '$1==1 && $3!~/kthread|init|systemd/ {print}'

# Sigma rules — portable detection rules
title: Suspicious PowerShell Download
status: test
logsource:
    category: process_creation
    product: windows
detection:
    selection:
        Image|endswith: '\powershell.exe'
        CommandLine|contains:
            - 'DownloadString'
            - 'DownloadFile'
            - 'WebClient'
    condition: selection
falsepositives:
    - Legitimate admin scripts
level: high
```
