# Incident Management — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from public postmortems and incident-management practice industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The rollback that wasn't actually the fastest option

**The pattern:** A P1 incident starts shortly after a deployment. Following the standard playbook ("rollback is almost always the fastest mitigation"), the on-call engineer initiates a rollback immediately. But this particular deployment included a database migration that isn't safely reversible in the time available — rolling back the application code while the database schema has already changed causes a second, different failure mode (the old code now querying columns that no longer match), extending the outage rather than ending it.

**Why "rollback first" as a default rule has a real exception worth naming explicitly:** the standard advice exists because most deployments genuinely are safely and quickly reversible, and defaulting to rollback saves precious time versus diagnosing the actual bug first. But a deployment that includes a schema migration, a data backfill, or any change with real side effects outside the application code itself breaks the assumption that rollback is a clean, symmetric operation. Treating "rollback" as a single universal button rather than checking what the deployment actually contained is exactly the gap this scenario falls through.

**What actually addresses this:**
- **Tag deployments that include non-reversible changes (schema migrations, backfills) distinctly**, so an on-call engineer can tell at a glance during an incident whether "rollback" is actually safe for this specific deployment, rather than assuming it always is.
- **Database migrations should themselves be designed to be backward-compatible with the previous application version** wherever possible (add-column-first, deploy-code-second, remove-old-column-later patterns) — this is a proactive practice that makes the "rollback first" default actually safe for the common case of schema changes, rather than requiring every migration to be a special case during an incident.
- **When rollback genuinely isn't safe, that needs to be a fast, well-known "second lever" during triage** (feature flag off, traffic shifted away from the affected path) rather than something discovered only after the first mitigation attempt has already made things worse.

---

## Scenario 2 (illustrative/composite): The postmortem that praised the response and missed the real lesson

**The pattern:** A postmortem for a P1 incident concludes with "the team responded quickly, communication was excellent, MTTR was well within target" — genuinely true, and worth recognizing. But the actual root cause (a specific dependency's connection pool exhausting under a load pattern that had actually happened twice before, quietly, at a severity too low to trigger a full postmortem either time) never gets addressed, because the postmortem process only fully engages once something crosses the P1/P2 threshold. The same root cause causes a third, larger incident a few months later.

**Why a well-executed *response* to an incident and a well-addressed *root cause* are genuinely different outcomes, easy to conflate:** a postmortem culture that measures itself primarily on response-quality metrics (MTTR, communication cadence) can look highly effective by every metric it tracks while the underlying systemic issue goes unaddressed, specifically because those metrics measure *how well the team reacted*, not *whether the actual cause got fixed*. This is a subtle trap — celebrating a genuinely well-run incident response can create a false sense that the incident has been "handled," when a fast, well-communicated response to a recurring root cause is a much smaller win than actually fixing that root cause.

**What actually addresses this:**
- **Track whether action items from a postmortem actually get closed**, not just whether the postmortem document itself gets written — an action item with an owner and a due date that quietly slips is functionally the same as no action item at all.
- **Treat a "near-miss" pattern (the same underlying issue occurring below the postmortem-triggering severity threshold multiple times) as itself worth investigating**, even without a P1/P2-level incident forcing the conversation — this is exactly why some mature incident programs deliberately lower the threshold for triggering a lightweight postmortem specifically to catch recurring near-misses before they escalate.
- **Distinguish, explicitly, in the postmortem document itself, between "how well did we respond" and "did we fix the actual cause"** — these deserve separate sections and separate follow-up tracking, since conflating them is exactly how a good response masks an unaddressed root cause.

---

## Scenario 3 (illustrative/composite): The incident commander who was also the only person who could fix it

**The pattern:** During a P1 incident, the most senior engineer on the team — the person who best understands the affected system — takes on the Incident Commander role by default, since they're clearly the most capable person available. Within twenty minutes, it becomes clear the actual fix requires that same engineer to be heads-down writing and testing a patch, but they're also the one fielding status-update requests, coordinating with three other teams, and making the mitigation-timing call — and all three responsibilities suffer simultaneously.

**Why this role conflict is a common, structural mistake rather than a one-off staffing error:** the Incident Commander role, done well, is explicitly a coordination role — managing communication, making the call on timing and escalation, keeping the incident moving — not a hands-on-keyboard debugging role. The most technically capable person is often, understandably, the instinctive choice for "who's in charge," but that instinct conflates *technical authority* with *incident command*, which are genuinely different skills and, during an active incident, competing uses of the same person's limited attention.

**What actually prevents this:**
- **Separate the IC role from the primary technical responder as standard practice**, even when it feels inefficient to "waste" a second person on pure coordination — the IC's job is explicitly to *not* be the one debugging, precisely so the technical responder can stay heads-down without needing to also manage stakeholder communication.
- **A clear, well-practiced IC role (with authority to make the mitigation call even with incomplete information) is what lets the most technically capable person focus entirely on the technical problem** — this is the actual point of having a distinct IC role at all, not an organizational nicety.
- **This needs to be practiced before a real incident, not improvised during one** — a team's first time actually trying the IC/responder split shouldn't be during their highest-severity incident of the year; smaller, lower-severity incidents are the right place to build the habit of keeping these roles separate.
