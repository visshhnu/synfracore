# ArgoCD — Interview Q&A

**Q: What problem does ArgoCD actually solve that a CI pipeline running `kubectl apply` doesn't?**
A: A CI pipeline pushing directly to a cluster needs long-lived cluster credentials stored in the CI system itself — a real, standing attack surface. It also makes "who changed what and when" dependent on build logs, which can be deleted, rotated out, or simply not retained long enough to investigate an incident. ArgoCD inverts the model: it runs inside the cluster and *pulls* from Git, so no external system needs direct cluster access, and every applied change traces back to an immutable Git commit rather than a build log entry.

---

**Q: What is the difference between ArgoCD's Sync status and Health status? Why does this distinction actually matter?**
A: Sync status (`Synced`/`OutOfSync`) answers "does the live cluster state match what Git says" — it's purely about whether ArgoCD has applied the latest manifests. Health status (`Healthy`/`Progressing`/`Degraded`/`Missing`) answers "is the deployed workload actually working" — a separate, orthogonal concern. An Application can be `Synced` and `Degraded` at the same time: ArgoCD applied the manifests exactly as written, but the resulting pods are crash-looping because the manifest itself describes something broken (a bad image tag, a missing ConfigMap key). Treating "Synced" as "done" is a common mistake — it only confirms the apply succeeded, not that the result is healthy.

---

**Q: What happens when someone runs `kubectl apply` or `kubectl edit` directly against a resource ArgoCD manages?**
A: ArgoCD's Application Controller continuously compares live cluster state against Git and will detect the difference as drift, marking the Application `OutOfSync`. What happens next depends on `selfHeal`: if `selfHeal: true`, ArgoCD reverts the manual change back to match Git on its next reconciliation — the manual edit is effectively overwritten. If `selfHeal: false` (or unset), the drift is visible in the UI/CLI but left alone until someone runs a manual sync. Some teams deliberately leave `selfHeal` off in production specifically so an emergency `kubectl` fix isn't silently reverted before someone's had a chance to also land the equivalent fix in Git.

---

**Q: Explain the `prune` sync option — what actually happens without it?**
A: Without `prune: true`, ArgoCD only adds and updates resources present in Git — it does not remove a resource from the cluster just because it disappeared from the Git-tracked manifests. This is a genuinely common point of confusion: deleting a Deployment from a Helm values file or manifest directory does *not* delete it from the cluster on the next sync unless `prune` is explicitly enabled. With `prune: true`, a resource removed from Git is deleted from the cluster on the next sync — which is also why `prune` is treated carefully in production; it's real, actual deletion, not just "stop managing this."

---

**Q: What is an AppProject, and what problem does it solve that a single shared ArgoCD instance has by default?**
A: Without an AppProject, every Application implicitly belongs to the `default` project, which has no meaningful restrictions — any Application could target any repo, any cluster, any namespace, any resource kind. An `AppProject` scopes what a group of Applications is collectively allowed to do: `sourceRepos` (which Git repos), `destinations` (which cluster/namespace combinations, often with a wildcard like `payments-*`), `clusterResourceWhitelist`/`namespaceResourceWhitelist` (which Kubernetes resource kinds), and `roles` with Casbin-style policies (`p, proj:team:role, applications, sync, team/*, allow`) mapped to SSO groups. This is the actual mechanism that lets one shared ArgoCD instance safely serve multiple teams — each team's Applications are confined to their own project's boundaries rather than implicitly having the access of the ArgoCD service account itself.

---

**Q: What's the difference between the App of Apps pattern and an ApplicationSet? When would you reach for each?**
A: **App of Apps**: one root `Application` whose source is a Git directory containing other Application manifests. Syncing the root creates/updates all the child Applications. Good for bootstrapping — "deploy this one root Application and the entire environment stands up" — and for cases where each Application genuinely differs (different repos, different config) rather than following a common template. **ApplicationSet**: a generator-driven template that automatically produces Applications — the List generator for a fixed, explicit set of environments; the Git directory generator for one Application per matching repo directory (adding a service is just adding a directory, no manifest to write by hand); the Cluster generator for deploying the same Application definition to every registered cluster matching a label selector. Reach for ApplicationSet specifically when the Applications are structurally identical and only a few parameters (cluster URL, namespace, replica count) vary — App of Apps doesn't template anything, it just aggregates hand-written manifests.

---

