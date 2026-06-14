# ArgoCD — Prerequisites

## What to Know Before Starting ArgoCD

ArgoCD implements GitOps — it watches a Git repository and automatically syncs your Kubernetes cluster to match what's in Git. These foundations are essential.

## Required

### 1. Kubernetes — Solid Understanding
ArgoCD manages Kubernetes resources. You must know:
- Deployments, Services, ConfigMaps, Secrets
- Namespaces and RBAC
- How to use `kubectl` comfortably
- What happens when a pod restarts vs a deployment rolls out

**Minimum:** Complete Kubernetes Fundamentals AND Intermediate before ArgoCD.

### 2. Git — Branching and PRs
GitOps means Git IS your deployment system. ArgoCD watches a Git branch and syncs any changes to the cluster automatically. You must know:
```bash
git clone, git add, git commit, git push
git branch -b feature/new-config
git merge, git pull request
```

You also need a GitHub/GitLab/Bitbucket account with a repository ArgoCD can watch.

### 3. Kubernetes YAML — Comfortable Writing It
ArgoCD syncs YAML files from Git to your cluster. You'll spend a lot of time writing and reading:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
  namespace: production
spec:
  replicas: 3
  ...
```

If writing Kubernetes YAML from scratch feels hard, practice that first.

### 4. Helm (Recommended)
ArgoCD has first-class Helm support. Many real-world GitOps setups use Helm charts in Git, not raw YAML. Understanding Helm charts makes ArgoCD much more powerful.

## The GitOps Mental Model (Get This Before Starting)

```
Traditional Deployment:
  Developer → runs kubectl apply → cluster changes

GitOps with ArgoCD:
  Developer → pushes to Git → ArgoCD notices → ArgoCD applies to cluster

Key difference: ArgoCD is the ONLY thing that touches the cluster.
Nobody runs kubectl apply in production. Ever.
If someone does: ArgoCD detects "drift" and reverts it automatically.
```

If this model doesn't click yet, read about GitOps principles first.

## Learning Order

```
Kubernetes Fundamentals
      ↓
Kubernetes Intermediate
      ↓
Helm Fundamentals (optional but recommended)
      ↓
ArgoCD Installation
      ↓
ArgoCD Fundamentals (your first App)
      ↓
ArgoCD Intermediate (ApplicationSets, sync waves, notifications)
```

## Time Estimate

With Kubernetes + Git knowledge:
- Deploy your first ArgoCD Application: 1 day
- Production GitOps setup with auto-sync: 1 week
- Multi-environment with ApplicationSets: 2-3 weeks
