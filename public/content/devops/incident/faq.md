# Incident Management — FAQ

## If "restore service first, root cause second" is the rule, doesn't that mean root cause analysis is less important?

Not less important — just correctly sequenced. Root cause analysis is exactly as valuable as ever; it just happens in the post-mortem, once service is already restored, rather than being a prerequisite to restoring it. The rule exists because thorough root-causing *while users are actively affected* trades continued impact for certainty you don't yet need — a rollback that removes the suspected cause within minutes, even without 100% confirmed root cause, is almost always the better call than spending that same time confirming the cause in detail before acting. Post-incident, that same thoroughness is exactly what a good post-mortem is for.

## Why declare a formal "incident" at all instead of just fixing the problem quietly?

Declaring an incident does real, practical work beyond labeling — it triggers a known communication cadence (so stakeholders aren't left guessing), gives someone explicit authority to make fast calls under uncertainty (the Incident Commander role), and creates a paper trail that makes an eventual post-mortem possible at all. "Just fixing it quietly" might genuinely be fine for something truly minor, but for anything with real blast radius, quiet handling risks the exact silence problem this course's own material warns about — stakeholders assuming nobody's aware of or working on a growing issue, and no structured record existing afterward to learn from.

## Is a fast MTTR always a sign of a healthy incident response process?

Not entirely on its own — a fast MTTR measures response speed, not whether the underlying cause actually got fixed. A team that consistently rolls back fast and hits great MTTR numbers, while the same underlying bug causes a new incident every few weeks, has an excellent response process and a real, unaddressed problem simultaneously — this is exactly the trap covered in this course's own Real World Scenarios. MTTR is a genuinely useful metric, but it needs to be read alongside "are the same root causes recurring," not in isolation.

## Why does an Incident Commander sometimes hand off command to someone else mid-incident?

This is standard practice for a long-running incident, not a sign anything went wrong — ICs get tired, incidents can run for hours, and a mid-incident handoff (done deliberately, with a clear transfer of context) keeps the role sharp rather than having a fatigued IC making increasingly poor judgment calls late into an extended incident. The key is that it's an explicit, communicated handoff ("I'm handing IC to Alex as of now") rather than an ambiguous drift where it's unclear who's actually in charge at a given moment.

## What's the actual difference between an SLA breach and an incident?

An incident is the operational event (something's broken); an SLA breach is a specific *contractual/measurement* consequence that may or may not follow from it, depending on the SLA's defined terms (uptime percentage over a billing period, response-time commitments, etc.). A short P1 might not breach a monthly uptime SLA at all if the SLA's threshold has enough buffer; conversely, several small, sub-P1 incidents can cumulatively breach an SLA even though none of them individually felt severe enough to escalate loudly. Treating "did we breach the SLA" as the only lens for how seriously to take an incident misses genuinely important operational incidents that don't happen to cross that specific contractual threshold.

## Why do some teams intentionally run "game days" or simulated incidents rather than just learning from real ones as they happen?

Because waiting for real incidents to build incident-response muscle memory means your team's first attempt at things like the IC/technical-responder role split (see this course's own Real World Scenarios) happens under real, high-stakes pressure rather than in a lower-stakes practice setting. A simulated incident lets a team practice the actual mechanics — declaring, communicating, escalating, running through a mitigation decision — without the underlying system actually being broken, which is a much better environment to fix process gaps in than a genuine P1 with real user impact on the line.

## Does a blameless post-mortem culture mean nobody is ever held accountable for anything?

No — it specifically separates *accountability for fixing the system* from *blame directed at an individual for making a mistake*. Blameless doesn't mean "nothing matters" — action items still get assigned to specific owners with specific due dates, and failing to follow through on an owned action item is a legitimate accountability gap worth addressing. What blameless culture avoids is treating the person who happened to trigger an incident (by, say, deploying the change that caused it) as the *root cause* — the actual root cause is almost always that the system allowed one person's ordinary, expectable mistake to cause a full outage, and that system-level gap is what gets fixed, not the individual punished.

## Why does severity classification matter so much if the team is going to respond quickly regardless?

Because severity drives *who* gets involved and *how loudly*, not just response speed in the abstract — misclassifying a real P1 as a P3 doesn't just slow down the response, it means the wrong (too small, too junior, or simply unaware) set of people are even looking at it, and stakeholders who should be notified aren't. This course's own material's advice to "always err toward higher severity" reflects this specifically: the cost of over-classifying (a few extra people briefly paged for something that turns out to be more minor) is much smaller than the cost of under-classifying (a real, serious incident sitting with inadequate attention because it was initially mislabeled as low-severity).

## Is it a problem if a post-mortem's action items include things like "add more tests" or "improve monitoring," which seem obvious?

The concern isn't that these are wrong in general — better tests and monitoring are usually genuinely good ideas — it's that vague, generic action items are far less likely to get done than specific ones, and they're a common way for a post-mortem to feel thorough without actually committing to anything concrete. "Add more tests" without specifying what scenario the missing test should have caught is worth challenging in post-mortem review — the useful version names the *specific* gap ("add an integration test that validates behavior under production-scale connection pool settings," as in this course's own post-mortem template example) tied to the actual failure that occurred, not a generic aspiration that could apply to nearly any incident.

## Why do incident communication templates emphasize saying "still investigating, next update at [time]" even when there's genuinely nothing new?

Because the absence of an update is itself information to whoever's watching — and the information it conveys ("nobody knows what's happening, or nobody's actively working on it") is usually false and actively damaging to confidence in the response, even when the team is in fact working hard on it. A scheduled "still investigating" update, even with zero new content, confirms the incident is actively owned and being worked, and sets an expectation for exactly when the next real update will come — which is a meaningfully different experience for anyone affected than uncertain silence, even though the underlying technical state is identical in both cases.
