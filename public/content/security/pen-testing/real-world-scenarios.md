# Penetration Testing — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real engagements described in industry writeups and postmortems, not one specific traceable client engagement (client confidentiality is fundamental to this field, so specific real engagements generally aren't publishable in detail anyway).

---

## Scenario 1 (illustrative/composite): The critical finding that was actually a scope violation

**The pattern:** A pen tester running an authorized web application test discovers what looks like a promising IDOR vulnerability, follows it further than the immediate finding to see how deep it goes, and ends up pivoting into a database that turns out to belong to a completely different application — one hosted on shared infrastructure but explicitly listed as out-of-scope in the signed rules of engagement. The tester now has evidence of access to a system they were never authorized to touch.

**Why this matters more than it might first seem:** this isn't just a technical mistake — it's the exact line this course's own material repeatedly emphasizes (written authorization, defined scope) existing specifically to prevent. Even with entirely good intentions and a genuinely authorized engagement covering the *primary* target, accessing an out-of-scope system without separate authorization can create real legal exposure for both the tester and the client, and it damages the trust the entire engagement depends on.

**What actually prevents this, beyond "read the scope document":**
- **Stop and get explicit written clarification the moment a finding leads toward infrastructure that might not clearly belong to the scoped target** — shared hosting, shared databases, and multi-tenant cloud environments make "is this actually in scope" a genuinely harder question than it sounds, and the right move is pausing to ask, not assuming and continuing.
- **Document the boundary the instant it's reached**, even if that means stopping mid-investigation on something that looks like a great finding — an incomplete finding you can go back to with authorization is recoverable; an unauthorized access event is not something documentation can undo after the fact.
- **This is exactly why "emergency contact" is a standard line item in a pre-engagement rules-of-engagement document** (as this course's own Fundamentals material lists) — a same-day call to the client's point of contact to clarify scope ambiguity is the correct move, not a sign of a failed engagement.

---

## Scenario 2 (illustrative/composite): The privilege escalation finding that the client dismissed as "theoretical"

**The pattern:** A pen tester finds a Linux privilege escalation path via a misconfigured cron job running as root that includes a world-writable script — a textbook example of exactly the kind of check this course's own Intermediate material lists (`cat /etc/cron*`, checking for world-writable files a lower-privileged user could modify). The client's engineering team pushes back on the report, arguing the finding requires "an attacker already having shell access to the box," which they consider an unrealistic starting point, and downgrades the finding's priority in their internal tracker.

**Why this dismissal is a common and genuinely risky misunderstanding, not an unreasonable business judgment on its own:** the finding's premise ("attacker already has some foothold") is not actually a rare or contrived starting point — it's the exact starting point of privilege escalation as a *category*, and the reason privilege escalation matters at all is that initial footholds (a compromised low-privilege web app account, a phished employee's low-privilege shell) are common in real intrusions. Dismissing a privilege-escalation finding because it "requires prior access" misunderstands what privilege escalation findings are for — they're specifically about limiting the blast radius *after* some other, often much easier, initial compromise succeeds.

**What actually addresses this kind of pushback, beyond re-explaining the technical finding:**
- **Frame the finding in terms of blast radius, not just theoretical exploitability** — "if the web application vulnerability found elsewhere in this same report is exploited, this cron misconfiguration is what turns a limited web-shell foothold into full root" connects two findings into a concrete attack chain a business stakeholder can actually reason about, rather than leaving each finding to be judged in isolation.
- **This is exactly what a good report's "Attack Narrative" section (in this course's own Report Writing structure) is for** — showing the story of how findings chain together is often more persuasive to a skeptical stakeholder than the severity rating on any single finding.
- **Low-cost, high-value fixes deserve to be pushed even against pushback** — removing a world-writable bit from a root cron script is a trivial fix relative to the blast-radius reduction it provides, and that cost-benefit case is worth making explicitly rather than assuming the CVSS score alone will carry the argument.

---

## Scenario 3 (illustrative/composite): The bug bounty report that got rejected for missing reproduction steps

**The pattern:** A researcher finds a genuine SSRF vulnerability in a bug bounty program's in-scope application, confirms it works, and submits a report that describes the vulnerability conceptually ("the URL-fetch feature doesn't validate against internal IP ranges") without including the exact request/response pair, timestamps, or a step-by-step reproduction path. The triage team closes it as "unable to reproduce" and the researcher, convinced they found something real, escalates in frustration rather than simply resubmitting with better evidence.

**Why this is a common, avoidable failure mode rather than a triage team being unreasonable:** a triage team working through a high volume of submissions (many of which are genuinely invalid, duplicate, or out of scope) has to prioritize reports they can *quickly verify* — and a conceptual description without concrete evidence puts the burden of re-discovering the exact reproduction path back on the triage team, which is both slower and more likely to result in a "can't reproduce" close, independent of whether the underlying vulnerability is real.

**What this course's own material already gets right, worth reinforcing specifically:** the Bug Bounty section's own tip — "always document with screenshots and HTTP traffic" — exists precisely to prevent this outcome. A well-documented report includes: the exact request (method, URL, headers, body), the exact response confirming impact (in the SSRF case, the actual metadata/internal-service response body returned), and numbered steps a triage engineer with no prior context could follow to reproduce it themselves without needing to ask a single clarifying question. The gap between "I found something real" and "the triage team can verify it fast" is almost always evidence quality, not the researcher's technical skill — and it's the single most controllable factor in whether a valid finding gets accepted on the first submission.
