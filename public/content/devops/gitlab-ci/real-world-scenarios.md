# GitLab CI/CD — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production GitLab CI/CD usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The merge conflict that passed every individual pipeline

**The pattern:** Two developers each open a merge request against `main`, and both merge requests' pipelines pass cleanly, tested independently against `main`'s current state. Both are approved and merged in quick succession. Shortly after, production breaks — the two changes, individually correct, conflict with each other in a way neither pipeline could have caught, since each was only ever tested against `main` as it existed before the other's merge.

**Why this is a genuinely easy trap, not an obvious process gap:** each individual pipeline did exactly what it was designed to do — verify the change against the current state of `main` at pipeline-run time. The failure isn't a bug in either pipeline; it's a structural gap in a pipeline design that only ever tests "does my change work against current main," not "does my change work against main as it will exist after everything currently queued to merge also merges."

**What actually prevents this:**
- **Adopt merge trains for the protected branch** — each queued merge request's pipeline is tested against the state that will exist after all prior queued merges apply, not just current `main`, directly closing this gap.
- **Treat merge order as a real variable worth being deliberate about** for genuinely risky or overlapping changes, rather than assuming "passed CI" is a complete correctness guarantee regardless of what else merges around the same time.
- **Add integration-level tests that run post-merge on `main` itself**, as a second layer of defense catching exactly this class of interaction that pre-merge, per-MR testing structurally can't.

---

## Scenario 2 (illustrative/composite): The DAG pipeline that looked faster but was secretly still stage-sequential

**The pattern:** A team migrates a large pipeline from stage-sequential jobs to `needs:`-based DAG execution, expecting a significant wall-clock speedup from parallel execution of independent job chains. The actual observed speedup is disappointing — much smaller than expected. Investigation reveals that while `needs:` was added to most jobs, a handful of jobs were left without explicit `needs:` declarations, which meant they defaulted back to waiting on their full previous stage — silently serializing what should have been an independent, parallel chain.

**Why this is easy to miss during a migration, not an obvious oversight:** a pipeline with `needs:` declared on *most* jobs looks, at a glance, like it's been fully converted to DAG execution — the YAML doesn't visually distinguish "this job is intentionally stage-sequential" from "someone forgot to add `needs:` here." The pipeline still runs correctly (no errors, no wrong results), just slower than the DAG conversion should have achieved, which is a much subtler signal to notice than an outright failure.

**What actually prevents this:**
- **Use the pipeline visualization in the GitLab UI to visually confirm actual parallel execution**, not just that `needs:` appears somewhere in the YAML — the graph view directly shows whether jobs are genuinely running in parallel or still serialized.
- **Audit every job in a DAG migration explicitly**, treating "no `needs:` declared" as a deliberate choice requiring justification, not an acceptable default to leave unreviewed during a large pipeline conversion.
- **Measure and document the actual before/after pipeline duration**, not just assume the migration succeeded because `needs:` is present — a real, measured number is what would have caught this specific gap immediately.

---

## Scenario 3 (illustrative/composite): The self-hosted runner that became a security incident waiting to happen

**The pattern:** A team sets up a self-hosted Kubernetes-executor runner fleet for cost and performance reasons, registered against a public open-source repository they also maintain. Months later, a security review flags that a malicious pull request from an external contributor could, under the existing configuration, trigger a pipeline run on the org's own self-hosted infrastructure with almost no restriction — a genuine remote-code-execution-adjacent risk that had been present the entire time without being exploited.

**Why this is a common, easy-to-miss configuration risk:** self-hosted runners are set up for entirely legitimate reasons (cost, custom hardware, network access) and the security implications specifically for *public* repositories are easy to overlook if the runner setup process doesn't explicitly call out the distinction — a GitHub-hosted or GitLab shared-runner equivalent is ephemeral and isolated per run by design, but a self-hosted runner on a public repo doesn't automatically inherit that same isolation guarantee unless deliberately configured for it.

**What actually addresses this:**
- **Treat self-hosted runners on public repositories as a hard security-review trigger**, not a routine infrastructure decision — the specific risk (arbitrary code execution from an untrusted fork's pipeline, running on infrastructure the org controls) needs explicit mitigation, not implicit trust.
- **Require pipeline runs from fork merge requests to need explicit maintainer approval** before executing on self-hosted infrastructure, rather than running automatically on every external contribution.
- **Prefer GitLab-hosted shared runners specifically for public repositories where feasible**, reserving self-hosted runner infrastructure for private, internally-trusted repositories where the threat model is meaningfully different.
