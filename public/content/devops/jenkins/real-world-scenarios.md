# Jenkins — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Jenkins usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The "quick job" on the controller that took down every team's pipelines

**The pattern:** A team, in a hurry during an incident, configures a diagnostic job to run directly on the Jenkins controller rather than routing it to an agent — reasoning it's a small, one-off, quick task and setting it up properly would take extra time they don't have during the incident. The diagnostic job turns out to be more resource-intensive than expected and hangs, consuming enough memory on the controller to degrade Jenkins' overall responsiveness — every other team's pipelines across the entire organization start timing out or failing to schedule, turning a small, contained diagnostic task into an organization-wide CI outage.

**Why this is a genuinely easy trap under pressure, not a careless decision:** in the moment, "just this once, on the controller, it's quick" feels like a reasonable tradeoff against the friction of properly routing to an agent, especially during an active incident where speed feels paramount. The actual risk (a hung or heavy job degrading the shared, single controller that every other pipeline also depends on) isn't visible until it actually happens — nothing about running one small job on the controller usually causes an immediate, obvious problem, which is exactly what makes the "just this once" reasoning feel safe until it isn't.

**What actually prevents this:**
- **Enforce, at the Jenkins configuration level, that jobs cannot be scheduled directly on the controller** — removing this as a possible choice entirely, rather than relying on discipline or awareness during high-pressure moments when shortcuts feel most justified.
- **Maintain a genuinely fast, low-friction path for routing even quick diagnostic jobs to agents**, so the friction that motivated the shortcut in the first place is minimized — if properly routing to an agent takes nearly as little effort as the shortcut, there's less incentive to bypass it even under pressure.
- **Treat this guide's own explicit warning (controller should never run build jobs) as a hard architectural rule, not a best-practice suggestion** — the blast radius of a controller-level failure (every team's pipelines, simultaneously) is categorically different from an agent-level failure (one job, contained), which justifies treating this rule with real rigor rather than case-by-case judgment.

---

## Scenario 2 (illustrative/composite): The Shared Library update that broke every team's pipeline at once

**The pattern:** A platform team maintains a Shared Library used across dozens of application teams' Jenkinsfiles, imported via `@Library('common-pipeline-lib')` — referencing the library's default branch rather than a pinned tagged version, for convenience during the library's early adoption. A well-intentioned improvement to the library's build-scanning function, pushed directly to the default branch, introduces a breaking change to its function signature. Every single consuming pipeline across every team using the unpinned `@Library` reference breaks simultaneously on their very next run, with no individual team having made any change of their own.

**Why this is a common, easy-to-fall-into trap for a growing Shared Library:** referencing the default branch felt convenient during the library's early days — every consuming pipeline automatically got improvements without any team needing to update their own `@Library` reference. That same convenience is exactly what turns a single library change into a simultaneous, organization-wide breaking event once enough teams depend on the library — the risk scales directly with adoption, in the opposite direction of what feels intuitive (more usage should mean more stability, not more fragility, but an unpinned reference makes it the reverse).

**What actually addresses this:**
- **Migrate every consuming pipeline to reference a specific, tagged Shared Library version**, exactly as this guide's own Advanced material recommends — this is precisely the mechanism that would have prevented every team from breaking simultaneously; a library update would only affect a team once they deliberately updated their own pinned reference.
- **Treat any breaking change to a Shared Library as requiring a new major version tag and an explicit migration communication to consuming teams**, rather than a direct push to whatever branch is currently being consumed by default.
- **Provide a staging/beta tag teams can optionally opt into for testing upcoming library changes**, giving the platform team a safe path to iterate and gather feedback without forcing every consumer onto untested changes automatically.

---

## Scenario 3 (illustrative/composite): The core upgrade that silently broke a business-critical deploy pipeline

**The pattern:** A platform team performs a routine Jenkins core version upgrade, testing it against a representative sample of pipelines beforehand and confirming they work correctly. Post-upgrade, most pipelines continue functioning normally, but one particular, less-frequently-run but business-critical deployment pipeline (used only for a specific, infrequent release process) fails the next time it's actually invoked — weeks after the upgrade — due to a plugin it specifically depends on being incompatible with the new core version, a plugin that wasn't included in the pre-upgrade testing sample because it wasn't in frequent use.

**Why this specific pipeline's dependency was easy to miss during upgrade testing:** pre-upgrade testing naturally gravitates toward the most frequently-used pipelines, since those are the ones most visible and most likely to be checked as part of routine validation — a pipeline used only occasionally for a specific, infrequent process is easy to overlook precisely because its infrequent use means it wasn't naturally exercised during the upgrade validation window, surfacing its plugin incompatibility only when it was actually needed, potentially at a time-sensitive moment.

**What actually addresses this:**
- **Maintain an explicit inventory of every plugin each pipeline actually depends on**, and require the upgrade testing plan to exercise every distinct plugin dependency at least once — not just the most frequently-run pipelines by traffic volume, which is a different, incomplete sampling criterion for plugin-compatibility risk specifically.
- **For business-critical but infrequently-run pipelines, schedule a deliberate test execution as part of any core upgrade process**, even if it means manually triggering the pipeline in a non-production context specifically to validate plugin compatibility ahead of when it's actually needed for real.
- **Treat "this pipeline hasn't been tested since the upgrade" as an explicit, tracked risk for any pipeline not naturally exercised during upgrade validation**, rather than an invisible gap discovered only when the pipeline is next actually needed — a known gap that's tracked can be proactively closed; an invisible one can't.
