# FluxCD — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production FluxCD usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The image automation loop that nobody remembered was fully automatic

**The pattern:** A team sets up Flux's image automation pipeline early in a project, confirms it works, and moves on to other work. Months later, a production incident traces back to an automatically-deployed image update that introduced a regression — and during the incident retro, several engineers are surprised to learn that image tag updates have been deploying to production automatically the entire time, without any human review step, since nobody on the current team remembers configuring it that way originally.

**Why this is a genuinely easy trap, not a one-off oversight:** image automation is designed to be invisible when working correctly — that's the entire point, removing manual toil from routine version bumps. But "invisible when working" also means "easy to forget is happening at all," especially as team membership changes over time and the original configuration decision fades from institutional memory. Nothing about Flux surfaces "this deployment was fully automated with no human review" as a distinct, flagged event from a manually-reviewed change.

**What actually prevents this:**
- **Scope `ImagePolicy` semver ranges deliberately and document the reasoning** — a range like `>=1.0.0` with no upper bound allows an unintended major version bump to deploy automatically; a properly scoped range (e.g., restricted to patch/minor within a known-safe major version) is a real, deliberate safety constraint worth documenting explicitly, not just configuring once and forgetting.
- **Maintain a living inventory of which services have fully-automated image updates versus manually-gated ones** — this is exactly the kind of institutional knowledge that erodes silently as team membership changes, and having it written down (not just "in someone's head") prevents this specific surprise.
- **Consider gating automated updates for genuinely production-critical services behind a staging-environment soak period** — image automation doesn't have to mean "directly to production with zero intermediate step"; a staged rollout through a lower environment first is a real, available pattern.

---

## Scenario 2 (illustrative/composite): The multi-tenant RBAC boundary that was never actually tested

**The pattern:** A platform team sets up per-tenant `Kustomization` resources with scoped `ServiceAccount`s, believing this correctly isolates each team's changes to their own namespace. During a later security review, someone actually tests the isolation directly — committing a manifest under Team A's path that attempts to modify a resource in Team B's namespace — and discovers the isolation genuinely holds, but only because of a coincidental, unrelated RBAC restriction, not the tenant-scoping configuration the team believed was responsible.

**Why this is a common, easy-to-miss gap:** RBAC misconfigurations that happen to produce the *correct* observable outcome (isolation appears to work) are structurally invisible without deliberately testing the failure case — a team can reasonably believe their multi-tenancy setup is correct simply because nothing has gone wrong yet, without that being genuine evidence the configuration itself is sound versus merely lucky.

**What actually addresses this:**
- **Deliberately test cross-tenant access attempts as part of setting up multi-tenancy**, not just after a security review flags it as a gap — commit a manifest that should be rejected and confirm it actually is, for the reason you expect, not a coincidental one.
- **Document the specific RBAC mechanism responsible for isolation explicitly**, so it's clear during any future change whether a modification could weaken it — "it currently works" isn't the same as "we understand why it works."
- **Treat multi-tenancy RBAC configuration with the same rigor as any other security control** — a control that hasn't been adversarially tested against its own failure mode isn't verified, regardless of how long it's been running without incident.

---

## Scenario 3 (illustrative/composite): The Git-as-DR plan that had never actually been tried

**The pattern:** A team's disaster recovery documentation states that cluster recovery is "just re-bootstrap Flux against the same Git repo" — a reasonable, architecturally sound claim given how Flux's reconciliation model works. During an actual cluster loss (a botched infrastructure change, not malicious), the team executes this plan for the first time under real pressure and discovers several genuinely stateful components (a database, a persistent queue) were never covered by the "Git is the source of truth" DR story at all — because Flux's GitOps model only ever managed their *configuration*, not their actual data.

**Why this is an easy gap to have, not an obviously incomplete plan:** the Git-as-DR story is genuinely true and valuable for everything Flux actually manages declaratively — the gap isn't a flaw in that reasoning, it's scope creep in what the DR documentation implicitly claimed to cover versus what Flux's reconciliation model actually covers. "GitOps makes DR easy" is true for configuration and is easy to over-generalize into "GitOps makes DR easy, period" without the explicit caveat.

**What actually addresses this:**
- **Explicitly separate the DR plan into "what Flux/Git recovers automatically" and "what needs a genuinely separate backup/restore process"** — stateful data (databases, persistent volumes with real data) was never in Flux's scope and needs its own explicit DR mechanism, documented as a distinct concern rather than assumed covered by the GitOps story.
- **Actually rehearse the full recovery process against a real (even if disposable) cluster**, not just document the theoretical steps — this is exactly what would have surfaced the stateful-data gap before a real incident forced the discovery.
- **Revisit and update the DR documentation whenever a new genuinely stateful component is added to the cluster** — the gap tends to grow quietly over time as new stateful services are added without anyone re-auditing whether the existing DR story still fully covers the cluster's actual current scope.
