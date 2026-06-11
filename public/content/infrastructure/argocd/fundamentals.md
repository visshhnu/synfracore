# ArgoCD — Fundamentals

## Core Concepts

```
Application: ArgoCD resource linking a Git repo path to a K8s cluster/namespace
Repository: Git repo containing K8s manifests (plain YAML, Helm, Kustomize)
Sync:        Make cluster state match Git state
Drift:       Cluster state differs from Git (detected automatically)

Sync status:  Synced | OutOfSync
Health status: Healthy | Progressing | Degraded | Missing
```

## Install ArgoCD

```bash
# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f \
  https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for pods
kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server -n argocd

# Get initial admin password
kubectl get secret argocd-initial-admin-secret -n argocd \
  -o jsonpath="{.data.password}" | base64 -d

# Port forward to access UI
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Login with CLI
argocd login localhost:8080
argocd account update-password
```

## Application Definition

```yaml
# application.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app-production
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io  # Cascade delete

spec:
  project: default

  source:
    repoURL: https://github.com/myorg/k8s-configs
    targetRevision: HEAD     # Branch, tag, or commit SHA
    path: apps/my-app/prod   # Path within repo

    # For Helm charts
    helm:
      valueFiles:
        - values.yaml
        - values-prod.yaml
      parameters:
        - name: image.tag
          value: "1.2.3"

  destination:
    server: https://kubernetes.default.svc  # In-cluster
    namespace: production

  syncPolicy:
    automated:
      prune: true       # Delete resources removed from Git
      selfHeal: true    # Revert manual changes to cluster
    syncOptions:
      - CreateNamespace=true
      - ApplyOutOfSyncOnly=true
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m
```

## App of Apps Pattern

```yaml
# root-app.yaml — single application that manages all other applications
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root-app
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/myorg/k8s-configs
    targetRevision: HEAD
    path: argocd/apps  # This directory contains other Application YAMLs
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true

# argocd/apps/ directory contains:
# - api-app.yaml (Application for API service)
# - frontend-app.yaml (Application for frontend)
# - monitoring-app.yaml (Application for Prometheus/Grafana stack)
```

## Image Updater

```yaml
# Automatically update image tags when new images are pushed
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  annotations:
    argocd-image-updater.argoproj.io/image-list: |
      app=registry.example.com/my-app
    argocd-image-updater.argoproj.io/app.update-strategy: latest
    argocd-image-updater.argoproj.io/write-back-method: git
spec:
  source:
    helm:
      parameters:
        - name: image.tag
          value: latest  # Will be updated by image updater
```

## CLI Common Commands

```bash
# Application management
argocd app list
argocd app get my-app-production
argocd app sync my-app-production
argocd app sync my-app-production --dry-run    # Preview sync
argocd app diff my-app-production              # What will change

# Rollback
argocd app history my-app-production
argocd app rollback my-app-production 5  # Roll back to revision 5

# Manual override (will be reverted by selfHeal)
argocd app set my-app-production --parameter image.tag=v1.2.3

# Project management
argocd proj list
argocd proj create production \
  --dest https://k8s.prod.example.com,production \
  --src https://github.com/myorg/k8s-configs

# Repository management
argocd repo add https://github.com/myorg/k8s-configs \
  --username git \
  --password $GITHUB_TOKEN
```
