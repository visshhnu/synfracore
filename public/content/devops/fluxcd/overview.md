# FluxCD

> **Pure GitOps — no UI, CRD-driven, multi-tenancy**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is FluxCD?

Both ArgoCD and FluxCD implement GitOps — cluster pulls desired state from Git. Key difference: ArgoCD has a rich UI for visualising application state; FluxCD has no UI — everything is CRDs managed via CLI or kubectl. FluxCD is preferred by platform teams who want pure CLI-driven GitOps with no web UI to maintain. FluxCD has better multi-tenancy support natively.

## Why FluxCD?

FluxCD is built around CRDs. GitRepository tells Flux where to watch. Kustomization tells Flux what path to apply from that repo. HelmRelease manages Helm charts. The key GitOps loop: Git changes → source-controller detects → kustomize-controller applies → cluster matches Git.

---

## Learning Modules

### Module 01 — FluxCD vs ArgoCD
*Two GitOps tools — key differences*

Both ArgoCD and FluxCD implement GitOps — cluster pulls desired state from Git. Key difference: ArgoCD has a rich UI for visualising application state; FluxCD has no UI — everything is CRDs managed via CLI or kubectl. FluxCD is preferred by platform teams who want pure CLI-driven GitOps with no web UI to maintain. FluxCD has better multi-tenancy support natively.

**Topics covered:**

- Pull-based GitOps — same principle — 🟢 Beginner
- FluxCD: no UI, pure CRD-driven — 🟢 Beginner
- ArgoCD: UI + CRDs — 🟢 Beginner
- When to choose FluxCD over ArgoCD — 🟡 Intermediate
- Flux components: source-controller, kustomize-controller — 🟡 Intermediate

```bash
# FluxCD architecture components:
# source-controller    — watches Git repos, Helm repos, OCI registries
# kustomize-controller — applies Kustomization CRDs
# helm-controller      — manages HelmRelease CRDs
# notification-controller — sends alerts (Slack, Teams, webhook)
# image-automation-controller — auto-updates image tags in Git

# Install Flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash

# Bootstrap FluxCD — installs into cluster + sets up Git repo
flux bootstrap github \\
  --owner=myorg \\
  --repository=gitops-fleet \\
  --branch=main \\
  --path=clusters/production \\
  --personal

# This:
# 1. Creates the gitops-fleet repo (or uses existing)
# 2. Installs FluxCD into the cluster
# 3. Commits FluxCD manifests to the repo
# 4. FluxCD then manages itself via GitOps

# Check FluxCD is running
flux check
kubectl get pods -n flux-system
```

### Module 02 — Core FluxCD CRDs
*GitRepository, Kustomization, HelmRelease*

FluxCD is built around CRDs. GitRepository tells Flux where to watch. Kustomization tells Flux what path to apply from that repo. HelmRelease manages Helm charts. The key GitOps loop: Git changes → source-controller detects → kustomize-controller applies → cluster matches Git.

**Topics covered:**

- GitRepository — watch a Git repo — 🟢 Beginner
- Kustomization — apply from repo path — 🟡 Intermediate
- HelmRelease — deploy Helm charts via FluxCD — 🟡 Intermediate
- ImageRepository + ImagePolicy — auto image updates — 🔴 Advanced

```bash
# GitRepository — watch a Git repo for changes
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: gitops-repo
  namespace: flux-system
spec:
  interval: 1m      # Poll every minute
  url: https://github.com/company/gitops-repo
  ref:
    branch: main
  secretRef:
    name: github-token    # For private repos
---
# Kustomization — apply a path from the repo
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: production-apps
  namespace: flux-system
spec:
  interval: 5m
  sourceRef:
    kind: GitRepository
    name: gitops-repo
  path: ./clusters/production
  prune: true           # Delete resources removed from Git
  healthChecks:
  - apiVersion: apps/v1
    kind: Deployment
    name: payment-service
    namespace: production
  timeout: 5m
---
# HelmRelease — deploy a Helm chart via FluxCD
apiVersion: helm.toolkit.fluxcd.io/v2beta1
kind: HelmRelease
metadata:
  name: prometheus
  namespace: monitoring
spec:
  interval: 30m
  chart:
    spec:
      chart: kube-prometheus-stack
      version: ">=48.0.0"
      sourceRef:
        kind: HelmRepository
        name: prometheus-community
  values:
    grafana:
      adminPassword: "changeme"
    prometheus:
      prometheusSpec:
        retention: 30d
```

### Module 03 — FluxCD Multi-Tenancy
*Team isolation, RBAC, path-based tenancy*

FluxCD multi-tenancy: each team gets their own GitRepository pointing to their own repo (or their own path in a monorepo). Each team's Kustomization runs with a ServiceAccount scoped to their namespace. Team A cannot deploy to Team B's namespace. This is more native in FluxCD than ArgoCD.

