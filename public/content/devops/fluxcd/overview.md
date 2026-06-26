# FluxCD

> **Pure GitOps — no UI, CRD-driven, multi-tenancy**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

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
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does FluxCD work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of FluxCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in FluxCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with FluxCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe FluxCD in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for FluxCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does FluxCD compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain FluxCD vs ArgoCD in FluxCD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Core FluxCD CRDs in FluxCD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [FluxCD Documentation](https://fluxcd.io/flux/)
- [FluxCD vs ArgoCD comparison](https://fluxcd.io/blog/2022/11/gitops-without-argo-cd/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*