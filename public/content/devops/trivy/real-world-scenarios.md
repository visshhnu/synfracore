# Trivy — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Trivy/container-scanning usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The gate that started failing every build, so the team disabled it entirely

**The pattern:** A team adds Trivy image scanning with `--exit-code 1 --severity HIGH,CRITICAL` directly into their CI pipeline as an immediate hard gate, without first running it in report-only mode to see what a real baseline scan of their existing images would even look like. The very first run against their existing, previously-unscanned base images finds dozens of HIGH/CRITICAL findings accumulated over years of unpatched base image usage — every single build now fails. Under delivery pressure, the team's response is to remove the gate entirely (rather than triaging the baseline), reasoning "we'll add it back properly later once we have time to deal with all this."

**Why turning on a hard gate against an unscanned codebase backfires predictably:** a brand-new gate against years of accumulated, previously-invisible findings will almost always surface an overwhelming baseline on day one — this isn't a sign the tool is broken or overly strict, it's the expected result of finally measuring something that was never measured before. But an overwhelming, un-triaged wall of failures under delivery pressure predictably leads to the gate being ripped out entirely rather than worked through, which is a worse outcome than never having added it, since "we tried scanning once and it was too noisy" often becomes the reason nobody tries again.

**What actually prevents this:**
- **Run a new scanning gate in report-only mode first** (no `--exit-code`), specifically to see the real baseline before committing to a hard gate — this reveals the scope of the problem without immediately blocking anyone's work.
- **Triage the baseline explicitly** — genuinely fixable findings get fixed, genuinely accepted-risk findings go into a documented `.trivyignore` with actual review, and only THEN is the hard gate enabled against a now-realistic starting point.
- **Gate NEW findings going forward more strictly than the historical baseline**, if a full baseline triage isn't immediately feasible — this at least stops the problem from growing while a backlog of pre-existing findings gets worked through over time, rather than an all-or-nothing choice between full triage now or no gating at all.

---

## Scenario 2 (illustrative/composite): The .trivyignore list that outlived the reason it was created

**The pattern:** During an early rollout, a specific CVE finding is added to `.trivyignore` with a genuinely valid reason at the time: "no fix available upstream yet, accepted risk, reviewed 2025-11-01." The upstream package maintainer releases a patched version six months later. Nobody revisits the `.trivyignore` file to check whether previously-accepted findings now have available fixes — the entry simply stays, silently suppressing a vulnerability that could have been resolved by a routine dependency bump the team was never prompted to make.

**Why a reviewed, well-documented ignore entry can still become a real problem later:** the review and documentation at the TIME of creation were genuinely good practice — the failure isn't in how the entry was originally added, it's that nothing in the process ever prompts a re-review once circumstances change (a fix becomes available). A `.trivyignore` file, treated as write-once rather than periodically re-audited, accumulates exactly this kind of stale, no-longer-justified suppression over time, even when every individual entry was added carefully.

**What actually prevents this:**
- **Periodically re-scan WITHOUT the ignore list applied** (or diff against it) specifically to check whether any previously-accepted finding now has a fix available that wasn't available when the exception was first documented.
- **Set a review date on every `.trivyignore` entry, not just a creation date** — a documented policy of re-checking entries past their review date on a regular cadence, rather than treating "documented once" as permanently sufficient.
- **Track ignored findings as a visible, tracked backlog item, not just a suppressed line in a config file** — giving the exception the same visibility a real open issue would have, rather than something that only ever gets looked at again by accident.

---

## Scenario 3 (illustrative/composite): The image that was scanned clean, deployed, and became vulnerable a week later — with nobody watching

**The pattern:** A team's CI pipeline scans every image at build time and gates on HIGH/CRITICAL findings — a genuinely solid build-time practice. An image passes cleanly and gets deployed to production. One week later, a new CVE affecting a package already present in that (already-deployed, unchanged) image is published and added to Trivy's vulnerability database. Because the team's ONLY scanning happens at build time (triggered by new commits), and nobody has made a new commit to that service in months, this newly-discovered vulnerability in an already-running production workload goes completely undetected — the build-time gate that worked perfectly at the time simply has no mechanism to catch a vulnerability discovered after the fact.

**Why a well-functioning build-time gate alone still leaves a real gap:** build-time scanning is triggered by CODE CHANGES, but a new vulnerability being discovered in an existing, unchanged dependency isn't a code change — it's new information about something that was already there. A team can have an excellent, strictly-enforced build-time gate and still be running a genuinely vulnerable production workload for an extended period, simply because nothing prompted a re-scan of code that hasn't changed.

**What actually prevents this:**
- **Schedule periodic re-scans of already-deployed images/workloads independently of new commits** — via `trivy k8s` on a cron schedule, or the Trivy Operator's continuous cluster scanning, which re-checks running workloads against the current database on an ongoing basis regardless of whether any new build has happened.
- **Treat build-time gating and continuous cluster scanning as two DIFFERENT, both-necessary controls**, not one control satisfying the other — build-time gating prevents shipping a KNOWN-bad image; continuous scanning catches a GOOD image becoming known-bad after deployment.
- **Alert on new findings surfaced by scheduled re-scans with the same urgency as a failed build-time gate** — a vulnerability discovered in a running production workload deserves prompt attention, not a lower priority just because it wasn't caught by the "main" build-time gate.
