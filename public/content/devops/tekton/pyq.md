# Tekton — PYQ (Previously Asked / Practice Questions)

**Framing note:** Tekton (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Tekton behavior.

---

### 1. (Domain: Architecture) Why is "no central server" specifically true for Tekton in a way it isn't for Jenkins, and what does this mean practically for debugging?

**Answer:** Every Tekton `Task`/`Pipeline` execution creates real Kubernetes pods, scheduled by the standard Kubernetes scheduler — there's no separate, standalone CI server process coordinating execution the way a Jenkins controller does. Practically, this means debugging a failed run means debugging a specific pod with `kubectl describe`/`kubectl logs`, the exact same workflow as any other Kubernetes workload — not a CI-tool-specific debugging interface.

---

### 2. (Domain: Workspace) A `Pipeline` chains a `git-clone` Task and a `build` Task, but the build Task can't find the cloned source code. What's the most likely missing piece?

**Answer:** A shared `Workspace` binding both Tasks to the same underlying storage. Since each Task runs as a genuinely separate pod, one Task's filesystem is invisible to another by default — `git-clone`'s output only becomes usable by the `build` Task if both explicitly reference the same `Workspace`, backed by a shared volume (commonly a PersistentVolumeClaim).

---

### 3. (Domain: Sequencing) When would you use `runAfter:` instead of relying on Tekton's automatic dependency detection?

**Answer:** `runAfter:` is needed when two Tasks have no actual data dependency Tekton can infer (no shared `Workspace`, no `results` passed between them) but still need to execute in a specific order for another reason — a notification Task that should only run after a deploy Task completes, for instance, with no data flowing between them. Without `runAfter:`, Tekton has no way to know these unrelated Tasks should be sequenced rather than run in parallel.

---

### 4. (Domain: Matrix Strategy) Write a `matrix` configuration that fans a test Task across Python versions 3.10, 3.11, and 3.12.

```yaml
tasks:
  - name: run-tests
    taskRef: { name: test-task }
    matrix:
      params:
        - name: python-version
          value: ["3.10", "3.11", "3.12"]
```
**What's being tested:** understanding that `matrix` creates N separate `TaskRuns` (one per combination) from a single Task definition, rather than requiring three separately-written, duplicated Task entries in the Pipeline YAML.

---

### 5. (Domain: finally Tasks) Why can't a regular Task placed at the end of the `tasks:` list reliably serve as cleanup or notification logic, requiring `finally:` instead?

**Answer:** A regular Task in the main `tasks:` list only runs if the Tasks it depends on (or precedes in sequence) succeed — if an earlier Task in the Pipeline fails, subsequent regular Tasks are skipped, including one intended as cleanup or failure notification. `finally:` Tasks are specifically guaranteed to run regardless of overall Pipeline outcome — success or failure — which is the actual requirement for reliable cleanup/notification logic.

---

### 6. (Domain: Supply-Chain Security) What does Tekton Chains actually produce, and how would you verify it?

**Answer:** Tekton Chains observes completed `TaskRuns` and automatically generates a signed in-toto attestation describing exactly what inputs (source commit, build parameters) produced a given output (an image). Verification uses `cosign verify-attestation` against the signed attestation and the expected public key — confirming the image was genuinely built by the expected pipeline from the expected source, not tampered with or built by an unauthorized process.

---

### 7. (Domain: Triggers) Walk through the chain of objects involved when a GitHub webhook triggers a new `PipelineRun`.

**Answer:** The webhook hits an `EventListener`'s exposed Service endpoint. The `EventListener` uses a `TriggerBinding` to extract relevant data from the incoming webhook payload (commit SHA, branch name), then a `TriggerTemplate` uses that extracted data to instantiate a new `PipelineRun` with the correct parameters. All three pieces — `EventListener`, `TriggerBinding`, `TriggerTemplate` — work together; none alone is sufficient to go from "webhook received" to "PipelineRun created."

---

### 8. (Domain: Troubleshooting) A `TaskRun` never starts and stays in a pending-like state. What are the two most likely causes to check first, beyond a generic "something's wrong"?

**Answer:** First, check for a missing or mismatched `Workspace` binding — a `TaskRun` referencing a `Workspace` that was never actually provided fails at the scheduling stage, before real execution even begins. Second, check the `ServiceAccount`'s RBAC permissions — if the service account the TaskRun uses lacks permission to create the required pod or access referenced secrets, scheduling fails silently from the user's perspective without an obvious top-level error.

---

### 9. (Domain: Multi-Tenancy) Why does Tekton's Affinity Assistant matter specifically in a multi-tenant cluster with heavy Workspace usage?

**Answer:** When multiple Tasks in a Pipeline share a `Workspace` backed by a ReadWriteOnce volume, all those Tasks' pods need to be scheduled onto the same node (since ReadWriteOnce volumes can only be mounted by one node at a time) — the Affinity Assistant manages this pod co-scheduling automatically. In a multi-tenant cluster with many concurrent pipelines each needing this same co-scheduling behavior, correctly tuning the Affinity Assistant's behavior becomes a real performance and scheduling-conflict consideration, not just a correctness detail.

---

### 10. (Domain: ClusterTask vs Task) When would you define a `ClusterTask` instead of a namespace-scoped `Task`, and what's the actual tradeoff?

**Answer:** A `ClusterTask` is reusable across every namespace in the cluster, making it the right choice for genuinely common, org-wide reusable steps (like the Catalog's `git-clone` or `kaniko` Tasks) that many teams' pipelines need identically. The tradeoff is governance — a `ClusterTask` change affects every namespace using it simultaneously, requiring more careful review and versioning discipline than a namespace-scoped `Task` that only affects one team's own pipelines.
