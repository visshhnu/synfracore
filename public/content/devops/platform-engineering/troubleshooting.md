# Platform Engineering vs SRE vs DevOps — Troubleshooting

Unlike a tool-specific guide, there's no CLI or config to debug here — "troubleshooting" for this topic means diagnosing why a platform, SRE, or DevOps *initiative* isn't achieving its intended outcome. These are real, recurring organizational failure patterns, each with a specific root cause and fix, not generic advice.

## Golden path exists but adoption stays low

**Symptom:** the platform team has shipped a standard Backstage template, standard CI/CD pipeline, and standard Helm chart — but most teams keep provisioning things their own way instead of using it.

**Root cause:** almost always that the golden path is slower, less flexible, or more work than the status quo it's supposed to replace — a golden path only gets adopted voluntarily if it's genuinely easier than the alternative, not just officially sanctioned. Mandating it without making it the path of least resistance produces compliance theater (teams technically using it while working around its limitations) rather than real adoption.

**Fix:** measure adoption as a real metric (percentage of services using the standard template, tracked over time, exactly as this guide's own DORA/adoption section describes) and treat low adoption as a signal to improve the golden path itself, not a signal to mandate harder. Talk to the teams *not* using it specifically — the reason is almost always concrete (missing a capability their service genuinely needs, too slow to provision compared to what they had before) rather than resistance to change for its own sake.

## Platform team ships a lot of tooling, but developer experience doesn't improve

**Symptom:** the platform team is visibly busy and shipping features, but developer satisfaction surveys and onboarding-time metrics don't improve, or get worse.

**Root cause:** this is the platform-team version of measuring output instead of outcomes — building impressive internal tooling that developers don't actually need, or that solves a problem the platform team assumed existed rather than one developers actually reported, produces real engineering effort with no corresponding impact. This guide's own framing is the direct answer: platform teams are measured by the productivity of the teams they serve, not their own output.

**Fix:** anchor the platform roadmap in developer-reported pain points (a genuine survey, direct interviews, support-ticket patterns) rather than the platform team's own assumptions about what would be valuable, and track the outcome metrics (onboarding time, DORA metrics, developer NPS) as the actual measure of success — not feature-ship velocity on the platform team's own backlog.

## Backstage catalog goes stale almost immediately after rollout

**Symptom:** the Software Catalog looked complete and accurate at launch, but within a few months, service ownership, documentation links, and dependency data are visibly out of date.

**Root cause:** a catalog that depends on developers manually maintaining `catalog-info.yaml` after the initial rollout effort will drift the moment that manual discipline lapses — and it reliably does, because keeping catalog metadata current isn't any individual team's top priority day to day.

**Fix:** enforce catalog freshness structurally rather than relying on manual upkeep — a CI check that fails a build if `catalog-info.yaml` references a nonexistent owner or missing TechDocs path, or making catalog registration part of the golden path's service-creation template so it's generated correctly from the start rather than added manually after the fact. A catalog that's automatically kept honest by tooling stays accurate; one that depends on voluntary manual updates degrades predictably.

## An "SRE team" exists but spends most of its time on reactive firefighting, not engineering

**Symptom:** the org has a team with the SRE title, but their actual day-to-day is almost entirely responding to incidents and manual operational requests, with little time for the SLO/toil-reduction engineering work SRE is supposed to mean.

**Root cause:** this is what happens when a team is renamed to "SRE" without adopting the actual practices that make SRE distinct from traditional ops — specifically, an enforced toil budget (this guide's own stated target: under 50% of time on toil) and the organizational authority to actually push back on unsustainable operational load. Without both, a team can carry the SRE title while functioning as pure reactive ops.

**Fix:** track toil as an explicit, visible metric (hours spent on manual/repetitive work per week) and treat crossing the toil-budget threshold as a trigger to pause new operational commitments and invest in automation — not as background noise. This requires genuine organizational buy-in that reducing toil now is worth short-term operational risk, which is the actual, harder problem underneath "we don't have time to automate."

## Platform Engineering and SRE teams both build overlapping tooling

**Symptom:** both teams independently build similar internal tools (a deployment dashboard, a service-health view) with duplicated effort and inconsistent results, and it's unclear which team owns what going forward.

**Root cause:** without an explicit ownership boundary, both teams' natural instincts point at the same territory — SRE wants visibility/tooling to manage reliability, Platform Engineering wants to provide developer-facing tooling, and a service-health dashboard genuinely sits at the overlap of both mandates.

**Fix:** define the boundary explicitly using Team Topologies' framing already established in this guide — Platform Engineering builds the self-service capability (the paved road any team can consume), SRE defines and owns the reliability practice (SLOs, error budgets, on-call) that the platform's tooling should support, not duplicate. A concrete rule that tends to work: Platform Engineering owns anything a stream-aligned team consumes directly as self-service; SRE owns anything that's specifically about defining or enforcing a reliability standard. Ambiguous cases get resolved by asking which team's roadmap the tool actually serves.

## DORA metrics get worse after a Platform Engineering initiative launches

**Symptom:** deployment frequency drops or lead time increases after a new "standard" pipeline or golden path rolls out — the opposite of what the initiative was supposed to achieve.

**Root cause:** a golden path built around excessive process (mandatory approval gates, an overly rigid pipeline template that doesn't fit every service's real needs) trades away the flexibility teams previously had without providing a commensurate reliability or velocity benefit — it's technically standardized, but standardized-and-slower, not standardized-and-better.

**Fix:** treat a DORA metric regression after a platform change as a direct, urgent signal to review what got added, not a temporary adjustment cost to tolerate — compare the new pipeline's actual steps against what it replaced, and specifically identify which new gate or process step is adding time without adding a proportional reduction in Change Failure Rate. A golden path that's genuinely well-designed should improve or hold DORA metrics steady, not regress them; a regression means the path optimized for standardization at the expense of the actual goal.

## A security incident traces back to the golden path itself

**Symptom:** a vulnerability or misconfiguration is discovered baked into the golden path's standard template — meaning every team that adopted it inherited the same flaw.

**Root cause:** "secure by default" only holds if the golden path's security posture is actively maintained over time — a template that had good defaults at creation but hasn't been revisited as new vulnerability classes or best practices emerged becomes a single point of failure precisely because of its own success: wide adoption means a flaw in the template is a flaw everywhere at once, not contained to one team's mistake.

**Fix:** treat the golden path itself as a security-critical asset requiring the same ongoing patching and review discipline as any shared, widely-depended-on piece of infrastructure — not a one-time "we built it secure" checkbox. The upside of the same wide-adoption property that made this incident severe is that a fix to the golden path template also propagates to every team at once, which is a faster remediation path than a security team chasing down the same flaw independently reimplemented across dozens of teams' own bespoke infrastructure.

---

## Official Resources

- [Platform Engineering Community](https://platformengineering.org/)
- [Team Topologies](https://teamtopologies.com/key-concepts)
- [Google SRE Book — Eliminating Toil](https://sre.google/sre-book/eliminating-toil/)

---
