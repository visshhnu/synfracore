# ArgoCD — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core GitOps Model

```
Git = single source of truth. ArgoCD (INSIDE the cluster) continuously
  watches Git and reconciles cluster state to match it.
FLIPS the normal CI/CD trust model: ArgoCD PULLS from Git and applies
  itself — NO external CI system needs direct cluster credentials.
Before GitOps: CI pipeline held long-lived cluster creds, "who changed
  what" buried in build logs, rollback = re-run old job and hope
With ArgoCD: every change traces to a Git commit (permanent, immutable
  audit trail), rollback = git revert (ArgoCD auto-applies it)
```

## Architecture

```
API server           — auth, RPC/API, UI
Repo server            — clones/caches Git repos, renders manifests
Application controller   — the actual reconciliation loop (compares
                          live state vs Git, triggers sync)
```

## Application CRD — Core Object

```
source:       Git repo, path, revision
destination:  cluster, namespace
syncPolicy:    automated vs MANUAL (human clicks sync)
AppProject — scopes which repos/clusters/namespaces a TEAM's
  Applications may touch — the mechanism letting ONE shared ArgoCD
  instance safely serve MULTIPLE teams
```

## Drift and Self-Heal

```
Drift = cluster's real state no longer matches Git (someone ran
  kubectl edit directly, or a controller mutated a resource)
selfHeal: true — automatically REVERTS drift back to Git — enforces
  Git as ACTUAL source of truth, not "true until someone intervenes"
  Some teams deliberately leave OFF in production — an emergency
  kubectl fix shouldn't be silently reverted before also fixed in Git
prune: true — REQUIRED for "removed from Git" to mean "deleted from
  cluster" — WITHOUT it, ArgoCD only adds/updates, NEVER removes a
  resource just because it disappeared from Git
```

## Resource Health vs Sync Status — Two Separate Dimensions

```
Sync Status  — does live state match Git? (Synced / OutOfSync)
Health Status — is the resource actually WORKING? (Healthy / Degraded /
               Progressing) — a resource can be Synced but Degraded
               (matches Git perfectly, but the app itself is crashing)
```

## Terminology Cross-Reference

```
ArgoCD term       | FluxCD equivalent
---------------------|--------------------------------
Application            | Kustomization + HelmRelease (roughly)
AppProject               | Multi-tenancy via scoped ServiceAccount
selfHeal                   | Flux's default reconciliation behavior
                             (FluxCD reconciles by default, no
                             separate opt-in flag needed)
UI                           | (no direct equivalent — FluxCD has none)
```
