# CI/CD Pipelines — Real World

## Knight Capital, 2012 — the incident that's really a deployment-verification story

Knight Capital deployed new trading software across eight production servers, but one server didn't receive the update and kept running old, dormant code containing a repurposed feature flag. When markets opened, that mismatch caused a runaway sequence of erroneous trades, costing roughly $440 million in about 45 minutes and effectively ending the company within days. This is one of the most-cited incidents in deployment practice specifically because the root cause wasn't exotic — it was a deployment process with no reliable way to verify all servers actually received identical code, and no fast kill-switch to halt the affected system the moment something looked wrong.

**Relevance to CI/CD pipeline design:** this is exactly why modern pipelines deploy a *single, verified artifact* to every target (see Fundamentals' note on artifact-based deployment) rather than trusting a manual, per-server update process — an automated pipeline deploying the same immutable artifact everywhere removes the "one server silently didn't get the update" failure mode by construction, not by discipline.

## The "green pipeline, broken production" gap

A recurring, less dramatic but far more common real-world pattern: a pipeline reports full success — build passed, all tests green, deploy step completed — and the application is still broken in production. Common real causes: the automated tests don't cover the actual failure path (a config value that's correct in the test environment but missing in production's secrets store), a downstream caching layer (CDN, load balancer) still serving the previous version even though the deploy technically completed, or a database migration that succeeded in isolation but is incompatible with the new application code that just deployed alongside it.

**Lesson:** "the pipeline says success" and "the production system is actually healthy" are two different claims, and treating them as equivalent is a common, costly mistake — a post-deploy smoke test against the real production URL, checked automatically as the pipeline's actual final step, is what closes this gap. Many teams add this only after being burned by it once.

## The migration that ran twice

A team's pipeline was configured to run database migrations as part of the deploy step, with no idempotency guard and no lock preventing concurrent execution. A deploy that got manually re-triggered (because the first run appeared to hang, when it was actually just slow) ran the migration a second time concurrently with the first — on a migration that wasn't written to safely handle being run twice, this caused data corruption that took hours to identify and fix, well after the pipeline itself reported success on both runs.

**Lesson:** any pipeline step with side effects that aren't safely repeatable (database migrations being the classic case) needs an explicit safeguard — a distributed lock, an idempotency check, or at minimum a "don't allow concurrent runs of this pipeline" setting — because "just re-trigger it if it seems stuck" is a completely reasonable human instinct that becomes dangerous the moment the underlying step isn't actually safe to run twice.
