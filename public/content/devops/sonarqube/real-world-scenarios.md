# SonarQube — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production SonarQube usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The Security Hotspot backlog that grew silently for a year

**The pattern:** A team enables SonarQube's default configuration, including Security Hotspot detection, and their Quality Gate correctly requires new Hotspots to be reviewed before a PR merges — a genuinely solid setup. Over the following year, individual PRs each get their own small number of new Hotspots reviewed correctly, one at a time, as part of normal PR flow. But nobody ever looks at the AGGREGATE Hotspot backlog across the whole project — a slow trickle of Hotspots that were reviewed at PR time but marked with a vague, undocumented "SAFE" justification (or in some cases, teams later realize, marked safe by a developer under time pressure without genuinely verifying exploitability) accumulates into a large body of hotspots whose "SAFE" status nobody would actually stand behind if re-examined carefully.

**Why per-PR review discipline alone didn't prevent this:** the per-PR gate correctly enforced that EVERY new Hotspot got SOME review before merge — but "reviewed" and "reviewed carefully and correctly" aren't the same thing under real time pressure, and nothing in the per-PR process caught a pattern of rushed, low-quality "SAFE" justifications accumulating in aggregate. A gate enforcing "was this looked at" doesn't guarantee "was this looked at well," and nothing was periodically re-checking the QUALITY of past justifications in aggregate.

**Why this is a genuinely easy trap, not obvious negligence:** each individual PR-time review felt reasonable in isolation — a developer under normal delivery pressure making a quick, plausible-sounding judgment call on one Hotspot doesn't feel like cutting a corner the way ignoring a Bug outright would. The problem only becomes visible in aggregate, across many individually-reasonable-seeming decisions, which is exactly why nobody caught it in real time.

**What actually prevents this:**
- **Periodically audit a SAMPLE of "SAFE"-marked Hotspots for justification quality**, not just checking that a justification field is non-empty — spot-checking whether the stated reasoning actually holds up to scrutiny, on a regular cadence, not only at PR time.
- **Require justification TEXT, not just a status flag, for every SAFE marking**, and make that text visible/reviewable in aggregate (not buried per-PR) — a documented reason is what makes a later audit possible at all.
- **Track Hotspot review-quality as its own periodic exercise, separate from the per-PR gate**, treating "was every Hotspot reviewed" and "were those reviews actually correct" as two different, both-necessary questions.

---

## Scenario 2 (illustrative/composite): The Quality Gate that was technically passing but had quietly stopped meaning anything

**The pattern:** A team's Quality Gate requires 80% coverage on New Code — a reasonable bar, correctly configured at adoption. Over time, a specific type of file (auto-generated code, or a category of trivial getter/setter boilerplate) starts being excluded from coverage calculation via a scanner configuration change, made originally for a legitimate reason (auto-generated code genuinely shouldn't count against a coverage target). But the exclusion pattern is broader than intended, and over subsequent months, more and more genuinely hand-written, meaningfully-testable code ends up matching that same broad exclusion pattern — inflating the effective coverage percentage without any corresponding increase in actual test writing. The gate keeps passing at 80%+ throughout, while the REAL proportion of meaningfully-tested new code has actually been declining.

**Why a passing gate can mask a real, worsening problem:** the gate's numeric threshold stayed satisfied the entire time — nothing ever "failed" to trigger investigation. The actual drift (an overly broad exclusion pattern quietly capturing more and more real code over time) had no natural forcing function surfacing it, since the visible metric (coverage %) looked fine throughout. This is the same class of "silently drifting, technically-passing" problem as an over-broad access policy that never gets revisited because nothing appears broken.

**What actually prevents this:**
- **Periodically review WHAT is actually being excluded from coverage/quality calculations**, not just trusting that the exclusion pattern still matches only its originally-intended scope — configuration drift in an exclusion rule is exactly as real a risk as drift anywhere else.
- **Track the ABSOLUTE volume of newly-added, non-excluded code alongside the coverage PERCENTAGE** — a shrinking pool of code actually being measured, even at a stable or improving percentage, is itself a signal worth investigating.
- **Treat exclusion pattern changes as reviewable configuration changes**, with the same scrutiny given to a Quality Gate threshold change itself, rather than a low-visibility scanner-config tweak nobody else on the team necessarily notices or reviews.

---

## Scenario 3 (illustrative/composite): The custom rule that made sense for one team and became noise for everyone else

**The pattern:** One team, working on a security-sensitive service, adds a custom Quality Profile rule flagging a specific pattern genuinely risky in THEIR codebase's context. The rule gets added to the ORGANIZATION-WIDE default Quality Profile (rather than a profile scoped just to that team's projects), reasoning "this seems like generally good practice, other teams should probably follow it too." For most other projects across the organization, the flagged pattern is either genuinely not risky in their different context, or is such an established, unavoidable convention in their specific domain that the rule fires constantly with no realistic fix — teams start reflexively suppressing or ignoring findings from that specific rule across the board, and that habit of dismissing findings from "that one noisy rule" begins bleeding into how seriously other, genuinely important findings from SonarQube get taken too.

**Why applying one team's genuinely good rule organization-wide backfired:** a rule that's well-calibrated for one specific codebase's actual risk profile and patterns isn't automatically well-calibrated for every other codebase — context that made the rule genuinely valuable for the originating team (their specific data-handling patterns, their specific risk profile) didn't transfer to teams with different codebases and different genuine risk profiles.

**What actually prevents this:**
- **Scope new custom rules to the specific project/team profile where they're actually validated as valuable first**, rather than defaulting to organization-wide rollout — expand deliberately to other teams only after confirming the rule's value transfers to their actual context too.
- **Treat "this rule fires constantly with no realistic fix, across many unrelated projects" as a signal the rule itself needs reconsidering**, not a signal that every team should just get better at ignoring it — persistent, widespread noise from one rule is itself informative feedback about that rule's calibration.
- **Protect the credibility of the WHOLE tool by not letting one poorly-scoped rule erode trust in every other finding** — a team's growing habit of reflexively dismissing SonarQube findings, once established for one bad reason, doesn't stay neatly contained to only that one rule.
