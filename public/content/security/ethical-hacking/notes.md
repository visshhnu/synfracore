# Ethical Hacking — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, de-duplicated, and corrected where out of date. Given the overlap with this course's Pen Testing technology, this reference leans toward the domains distinct to Ethical Hacking's broader (CEH-style) scope — see the Pen Testing technology's own notes for deep web-app/AD/privesc reference.

---

## Ethical Hacking vs. Pen Testing (terminology, see this course's own FAQ for the full version)

```
"Ethical hacking" = the broader umbrella term (CEH's scope: recon through
  reporting across web, network, wireless, social engineering, malware,
  cloud/IoT — 20 modules)
"Penetration testing" = the specific methodology/engagement type
  (PTES-style phases, narrower and deeper on exploitation mechanics)
CEH: theory/methodology-heavy, 125 MCQ, broader domain coverage
OSCP: pure hands-on, narrower scope, deeper on manual exploitation
```

## Attack Phases (CEH's 5-phase model — slightly different framing
## from PTES's 7-phase model used in this course's Pen Testing notes)

```
1. Reconnaissance   (footprinting — passive + active)
2. Scanning         (ports, services, vulnerabilities)
3. Gaining Access   (exploitation)
4. Maintaining Access (persistence, post-exploitation)
5. Covering Tracks  (NOTE: for an ETHICAL engagement, this phase is
   INVERTED — document everything, do NOT actually cover tracks; the CEH
   curriculum teaches this phase conceptually as "how attackers do this"
   for recognition/defense purposes, not as something to practice)
```

## Social Engineering (this technology's distinct domain)

```
Pretexting:  fabricated scenario to extract info/access (fake urgent
             exec locked out, fake vendor needing "quick access")
Phishing:    broad, untargeted deceptive email
Spear phishing: targeted at a specific individual using researched detail
Whaling:     spear phishing targeting executives specifically
Vishing:     voice/phone-based social engineering
Smishing:    SMS-based
Tailgating/Piggybacking: following an authorized person through a
             secured door without independently badging in — defeats
             MOST purely technical access controls; hardest to defend
             because it requires overriding normal politeness norms,
             not a technology gap

Psychological levers exploited: urgency, authority, social proof,
  reciprocity, fear

Defense that actually works regardless of pretext quality: OUT-OF-BAND
  verification that doesn't rely on info the requester supplies
  (callback to a known-good number, independent manager confirmation)
```

## Malware Categories — Quick Reference

```
Virus:    needs a HOST FILE + user action to run/spread
Worm:     SELF-PROPAGATING across a network, no host file or user
          action needed — exploits a vulnerability/misconfig directly
Trojan:   disguised as legitimate software, user installs voluntarily;
          doesn't self-replicate — the "attack" IS the deception
Ransomware: encrypts data, demands payment for decryption key
Rootkit:  hides its own presence + other malware from detection, often
          at kernel/boot level

Detection approaches: signature-based (known hash/pattern match, fast
  but misses novel malware) vs. behavioral/heuristic (watches for
  malicious BEHAVIOR patterns, catches novel malware, more false
  positives)

Safe analysis: sandboxed, network-isolated environment ONLY (Any.Run,
  isolated VM with no path back to a real network) — never run unknown
  samples on a general-purpose machine
```

## Sniffing & Man-in-the-Middle

```
Switched network (modern default): sniffing your own interface only
  shows YOUR traffic — switches forward to specific ports, not broadcast

To intercept OTHER devices' traffic, need an ACTIVE technique:
  ARP spoofing/poisoning: forge ARP replies, both targets route through
    attacker as MITM
  MAC flooding: overwhelm switch's MAC table until it fails open and
    starts broadcasting like a hub (rare on modern switches, patched)

Sniffing = passive capture (once traffic reaches you)
MITM = active technique to GET other parties' traffic reaching you
  in the first place
```

## Denial of Service — Quick Reference

```
Volumetric: saturate network bandwidth/infra directly (UDP flood,
  amplification attacks) — the constraint is PIPE CAPACITY
Application-layer: exhaust a specific app-level bottleneck (Slowloris,
  expensive-query flooding) — the constraint is SERVER-SIDE COMPUTE/
  CONNECTION SLOTS, NOT bandwidth
  → a target with abundant bandwidth can still go down from this type;
    network-layer scrubbing alone doesn't stop it

DDoS = Distributed (multiple sources, often botnet) — much harder to
  block by source IP than a single-source DoS
```

## Session Hijacking

