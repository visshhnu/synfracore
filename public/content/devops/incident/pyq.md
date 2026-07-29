# Incident Management — PYQ (Previously Asked / Practice Questions)

**Framing note:** Incident Management doesn't have a dedicated standalone certification the way some other technologies in this course do — the closest formal credential is **ITIL 4 Foundation** (administered by PeopleCert), which covers Incident Management as one of its named ITSM practices alongside Problem Management, Change Enablement, and others. Verified current format: 40 multiple-choice questions, 60 minutes, 65% (26/40) passing, ~$300-350 standalone voucher (though PeopleCert commonly bundles it with required accredited training in practice). One thing I can't confirm cleanly: sources disagree on certification validity — some describe it as never expiring, others describe a 3-year renewal cycle via CPD credits — worth verifying directly with PeopleCert before relying on either claim. Beyond ITIL, most real assessment of this skill happens through **scenario-based SRE/on-call interview questions** rather than a formal exam, which is what most of the questions below are built around instead.

---

### 1. (ITIL Foundation domain: Incident Management practice) What's the ITIL-defined difference between an "incident" and a "problem," and why does conflating them lead to worse outcomes?

**Answer:** An incident is an unplanned interruption or reduction in quality of a service — the immediate, active issue. A problem is the underlying cause of one or more incidents — often not yet fully understood, and addressed through Problem Management as a separate (related but distinct) practice. Conflating them leads to a common real failure: treating "the incident is resolved" (service restored) as equivalent to "the problem is solved" (root cause fixed), when a resolved incident can recur indefinitely if the underlying problem was never actually addressed — exactly the failure mode in this course's own Real World Scenarios (a recurring root cause that never escalates high enough to force a real fix).

---

### 2. (Scenario-based, common in SRE/on-call interviews) Walk through exactly what you'd do in the first 5 minutes after being paged for a P1.

