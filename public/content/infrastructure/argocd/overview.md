# ArgoCD — GitOps Continuous Delivery

ArgoCD is the most widely adopted GitOps tool for Kubernetes. It continuously monitors Git repositories and automatically synchronizes Kubernetes cluster state with the desired state defined in Git — making Git the single source of truth for your infrastructure.

## What is GitOps?

GitOps = Git + Operations. Core principle: **everything is code in Git**.

```
Traditional CD:                    GitOps CD:
CI pipeline pushes to K8s    vs    Git repo IS the desired state
Pipeline has cluster access        Only ArgoCD has cluster access
Hard to audit "who changed what"   Every change is a Git commit
Rollback = re-run old pipeline     Rollback = revert Git commit
```

**Four GitOps Principles:**
1. Declarative — desired state described declaratively
2. Versioned — entire desired state stored in Git
3. Pulled automatically — software agents pull from Git
4. Continuously reconciled — agents continuously correct drift

## Architecture

```
Developer → Git Push → GitHub/GitLab
                              │
                    ArgoCD watches repo
                              │
                    Detects drift from desired state
                              │
                    Syncs cluster to match Git
                              │
                    Kubernetes Cluster Updated
```

ArgoCD runs inside the cluster, polls (or receives webhooks from) Git repos, and calls the Kubernetes API to apply changes. The cluster pulls from Git — your CI pipeline never has direct cluster access.

## Core Concepts

**Application** — ArgoCD's unit of deployment. Links a Git repo path to a Kubernetes namespace.

**AppProject** — Groups Applications. Controls which repos, clusters, and namespaces are allowed. Used for multi-tenant RBAC.

**Sync** — The act of applying Git state to the cluster.

**Sync Status** — `Synced` (cluster matches Git), `OutOfSync` (cluster differs from Git).

**Health Status** — `Healthy`, `Progressing`, `Degraded`, `Missing`, `Unknown`.

**Auto-sync** — ArgoCD automatically applies changes when Git changes detected. Can enable/disable per application.

**Self-heal** — ArgoCD reverts manual `kubectl` changes to match Git state. Prevents "configuration drift".

## Installation

```bash
# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for pods
kubectl wait --for=condition=Available deployment/argocd-server -n argocd --timeout=120s

# Get admin password
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d

# Access UI
kubectl port-forward svc/argocd-server -n argocd 8080:443
# https://localhost:8080  admin / <password>

# Install argocd CLI
curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x argocd && sudo mv argocd /usr/local/bin/

# Login
argocd login localhost:8080 --username admin --password <password> --insecure
```

## Create Your First Application

```yaml
# application.yaml — Deploy an app from Git
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp-production
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io  # Delete resources when app deleted
spec:
  project: default

  source:
    repoURL: https://github.com/myorg/myapp-gitops
    targetRevision: main                    # Branch, tag, or commit SHA
    path: kubernetes/production             # Path in repo

  destination:
    server: https://kubernetes.default.svc  # In-cluster
    namespace: production

  syncPolicy:
    automated:
      prune: true      # Delete resources removed from Git
      selfHeal: true   # Revert manual kubectl changes
    syncOptions:
    - CreateNamespace=true
    - PrunePropagationPolicy=foreground
    retry:
      limit: 3
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m
```

```bash
# CLI approach
argocd app create myapp-production \
  --repo https://github.com/myorg/myapp-gitops \
  --path kubernetes/production \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace production \
  --sync-policy automated \
  --auto-prune \
  --self-heal

# Check status
argocd app get myapp-production
argocd app sync myapp-production     # Manual sync
argocd app rollback myapp-production 5  # Rollback to revision 5
```

## Helm Charts with ArgoCD

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: prometheus-stack
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://prometheus-community.github.io/helm-charts
    chart: kube-prometheus-stack
    targetRevision: "56.0.0"
    helm:
      releaseName: prometheus
      values: |
        grafana:
          adminPassword: "secure-password"
          persistence:
            enabled: true
            size: 10Gi
        prometheus:
          prometheusSpec:
            retention: 30d
            storageSpec:
              volumeClaimTemplate:
                spec:
                  resources:
                    requests:
                      storage: 50Gi
      valueFiles:
      - values-production.yaml   # File in your Git repo

  destination:
    server: https://kubernetes.default.svc
    namespace: monitoring

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## App of Apps Pattern

