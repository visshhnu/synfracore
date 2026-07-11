# Incident Response — Intermediate

## Writing SIEM correlation rules that actually reduce noise

A SIEM ingests enormous log volume, and a poorly-tuned alert rule either misses real incidents (too narrow) or produces so many false positives that analysts stop trusting it (too broad) — both failure modes are common, and tuning correlation rules deliberately is a real, ongoing skill:

```spl
# Splunk SPL — a correlation rule combining multiple weak signals
# into one higher-confidence alert, rather than alerting on any single one alone
index=auth_logs sourcetype=windows_security EventCode=4625
| stats count by user, src_ip
| where count > 5
| join user [
    search index=auth_logs sourcetype=windows_security EventCode=4624
    | where src_ip != prev_src_ip
  ]
| eval alert_reason="Multiple failed logins followed by success from a new IP"
```
The pattern worth understanding, not just this specific query: a single failed login is weak, low-confidence signal (someone mistyped a password); five failed logins followed by a success from a *different* IP than usual is a meaningfully stronger, more specific signal of credential compromise. Correlation rules that combine multiple weak signals into one higher-confidence alert are what actually reduces alert fatigue — an analyst trusts and investigates a well-correlated alert far more reliably than one of a thousand raw single-event alerts they've learned to mostly ignore.

## Digital forensics basics: memory and disk imaging done correctly

```bash
# Memory acquisition — must happen BEFORE containment (see Fundamentals)
# FTK Imager or similar, producing a raw memory image with a hash
ftkimager --memory memory_dump.raw

# Disk imaging — a bit-for-bit copy, never work directly on the original
dd if=/dev/sda of=/evidence/disk_image.dd bs=4M status=progress
sha256sum /dev/sda /evidence/disk_image.dd   # confirm the hashes match

# Analyze the COPY, never the original device
volatility3 -f memory_dump.raw windows.pslist
volatility3 -f memory_dump.raw windows.netscan
```
The non-negotiable rule underlying all forensic work: **never analyze the original evidence directly** — always work against a verified, hash-matched copy, keeping the original untouched and preserved. This protects both the evidence's integrity (any analysis action, even a read, can theoretically alter metadata like access timestamps) and the investigation's legal defensibility — an analysis performed against the original, rather than a verified copy, is a real, avoidable weakness if that evidence is ever challenged later.

## IOC management: turning one incident's findings into future detection

An Indicator of Compromise (IOC) — a malicious IP, file hash, domain, or registry key observed during an incident — has value far beyond the current investigation if it's captured and fed back into detection systems:

```bash
# After confirming a malicious IP during investigation, feed it back
# into the SIEM/firewall as a detection/blocking rule for the future
# STIX/TAXII format is the common standard for structured IOC sharing
{
  "type": "indicator",
  "pattern": "[ipv4-addr:value = '203.0.113.45']",
  "labels": ["malicious-activity"],
  "valid_from": "2026-07-11T00:00:00Z"
}
```
The habit worth building into every incident's closure: before closing an incident, explicitly ask "what IOCs did we find, and have they been added to detection systems" — an incident that's fully remediated but whose IOCs were never fed back into the SIEM/EDR/firewall means the exact same attacker, using the exact same infrastructure, could succeed again undetected, since nothing about this incident's specific findings improved the organization's ongoing detection capability.

## Threat hunting: proactively looking, not just waiting for an alert

Incident response as described so far is fundamentally reactive — responding to an alert that already fired. Threat hunting is the complementary, proactive discipline: actively searching for signs of compromise that *haven't* triggered any existing alert, working from a hypothesis rather than a triggered signature:

```
A threat-hunting hypothesis, structured:
  "If an attacker has established persistence via a scheduled task,
   I'd expect to see an unusual scheduled task created outside
   normal change-management hours, running from an uncommon path"

Hunt query (conceptual):
  Search EDR telemetry for scheduled task creation events,
  filtered to non-business-hours creation, from paths outside
  the standard software installation directories
```
This matters specifically because it catches attacks and living-off-the-land techniques designed to evade existing signature-based detection — an attacker using entirely legitimate system tools (PowerShell, scheduled tasks, WMI) in an anomalous *pattern* won't trigger a signature looking for known-malicious files, but a hypothesis-driven hunt looking for anomalous *use* of legitimate tools can surface it. Mature security teams run threat hunts on a regular cadence, not only reactively after a known incident — proactively assuming some level of undetected compromise might already exist, and deliberately looking for it, rather than only ever responding to what already alerted.

## Coordinating a multi-team incident: communication discipline under pressure

A significant incident routinely involves multiple teams simultaneously — IR, legal, communications, executive leadership, sometimes external forensics or law enforcement — and communication breakdown under that pressure is a real, common secondary failure mode on top of the incident itself:

```
Incident communication structure that scales:
- One incident commander — the single point of coordination decisions
- A dedicated IR channel (Slack/Teams) — all incident discussion happens
  here, not scattered across DMs and hallway conversations
- Regular, scheduled status updates (e.g. every 30 min during P1) —
  even "no new information" is a valid, expected update
- A single source of truth for the timeline — not multiple people's
  independent, potentially conflicting notes
```
Without this structure, a real, common failure mode emerges: different people responding to the same incident develop different, sometimes contradictory understandings of what's happening and what's already been done, leading to duplicated effort (two people independently isolating the same host) or gaps (an action everyone assumed someone else already took). A single incident commander and a single documented timeline are what prevent this — not because any individual is untrustworthy, but because uncoordinated, high-pressure, simultaneous action across multiple teams reliably produces exactly this kind of drift without deliberate structure imposed on it.