**Answer:** Acknowledge the alert immediately (an unacknowledged page reads as "nobody's responding," even if you're actively investigating) — open an incident channel, and do a fast initial assessment: what's broken (the symptom), who's affected (blast radius), since when (timeline), and what changed recently (recent deployments, config changes). Post an initial status update even if it's just "investigating, no root cause yet" — communicating early and often matters more than having something substantive to say, and going silent while heads-down is a common, understandable mistake that makes the situation look worse than it is to anyone watching.

---

### 3. (Scenario-based) Two candidate mitigations exist for an active P1: Option A fully resolves the issue but requires 25 minutes to implement safely; Option B is a partial mitigation, deployable in 3 minutes, that reduces impact from 100% of users to roughly 20%. Which do you choose, and why?

**Answer:** Generally Option B first — reducing active user impact from 100% to 20% in 3 minutes is a dramatically better outcome for the next 22 minutes than leaving 100% of users affected while Option A gets safely implemented, and the two aren't mutually exclusive: apply B immediately, then proceed with A while the reduced-impact state holds. This reflects the core "mitigate first, root-cause and full-fix second" principle — the goal during an active incident is minimizing cumulative user impact, not necessarily reaching the most complete fix as fast as possible if a faster partial mitigation is available in the meantime.

---

### 4. (ITIL Foundation domain, adjacent: Problem Management) After a P1 is resolved, an action item says "investigate root cause" with no owner or due date. What's wrong with this, and what should it look like instead?

**Answer:** An action item without a specific owner and a specific due date is, functionally, not a real commitment — it has no one accountable for actually doing it and no forcing function to ensure it happens before attention moves elsewhere. It should instead specify exactly who owns it and by when, framed concretely enough to verify completion (e.g., "Add connection-pool-exhaustion alert to Prometheus — Owner: Platform team — Due: [specific date]") rather than a vague intention — this is exactly the format this course's own post-mortem template material uses, and the specificity is the entire point, not a formality.

---

### 5. (Scenario-based) An incident's on-call engineer discovers the actual fix requires touching a system owned by a different team, who isn't currently paged in. What's the right move?

**Answer:** Escalate and pull that team in immediately, rather than attempting a fix in unfamiliar territory or waiting for a "convenient" time to loop them in — incident response prioritizes speed and correctness over avoiding the social friction of paging someone outside the immediate on-call rotation. Most mature incident processes explicitly normalize this ("declare and pull in whoever's needed" rather than "handle it alone as long as possible") specifically because hesitating to escalate out of not wanting to bother another team is a common, understandable instinct that directly extends resolution time.

---

### 6. (ITIL Foundation domain: Incident Management practice) Why does ITIL formally distinguish "workaround" from "resolution," and why does this distinction matter operationally, not just semantically?

**Answer:** A workaround reduces or eliminates the impact of an incident without actually fixing the underlying cause (e.g., manually restarting a service every few hours while the actual bug remains); a resolution addresses the incident directly, though not necessarily the deeper problem behind it. This matters operationally because closing an incident as "resolved" via workaround alone, without tracking that the underlying issue is still open, risks the team losing track of unaddressed work — the incident *looks* closed, but real exposure remains until the workaround is either formalized as a genuine long-term fix or replaced by addressing the actual problem.

---

### 7. (Scenario-based) A postmortem reveals that a monitoring alert *did* fire correctly and on time, but no one was paged because the alert was misconfigured to route to a deprecated on-call schedule. What category of failure is this, and how should the action items differ from a "we need better monitoring" conclusion?

**Answer:** This isn't a detection failure (MTTD) — the alert fired correctly and promptly — it's an **acknowledgment/escalation-path failure** (effectively an MTTA problem, since the alert never reached a human who could act on it at all). The action items should target the routing/escalation configuration specifically (audit all alert routing against current on-call schedules, and ideally add a check that catches an alert routing to a stale/deprecated destination) rather than the generic and less useful "add more monitoring," which wouldn't have prevented this specific failure mode at all — the monitoring itself worked exactly as intended.

---

### 8. (Scenario-based) How do you calculate MTTR for a period with 4 incidents: 20 min, 90 min, 15 min, and 35 min? What's a real limitation of using a single blended MTTR number across incidents of different severities?

**Answer:** MTTR = total downtime ÷ number of incidents = (20+90+15+35)/4 = 40 minutes. The real limitation: a single blended number across all severities can hide a genuinely important pattern — if the 90-minute incident was a P3 (acceptable to take longer) and the three fast ones were all P1s, the blended 40-minute average looks fine while potentially masking that P1 resolution is actually excellent and doesn't need attention, or conversely, that one severely slow outlier incident is dragging the average without revealing which severity tier actually has a problem. Tracking MTTR **separately by severity** (P1 MTTR vs. P2 MTTR vs. P3 MTTR) avoids this blending problem and is standard practice for exactly this reason.

---

### 9. (ITIL Foundation domain, general ITSM principle) Why does ITIL frame Incident Management as one of several interconnected "practices" (alongside Problem Management, Change Enablement, Service Desk) rather than a fully standalone process?

**Answer:** Because incidents, problems, and changes are causally linked in practice, not independent categories — a change (deployment) frequently causes an incident, and repeated incidents from the same cause point to an unaddressed problem, which itself often gets fixed via a change. Treating Incident Management in isolation from Problem Management and Change Enablement misses this feedback loop — an incident management process that resolves incidents quickly but never feeds insights back into problem management or change review processes will keep experiencing the same categories of incident repeatedly, which is exactly the systemic issue this course's own Real World Scenarios material illustrates with a recurring root cause.

---

### 10. (Scenario-based) A postmortem's "what went well" section lists only positive items, and "what didn't go well" is nearly empty, for an incident that took considerably longer to resolve than the team's own MTTR target. Is this a good sign?

**Answer:** Generally a warning sign rather than a good one — an incident that exceeded the team's own target MTTR almost certainly has *something* worth improving, and a postmortem with an unusually thin "what didn't go well" section for exactly that kind of incident often signals a blameless-culture gap in the other direction: people aren't comfortable naming what actually went wrong, possibly because "blameless" has been interpreted as "don't critique the response" rather than its intended meaning of "don't blame individuals while still honestly examining what the system got wrong." A genuinely blameless culture should make it *easier*, not harder, to honestly document real gaps — psychological safety is what enables honest self-critique, not what excuses skipping it.
