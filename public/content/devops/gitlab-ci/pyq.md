# GitLab CI/CD — PYQ (Previously Asked / Practice Questions)

**Framing note:** GitLab doesn't administer a proctored public certification with a leaked-question archive the way some vendor exams do. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented GitLab CI/CD behavior.

---

### 1. (Domain: Pipeline Fundamentals) What's the actual difference between what `artifacts:` and `cache:` each do, and why is conflating them a common mistake?

**Answer:** `artifacts:` persists specific files between stages of the *same* pipeline run — the build stage's output becomes available to the test stage. `cache:` persists dependencies between *separate* pipeline runs to speed up repeated installs — it's a performance optimization, not a correctness mechanism. Conflating them is common because both involve "files sticking around," but relying on cache for cross-stage data transfer within one run is fragile — cache is best-effort and not guaranteed to be restored, while artifacts are a deliberate, reliable hand-off.

---

### 2. (Domain: DAG Pipelines) Write a job that uses `needs:` to start immediately after `build-frontend` completes, without waiting for `build-backend` even though both are in the same `build` stage.

```yaml
test-frontend:
  stage: test
  needs: [build-frontend]
  script: [echo "testing frontend"]
```
**What's being tested:** understanding that `needs:` creates a job-level DAG dependency that overrides default stage-sequential waiting — `test-frontend` starts the moment `build-frontend` finishes, regardless of `build-backend`'s status, as long as both are declared with `needs:` correctly.

---

### 3. (Domain: Runners) A job requires GPU access available only on specific self-managed runners. What's the mechanism for ensuring this job only runs on those specific runners?

**Answer:** Runner tags. The GPU-capable runners are registered with a specific tag (e.g., `gpu`), and the job specifies `tags: [gpu]` — GitLab only schedules the job onto runners matching all specified tags. Without this, the job could be picked up by any available runner, including ones without GPU access, causing job failure or incorrect execution.

---

### 4. (Domain: Security Scanning) A pipeline includes GitLab's SAST template but a real vulnerability doesn't cause the pipeline to fail. What's the likely cause?

**Answer:** Including the SAST template alone runs the scan and surfaces results in the Merge Request security widget and Security Dashboard — it does not automatically fail the pipeline on finding a vulnerability unless a separate policy (a scan result policy, or explicit pipeline logic checking scan output) is configured to enforce that. Scanning and enforcement are two separate, deliberately decoupled steps.

---

### 5. (Domain: Advanced Patterns) What problem do merge trains solve that a simple "test against current main" pipeline doesn't?

**Answer:** Merge trains serialize merges to a protected branch, testing each queued merge request against the state that *will* exist after all prior queued merges are applied — not just against current `main` at the moment the pipeline started. Without this, two merge requests that individually pass CI against current `main` can still conflict or break when merged in sequence, since each was only ever tested in isolation against a state that had already changed by the time it actually merged.

---

### 6. (Domain: Multi-Project Pipelines) What does `strategy: depend` do on a `trigger:` job, and why does it matter for a multi-project pipeline?

**Answer:** Without `strategy: depend`, a `trigger:` job that starts a downstream pipeline in another project is fire-and-forget — the parent pipeline's job succeeds as soon as the trigger fires, regardless of whether the downstream pipeline actually succeeds. `strategy: depend` makes the parent pipeline job wait on and reflect the child pipeline's actual outcome — a genuine dependency, not just an invocation, which matters for any deployment pipeline where the parent's success should mean the whole deployment genuinely worked.

---

### 7. (Domain: Runner Executors) Why is the Kubernetes executor generally preferred over the Shell executor for production CI/CD, even though the Shell executor is faster per-job?

**Answer:** The Shell executor runs directly on the runner VM with no isolation between jobs — environment state can leak between jobs (a stale file, a modified system package), making it fast but unreliable for reproducibility. The Kubernetes executor runs each job in a fresh pod, guaranteeing clean isolation per job, and can autoscale to zero when idle — the production tradeoff favors correctness and cost efficiency over the Shell executor's raw speed advantage, which matters less than reliability at production scale.

---

### 8. (Domain: Troubleshooting) A job has been stuck in "pending" status for a long time with no error message. What are the two most likely causes to check first?

**Answer:** First, confirm a runner with matching tags is actually online and available — a job's `tags:` requiring a specific runner that's offline or doesn't exist will queue indefinitely with no explicit error. Second, check whether the project's runner is enabled/shared-runner quota hasn't been exhausted — both are silent-queue causes rather than failures, since GitLab doesn't proactively error on "no matching runner available," it just waits.

---

### 9. (Domain: DAG Optimization) In a large pipeline with many independent job chains, what's the practical benefit of restructuring stage-sequential jobs into a `needs:`-based DAG, beyond "it's faster"?

**Answer:** Beyond raw wall-clock speedup (independent chains running in parallel instead of waiting on unrelated stage completions), a well-designed DAG makes the pipeline's actual dependency structure explicit and reviewable in the YAML itself — `needs: [build-frontend]` documents precisely what a job depends on, versus a stage-sequential pipeline where the real dependency (or lack thereof) between jobs in the same stage is implicit and easy to get wrong as the pipeline grows.

---

### 10. (Domain: Self-Hosted HA) What are the two genuinely separate concerns in making a self-hosted GitLab instance highly available, beyond just running multiple application server replicas?

**Answer:** The database (typically PostgreSQL) and the Git repository storage itself both need their own HA strategy independent of the application server layer — running multiple GitLab application replicas alone doesn't remove a single point of failure if they all depend on one non-HA database or one non-replicated Git storage backend. This mirrors the same pattern seen in other self-hosted platforms (Harbor's own HA material makes the identical point about its bundled PostgreSQL/Redis) — scaling the application layer alone is necessary but not sufficient for genuine HA.
