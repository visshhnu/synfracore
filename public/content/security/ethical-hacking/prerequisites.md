# Ethical Hacking — Prerequisites

## What You Need Before Starting

This course also has a Pen Testing technology covering closely related ground — if you've already reviewed that technology's prerequisites, most of the same foundation applies here too (networking fundamentals, both-OS comfort, Security Fundamentals as an actual prerequisite technology, not just background reading). This page focuses on what's specifically different about the broader "ethical hacking" scope this course's own certification material maps to CEH's wider domain coverage — social engineering, wireless, malware, and IoT/cloud — beyond the web-application/Active Directory focus Pen Testing's material concentrates on.

### 1. Everything listed in this course's Pen Testing prerequisites (required, not optional here either)

Networking fundamentals, genuine Linux *and* Windows comfort, Security Fundamentals completed first, and basic Python/Bash scripting ability all apply exactly as described there. This technology builds on the same foundation; it doesn't substitute for it.

### 2. Basic wireless networking concepts (required, and specific to this technology's broader scope)

Beyond general networking, you should understand:
- The difference between WPA2 and WPA3, and roughly how a Wi-Fi handshake authenticates a client
- What an access point (AP), SSID, and BSSID are, and that a device can be tricked by a rogue AP broadcasting a familiar SSID
- Basic RF concepts — that Wi-Fi signal strength and range matter for an attacker's positioning, at least conceptually

If wireless concepts specifically feel unfamiliar even after covering general networking, that's worth closing before this course's wireless-domain material, since it assumes this baseline rather than re-teaching it.

### 3. Conceptual understanding of malware categories (required — you need to reason about this, not write malware)

You should understand the *behavioral* distinctions between common malware types (virus, worm, trojan, ransomware) covered in this course's own PYQ material, and roughly how antivirus/EDR tools detect malicious software (signature-based vs. behavioral/heuristic detection) — this is conceptual knowledge for recognizing and defending against malware, not a prerequisite in malware development, which this course does not cover and which sits outside what's appropriate for general ethical hacking education.

### 4. Awareness of basic human psychology/social engineering principles (recommended, genuinely useful here specifically)

Since a meaningful part of this technology's distinct scope is social engineering, some familiarity with why people fall for pretexting, phishing, and authority-based manipulation — urgency, authority, social proof, reciprocity as psychological levers — makes this material land as "here's the mechanism" rather than abstract theory. You don't need a psychology background; even having noticed these patterns in everyday scams or manipulative sales tactics gives you a working intuition to build on.

### 5. A safe, legal environment to practice in (required — same core principle as Pen Testing, some different specific platforms)

- **TryHackMe** and **HackTheBox** — both cover ethical hacking's broader domains (not just web/AD), including dedicated wireless and social-engineering-adjacent learning paths
- **A home wireless lab** — a spare router/AP and a Wi-Fi adapter that supports monitor mode, used only against your own equipment, is genuinely useful for the wireless domain specifically in a way that platform-based labs can't fully replicate
- **Sandboxed malware analysis environments** (Any.Run, a fully isolated VM with no network access) — if you want hands-on exposure to malware *analysis* specifically (examining behavior safely), always in an isolated environment with no path back to your real network, never running unknown samples on a general-purpose machine

### 6. What you do *not* need yet

- Malware development skills — this course's own material treats malware from a recognition/defense/analysis angle, not a "how to write one" angle, and that distinction matters for what's appropriate to learn and practice here
- Deep RF engineering or hardware hacking background — the wireless domain here is about attack/defense patterns at the protocol and configuration level, not building custom RF hardware
- A psychology degree — see #4; awareness of the common manipulation patterns is enough to start

### Quick self-check

If someone said "the assessment found employees were vulnerable to pretexting because the helpdesk's identity verification process could be satisfied with information gatherable from LinkedIn," would that sentence make immediate sense — pretexting, identity verification process, OSINT-gatherable information — without needing each term explained? If yes, you're ready for this technology's Fundamentals section. If the vocabulary needed unpacking, spend more time on prerequisite #4 (and this course's Security Fundamentals technology generally) first.
