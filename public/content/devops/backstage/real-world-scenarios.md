# Backstage — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Backstage/Internal Developer Platform usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The catalog rollout that stalled on perfect data instead of shipping good-enough coverage

**The pattern:** A platform team rolling out Backstage decides every service's catalog entry must be fully complete before the catalog "launches" org-wide — full API relationships mapped, System groupings defined, TechDocs linked, for all 120 existing services. Individual teams are asked to fill out detailed entries for their own services. Months pass; only about 30% of services have genuinely complete entries, since detailed catalog authoring competes with every team's actual delivery priorities and consistently loses. The catalog never officially "launches" because it's not yet complete, and in the meantime, developers get zero value from the 30% of genuinely good entries that DO already exist, since the whole thing is still gated on "not ready yet."

**Why waiting for completeness was the wrong bar:** the catalog's core value — even a MINIMAL entry establishing basic ownership — is genuinely useful immediately, on its own, without every field being filled in. Treating "fully detailed" as the launch bar meant real, available value sat unused for months while waiting for a completeness standard that individual teams' actual priorities were never going to consistently deliver on their own timeline.

**What actually prevents this:**
- **Launch with minimal required fields (name, type, lifecycle, owner) as the actual bar**, treating full enrichment (API relationships, TechDocs, System groupings) as valuable follow-up work, not a blocker to getting basic ownership visibility live and useful immediately.
- **Use catalog discovery to auto-register a baseline entry for every service automatically**, rather than depending on each team to manually author a complete entry on their own schedule — discovery gets breadth quickly; teams enrich depth over time as they have bandwidth.
- **Treat "the catalog is live and has SOME value today" and "the catalog is fully enriched" as two separate milestones**, celebrating and using the first one immediately rather than gating all value on reaching the second.

---

## Scenario 2 (illustrative/composite): The Software Template that nobody actually used, because it didn't match reality

**The pattern:** A platform team builds a polished Software Template for creating new microservices, reflecting what they believe is the organization's standard architecture — a specific framework, a specific deployment pattern, a specific CI/CD setup. The template launches with an internal announcement. Adoption is near zero months later — most teams creating new services either don't know the template exists, or (for the ones who do know) find that the template's assumed standard architecture doesn't actually match what their specific team's services genuinely need, so they continue creating new projects the old, manual way instead.

**Why a well-built template still failed to get adopted:** a golden path template is only as valuable as it being (a) genuinely known to exist by the people who'd use it, and (b) actually matching what teams need closely enough that using it is easier than not using it. A technically well-built template that few people know about, or that requires significant manual adjustment after scaffolding to actually fit a team's real needs, doesn't achieve the "path of least resistance" property that's the whole point of the golden-path approach.

**What actually prevents this:**
- **Validate a new template against a few REAL upcoming projects before broad rollout**, confirming it genuinely produces something close to what a real team actually needs with minimal post-scaffolding adjustment, rather than launching based on an assumed standard that was never checked against real, current team needs.
- **Actively promote new templates where developers are already looking** (linked from the catalog's own "create new" entry point, mentioned in onboarding, not just a one-time announcement easily missed or forgotten) — discoverability is as real a factor in adoption as the template's actual quality.
- **Treat low template adoption as a signal to investigate why, not just a fact to note** — asking teams who didn't use it what got in the way (didn't know it existed, didn't match their needs, was easier to just copy an existing service) directly surfaces which specific problem to actually fix.

---

## Scenario 3 (illustrative/composite): The unconfigured permission framework that let a template provision unintended infrastructure

**The pattern:** A platform team builds a Software Template that, as one of its scaffolder steps, provisions real cloud infrastructure (a database instance, a message queue) alongside the new service's code repository — a genuinely convenient, well-intentioned feature reducing new-service setup friction. The Backstage instance's permission framework was never configured beyond its default (fully open), since the team was focused on getting core Backstage functionality working and treated permissions as a "later" hardening task. A developer, experimenting with the Scaffolder UI to understand what templates were available, runs this infrastructure-provisioning template out of curiosity rather than a genuine intent to create a new service — resulting in real, unintended cloud infrastructure being provisioned and billed, discovered only when a cost anomaly review later flags it.

**Why "we'll configure permissions later" was a predictable trap once real actions were on the line:** the risk profile changed meaningfully the moment a template gained the ability to trigger REAL infrastructure provisioning, not just scaffold code — but the permission framework's configuration status didn't change alongside that risk, since it was still sitting in the "later hardening" bucket from before that capability existed. A default-open Backstage instance is a much smaller practical concern when templates only scaffold code repositories than when a template can provision billed cloud resources.

**What actually prevents this:**
- **Treat adding ANY genuinely consequential scaffolder action (infrastructure provisioning, anything with real cost/access implications) as the trigger point for configuring real permission scoping**, not a separate, indefinitely-deferrable task — the risk profile changing is exactly the signal that the "later" bucket needs to be revisited now.
- **Scope infrastructure-provisioning templates specifically to the smaller group of users who should genuinely be able to run them**, rather than leaving them available to every authenticated user by default, once the permission framework is configured.
- **Monitor for unexpected/unattributed infrastructure provisioning as its own alerting category**, not solely relying on periodic cost-anomaly reviews to catch this class of issue after the fact — the sooner an unintended provisioning event is caught, the smaller its actual cost/cleanup impact.