Scale to hundreds of applications:

```yaml
# Root application watches a directory of Application manifests
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/myorg/gitops-root
    path: apps/production              # Contains Application manifests
    targetRevision: main
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      selfHeal: true
      prune: true
```

```
gitops-root/
├── apps/
│   └── production/
│       ├── frontend.yaml           # Application manifest
│       ├── backend.yaml            # Application manifest
│       ├── postgres.yaml           # Application manifest
│       └── prometheus.yaml         # Application manifest
└── kubernetes/
    ├── frontend/
    │   └── deployment.yaml
    └── backend/
        └── deployment.yaml
```

## Multi-Cluster Management

```yaml
# Register external cluster
argocd cluster add my-prod-cluster --name production-us-east

# Application targeting external cluster
spec:
  destination:
    server: https://prod-cluster-api.example.com
    namespace: production
```

## AppProject — Multi-tenant RBAC

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: team-payments
  namespace: argocd
spec:
  description: "Payments team project"

  # Only these repos allowed
  sourceRepos:
  - https://github.com/myorg/payments-*

  # Only these destinations allowed
  destinations:
  - namespace: payments-*
    server: https://kubernetes.default.svc

  # Only these resource types allowed
  clusterResourceWhitelist:
  - group: ''
    kind: Namespace

  namespaceResourceWhitelist:
  - group: 'apps'
    kind: Deployment
  - group: ''
    kind: Service
  - group: ''
    kind: ConfigMap

  # RBAC — team can sync but not delete
  roles:
  - name: developer
    policies:
    - p, proj:team-payments:developer, applications, get, team-payments/*, allow
    - p, proj:team-payments:developer, applications, sync, team-payments/*, allow
    - p, proj:team-payments:developer, applications, create, team-payments/*, allow
```

## Sync Waves — Ordered Deployment

```yaml
# Control deployment order with sync-wave annotation
# Lower numbers deploy first. Default is 0.

# 1. Deploy database first (wave -2)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
  annotations:
    argocd.argoproj.io/sync-wave: "-2"

# 2. Run database migrations (wave -1)
apiVersion: batch/v1
kind: Job
metadata:
  name: db-migrate
  annotations:
    argocd.argoproj.io/sync-wave: "-1"

# 3. Deploy application (wave 0, default)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  # no annotation needed

# 4. Deploy monitoring (wave 1)
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: myapp-monitor
  annotations:
    argocd.argoproj.io/sync-wave: "1"
```

## Interview Questions

**What is the difference between ArgoCD and Flux?**
Both implement GitOps for Kubernetes. ArgoCD provides a visual UI, supports multi-cluster, has an AppProject multi-tenancy model, and is more feature-rich for organizations. Flux is more lightweight, CLI-focused, tightly integrated with Kubernetes controllers (CRDs), and easier to extend. ArgoCD is better for teams that want visibility and a UI; Flux for teams that want pure GitOps with minimal overhead. Many organizations use both: Flux for infrastructure, ArgoCD for applications.

**What happens when someone runs `kubectl apply` directly bypassing ArgoCD?**
If `selfHeal: true` is configured on the Application, ArgoCD detects the drift within the polling interval (default 3 minutes or immediately on webhook) and reverts the change to match Git state. The manual change gets overwritten. This is GitOps enforcement — Git is the source of truth. If `selfHeal: false`, the app shows as `OutOfSync` but doesn't revert automatically. This is why RBAC should restrict direct kubectl access in production environments.

**Explain how you would roll back a bad deployment with ArgoCD.**
Option 1: Revert the Git commit (`git revert HEAD && git push`) — ArgoCD auto-syncs to the previous state. This is the preferred GitOps approach. Option 2: `argocd app rollback myapp <revision-id>` — reverts to a previous ArgoCD revision without changing Git. Option 3: Disable auto-sync temporarily, manually sync to a specific Git commit SHA. Always prefer Option 1 in production as it keeps Git history accurate.