```
Session prediction: sequential/predictable session IDs → attacker
  guesses/brute-forces another active session
Fix: cryptographically random tokens, 128+ bits entropy, no inferable
  pattern from observing valid ones

Session timeout: doesn't PREVENT theft, but shrinks the WINDOW a stolen
  token stays useful — defense-in-depth layer, not a substitute for
  actual token security (httpOnly/Secure cookie flags, HTTPS-only, CSRF
  protection)
```

## Evading IDS/Firewalls — the general principle

```
Most evasion techniques exploit a gap between how the DETECTOR
interprets traffic and how the DESTINATION will actually process it:
  Fragmentation: split payload across packets so IDS never sees the
    full pattern in one packet; target's OS reassembles before processing
  Encoding: payload doesn't match a signature until decoded target-side
  Timing: space requests to stay under a rate-based detection threshold

KEY INSIGHT: this is a structural property of network detection
  generally (detector-side interpretation vs. destination-side
  processing can diverge), not a specific bug — new tools change which
  SPECIFIC tricks work, but the underlying gap persists. This is also
  why understanding evasion is a DEFENSIVE skill — it's how you find
  gaps in YOUR OWN detection before an attacker does.
```

## Wireless Security

```
WPA2: reasonably secure with a strong unique passphrase. Known
  weaknesses: 4-way handshake capturable + crackable offline against a
  WEAK passphrase (passphrase-strength problem, not a protocol break);
  KRACK vulnerability (patchable at client/AP level)
WPA3: current standard. SAE handshake specifically resists offline
  dictionary attacks against a captured handshake — WPA2's biggest
  practical weakness, addressed directly

Rogue AP: broadcasts a familiar SSID to trick auto-connecting devices —
  ZERO user interaction required (unlike phishing), since it exploits
  device auto-connect behavior, not human judgment
Defense: 802.1X/WPA2-Enterprise or WPA3-Enterprise with certificate-
  based auth (a fake AP can't complete cert-based auth); WIDS monitoring
  for duplicate SSIDs from unrecognized BSSIDs
```

## Cloud / IoT Hacking

```
Hardcoded credentials (baked into firmware, END USER CANNOT CHANGE)
  vs. default credentials (user COULD change, didn't) — hardcoded is
  categorically worse: no amount of user diligence fixes it; only a
  vendor firmware update (if one ever ships) or decommissioning does

IoT-specific risk factors (why it's disproportionately risky as a
  category): often no patching mechanism at all + installed by non-
  security staff + long unmonitored device lifespan (a smart thermostat
  doesn't "feel" outdated the way an old laptop does)
Defense: NETWORK SEGMENTATION for IoT/OT onto isolated VLANs is the
  single highest-leverage control — contains blast radius even when
  device-level credential fixes get missed

Container escape: breaking out of a container's isolation to the host
  (or, worse, OTHER TENANTS' containers on shared infra) — matters far
  more in MULTI-TENANT cloud environments than single-tenant, which is
  why cloud providers invest in kernel-level sandboxing (gVisor, Kata
  Containers) specifically for this threat model
```

## Certifications — CORRECTED (same OSCP pricing update as this
## course's Pen Testing technology; CEH pricing was already accurate)

```
CEH v13 (current version, verified) — $1,199 Pearson VUE / ~$950
  EC-Council remote proctoring, 125 MCQ, 4 hours, variable 60-85% cut
  score depending on question pool difficulty. Requires 2 years
  security experience OR official training to sit. This course's own
  "~$1,200" figure was already accurate — no correction needed here.
  CEH v13 specifically integrated AI-driven attack/defense content
  across the curriculum (not a separate module — woven throughout).

OSCP — this course's own certification.md lists $1,499; CURRENT
  VERIFIED price is $1,749 for the standard PEN-200 bundle (course +
  90-day labs + 1 attempt). Also: OSCP+ was introduced Nov 2024 as a
  3-year-renewable companion designation issued alongside the
  traditional LIFETIME OSCP — both awarded together on a pass. Full
  detail on this split is in this course's Pen Testing technology notes.

CEH DOMAIN WEIGHTS (from this course's own certification.md — these
  percentages are the actual differentiator vs. Pen Testing's OSCP-
  focused material):
  Web Server/App Hacking 12% (largest single domain) | Footprinting 9%
  | Scanning 9% | System Hacking 7% | Enumeration 6% | Intro 6% |
  Vuln Analysis 5% | Sniffing 5% | SQL Injection 5% | Wireless 5% |
  Cloud/IoT 5% | Social Engineering 4% | DoS 4% | Session Hijacking 4%
  | Evading IDS/Firewalls 4% | Malware Threats 3%
```
