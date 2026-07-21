# ArgoCD

> **Declarative GitOps CD for Kubernetes**

**Category:** GitOps
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is ArgoCD?

ArgoCD implements GitOps for Kubernetes: Git is the single source of truth, and ArgoCD — running inside the cluster — continuously watches a Git repository and reconciles the cluster's actual state to match it. This flips the normal CI/CD trust model: instead of a CI pipeline holding cluster credentials and pushing changes out, ArgoCD pulls from Git and applies changes itself, so no external CI system needs direct cluster access. Drift (someone running `kubectl apply` or `kubectl edit` directly against the cluster) is detected automatically and, if `selfHeal` is enabled, reverted back to match Git.

## Why ArgoCD?

Before GitOps, a CI pipeline (Jenkins, GitHub Actions) typically ran `kubectl apply` directly, which means the pipeline itself held long-lived cluster credentials, "who changed what" was buried in build logs that could be deleted or rotated out, and rolling back meant re-running an old pipeline job and hoping it still worked against the current cluster state. With ArgoCD, every change to the cluster traces back to a Git commit — the audit trail is Git history itself, permanent and immutable — and rolling back is `git revert`, which ArgoCD then auto-applies. The `Application` CRD is the core object: it defines *source* (Git repo, path, revision) and *destination* (cluster, namespace), with a `syncPolicy` controlling whether changes apply automatically or require a human to review and click sync. `AppProject` scopes which repos, clusters, and namespaces a given team's Applications are allowed to touch — the mechanism that lets one shared ArgoCD instance safely serve multiple teams.

---

## Learning Modules

### Module 01 — GitOps & ArgoCD Concepts
*Pull-based CD, desired state*

**Topics covered:**

- GitOps principles (declarative, versioned, pulled, reconciled) — 🟢 Beginner
- Push vs Pull deployment models — 🟢 Beginner
- ArgoCD architecture (API server, repo server, application controller) — 🟡 Intermediate

### Module 02 — Applications & AppProjects
*Application CRD, RBAC*

**Topics covered:**

- Application CRD (source, destination, syncPolicy) — 🟢 Beginner
- Sync policy: automated vs manual — 🟡 Intermediate
- AppProject for multi-tenant RBAC — 🟡 Intermediate
- Resource health vs sync status — 🟢 Beginner

### Module 03 — Sync Policies & Drift
*SyncOptions, drift detection, self-heal*

Drift means the cluster's actual state no longer matches Git — someone ran `kubectl edit` directly, or a controller mutated a resource outside Git's knowledge. ArgoCD detects this continuously and marks the affected Application `OutOfSync`. `selfHeal: true` automatically reverts drift back to match Git, enforcing that Git really is the source of truth rather than "true until someone manually intervenes" — though some teams deliberately leave it off in production so an emergency `kubectl` fix isn't silently reverted before it's also fixed properly in Git. `prune: true` is what actually makes "removed from Git" mean "deleted from the cluster" — without it, ArgoCD only adds/updates, it never removes a resource just because it disappeared from the Git-tracked manifests.

**Topics covered:**

- Drift detection — 🟡 Intermediate
- Self-heal vs manual intervention — 🟡 Intermediate
- SyncOptions (prune, replace, ApplyOutOfSyncOnly) — 🔴 Advanced
- Resource hooks (PreSync, PostSync, SyncFail) — 🔴 Advanced

### Module 04 — ApplicationSets
*Multi-cluster, multi-tenant*

Manually creating and maintaining one `Application` per service (or per cluster, for a multi-cluster fleet) doesn't scale past a handful. An `ApplicationSet`'s generators solve this: the List generator takes an explicit set of environments/clusters, the Git directory generator creates one Application per matching repo directory (adding a service is just adding a directory), and the Cluster generator deploys the same Application definition to every registered cluster matching a label selector — essential for platform teams managing infrastructure across many clusters.

**Topics covered:**

- List generator — 🔴 Advanced
- Git directory generator — 🔴 Advanced
- Cluster generator — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook — "Application shows Synced but Degraded, pods CrashLooping"

# Step 1: Confirm the split -- Sync and Health are separate axes.
# Synced/OutOfSync = does the cluster match Git.
# Healthy/Progressing/Degraded = is the deployed workload actually working.
# An app can be perfectly Synced (cluster has exactly what Git says) while
# still Degraded (the pods it created are crashing) -- ArgoCD applied the
# manifests correctly; the manifests themselves describe something broken.
argocd app get myapp

# Step 2: Use ArgoCD's own resource tree to find WHICH resource is
# unhealthy inside a larger Application, rather than guessing from the
# Application's overall status.
argocd app get myapp --show-operation

# Step 3: Drill into the actual Kubernetes-level failure
kubectl get pods -n production -l app=myapp
kubectl describe pod <pod-name> -n production
kubectl logs <pod-name> -n production --previous   # last container's logs before it crashed

# Step 4: If it's a bad image (the common case for "was fine, now Degraded
# right after a deploy"), the GitOps-correct rollback is a Git revert, not
# a manual kubectl or argocd rollback -- it keeps Git as the accurate
# record of what's actually running.
git revert HEAD
git push
# ArgoCD auto-syncs back to the previous known-good revision on its own,
# assuming automated sync is enabled; otherwise `argocd app sync myapp`
# after the revert lands.

# Step 5: Confirm the fix actually resolved it, not just changed the symptom
argocd app get myapp
kubectl get pods -n production -l app=myapp
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is ArgoCD and why would you use it in production?"
    **Problem:** a CI pipeline pushing changes directly to a cluster means the pipeline holds cluster credentials, and "who changed what" lives in build logs that can be deleted or rotated out. **Solution:** ArgoCD runs inside the cluster and pulls from Git instead — Git becomes the single source of truth, and no external system needs direct cluster access. **Result:** every cluster change traces back to an immutable Git commit, rollback is a `git revert`, and drift from manual changes is detected (and optionally auto-corrected) instead of silently persisting.

