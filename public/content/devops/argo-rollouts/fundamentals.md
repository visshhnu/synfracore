# Argo Rollouts — Fundamentals

## What a standard Kubernetes rolling update can't do

A standard Deployment's rolling update replaces old pods with new ones gradually, but it has no concept of whether the new version is actually *healthy* — it proceeds based purely on pod readiness (did the container start and pass its readiness probe), not on real application-level health signals like error rate or latency. A new version that starts fine but silently produces wrong results, or elevated errors, rolls out to 100% of traffic with no automatic check catching it. Argo Rollouts exists specifically to close this gap.

## The `Rollout` resource: a drop-in replacement for `Deployment`

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: payment-service
spec:
  replicas: 10
  selector:
    matchLabels: { app: payment }
  template:
    metadata: { labels: { app: payment } }
    spec:
      containers:
      - name: payment
        image: myregistry/payment:v1.2.3
  strategy:
    canary:
      canaryService: payment-canary
      stableService: payment-stable
      steps:
      - setWeight: 10
      - pause: { duration: 5m }
      - setWeight: 50
      - pause: { duration: 5m }
      - setWeight: 100
```

A `Rollout` has essentially the same pod template structure as a `Deployment` — the meaningful difference is the `strategy` block, which defines a canary (or blue-green) rollout with explicit, controllable steps instead of a single implicit rolling update.

## Canary steps: precise, incremental traffic control

Each `setWeight` step sends that percentage of traffic to the new version; `pause` holds at that weight for a defined duration (or indefinitely, until manually promoted) before proceeding. This granular control — 10% → wait → 50% → wait → 100%, rather than an all-or-nothing switch — is what actually limits the blast radius of a bad deploy: if something's wrong, it's affecting 10% of traffic for the pause duration, not 100% immediately.

## Manual control: promote and abort

```bash
kubectl argo rollouts get rollout payment-service --watch    # live status
kubectl argo rollouts promote payment-service                 # manually advance a paused step
kubectl argo rollouts abort payment-service                   # abort and roll back immediately
kubectl argo rollouts undo payment-service                    # roll back to the previous stable version
```
Even before adding automated analysis (Intermediate), manual pauses with human review at each step are a real, meaningful safety improvement over a standard Deployment's unconditional rolling update — automated analysis is the next step up, not a prerequisite for getting any value from Argo Rollouts at all.

## Why this pairs naturally with ArgoCD

Argo Rollouts and ArgoCD are separate tools solving separate problems — ArgoCD handles *what gets deployed* (syncing the desired state from Git), Argo Rollouts handles *how the deployment actually proceeds* (the canary/blue-green mechanics once a new version is being rolled out). Used together: a Git push changes the image tag, ArgoCD detects and syncs the change, and Argo Rollouts takes over executing the actual progressive rollout — giving you full GitOps (Git as source of truth) *and* progressive delivery (safe, gradual, checkable rollouts) at the same time, rather than having to choose one or hand-roll the other.

## Blue-Green as the other supported strategy

```yaml
strategy:
  blueGreen:
    activeService: payment-active
    previewService: payment-preview
    autoPromotionEnabled: false   # require manual promotion
```
Where canary shifts traffic gradually, blue-green routes 100% of traffic to either the old ("active") or new ("preview") version at any given moment — the new version gets fully deployed and can be tested against the preview service before a single traffic-routing switch sends everything to it. This gives instant, complete rollback (switch the routing back) at the cost of running full duplicate capacity during the transition — the same fundamental blue-green tradeoff that applies outside Kubernetes too, just implemented natively here.
