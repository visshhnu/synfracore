# Incident Management — Revision Notes

Condensed reference for quick review. Consolidated from this course's overview, fundamentals, interview, and cheatsheet material.

---

## Severity Classification

```
P1 CRITICAL: complete outage, data loss, payment failing, security breach
  → immediate, on-call paged within minutes, CEO/VP may be notified
P2 MAJOR: significant degradation, partial functionality, some users affected
  → response within 30 minutes
P3 MINOR: non-critical feature broken, workaround exists
  → business-hours response
P4 LOW: cosmetic, no functional impact
  → scheduled into normal work, not urgent

RULE: when genuinely uncertain between two levels, default HIGHER.
Cost of over-classifying (a few extra people briefly paged) is much
smaller than under-classifying (a real P1 sitting unaddressed for hours).

Declaring an incident does real work beyond labeling: triggers a known
communication cadence, gives someone explicit authority to make fast
calls (Incident Commander), creates a record for the post-mortem.
```

## The Core Principle

```
RESTORE SERVICE FIRST, ROOT CAUSE SECOND.
Every minute investigating WHY during active impact is a minute of
continued impact a faster mitigation could have stopped. Root-causing
still matters fully — it happens in the post-mortem, AFTER restoration,
not as a prerequisite to it.

ROLLBACK is almost always the fastest mitigation for deployment-caused
incidents — BUT with a real exception: a deployment including a
DATABASE MIGRATION or other non-reversible side effect (backfill, etc.)
may not be safely/quickly reversible. Tag such deployments distinctly
so on-call knows rollback isn't automatically safe for THIS one.
Backward-compatible migration patterns (add-column-first, deploy-code-
second, remove-old-column-later) are what make "rollback first" safe
as a DEFAULT — without that discipline, it's not a safe universal rule.
```

## 6-Phase Response Framework

```
1. DETECT (0-2 min): acknowledge immediately, open incident channel,
   never acknowledge and go silent
2. ASSESS (2-5 min): what's broken? who's affected (blast radius)?
   since when? what changed recently (deploys are the highest-
   probability lead in most real incidents)?
3. COMMUNICATE (5 min mark): post status even with nothing new —
   "still investigating, next update at [time]" beats silence, because
   silence reads as "nobody's working on this" even when false
4. MITIGATE (fastest → slowest): rollback → scale up → restart pods →
   feature flag off → failover to DR region
   (choose the FASTEST real impact reduction available, not necessarily
   the most complete fix — a partial mitigation now + full fix in
   parallel beats waiting for the complete fix alone)
5. RESOLVE & MONITOR: confirm metrics at baseline, watch for secondary
   issues, keep channel open ~30 min for stability confirmation
6. POST-MORTEM (within 48hrs for P1): blameless, timeline, 5-whys,
   what worked/didn't, action items WITH owners and due dates
```

## Communication Cadence

```
P1: update every 10-15 min, even with nothing new
P2: update every 30 min
Escalation: 30 min → manager if not mitigated | 60 min → VP/Director (P1)
NEVER go silent on P1/P2 — silence feels worse than uncertainty, even
when the team is actively working the problem.
```

## Blameless Post-Mortems

```
BLAMELESS = system failed, not a person. People make mistakes; the
SYSTEM should be designed so one mistake doesn't cause an outage.

WHY IT'S PRACTICAL, NOT JUST CULTURAL: a blame-assigning culture
produces WORSE incident data over time — people under-report their own
mistakes, omit details that look bad, become reluctant to raise "this
could go wrong" concerns proactively. This directly degrades the
quality of information every future post-mortem needs.

Blameless ≠ no accountability: action items still get specific owners
and due dates; failing to follow through on an OWNED action item is a
real accountability gap. What's avoided is blaming the INDIVIDUAL who
triggered the incident as if they were the root cause — the actual
root cause is almost always the system allowing an ordinary human
mistake to cause an outage.

5-WHYS: ask "why" five times to reach the systemic root cause.
Example chain: 500 errors → DB pool exhausted → new code opened
connections without closing → integration test didn't use prod-scale
DB config → test env pool_size too small even relative to prod →
ROOT CAUSE: missing connection pool config validation in the pipeline
```

## Post-Mortem Template Structure

```
INCIDENT: [name] — [date]        SEVERITY: P1/P2/etc
DURATION: [start–end, elapsed]   IMPACT: [users affected, revenue, etc.]
TIMELINE: chronological, timestamped events (deploy → alert → ack →
  diagnosis → mitigation → resolution → monitoring end)
ROOT CAUSE: via 5-whys, the SYSTEMIC cause, not the surface symptom
WHAT WORKED / WHAT DIDN'T: separate sections — don't conflate
  "we responded well" with "we fixed the actual cause" (see below)
ACTION ITEMS: specific, with OWNER and DUE DATE — vague items ("add
  more tests") are much less likely to get done than specific ones
  ("add integration test validating prod-scale connection pool config")

CRITICAL DISTINCTION (easy to blur): a fast, well-communicated response
to a RECURRING root cause is a much smaller win than actually FIXING
that root cause. Good MTTR/communication metrics can mask an unaddressed
systemic issue — track whether action items actually CLOSE, not just
whether the post-mortem document itself gets written.
```

