# Platform Engineering vs SRE vs DevOps — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## The Core Three-Way Distinction

```
DevOps    — a CULTURE, not a job title. Break silos, automate, fast
            feedback. ANYONE can be "doing DevOps."
SRE       — Google's specific OPERATIONALIZATION of DevOps: SLOs,
            SLIs, error budgets, blameless postmortems, structured
            on-call. Job title: Site Reliability Engineer.
Platform
Engineering — builds the INTERNAL PLATFORM (IDP) developers use —
            golden path, self-service. Job title: Platform Engineer.

They're NOT competing job descriptions — different LENSES on the
same underlying goal. One senior engineer often does all three at once.
```

## Internal Developer Platform (IDP)

```
Backstage (Spotify -> CNCF) — most popular IDP portal:
  Software Catalog  — every service + owner, one place
  TechDocs           — docs generated from markdown already in repo
  Templates            — "create new service" scaffolding
  Plugins               — K8s, GitHub, PagerDuty, SonarQube integrations

Golden path = the opinionated, SUPPORTED route — not the only
  technically possible route, the one with support behind it.
```

## Platform as a Product (Intermediate)

```
Platform team's "customers" = the org's own engineers.
Concrete consequences:
  - Product roadmap driven by developer feedback, NOT a fixed project plan
  - Onboarding/docs = first-class deliverable, not afterthought
  - Named internal "product owner" accountable for adoption metrics
```

## Backstage Scorecards — Making Adoption Measurable

```
Per-service automated checks: has-oncall-rotation, has-slo-defined,
  uses-golden-path-pipeline, dependency-freshness
Converts "which teams are on the golden path" from periodic manual
  survey -> live, queryable, PER-SERVICE dashboard
```

## Service Maturity Model (Intermediate)

```
Level 0 Unmanaged -> 1 Cataloged -> 2 Standardized ->
  3 Observable -> 4 Optimized
Gives a legible, incremental path — not binary "on golden path or not"
```

## Metrics That Actually Matter

```
DORA metrics — deployment frequency, lead time, change failure rate, MTTR
Onboarding time — new service to production (this guide's own example:
  2 weeks -> 2 days via a Backstage template)
Platform adoption % — teams using golden path vs. going around it
Developer NPS — quarterly survey
Toil reduction (SRE-specific) — hours saved/week
KEY DISCIPLINE: platform teams measured by the PRODUCTIVITY OF TEAMS
  THEY SERVE, not their own output/feature-ship velocity.
```

## Advanced — Scaling Beyond One Platform Team

```
Platform-of-platforms: core platform team (identity, base infra,
  portal itself) + domain platform teams (data, ML, mobile) building
  ON TOP of core primitives — not reimplementing their own foundation
Build vs. buy — differentiated value is usually in golden paths/
  Compositions built ON TOP, not the portal software itself
Funding models: centrally funded | chargeback | hybrid (most common:
  core mandatory + centrally funded, optional capabilities chargeback)
Ivory-tower anti-pattern: HIGH nominal adoption (mandated) but
  organizationally isolated, no embedded feedback loop — DISTINCT
  from the low-adoption failure pattern
```

## Troubleshooting Quick Reference

```
Golden path exists, low adoption -> it's harder than status quo, fix
  the path, don't mandate harder
Lots of tooling shipped, DX doesn't improve -> measuring output not
  outcomes; anchor roadmap in developer-reported pain
Backstage catalog goes stale -> enforce freshness structurally (CI
  check), don't rely on manual upkeep
DORA metrics regress after platform launch -> too much process added
  (approval gates), review what's slowing things down
```
