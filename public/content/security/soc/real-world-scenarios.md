# SOC & SIEM — Real World Scenarios

A note on framing: Scenario 1 is built directly from Mandiant's own published M-Trends 2026 findings (a real, current industry benchmark report, cited and linked below) rather than a specific named breach. Scenarios 2 and 3 are illustrative/composite — common patterns from SOC postmortems industry-wide, not one traceable incident.

---

## Scenario 1 (grounded in current published data): The 22-second handoff problem

**What the data actually shows:** Mandiant's M-Trends 2026 report — based on over 500,000 hours of incident response investigations conducted in 2025 — documents a structural shift in how intrusions unfold. In a growing share of cases (9% of 2025 investigations, up from 4% in 2022), one threat group gains initial access and then hands that access off to a separate, specialized group for the actual follow-on attack. In 2022, the median time between initial access and that handoff was over 8 hours. In 2025, it had collapsed to **22 seconds**.

**Why this matters specifically for SOC triage:** an alert that looks like low-priority reconnaissance — a single scan, a single suspicious login — can no longer be safely treated as "we'll get to it during business hours." By the time a P3/P4 alert sits in a queue, the access it represents may have already been sold or handed to a completely different, more capable threat actor. Mandiant's own framing of this finding is that alerts traditionally considered lower priority can very quickly become significant compromises.

**What this actually changes about how a SOC should operate (not just "be faster," which isn't actionable on its own):**
- **Triage queues need a re-think of what "low severity" means for access-type alerts specifically** (successful login from new geography, new external scanning activity against internet-facing assets) — even if nothing else about the alert looks unusual yet, these are exactly the alert types this handoff pattern rides on.
- **Automated first-response actions matter more than they used to.** A SOAR playbook that auto-enriches an alert (IP reputation lookup, asset criticality, user risk score) the moment it fires — before a human even opens it — compresses the time-to-context in a way manual triage can't match at 22-second timescales.
- **This is a genuine argument for context-rich automation over pure "alert faster" tooling** — the bottleneck isn't detection speed alone, it's how quickly an analyst can get enough context to make a contain-or-wait decision.

**Also from the same report, worth knowing as context:** the same report found global median dwell time (how long an attacker sits undetected) rose to 14 days in 2025, up from 11 in 2024 — but this masks a real split: ransomware-related dwell time actually *dropped* to a median of 9 days (attackers moving faster to monetize), while long-term espionage and certain insider-threat categories average 122 days. "Attackers are getting faster" and "attackers are getting stealthier" are both true, just for different categories of attacker with different goals — worth keeping in mind before assuming a single trend applies to every alert type your SOC handles.

*(Source: Mandiant M-Trends 2026, Google Cloud, published March 2026 — https://cloud.google.com/blog/topics/threat-intelligence/m-trends-2026)*

---

## Scenario 2 (illustrative/composite): The alert that was correct and still got ignored

**The pattern:** A SIEM correctly fires an alert for impossible travel — the same user account logging in from two countries within an hour, a genuinely strong indicator of credential compromise. The analyst on shift checks the alert, sees the user works remotely and travels internationally somewhat often for their role, closes it as a likely false positive without checking anything else, and moves to the next alert in a 200-alert queue. Three weeks later, that same credential is used in a much larger intrusion, and log review shows the impossible-travel alert was the actual first sign of compromise.

**Why this is a systemic problem, not just one analyst's mistake:** alert fatigue from a high false-positive rate (this course's own material puts realistic SOC false-positive rates at 20-30%, and many SOCs run higher) creates a real incentive to close alerts quickly rather than investigate thoroughly, especially for an alert type that has a plausible, easy-to-accept innocent explanation. The fix isn't "tell analysts to be more careful" — that doesn't scale and isn't a fair ask under sustained alert volume.

**What actually addresses this:**
- **Tune the alert to require corroborating context before it's closable as routine**, not just travel plausibility — e.g., cross-reference against the user's actual travel/calendar system, or require checking whether the "second location" login used a new device fingerprint, not just a new IP.
- **Track false-closure rate as its own metric**, not just false-positive rate — i.e., periodically re-review a sample of *closed* alerts against later threat intel/IOCs, not just open ones, to catch cases where the closure itself was the mistake.
- **Reduce overall alert volume through better upstream tuning** (this course's own material identifies <100 alerts per analyst per day as a manageable target) so each alert that does fire gets the attention it needs — a queue of 200+ alerts a day structurally pressures analysts toward exactly this kind of quick, under-investigated closure.

---

## Scenario 3 (illustrative/composite): The playbook that assumed the wrong containment order

**The pattern:** A ransomware-detection playbook's first automated step is to isolate the affected endpoint from the network — a correct instinct on its own. But the playbook isolates by disabling the network interface entirely, rather than by blocking outbound C2 traffic while preserving the ability to pull a live memory image first. By the time the forensics team accesses the machine, the network isolation has already triggered a graceful shutdown routine on that particular endpoint class, and volatile memory — including any encryption keys or in-memory-only malware artifacts — is gone.

**Why this is a genuinely easy playbook mistake to make:** "isolate immediately" is correct and urgent advice (this course's own Ransomware playbook material says exactly this — isolate first, don't turn off, to preserve memory evidence), but *how* a given endpoint's specific isolation mechanism behaves under automation isn't always tested against that specific class of hardware/OS before the playbook goes live. The instruction was right; the implementation detail wasn't verified against real device behavior.

**What actually prevents this:**
- **Test automated containment actions against a real replica of each asset class before relying on them during an actual incident** — not just "does the API call succeed," but "does the target device actually end up in the state we assumed."
- **Sequence memory acquisition before network-level isolation actions that could trigger a shutdown**, where the two can be made to not conflict — or build the memory-capture step directly into the automated playbook itself, rather than treating it as a manual follow-up step that happens after automation has already run.
- **Document known isolation-method quirks per asset type** (this laptop model powers off on NIC disable; this server class doesn't) as part of the playbook itself, not as institutional knowledge that lives only in one senior analyst's head.
