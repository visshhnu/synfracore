# CI/CD Pipelines — Advanced

## Progressive delivery: canary and blue-green deployments

At production scale, "deploy the new version, hope it's fine" is an unacceptable risk profile. Two dominant patterns replace it:

**Blue-Green**: two complete, identical production environments exist simultaneously ("blue" = current live, "green" = new version). The new version is deployed to green in full, verified, and then traffic is switched over atomically (a load balancer/router config change, not a redeploy). If something's wrong, switching back to blue is instant — no rebuild, no redeploy, just a routing change. The cost: you're running (and paying for) double the infrastructure during the transition window.

**Canary**: instead of an all-or-nothing switch, the new version receives a small percentage of real traffic first (often 1-5%), with automated monitoring watching error rates and latency on that slice specifically. If metrics stay healthy, traffic is gradually shifted (5% → 25% → 50% → 100%); if they degrade, the pipeline automatically rolls back the canary before most users are ever affected. This requires genuinely automated rollback logic tied to real metrics (not a human watching a dashboard) to deliver its actual value — a canary that still needs a human to notice a problem and manually intervene has given up most of the safety benefit for the added complexity.

## GitOps: the pipeline doesn't deploy, it just updates a Git repo

In a GitOps model (ArgoCD, Flux), the CI pipeline's job stops earlier than people expect: it builds, tests, and pushes an artifact — then updates a *separate* Git repository (the "deployment repo") with the new artifact version/tag. A GitOps controller running *inside* the target cluster watches that deployment repo and pulls the change itself, reconciling the cluster's actual state to match what's declared in Git. The CI pipeline never has direct write access to production infrastructure at all.

This inversion matters for a genuine security reason: your CI/CD platform (often a third-party SaaS) never holds production cluster credentials. The blast radius of a compromised CI/CD pipeline shrinks to "can write to a Git repo," not "has direct write access to production." The tradeoff is added architectural complexity and a slight latency increase (the GitOps controller polls or gets notified, rather than an instant push).

## Multi-region, multi-cloud pipeline design

Deploying to multiple regions (or multiple cloud providers) for resilience changes pipeline design meaningfully — you're no longer deploying "an artifact" to "an environment," you're orchestrating a coordinated rollout across N independent targets, each of which can partially fail independently. Real patterns:
- **Sequential regional rollout** (deploy region A, verify, then region B) — slower, but a bad deploy is contained to one region while it's caught.
- **Region-aware canary** — canary within one region first, using it as an early-warning signal before rolling to all regions, rather than canarying globally in parallel.
- **Independent rollback per region** — a rollback in region A should never depend on region B's pipeline state; treating multi-region as N independent pipelines sharing a trigger, not one pipeline with a loop, keeps failure domains genuinely isolated.

## Pipeline security: treating the pipeline itself as an attack surface

A CI/CD pipeline with write access to production is, by definition, a high-value target — compromising the pipeline can be more valuable to an attacker than compromising the application directly, since it grants a path to inject arbitrary code into every future deployment (a supply-chain attack, not just a single breach). Advanced practice:
- **Pin third-party actions/plugins to a specific commit SHA, not a mutable tag** — `uses: actions/checkout@v4` can silently change what code runs if the `v4` tag is ever moved; pinning to a commit SHA (`uses: actions/checkout@<sha>`) removes that trust dependency.
- **Signed commits and signed artifacts** — verifying that a build artifact actually corresponds to a specific, signed commit closes the gap where a compromised build step could substitute a malicious artifact without the deployment stage noticing.
- **Least-privilege pipeline identities** — the credentials a pipeline run uses should be scoped to exactly what that specific job needs (see Intermediate's note on secret scoping), re-applied here at the infrastructure-permission level: a build job should not hold the same permissions as a production-deploy job, even within the same pipeline run.

## Deployment frequency as an organizational signal, not just a technical metric

DORA's research (State of DevOps Reports) consistently finds deployment frequency correlates with organizational performance — but the causal mechanism matters more than the number itself: teams that deploy frequently are forced to keep each change small (a large, infrequent deploy is too risky to ship often), and small changes are inherently easier to review, test, and roll back. Chasing "deploy more often" as a metric without the underlying discipline (small changes, strong automated test coverage, fast rollback) just moves risk around faster — it doesn't reduce it.
