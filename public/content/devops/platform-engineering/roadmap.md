# Platform Engineering vs SRE vs DevOps Learning Roadmap

**Goal**: From confusing these three terms interchangeably to being able to design and defend real platform-team decisions

## Learning Phases

### Phase 1: Core Definitions (1 day)

- DevOps as culture, SRE as Google's operationalization, Platform Engineering as the internal-platform-building discipline
- How the three relate in a real org — not competing job descriptions, different lenses on the same goal
- Core practices underneath each label — CI/CD/IaC, SLOs/error budgets/toil reduction, IDP/golden paths

### Phase 2: The Internal Developer Platform in Practice (2-3 days)

- Backstage — Software Catalog, TechDocs, Templates, Plugins
- Golden path as the opinionated, supported route
- Getting a real Backstage instance and Crossplane setup running hands-on (see `installation.md`)

### Phase 3: Platform as a Product (2-3 days)

- Backstage Scorecards for measurable, per-service golden-path adoption
- Self-service infrastructure provisioning via Crossplane Compositions
- Service maturity models and internal platform SLAs

### Phase 4: Scaling and Strategic Decisions (3-4 days)

- Platform-of-platforms — scaling beyond one centralized platform team
- Build vs. buy for IDP tooling
- Platform-as-ivory-tower as a distinct anti-pattern from low adoption
- Platform team funding models (centrally funded vs. chargeback vs. hybrid)

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing low golden-path adoption, stale Backstage catalogs, and DORA-metric regressions after a platform initiative
- Practice walking through the same concrete goal (e.g., reducing deployment failures) from all three lenses — DevOps, SRE, Platform Engineering — this guide's own Interview Prep models exactly this exercise

## Job Roles This Enables

- Platform Engineer
- Site Reliability Engineer
- Staff/Principal Engineer roles spanning all three disciplines
- Engineering Manager overseeing a platform team

## Target Certifications

`(needs verification — recheck against current source; Platform Engineering as a discipline doesn't currently have a single widely-recognized vendor certification the way specific tools do)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's Scorecards and maturity models assume Phase 2's Backstage/Crossplane fundamentals are already hands-on familiar, not just conceptually understood
2. Unlike a tool-specific guide, the deepest learning here comes from actually setting up Backstage and Crossplane (Installation section) and registering a real service — reading the concepts alone won't build the same intuition
3. Build the portfolio work in `projects.md` after Phase 3 — a real golden-path artifact (even a small one) is far more convincing than describing the concept
4. Use the Troubleshooting section's real organizational failure patterns as active study material — they're the practical, non-obvious part of this discipline that pure definitions don't teach
5. Practice the "same goal, three lenses" exercise from this guide's own Interview Prep repeatedly, with different example goals — it's the single most tested pattern for this topic at senior interview levels

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 1-2 weeks (part-time)
This guide rewards hands-on setup (a real Backstage catalog entry, a
real Crossplane-provisioned resource) far more than most conceptual
guides do — don't skip the Installation section's practical setup
even though it's not a traditional "install a CLI tool" section
```
