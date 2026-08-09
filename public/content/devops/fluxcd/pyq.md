# FluxCD — PYQ (Previously Asked / Practice Questions)

**Framing note:** FluxCD (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Flux behavior.

---

### 1. (Domain: Architecture) What's the actual difference between what `source-controller` and `kustomize-controller` each do in the FluxCD reconciliation loop?

**Answer:** `source-controller` watches external sources — Git repos, Helm repos, OCI registries — for changes, and makes the fetched content available internally. `kustomize-controller` applies `Kustomization` CRDs, reconciling actual cluster state to match what `source-controller` fetched. The division matters conceptually: detecting a change and applying a change are separate responsibilities, each independently reconciled and independently debuggable.

---

### 2. (Domain: GitOps Principles) Why is FluxCD described as "pull-based" GitOps, and what would a "push-based" alternative look like?

**Answer:** Pull-based means the cluster itself (via `source-controller`/`kustomize-controller`) actively polls Git and pulls changes to apply — the cluster initiates. A push-based alternative would be a CI pipeline running `kubectl apply` directly against the cluster whenever code merges — the external system initiates, requiring the CI system to hold direct cluster credentials. Pull-based avoids that credential exposure entirely, since nothing outside the cluster needs write access to it.

---

### 3. (Domain: Image Automation) Write the three CRDs needed for Flux to automatically detect a new image tag and commit the update back to Git.

**Answer:** `ImageRepository` (watches a registry for new tags), `ImagePolicy` (defines which tags qualify, e.g., via a semver range), and `ImageUpdateAutomation` (performs the actual Git commit updating the manifest to reference the new qualifying tag). All three are required together — `ImageRepository` alone only detects tags without any policy or automation acting on that detection.

---

### 4. (Domain: Image Automation) Why does Flux commit the updated image tag back to Git, rather than applying the new tag directly to the cluster?

**Answer:** Because directly applying to the cluster without a corresponding Git commit would break GitOps's core principle — Git as the single source of truth. If Flux applied changes without committing them back, cluster state would drift from what Git shows, and a later reconciliation from Git could silently revert the "direct" change. Committing back to Git keeps the audit trail complete and ensures the next reconciliation is consistent with what's now in Git, not a diverging parallel state.

---

### 5. (Domain: Multi-Tenancy) How does per-tenant `serviceAccountName` scoping on a `Kustomization` actually enforce multi-tenant isolation?

**Answer:** Each tenant's `Kustomization` reconciles using a specific, RBAC-scoped `ServiceAccount` rather than a shared, broadly-privileged one — Team A's `Kustomization`, configured with Team A's own scoped service account, genuinely cannot apply changes outside what that service account's RBAC permits, even if someone commits a manifest attempting to affect Team B's namespace. The isolation is enforced by Kubernetes RBAC itself, applied per-Kustomization, not by convention or trust.

---

### 6. (Domain: Disaster Recovery) What does FluxCD's own DR story look like, concretely, if a cluster is lost entirely?

**Answer:** Because Git is the source of truth for everything Flux manages, recovering a lost cluster is largely "bootstrap Flux against the same Git repository again" — the reconciliation loop rebuilds cluster state from Git automatically, rather than requiring a separate backup-and-restore process for the applications and configuration Flux manages. This doesn't cover genuinely stateful data (a database's actual data, for instance) — that still needs its own separate backup strategy — but for the declarative configuration itself, Git-as-source-of-truth is the DR mechanism.

---

### 7. (Domain: Troubleshooting) `flux get kustomizations` shows no reconciliation happening for a Kustomization. What should be checked first, and why?

**Answer:** The `GitRepository` source's own status via `flux get sources git`, before debugging the Kustomization itself — if the source has an error (authentication failure, unreachable repo), the Kustomization has nothing valid to reconcile from regardless of how correctly it's configured. Debugging downstream of a broken source wastes time on a symptom rather than the actual cause.

---

### 8. (Domain: Progressive Delivery) What does Flagger add on top of FluxCD's standard reconciliation loop, and why can't `Kustomization`/`HelmRelease` alone achieve the same thing?

**Answer:** Flagger adds automated canary analysis and progressive traffic shifting — gradually increasing traffic to a new version while monitoring real metrics (error rate, latency) and automatically rolling back if those metrics degrade. Standard `Kustomization`/`HelmRelease` reconciliation applies a full, all-at-once update to match Git — it has no concept of gradual rollout or automated metric-based rollback; Flagger sits alongside Flux's core reconciliation specifically to add that progressive-delivery layer.

---

### 9. (Domain: Notifications) What's the difference between a `Provider` and an `Alert` CRD in Flux's notification-controller?

**Answer:** `Provider` defines *where* notifications go — a specific Slack webhook, Teams channel, or generic webhook endpoint. `Alert` defines *what* triggers a notification to that provider — which resources and event types to watch (e.g., reconciliation failures for a specific `Kustomization`). The separation lets one `Provider` be reused across multiple `Alert` rules, rather than each alert needing its own endpoint configuration duplicated.

---

### 10. (Domain: Bootstrap) What does `flux bootstrap github` actually do, and why is it described as doing two things at once?

**Answer:** It installs Flux's controllers into the target cluster AND sets up the Git repository Flux will reconcile against — including committing Flux's own bootstrap manifests into that repository, making Flux's own configuration itself managed under GitOps from the very first command. This is why the bootstrapped Git repository, from the start, already contains a `flux-system` path under GitOps management — Flux manages itself the same way it manages any other application.