## Key Metrics

```
MTTD (Mean Time To Detect): incident start → detection
  Driven by ALERTING QUALITY, not response process. Target: <5 min.
MTTA (Mean Time To Acknowledge): alert fires → someone responds
  Driven by ON-CALL PROCESS/escalation clarity. Target: <5 min for P1.
MTTR (Mean Time To Recover): detection → full resolution
  Most directly reflects RESPONSE EFFECTIVENESS. Target: <30min P1,
  <4hrs P2. Formula: sum(resolution_time) / count(incidents)
Change Failure Rate: % of deployments causing an incident. Target: <5%.
  LEADING indicator of testing/review/canary practice effectiveness.

WHY TRACK ALL FOUR SEPARATELY: they point to DIFFERENT improvement
levers. High MTTD → alerting gap. High MTTR + low MTTD → response-
process gap. Conflating them (or blending MTTR across ALL severities
into one number) leads to fixing the wrong thing or hiding which
severity tier actually has a problem — track MTTR BY SEVERITY, not
as one blended average.

An alert that fires correctly and promptly but never reaches a human
(misrouted to a deprecated on-call schedule) is an MTTA/escalation-
path failure, NOT an MTTD/monitoring failure — the fix targets routing
configuration, not "add more monitoring."
```

## Incident Commander Role

```
IC = coordination role, explicitly NOT the hands-on debugger.
  Clear decision authority (makes the mitigation call even with
  incomplete information) | manages communication channels | sets
  update cadence | does NOT get into debugging details personally

COMMON MISTAKE: defaulting to "most technically capable person" as IC.
Technical authority ≠ incident command — they're different skills and,
during an incident, COMPETING uses of the same person's attention. The
most capable engineer should often be freed to focus purely on the fix,
which requires someone ELSE handling coordination.

Mid-incident IC handoffs are normal for long-running incidents (fatigue
management) — must be EXPLICIT ("I'm handing IC to X as of now"), not
an ambiguous drift in who's actually in charge.

Practice this role split on LOWER-severity incidents or simulated "game
days" — a team's first attempt at this shouldn't be during their
highest-severity incident of the year.
```

## Incident vs. Problem vs. Workaround (ITIL terminology)

```
INCIDENT: the immediate, unplanned interruption — the active issue
PROBLEM: the underlying CAUSE of one or more incidents (may be
  addressed by a SEPARATE practice, Problem Management)
WORKAROUND: reduces/eliminates IMPACT without fixing the underlying
  cause (e.g., manually restarting a service periodically)
RESOLUTION: addresses the incident directly (not necessarily the
  deeper problem)

Conflating "incident resolved" with "problem solved" is exactly how a
root cause recurs indefinitely — closing via workaround alone, without
tracking the underlying issue as still open, risks losing track of
real, unaddressed exposure.
```

## Declaring vs. Handling Silently

```
DECLARE when: customer-facing impact, SLO breach likely, multiple teams
  need coordination, or genuine uncertainty about blast radius.
Better to declare and stand down quickly than silently handle something
  that grows — most mature teams err toward declaring, with a fast
  stand-down process for over-classified incidents.

SLA breach ≠ incident severity: a short P1 might not breach a monthly
uptime SLA if the threshold has buffer; several small sub-P1 incidents
can cumulatively breach an SLA despite none individually feeling severe
enough to escalate loudly. Don't use "did we breach the SLA" as the
only lens for how seriously to treat an incident.
```

## Certifications (see this course's own PYQ for full verification notes)

```
ITIL 4 Foundation — the closest formal credential; covers Incident
  Management as one of several named ITSM practices. PeopleCert-
  administered, 40 MCQ, 60 min, 65% (26/40) passing, ~$300-350
  standalone voucher (often bundled with required training in
  practice). VALIDITY UNCONFIRMED — sources disagreed between lifetime
  and 3-year/CPD renewal; verify directly with PeopleCert.
Most real assessment of this SKILL happens via scenario-based SRE/
  on-call interview questions rather than a formal exam — see this
  course's own PYQ for worked examples of that format specifically.
```

## Tool Stack Reference

```
Alerting: PagerDuty / OpsGenie
Channels: Slack #incidents
Status page: Statuspage.io / Atlassian
Post-mortems: Confluence / GitHub wiki
Tracking: Jira incidents project
Dashboards: Datadog/Grafana (error rate, latency, saturation)
Logs: Kibana/Splunk (error patterns)
```
