# SOC & SIEM — PYQ (Previously Asked / Practice Questions)

**Framing note:** Like the certifications covered in other technologies in this course, SOC-relevant certifications (CySA+, GCIH, BTL1) are proctored and confidential — no public past-paper archive exists. What follows is built from the **current, live exam objectives** rather than an older or invented version.

**Time-sensitive correction:** this course's own `certification.md` lists CompTIA CySA+ as CS0-003 with a 5-domain breakdown. As of **June 23, 2026**, CompTIA retired CS0-003 and launched **CS0-004** as the current live exam (confirmed directly on CompTIA's own certification page) — same format (85 questions max, 165 minutes, 750/900 passing), but rebalanced to 4 domains: **Security Operations (34%), Vulnerability Management (26%), Incident Response and Management (24%), Reporting and Communication (16%)**. CS0-004 also adds explicit AI-related content (AI use in security operations, AI governance, AI-specific risks) that CS0-003 didn't cover at all. The questions below are framed around the current CS0-004 domains.

---

### 1. (Security Operations domain) A SIEM alert fires for "PowerShell with encoded command" (Base64 `-EncodedCommand`). What should an analyst check first, and why is this specific indicator worth flagging even before looking at what the decoded command does?

**Answer:** Check first whether this matches a known legitimate admin script/tool in the environment (some legitimate deployment tools do use encoded PowerShell) versus an unexpected source. The reason this indicator is worth flagging on its own, independent of the decoded content: encoding a command is a well-documented evasion technique specifically because plain-text malicious commands are easier for both humans and simple string-matching detections to catch — its presence at all is a mild signal regardless of payload, and it's cheap to decode (`[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($encoded))`) before doing anything else.

---

### 2. (Incident Response domain) Walk through the correct sequence of actions when ransomware is confirmed on an endpoint, and explain why the order matters.

**Answer:** Isolate the endpoint from the network **without powering it off** (preserves volatile memory — encryption keys or malware artifacts may only exist in RAM), then acquire a memory image, then a disk image, then begin eradication. The order matters specifically because containment and evidence preservation can conflict if done carelessly: a network-isolation method that triggers a shutdown routine (rather than a pure network-layer block) can destroy the exact evidence a later forensic investigation needs — this is precisely the failure mode described in this course's own Real World Scenarios file for this technology.

---

### 3. (Vulnerability Management domain) Two vulnerabilities have the same CVSS base score of 8.8. One has a known, actively-exploited public exploit; the other doesn't. Should they be prioritized the same way, and what framework addresses this directly?

**Answer:** No — CVSS alone measures theoretical severity, not real-world exploitation likelihood. **CISA's KEV (Known Exploited Vulnerabilities) catalog** exists specifically to close this gap: a vulnerability confirmed to be under active exploitation should generally jump the remediation queue regardless of its CVSS score being identical to an unexploited one. This distinction — CVSS severity vs. actual exploitation activity — is explicitly named in current CySA+ guidance as a required skill, not just a nice-to-have judgment call.

---

### 4. (Security Operations domain) An analyst is investigating "impossible travel" (same account, two countries, one hour). What corroborating evidence should be checked before treating this as confirmed malicious, and what corroborating evidence should be checked before dismissing it as benign?

**Answer:** Before confirming malicious: check for a new/unrecognized device fingerprint on the second login, check whether MFA was satisfied (and if so, whether that MFA approval itself looks suspicious — e.g., MFA fatigue/push-bombing patterns), and check for any subsequent suspicious activity from that session (mailbox rule changes, unusual data access). Before dismissing as benign: check the user's actual travel record/calendar if available, and check whether a VPN or corporate proxy legitimately routes that user's traffic through a different apparent geography — a common, boring cause of false "impossible travel" alerts that's worth ruling out before deeper investigation.

---

### 5. (Reporting and Communication domain) An executive asks "are we secure?" after a vulnerability scan reports 200 critical findings. What's wrong with answering that question with the raw finding count, and what should the answer actually communicate?