**Topics covered:**

- Tenant isolation with Kustomization RBAC — 🔴 Advanced
- Per-team Git repos and paths — 🟡 Intermediate
- flux-system namespace security — 🔴 Advanced

```bash
# Multi-tenancy: team-a can only deploy to team-a namespace
# Create ServiceAccount for team-a
apiVersion: v1
kind: ServiceAccount
metadata:
  name: flux-team-a
  namespace: team-a
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: flux-team-a
  namespace: team-a
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: flux-team-a
  namespace: team-a
---
# Kustomization scoped to team-a ServiceAccount
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: team-a-apps
  namespace: flux-system
spec:
  serviceAccountName: flux-team-a    # Runs with team-a RBAC only
  sourceRef:
    kind: GitRepository
    name: team-a-repo
  path: ./apps
  targetNamespace: team-a
  prune: true

# Useful FluxCD commands
flux get all                          # Status of all resources
flux reconcile source git gitops-repo # Force re-sync from Git
flux reconcile kustomization production-apps
flux logs --all-namespaces            # All flux controller logs
flux trace kustomization production-apps  # Trace resource lineage
```

---

## Production Example

```bash
# FluxCD vs ArgoCD — Decision Guide

# CHOOSE FLUXCD WHEN:
# ✓ Pure CLI-driven platform team (no one wants a UI)
# ✓ Need native multi-tenancy (each team has their own repo)
# ✓ Want minimal cluster footprint
# ✓ Already using Kustomize heavily
# ✓ GitOps for platform config (not just apps)

# CHOOSE ARGOCD WHEN:
# ✓ Team wants a visual UI to see app health
# ✓ Need App-of-Apps pattern easily
# ✓ ApplicationSets for multi-cluster deployments
# ✓ On-call engineers need visual rollback
# ✓ Non-platform engineers also do deployments

# BOTH SUPPORT:
# ✓ Pull-based GitOps
# ✓ Drift detection and auto-correction
# ✓ Prune (delete resources removed from Git)
# ✓ Health checks
# ✓ Slack/webhook notifications
# ✓ Multi-cluster deployments
# ✓ Helm chart management

# INTERVIEW ANSWER:
# "I have production experience with ArgoCD and understand FluxCD
# deeply — same GitOps principles, different implementation.
# ArgoCD for teams that want UI visibility.
# FluxCD for pure platform engineering CLI workflows.
# I would evaluate based on team preferences, not technical capability
# since both solve the same problem equally well."
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is FluxCD and why would you use it in production?"
    **Problem:** manually running `kubectl apply` against a cluster means the cluster's actual state and Git's declared state drift apart the moment anyone makes a manual change — there's no single source of truth. **Solution:** FluxCD is a pull-based GitOps tool — controllers running inside the cluster continuously reconcile cluster state to match what's declared in Git, with zero UI, everything expressed as CRDs (`GitRepository`, `Kustomization`, `HelmRelease`) managed via CLI or `kubectl`. **Result:** Git becomes the actual source of truth, not just documentation of intent — any manual `kubectl` drift gets auto-corrected back to what Git says on the next reconciliation, and every change has a Git history/PR trail.

??? question "How does FluxCD work internally? Explain the architecture."
    **Problem:** without knowing which controller does what, "my change isn't showing up in the cluster" is guesswork. **Solution:** `source-controller` watches Git repos, Helm repos, and OCI registries for changes; `kustomize-controller` applies `Kustomization` CRDs (which reference a path in that source); `helm-controller` manages `HelmRelease` CRDs; the loop is Git changes → `source-controller` detects → `kustomize-controller`/`helm-controller` applies → cluster matches Git. **Result:** "my change isn't applying" splits into two different problems depending on which controller is stuck — `flux get sources git` shows whether the source was even detected, `flux get kustomizations` shows whether the apply step is the one failing.

??? question "What are the main components of FluxCD?"
    **Problem:** FluxCD's CRD-driven design means there's no single dashboard listing "the components" the way a UI-based tool would show — knowing them requires knowing the controllers. **Solution:** `source-controller` (watches sources), `kustomize-controller` (applies Kustomizations), `helm-controller` (manages HelmReleases), `notification-controller` (sends Slack/Teams/webhook alerts on reconciliation events), and `image-automation-controller` (auto-updates image tags in Git when a new image is pushed) are the five core controllers, each running as its own pod in the `flux-system` namespace. **Result:** `flux check` and `kubectl get pods -n flux-system` are the two commands that confirm all five are actually running — a missing pod there is a direct explanation for a specific class of stuck reconciliation.

??? question "How do you handle failures in FluxCD?"
    **Problem:** a `Kustomization` that isn't reconciling could be stuck for a source problem, an apply problem, or a health-check problem, and each needs a different command. **Solution:** `flux get all` gives a fast overall status across every Flux resource; `flux logs --all-namespaces` surfaces the actual controller error; `flux reconcile source git <name>` forces a re-fetch if the source looks stale; `flux trace kustomization <name>` traces a specific resource's lineage back through which `Kustomization`/`GitRepository` produced it, useful when the same resource is unexpectedly touched by two different tenants. **Result:** most stuck-reconciliation incidents resolve to a source-fetch failure (bad credentials, unreachable Git host) or a `healthChecks:`-blocked apply (the Kustomization won't report healthy until the named Deployment is actually healthy) — `flux get all` distinguishes the two immediately.

??? question "What is your production experience with FluxCD?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a stale `GitRepository` due to expired credentials, a `Kustomization` stuck on a failing `healthChecks:` target, a multi-tenant RBAC misconfiguration), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

??? question "How do you monitor and observe FluxCD in production?"
    **Problem:** a `Kustomization` silently failing to reconcile can leave a cluster running stale, drifted config for a long time before anyone notices. **Solution:** `notification-controller` pushes reconciliation events (success and failure) to Slack/Teams/webhooks, so a failed sync surfaces immediately rather than waiting for someone to run `flux get all`; `healthChecks:` on a `Kustomization` ties reconciliation success to an actual Deployment being healthy, not just "the YAML applied without error"; `flux get all` and `flux logs` remain the manual fallback for deeper investigation. **Result:** the notification-controller alert is what catches drift proactively — the CLI commands are for diagnosing an alert that already fired, not the primary detection mechanism.

??? question "What are the security considerations for FluxCD?"
    **Problem:** Flux has cluster-wide apply permissions by default, and in a multi-tenant cluster an over-broad `ServiceAccount` means one team's `Kustomization` could apply resources into another team's namespace. **Solution:** scope each tenant's `Kustomization` with `serviceAccountName:` pointing at a `ServiceAccount` whose RBAC is limited to that team's namespace (not `cluster-admin`, despite that being the quickest way to unblock a new tenant), keep each team's `GitRepository` pointed at their own repo or repo path, and use `secretRef:` for private-repo credentials rather than embedding tokens in the CRD. **Result:** this is what makes "Team A cannot deploy to Team B's namespace" actually true rather than aspirational — the isolation is enforced by RBAC on the reconciling ServiceAccount, not by convention.

??? question "How does FluxCD compare to alternatives?"
    **Problem:** FluxCD and ArgoCD solve the same GitOps problem, and picking between them is a real, recurring decision. **Solution:** both are pull-based GitOps with drift detection, pruning, health checks, and Helm support — the real difference is UI and tenancy model: ArgoCD has a rich web UI for visualizing app state and an App-of-Apps pattern that's easy for non-platform engineers to use; FluxCD is pure CLI/CRD-driven with no UI to maintain, and has more native multi-tenancy (per-team `GitRepository`/`ServiceAccount` isolation) built in. **Result:** the choice tracks who's actually doing deployments — teams where non-platform engineers need visual rollback lean ArgoCD; platform teams standardizing on CLI-only workflows across many tenants lean FluxCD — not a capability gap either way.

??? question "Walk through the difference between GitRepository, Kustomization, and HelmRelease."
    **Problem:** all three are Flux CRDs and it's easy to conflate "watching a source" with "applying it." **Solution:** `GitRepository` only watches — it tells Flux where to poll (a Git URL, branch, and interval) and does nothing else; `Kustomization` references a `GitRepository` as its `sourceRef` and applies a specific path from it, with options like `prune: true` (delete resources removed from Git) and `healthChecks:` (don't report success until a named Deployment is actually healthy); `HelmRelease` similarly references a Helm chart source and manages installing/upgrading that chart. **Result:** a `GitRepository` that's healthy but a `Kustomization` that isn't means the source is being fetched fine but the apply or health check is failing — these two CRDs failing independently is exactly why `flux get sources git` and `flux get kustomizations` are checked separately, not as one combined status.

??? question "How does FluxCD's multi-tenancy model actually enforce isolation between teams?"
    **Problem:** without a design for it, any team's `Kustomization` could apply resources anywhere in the cluster, defeating the point of "self-service GitOps" once more than one team shares a cluster. **Solution:** each tenant gets their own `GitRepository` (pointing at their own repo or repo path) and their own `ServiceAccount`, and their `Kustomization` sets `serviceAccountName:` to that scoped account with `targetNamespace:` limiting where it can apply — Flux then reconciles that tenant's resources using that tenant's RBAC, not Flux's own cluster-wide permissions. **Result:** this is more native to FluxCD's design than ArgoCD's — the isolation is a first-class field on the `Kustomization` spec itself, not a separate RBAC layer bolted on afterward.

---

## Official Resources

- [FluxCD Documentation](https://fluxcd.io/flux/)
- [FluxCD vs ArgoCD comparison](https://fluxcd.io/blog/2022/11/gitops-without-argo-cd/)

---

