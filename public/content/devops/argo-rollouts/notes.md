# Argo Rollouts — Key Notes

## Core CRDs

| CRD | Purpose |
|---|---|
| `Rollout` | Drop-in replacement for `Deployment` — adds canary/blue-green strategy |
| `AnalysisTemplate` | Reusable definition of a metric query + success/failure condition |
| `ClusterAnalysisTemplate` | Same as AnalysisTemplate, but cluster-scoped (usable across namespaces) |
| `AnalysisRun` | A single, in-progress execution of an AnalysisTemplate — created automatically when a rollout hits an analysis step |
| `Experiment` | Runs separate baseline/canary pods to compare metrics, without touching live Rollout traffic |

## CLI Command Reference

```
kubectl argo rollouts get rollout <name> --watch    # live status
kubectl argo rollouts list rollouts                  # list all rollouts
kubectl argo rollouts promote <name>                 # advance past current pause
kubectl argo rollouts promote <name> --full          # skip all remaining steps
kubectl argo rollouts abort <name>                   # stop, full traffic back to stable
kubectl argo rollouts undo <name>                     # roll back to previous revision
kubectl argo rollouts restart <name>                  # recreate pods, no canary steps
kubectl argo rollouts dashboard                       # local UI at localhost:3100
```

## Rollout vs. Deployment

| | Deployment | Rollout |
|---|---|---|
| Update strategy | Rolling update only | Canary or Blue-Green, with explicit steps |
| Health awareness | Pod readiness only | Pod readiness + optional metric-based analysis |
| Rollback trigger | Manual only | Manual, or automatic on failed analysis |
| Traffic control | All-or-nothing per pod count | Precise weighted traffic control (with a traffic provider) |

## Canary vs. Blue-Green

| | Canary | Blue-Green |
|---|---|---|
| Traffic shift | Gradual (10% → 50% → 100%) | Instant, all-or-nothing switch |
| Resource cost during rollout | Proportional to current step's replica split | Full duplicate capacity (both versions fully scaled) |
| Rollback speed | Fast, but was already partial exposure | Instant (switch routing back) |
| Real-user validation | Yes, at each traffic increment | Only if testing the preview service directly before switch |

## Analysis Step Types

```
INLINE analysis  → placed directly in the `steps` list, rollout PAUSES here
                    until it resolves — a specific go/no-go gate
BACKGROUND analysis → runs continuously in parallel from a `startingStep`,
                       doesn't block step progression, catches slower-building
                       regressions across the whole rollout
```

## Traffic Providers (need one for precise weight enforcement)

```
Istio, AWS ALB, NGINX Ingress, SMI (Linkerd + others), Ambassador, Traefik
```
Without one configured, canary steps still execute (scaling pod counts per step) but actual traffic split approximates via basic Service load-balancing, not an enforced exact percentage.

## Pairing with ArgoCD

```
ArgoCD          → WHAT gets deployed (syncs desired state from Git)
Argo Rollouts   → HOW the deployment proceeds (canary/blue-green mechanics)
```
Together: Git push → ArgoCD syncs the Rollout object → Argo Rollouts executes the actual progressive delivery.
