# SOC & SIEM — Prerequisites

## What You Need Before Starting

SOC/SIEM work sits on top of general IT and networking knowledge — it's the "defend it" layer applied to systems you should already understand at a basic level. Trying to learn SOC concepts and fundamental networking/OS concepts at the same time makes both harder than they need to be.

### 1. Basic networking concepts (required)

You should already be comfortable with:
- What an IP address, port, and protocol are, and the difference between TCP and UDP at a conceptual level
- What DNS does and roughly how it resolves a name to an address
- What a firewall does at a basic level (allow/block based on rules)
- Reading a basic network diagram (client → firewall → server, roughly)

If terms like "port 443" or "DNS lookup" aren't already familiar, a foundational networking course (or this platform's own Networking material, if covering that technology) should come before this one — a huge amount of SOC alert analysis is fundamentally about interpreting network activity, and that's much harder to learn for the first time inside a security context specifically.

### 2. Basic operating systems knowledge — both Windows and Linux (required)

SOC work routinely involves both, and the course material itself reflects this (Windows Event Logs and PowerShell examples alongside Linux `auth.log` and `bash` examples). You should be able to:
- Navigate a filesystem and view logs on both a Windows machine (Event Viewer, or `Get-WinEvent` in PowerShell) and a Linux machine (`/var/log/`, basic `grep`/`cat`)
- Understand what a "process" is and see a running process list on both platforms
- Have at least basic familiarity with the Windows Registry and Linux file permissions, since both come up constantly in intrusion analysis (registry run keys for persistence, file permission misconfigurations)

If you're comfortable with only one OS family, that's a genuine gap worth closing early — SOC job postings and real environments essentially always involve both.

### 3. Basic scripting (recommended, increasingly expected — not a hard blocker to start)

You don't need to be a software engineer, but basic Python (variables, loops, string parsing, calling a simple HTTP API) and comfort with command-line tools (`grep`, `awk`, basic PowerShell cmdlets) will make the Intermediate section's material land much faster rather than feeling like new syntax on top of new concepts. If you have zero scripting background, it's reasonable to start the Fundamentals section in parallel with picking up basic Python — you don't need to fully learn it first, but plan to build it alongside this material rather than treating it as optional forever.

### 4. A safe environment to practice in (required)

You genuinely cannot learn SOC analysis by reading alone — you need real logs and alerts to actually triage. Reasonable starting points:
- **A home lab**: a couple of VMs (one "attacker," one "victim") using something like VirtualBox, with a free-tier SIEM (Splunk Free, or the ELK/Elastic stack) ingesting logs from the victim VM — this is the single most valuable setup for genuinely internalizing this material
- **TryHackMe's SOC-focused learning paths** or **LetsDefend** — both simulate realistic SOC ticket queues with real alert data to triage, without needing to build your own lab from scratch
- **Blue Team Labs Online** — defensive-focused challenges (SIEM analysis, malware triage) in a structured, guided format

### 5. What you do *not* need yet

- A security-specific degree — see this course's own FAQ section on this exact point; general IT/helpdesk backgrounds are a common and legitimate path in
- Offensive security / penetration testing knowledge — helpful context eventually (understanding attacker tooling deepens defensive intuition), but SOC/defensive work and offensive work are genuinely separate skill tracks, and you don't need the offensive side first
- Deep programming ability — see #3; basic scripting is enough to start and grows alongside the material

### Quick self-check

Given a log line like `Failed password for admin from 203.0.113.7 port 51234 ssh2`, can you identify: which IP is attempting the login, what service is being targeted, and roughly what a repeated pattern of this line (same IP, many different usernames, in a short window) would suggest? If that reads naturally, you're ready for the Fundamentals section. If the log line itself is confusing to parse, spend a bit more time on prerequisite #1 and #2 first.
