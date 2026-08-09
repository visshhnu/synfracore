# FluxCD — Prerequisites

## What to Know Before Starting FluxCD

FluxCD is CRD-driven and CLI-only — there's no UI to fall back on when something's unclear, so solid Kubernetes fundamentals matter more here than for a tool with a rich dashboard.

## Required (Must Have)

### 1. Solid Kubernetes Fundamentals
```bash
kubectl get pods, kubectl describe, kubectl logs
kubectl apply -f, kubectl get crd
```
Everything in FluxCD is a Kubernetes Custom Resource — `GitRepository`, `Kustomization`, `HelmRelease` — you need to be comfortable reading and debugging CRDs with `kubectl describe`/`kubectl get -o yaml`, since there's no separate FluxCD UI to inspect state visually.

### 2. Git Fundamentals
```bash
git clone, git push, git branch, git tag
```
GitOps means Git is the source of truth for cluster state — you need to understand branches and commits well enough to reason about "what does the cluster currently match in Git."

### 3. Kustomize or Helm (At Least One)
FluxCD's `Kustomization` and `HelmRelease` CRDs apply Kustomize overlays and Helm charts respectively — you don't need deep expertise in both, but understanding at least one deployment-templating approach is necessary to understand what Flux is actually applying to the cluster.

## Nice to Have (Speeds Up Learning)

### Prior GitOps Concept Exposure (ArgoCD or Otherwise)
Overview's own framing is the fastest on-ramp if you've seen any GitOps tool before: FluxCD implements the same pull-based "cluster pulls desired state from Git" principle as ArgoCD — the difference is UI-less, CRD-only operation, not a different underlying philosophy.

### YAML Comfort
All Flux CRDs are YAML manifests — the same general comfort level needed for any Kubernetes-native tool.

### Basic Understanding of Webhooks/Notifications
Intermediate's coverage of the notification-controller (Provider/Alert CRDs) assumes basic familiarity with what a webhook is and how Slack/Teams integrations typically work.

## What You Do NOT Need

- Prior ArgoCD experience — helpful for contrast, but not required
- Deep Helm chart-authoring skills — using existing charts via `HelmRelease` is different from writing your own
- A managed Kubernetes cluster — Flux works identically on any conformant cluster, including local kind/minikube for learning

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 4-6 days
- Job-ready (comfortable with the GitOps reconciliation loop, multi-tenancy, and image automation): 2-3 weeks

## Start Here

Go to the **Installation** section to bootstrap FluxCD onto a cluster, then proceed to **Fundamentals**.
