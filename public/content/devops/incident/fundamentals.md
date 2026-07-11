# Incident Management — Fundamentals

## Severity classification: what actually drives it

A severity level isn't a judgment of how "bad" a bug feels — it's a structured signal that drives response speed and who gets paged, and it should be assigned based on defined, objective criteria, not gut feel in the moment:

| Severity | Definition | Typical response |
|---|---|---|
| P1 | Complete outage, data loss, or a critical business function fully down | Immediate — on-call paged within minutes |
| P2 | Major degradation, service partially working | Fast response, typically within 30 minutes |
| P3 | Non-critical feature broken, workaround exists | Business-hours response |
| P4 | Cosmetic, no real functional impact | Scheduled into normal work, not urgent |

**When genuinely uncertain between two levels, default to the higher one** — the cost of over-classifying a real incident (extra people paged, resolved faster than strictly needed) is much smaller than the cost of under-classifying one (a real P1 treated as a P3, sitting unaddressed for hours).

## The core principle: restore service first, root-cause second

This is the single most important mindset shift for incident response specifically, as distinct from normal debugging: while an incident is actively affecting users, every minute spent investigating *why* it happened is a minute of continued impact that a faster mitigation (often a rollback) could have already stopped. Root-causing thoroughly matters — but it happens in the post-mortem, after service is restored, not as a prerequisite to restoring it.

## Communication: structured, not silent

A common mistake under pressure is going quiet while heads-down investigating — but silence during an active incident reads as "nobody's working on this" to whoever's affected or watching, even when the opposite is true. The standard discipline: post a status update at a defined cadence (commonly every 10-15 minutes for a P1) even when there's genuinely nothing new to report — "still investigating, next update at 14:50" is a meaningfully better message than no message at all.

## Rollback as the default first mitigation

For any incident correlated with a recent deployment, rolling back that deployment is almost always the fastest available mitigation — faster than diagnosing and fixing the actual bug under pressure, and it immediately removes the suspected cause regardless of whether you've fully confirmed it yet. This is why "what changed recently" is one of the very first questions in incident triage (see the response-framework tab) — a correlated recent deploy is the highest-probability lead in a large fraction of real incidents.

## The four core incident metrics

- **MTTD (Mean Time To Detect)**: how long between the incident starting and it being detected — driven by alerting quality, not response process.
- **MTTA (Mean Time To Acknowledge)**: how long between an alert firing and someone actually responding — driven by on-call process and escalation clarity.
- **MTTR (Mean Time To Recover)**: how long from detection to full resolution — the metric most directly reflecting response effectiveness.
- **Change Failure Rate**: what percentage of deployments cause an incident — a leading indicator of whether testing/review/canary practices are actually working, not just a lagging one.

Tracking all four separately matters because they point to different improvement levers — a high MTTD points to alerting gaps; a high MTTR with a low MTTD points to response-process gaps, and conflating the two leads to fixing the wrong thing.

## Blameless culture: why it's a practical requirement, not just a nice value

A post-mortem culture that assigns individual blame reliably produces worse incident data over time, not better — people under-report their own mistakes, omit details that might look bad, and become reluctant to raise "this could go wrong" concerns proactively, all of which directly reduces the quality of the information a post-mortem needs to actually prevent recurrence. "Blameless" specifically means: the investigation asks what about the *system* allowed a human mistake to cause an outage, not who made the mistake — since humans will always eventually make mistakes, and a system that can be taken down by one mistake is the actual thing worth fixing.
