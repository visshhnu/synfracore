# SOC & SIEM — FAQ

## What's the actual difference between a SIEM and an EDR? People use them almost interchangeably.

A SIEM aggregates and correlates logs from *everywhere* — network devices, cloud, identity systems, applications, endpoints — and is the tool for cross-source correlation and long-term log retention/compliance reporting. An EDR (Endpoint Detection and Response) is specific to endpoints (laptops, servers) and provides much deeper telemetry about what's happening on that one machine (process trees, memory, file/registry changes) plus the ability to take direct action there (isolate the host, kill a process). In practice, EDR telemetry is one of the log sources that feeds *into* a SIEM — they're complementary layers, not competing tools, and a mature SOC uses both together rather than picking one.

## Why does my organization's false-positive rate feel so much higher than the "20-30%" figures quoted everywhere?

Those figures are rough industry benchmarks, not universal guarantees, and they vary enormously by how well an environment's detection rules have been tuned. A SIEM with default vendor rules and no ongoing tuning effort will often run well above 30% false positives — the 20-30% range assumes active, ongoing rule tuning based on what's actually being closed as false positive. If your rate is meaningfully higher, that's usually a signal to invest time in tuning specific noisy rules (adding exception conditions for known-legitimate activity) rather than assuming something is fundamentally wrong with your SIEM or your analysts.

## Is a "true positive" the same thing as "this is definitely a real attacker"?

Not quite — worth separating two different questions. "True positive" means the alert correctly identified the activity it was designed to detect (e.g., a rule for "PowerShell with encoded command" firing on an actual instance of that). Whether that activity is *malicious* is a separate judgment call — a true positive can still turn out to be legitimate admin activity that happens to match the pattern (someone's deployment tool genuinely does use encoded PowerShell). "True positive" is about detection accuracy; "malicious vs. benign" is about intent and context, and confirming both is what full triage actually requires.

## Why do SOC job postings so often ask for "scripting" skills when the job is mostly using a SIEM's point-and-click interface?

Because a meaningful amount of real SOC work is automating repetitive investigation steps that the SIEM's UI doesn't do out of the box — enriching an alert by calling a threat-intel API, parsing a log format the SIEM doesn't natively support, or writing a quick script to correlate two data sources the SIEM can't join directly. Python is the most commonly requested language for this, and even basic scripting ability (loops, string parsing, calling an HTTP API) covers the large majority of what's actually asked for — it's rarely "write production software" so much as "automate a repetitive analyst task."

## What does "threat hunting" actually mean, in concrete terms, versus just reading SIEM alerts?

Reading SIEM alerts is *reactive* — you're responding to something the SIEM's existing rules already decided was worth flagging. Threat hunting is *proactive* — you start from a hypothesis about a specific kind of activity that might be happening but wouldn't necessarily trigger an existing alert (e.g., "could an attacker be using a living-off-the-land technique that doesn't match our current detection rules?"), then go query the raw telemetry directly to test that hypothesis, rather than waiting for an alert to tell you something's wrong. A successful hunt often ends with a new detection rule being built so that the same pattern *does* generate an alert automatically next time — hunting and automated detection feed each other over time rather than being separate, competing activities.

## If MITRE ATT&CK maps "what attackers do," why doesn't the framework tell me what to actually do about it?

Because ATT&CK is explicitly a knowledge base of adversary behavior (tactics and techniques), not a defensive framework — mapping a detected behavior to an ATT&CK technique ID tells you *what the attacker is trying to do*, which is genuinely useful for understanding intent and likely next steps, but it's a separate question from *what mitigations or detections address it*. MITRE's own **D3FEND** framework exists specifically to map defensive countermeasures to ATT&CK techniques — increasingly named alongside ATT&CK in current SOC certification material for exactly this reason (they're meant to be used together, not as substitutes for each other).

## Why do some SOCs run 24/7 with in-house staff, and others use a managed service (MSSP), and how do I know which a given job posting is describing?

This usually comes down to organization size and whether security operations is core enough to the business to justify building a full round-the-clock in-house team versus outsourcing base-level monitoring to a Managed Security Service Provider and keeping a smaller in-house team for escalations and strategic work. Job postings for MSSP-side SOC analyst roles typically describe working across *multiple client environments* rather than one company's own infrastructure — a meaningfully different day-to-day than an in-house SOC analyst role, worth clarifying explicitly in an interview if the posting doesn't make it clear which model you'd be working in.

## Is it possible to get into a SOC analyst role without a security-specific degree?

Very much so — this is one of the more accessible entry points into cybersecurity specifically because L1/Tier-1 roles are largely about following a structured triage process rather than requiring deep prior specialization, and a meaningful share of working SOC analysts came from general IT/helpdesk backgrounds rather than dedicated security degrees. Entry-level certifications (Security+, then working toward CySA+) plus hands-on practice (home-lab SIEM setups, platforms like TryHackMe/LetsDefend that simulate real SOC ticket queues) are commonly cited as a practical path in without a specific degree.

## What's the real difference between IDS/IPS and a firewall — don't they all "block bad traffic"?

A traditional firewall makes allow/block decisions based on port, protocol, and source/destination address — it doesn't inspect the actual content or behavior of allowed traffic. An IDS/IPS inspects traffic *content and patterns* for known attack signatures or anomalous behavior, even on a port/protocol combination the firewall would otherwise allow through (e.g., malicious content riding on port 443, which a firewall would pass simply because HTTPS is generally allowed). IDS is passive (alerts only); IPS sits inline and can actively block. In a modern environment these often aren't fully separate boxes — a next-generation firewall (NGFW) frequently bundles firewall + IPS functionality together, which is part of why the distinction can feel blurry in practice.

## Why does dwell time matter as a metric if an organization already has a fast MTTD for the alerts it does catch?

Because MTTD only measures how fast you detect what your existing detections are built to catch — dwell time (from *actual compromise* to detection, regardless of how) captures the gap for techniques or entry points your current detection coverage doesn't address at all. An organization can have an excellent MTTD for its known alert types and still have attackers sitting undetected for months via techniques that simply don't trigger any existing rule — which is exactly the split described in Mandiant's own 2026 data (ransomware dwell time dropping, while stealthy espionage-style intrusions average 122 days) — a single MTTD number doesn't capture that split at all.
