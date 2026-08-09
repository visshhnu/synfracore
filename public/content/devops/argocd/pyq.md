# ArgoCD — PYQ (Previously Asked / Practice Questions)

**Framing note:** ArgoCD (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented ArgoCD behavior.

---

### 1. (Domain: GitOps Model) How does ArgoCD "flip the trust model" compared to a traditional CI pipeline running `kubectl apply` directly?

**Answer:** In a traditional model, an external CI system (Jenkins, GitHub Actions) holds long-lived cluster credentials and pushes changes into the cluster. With ArgoCD, the pull happens from inside the cluster — ArgoCD itself watches Git and applies changes, meaning no external CI system needs direct cluster access at all. This removes an entire class of credential-exposure risk (a compromised CI system with standing cluster credentials) since the only thing with cluster-write access is ArgoCD itself, running inside the cluster it manages.

---

### 2. (Domain: Audit Trail) Why does this guide describe Git history as a "permanent, immutable audit trail" for ArgoCD-managed changes, in contrast to a traditional pipeline's build logs?

**Answer:** Every change to the cluster under ArgoCD traces back to a specific Git commit — who authored it, when, and exactly what changed, preserved in Git's own history indefinitely. Build logs from a traditional CI pipeline can be deleted, rotated out per a log-retention policy, or simply become inaccessible over time — Git commit history doesn't have that same natural expiration, making it a structurally more durable record of "who changed what and when."

---

### 3. (Domain: Drift) A cluster's actual state no longer matches what's in Git, because someone ran `kubectl edit` directly during an emergency fix. What does ArgoCD do by default, and how does `selfHeal` change this?

**Answer:** By default (without `selfHeal`), ArgoCD detects the drift and marks the affected Application `OutOfSync`, but doesn't automatically revert the manual change — it surfaces the drift for a human to address. With `selfHeal: true`, ArgoCD automatically reverts the drift back to match Git the moment it's detected, enforcing that Git genuinely is the source of truth rather than "true until someone manually intervenes." Some teams deliberately leave `selfHeal` off in production specifically so an emergency `kubectl` fix isn't silently undone before the same fix is also properly committed to Git.

---

### 4. (Domain: Prune) Why does removing a resource's manifest from the Git repository not automatically delete it from the cluster, unless `prune: true` is set?

**Answer:** By default, ArgoCD's reconciliation only adds and updates resources to match what's currently in Git — it doesn't infer that a resource's absence from Git means it should be deleted, since that's a more destructive, higher-risk action than adding or updating. `prune: true` explicitly opts into that behavior, letting "removed from Git" actually mean "deleted from the cluster." Without it, deleting a manifest from Git leaves the corresponding cluster resource orphaned — no longer tracked in Git, but still running.

---

### 5. (Domain: Multi-Tenancy) What specific problem does `AppProject` solve that a single, unscoped ArgoCD instance serving multiple teams wouldn't have?

**Answer:** Without `AppProject` scoping, any team with access to create an `Application` in a shared ArgoCD instance could potentially point it at any Git repo, any cluster, or any namespace — including ones belonging to other teams. `AppProject` explicitly scopes which repos, clusters, and namespaces a given team's Applications are allowed to reference, which is the actual mechanism that lets one shared ArgoCD instance safely serve multiple teams without one team's Applications being able to affect another's resources.

---

### 6. (Domain: Health vs Sync Status) An Application shows "Synced" but the actual application is failing. How is this possible, and what does it reveal about ArgoCD's health-checking model?

**Answer:** Sync Status and Health Status are two genuinely separate dimensions — Sync Status confirms the live cluster state matches what's declared in Git; Health Status reflects whether the resource is actually functioning correctly (a Deployment's pods passing readiness checks, for instance). A resource can be perfectly Synced (exactly matching Git) while still being unhealthy, if the Git-declared configuration itself has a problem (a bad image tag, insufficient resource limits causing crashes) — Sync Status alone doesn't guarantee the deployed application is actually working.

---

### 7. (Domain: Architecture) What are the three core ArgoCD components, and what does each one specifically do?

**Answer:** The API server handles authentication and the API/RPC layer that both the UI and CLI interact with. The repo server clones and caches Git repositories, rendering the actual Kubernetes manifests (including running Helm/Kustomize templating if applicable). The application controller is the actual reconciliation loop — comparing live cluster state against the rendered manifests and triggering sync actions when they diverge. Each is a genuinely separate responsibility in the overall architecture, not redundant layers.

---

### 8. (Domain: Sync Policy) What's the practical tradeoff between an automated sync policy and a manual one?

**Answer:** Automated sync applies changes from Git immediately upon detecting a difference, minimizing the delay between a merged Git change and it actually taking effect in the cluster — closer to true continuous deployment. Manual sync requires a human to review and explicitly click sync before a detected change is applied, adding a deliberate human checkpoint at the cost of deployment speed. The choice reflects a real tradeoff between deployment velocity and the safety of a final human review step, and different environments (a fast-moving dev cluster vs. a more cautious production one) commonly use different policies.

---

### 9. (Domain: GitOps vs Traditional CI/CD) Why does rolling back a bad deployment under ArgoCD's GitOps model become "just `git revert`," rather than requiring a rerun of a CI pipeline job?

**Answer:** Because the cluster's actual state is continuously reconciled to match whatever the current state of Git is, reverting the Git commit that introduced the bad change is sufficient — ArgoCD detects that Git now reflects the previous, known-good state and automatically re-applies it. This is structurally different from a traditional pipeline, where rolling back means finding and re-running an old pipeline job and hoping it still executes correctly against the cluster's current state, which may have diverged since that job last ran.

---

### 10. (Domain: SyncOptions) What's the practical difference between the standard sync behavior and `ApplyOutOfSyncOnly`, and when would the latter matter?

**Answer:** Standard sync behavior can re-apply every resource in an Application on each sync operation, even ones that are already correctly synced. `ApplyOutOfSyncOnly` restricts the sync operation to only the resources that are actually out of sync, skipping ones already matching Git. This matters for large Applications with many resources, where re-applying everything on every sync is unnecessarily slow or resource-intensive compared to only touching what's genuinely changed.