**Q: How does ArgoCD handle secrets? What's the actual constraint here?**
A: ArgoCD does not store or manage secret values itself — it applies whatever is in the Git repo it's pointed at, and Git is not a safe place for plaintext secrets (anyone with repo read access, or access to old history, can read them). The real patterns: **Sealed Secrets** encrypts a secret with the target cluster's public key before it's committed — the encrypted `SealedSecret` is safe to commit, and only the in-cluster controller holding the matching private key can decrypt it. **External Secrets Operator** takes the opposite approach — the Git repo holds only a *reference* (an `ExternalSecret` CRD naming a key in Vault/AWS Secrets Manager/etc.), and the operator fetches the actual value from that external store at runtime, so the value never touches Git at all. **SOPS** encrypts individual values within a file rather than the whole object. All three share the same underlying rule: the secret *value* is never committed in plaintext, only an encrypted form or a reference to where the real value lives.

---

**Q: How would you actually roll back a bad deployment with ArgoCD?**
A: The GitOps-correct approach is `git revert HEAD && git push` — ArgoCD detects the reverted commit and auto-syncs the cluster back to the previous state (if automated sync is enabled; otherwise a manual `argocd app sync` after the revert lands). This is preferred because it keeps Git accurate as the actual record of what's running — the revert is itself a new commit, so history isn't rewritten. The alternative, `argocd app rollback <app> <revision>`, reverts the *live cluster state* to a previous ArgoCD-tracked revision without touching Git — faster in an emergency, but it leaves Git and the cluster out of sync (Git still shows the bad commit as current) until someone follows up with the equivalent Git-level fix. In practice: `argocd app rollback` for "stop the bleeding right now," followed by a proper Git revert to make the record accurate again.

---

**Q: What is the difference between ArgoCD and FluxCD? How would you actually decide between them?**
A: Both are CNCF GitOps tools implementing the same core principles (declarative, versioned, pulled, continuously reconciled), but with different shapes. ArgoCD is application-centric with a full web UI, an `Application`/`AppProject` model as first-class objects, and multi-cluster management from one control plane — it's the more visible, UI-forward choice, which matters when a broader team (not just platform engineers) needs to see deployment state. FluxCD is more Kubernetes-native — a set of composable controllers/CRDs (the "GitOps toolkit"), CLI-first, often preferred for infrastructure-level GitOps (cluster bootstrapping, Helm release management) rather than application delivery. It's common to see both in the same organization: Flux for infrastructure and cluster configuration, ArgoCD for application deployment where developers benefit from the UI.

## Revision Notes
```
GITOPS PRINCIPLES: Declarative + Versioned + Pull-based + Continuously reconciled
  Pull-based = ArgoCD (inside cluster) pulls from Git; nothing external pushes

SYNC STATUS vs HEALTH STATUS: two separate axes
  Synced/OutOfSync = does cluster match Git
  Healthy/Progressing/Degraded/Missing = is the workload actually working
  An app CAN be Synced + Degraded at the same time

DRIFT: cluster differs from Git (manual kubectl change, mutating controller)
  selfHeal: true  -> ArgoCD reverts drift automatically
  selfHeal: false -> drift visible (OutOfSync) but not auto-corrected

PRUNE: without prune:true, removing a resource from Git does NOT delete it
  from the cluster -- ArgoCD only adds/updates by default

APPPROJECT: scopes sourceRepos + destinations + resource whitelist/blacklist
  + RBAC roles per team -- default project has no meaningful restrictions

APP OF APPS: root Application manages hand-written child Application manifests
  (bootstrap pattern, structurally different children)
APPLICATIONSET: generator-driven TEMPLATE producing many Applications
  (List / Git directory / Cluster generators, structurally identical children)

ROLLBACK:
  git revert + push  -> GitOps-correct, keeps Git accurate (preferred)
  argocd app rollback -> reverts live cluster only, Git still shows bad commit

SECRETS: ArgoCD never stores secret values
  Sealed Secrets: encrypt before commit, decrypt in-cluster
  External Secrets Operator: Git holds a REFERENCE, value fetched at runtime
  SOPS: file/value-level encryption

ARGOCD vs FLUX: ArgoCD = UI-forward, application-centric, multi-cluster
  Flux = Kubernetes-native controllers/CRDs, CLI-first, infra-leaning
  Often used together: Flux for infra, ArgoCD for apps
```