**Answer:** A raw count of "critical" findings (as labeled by the scanner's own severity rating) doesn't tell an executive what they actually need to decide — how much real risk exists and what's being done about it. A better answer translates count into risk-adjusted priority: how many of those 200 are on internet-facing or otherwise high-exposure systems, how many have a known active exploit (see Q3), and what the remediation timeline and compensating controls look like for the ones that can't be patched immediately. This is exactly the "technical vs. executive reporting" distinction this course's own certification material names as a distinct required skill, not just a communication-style preference.

---

### 6. (Incident Response domain) What's the actual difference between "containment" and "eradication," and why do skipping straight to eradication get flagged as a mistake in incident response training?

**Answer:** Containment stops the bleeding (isolate, block, disable) without necessarily removing the root cause yet; eradication removes the malware/backdoor/persistence mechanism entirely. Jumping straight to eradication before proper containment and evidence preservation risks alerting the attacker (if they have any monitoring on their own tooling) before you've fully scoped the intrusion, and risks destroying evidence needed to understand the full extent of compromise — you may eradicate the piece you found while missing a second persistence mechanism you hadn't discovered yet, and the attacker adapts once they notice the first one is gone.

---

### 7. (Security Operations domain) Given a log excerpt showing a single external IP failing SSH login 40 times in 2 minutes against 15 different usernames, what specific attack pattern does this indicate, and how does the detection differ from a simple "too many failed logins" rule?

**Answer:** This is a **password spray** pattern (many usernames, one IP, tight time window) rather than classic brute force (one username, many password attempts). A naive "N failed logins from one account" rule won't catch this, since each individual username only fails a couple of times — the detection needs to correlate failed attempts *across* usernames grouped by source IP, not just per-account, which is exactly the kind of correlation a SIEM does that a single host's local log monitoring can't.

---

### 8. (Vulnerability Management domain) A vulnerability scan can only be run as either "credentialed" or "uncredentialed." What's the practical tradeoff, and which one would miss a locally-exploitable privilege escalation flaw?

**Answer:** An uncredentialed scan probes the target the way an external attacker would, without login access — it sees what's exposed on the network but generally can't inspect local software versions, patch levels, or configuration in depth. A credentialed scan logs into the target and inspects it from the inside, catching far more (including local privilege escalation vulnerabilities that require inspecting installed software versions and OS configuration directly). An uncredentialed scan alone would very plausibly miss a local privilege-escalation flaw, since exploiting it doesn't require anything visible from outside the host.

---

### 9. (Reporting and Communication domain) What should a post-incident "lessons learned" report include beyond a technical timeline, and why does a blameless framing matter operationally, not just culturally?

**Answer:** Beyond the technical timeline (what happened, when, how it was detected/contained/resolved), it should include root cause analysis, what worked well, what didn't, and concrete follow-up actions with owners and deadlines. Blameless framing matters operationally because a report that assigns individual blame creates a real incentive for people to under-report or hide details of what actually happened in future incidents — which directly degrades the accuracy of every future lessons-learned process, not just morale.

---

### 10. (Security Operations domain, AI-related — new in CS0-004) An organization deploys an AI-assisted SOC tool that auto-triages alerts before an analyst sees them. What's a legitimate SOC-operations concern specific to this, beyond generic "AI might be wrong"?

**Answer:** A specific, non-generic concern: if the AI triage tool's own decision logic isn't auditable/explainable, an analyst reviewing a closed alert later (e.g., during the exact kind of "re-review closed alerts" practice recommended for catching false-closures, discussed in this course's own Real World Scenarios file) may not be able to reconstruct *why* the tool closed it — which undermines the after-the-fact audit trail that's often a compliance requirement, independent of whether the AI's original decision was actually correct. This is exactly the kind of "black box" concern named in current industry incident reporting (Mandiant's M-Trends 2026, for instance, explicitly flags AI-driven decision opacity as a governance issue, not just an accuracy one) — auditability of the decision, not just correctness of the outcome, is the thing worth verifying before trusting automated triage broadly.
