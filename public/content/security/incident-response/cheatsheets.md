# Incident Response — Quick Reference

## NIST IR phases

```
Preparation → Identification → Containment → Eradication → Recovery → Post-Incident
                                                                              ↓
                                                        (loops back to Preparation)
```

## Severity classification

| Severity | Definition | SLA |
|---|---|---|
| P1 Critical | Active breach, exfiltration, ransomware | 15 min |
| P2 High | Suspicious activity, potential compromise | 1 hour |
| P3 Medium | Policy violation, failed attack attempt | 4 hours |
| P4 Low | Informational, no active threat | 24 hours |

## Evidence collection order (critical)

```
1. Capture volatile evidence FIRST (memory, network connections)
2. THEN contain (isolate the host)
Reversing this order can destroy evidence — memory is lost on power-off,
and fileless malware may exist only in memory.
```

## Chain of custody — required fields

```
[ ] Item description
[ ] Collected by (name), date/time with timezone
[ ] Collection method (tool + version)
[ ] Storage location + SHA-256 hash at collection time
[ ] Log of every subsequent access (who, when, why)
```

## Forensic acquisition commands

```bash
# Memory (before containment)
ftkimager --memory memory_dump.raw
volatility3 -f memory_dump.raw windows.pslist
volatility3 -f memory_dump.raw windows.netscan

# Disk (bit-for-bit copy, never analyze the original)
dd if=/dev/sda of=/evidence/disk_image.dd bs=4M status=progress
sha256sum /dev/sda /evidence/disk_image.dd   # confirm match
```

## Containment commands

```bash
# Isolate an EC2 instance
aws ec2 modify-instance-attribute --instance-id i-xxx --groups sg-isolated-only

# Block an IP at the firewall
iptables -A INPUT -s <attacker-ip> -j DROP
```

## Playbook quick reference

**Ransomware**: Identify scope → isolate immediately (pull cable, don't reboot) → do NOT pay without legal/exec decision → assess backup integrity → notify legal/CISO/leadership/regulators as required

**Phishing → credential theft**: Identify affected accounts → force password reset → revoke sessions/tokens → check for mail-forwarding rules (persistence) → check for attacker-registered MFA devices → audit sent mail

**Data breach**: What data + how much + exfiltrated or just accessible → determine notification obligations (GDPR 72h, HIPAA 60d, DPDP Act) → preserve all logs under legal hold

## Notification timelines by regulation

| Regulation | Jurisdiction | Timeline |
|---|---|---|
| GDPR | EU | 72 hours to supervisory authority |
| HIPAA | US healthcare | 60 days to affected individuals |
| DPDP Act | India | Evolving — Data Protection Board oversight |

## Tools by category

| Category | Tools |
|---|---|
| SIEM | Splunk, Azure Sentinel, Elastic SIEM |
| EDR | CrowdStrike, SentinelOne, Microsoft Defender |
| SOAR | Splunk SOAR, Palo Alto XSOAR |
| Forensics | Volatility (memory), Autopsy (disk), Wireshark (network) |
| Threat intel | VirusTotal, Shodan, AlienVault OTX |

## IR metrics

```
MTTD — Mean Time to Detect (compromise → detection)
MTTR — Mean Time to Respond/Recover (detection → full recovery)
Dwell time — how long attacker had undetected access

Track per incident-type, not as one blended average — a blended
number can hide a severe gap in one specific attack pattern.
```