??? question "How does ArgoCD work internally? Explain the architecture."
    **Problem:** understanding which component does what matters for both scaling ArgoCD itself and debugging a stuck sync. **Solution:** the API Server handles the REST/gRPC API, web UI, and auth; the Repository Server clones Git repos and renders manifests (plain YAML, Helm, Kustomize); the Application Controller watches both Git and the live cluster state, computes the diff, and performs syncs; Redis provides caching. **Result:** ArgoCD can manage the cluster it runs in, or register and manage entirely external clusters from one control plane — the Application Controller is what actually performs each sync, independent of which cluster it targets.

??? question "What are the main components of ArgoCD?"
    **Problem:** "ArgoCD" names both the tool and several distinct internal pieces worth separating when reasoning about behavior. **Solution:** the `Application` CRD (source + destination + syncPolicy, one per deployed service/environment); `AppProject` (multi-tenant RBAC scoping which repos/clusters/resources an Application is allowed to use); `ApplicationSet` (template that generates many Applications); and the underlying API/Repo/Controller server components. **Result:** most real ArgoCD questions ("why can't this app deploy to that namespace," "why did 10 environments update from one commit") trace back to one of these — AppProject restrictions or an ApplicationSet generator, respectively.

??? question "How do you handle failures in ArgoCD?"
    **Problem:** a sync can fail outright, or succeed while leaving the workload unhealthy — two different failure modes needing different diagnosis. **Solution:** `argocd app get <app> --show-operation` for the actual sync error (not just "failed"); for a Synced-but-Degraded app, drill into the specific unhealthy resource via `kubectl describe`/`kubectl logs`; for a bad deploy, `git revert` is the GitOps-correct rollback (ArgoCD auto-applies it) rather than a one-off `argocd app rollback`, which reverts the live state without correcting Git. **Result:** treating Git as the actual record of truth, not just the initial deploy mechanism, is what keeps rollback and audit trail consistent over time.

??? question "What is your production experience with ArgoCD?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a sync stuck in Progressing, an AppProject misconfiguration blocking a legitimate deploy, drift from an emergency `kubectl` fix. Interviewers are listening for whether you've actually operated ArgoCD under real constraints, not just applied an Application manifest once.

??? question "How do you monitor and observe ArgoCD in production?"
    **Problem:** ArgoCD's own UI shows current state, but doesn't proactively alert anyone when a sync fails or health degrades. **Solution:** ArgoCD Notifications, configured with triggers (`on-sync-failed`, `on-health-degraded`) and subscribed per-Application to Slack/email/PagerDuty — subscribing to failures and degradation specifically (not every successful sync) keeps the channel meaningful rather than noisy. **Result:** teams find out about a failed sync or a crashing deployment from an alert, not from a user report or a routine UI check.

??? question "What are the security considerations for ArgoCD?"
    **Problem:** ArgoCD effectively holds deploy authority over every cluster it manages, and by default a single shared instance has no team isolation. **Solution:** `AppProject` scoping (restrict repos, destinations, and resource kinds per team), RBAC policies mapping SSO groups to roles with least privilege (sync but not delete, for most developers), and never letting ArgoCD itself store secret values — use Sealed Secrets, External Secrets Operator, or SOPS so secret material never lands in the Git repo ArgoCD reads from. **Result:** these are the same least-privilege and secrets-hygiene principles as anywhere else, applied to a system that has real, direct deploy authority over production.

??? question "How does ArgoCD compare to alternatives?"
    This usually means FluxCD specifically, the other major CNCF GitOps tool. ArgoCD has a full web UI, an application-centric model (`Application`/`AppProject` as first-class objects), and multi-cluster management from one control plane. FluxCD is more Kubernetes-native (built as a set of composable controllers/CRDs, "the GitOps toolkit"), CLI-first, and often preferred for infrastructure-level GitOps. Many organizations use both — Flux for cluster/infrastructure bootstrapping, ArgoCD for application delivery where the UI's visibility matters to a broader team.

??? question "Explain GitOps & ArgoCD Concepts, concretely."
    The four GitOps principles: declarative (desired state described, not imperative steps), versioned (the entire desired state lives in Git, with full history), pulled automatically (ArgoCD, an agent inside the cluster, pulls from Git — nothing external pushes to the cluster), and continuously reconciled (ArgoCD doesn't just apply once; it keeps checking and correcting drift). Each principle maps to a real operational property: versioned means audit trail, pulled means no external system needs cluster credentials, continuously reconciled means configuration drift gets caught rather than silently accumulating.

??? question "Explain Applications & AppProjects, concretely."
    An `Application` is one deployable unit: `source` (repo URL, path, target revision), `destination` (cluster server URL, namespace), and `syncPolicy` (automated or manual, with `prune`/`selfHeal` flags). An `AppProject` groups Applications and restricts what they're collectively allowed to do — `sourceRepos` (which Git repos are allowed), `destinations` (which cluster/namespace combinations), `clusterResourceWhitelist`/`namespaceResourceWhitelist` (which Kubernetes resource kinds), and `roles` with Casbin-style policies for who can sync vs. just view. Without an AppProject, every Application implicitly has the access of the `default` project — restricting per-team is what makes a single shared ArgoCD instance safe for multiple teams.

---

## Official Resources

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [ArgoCD ApplicationSets](https://argo-cd.readthedocs.io/en/stable/user-guide/application-set/)
