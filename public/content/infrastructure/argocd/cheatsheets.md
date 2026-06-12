# ArgoCD — Cheatsheet

```bash
# ── LOGIN ──────────────────────────────────────────────────
argocd login argocd.example.com --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
argocd login --core                              # In-cluster login

# ── APPLICATIONS ───────────────────────────────────────────
argocd app list                                  # All applications
argocd app get my-app                            # App details
argocd app get my-app --refresh                  # Force refresh
argocd app diff my-app                           # What will change
argocd app sync my-app                           # Sync now
argocd app sync my-app --dry-run                 # Preview sync
argocd app sync my-app --prune                   # Also delete removed resources
argocd app sync my-app --force                   # Force replace (destructive)
argocd app wait my-app --health                  # Wait until healthy
argocd app wait my-app --sync                    # Wait until synced

# Rollback
argocd app history my-app
argocd app rollback my-app 5                     # Roll back to revision 5

# Manual override (temporary, selfHeal will revert)
argocd app set my-app -p image.tag=v1.2.3

# Delete (with cascade — deletes K8s resources too)
argocd app delete my-app --cascade

# ── REPOSITORIES ──────────────────────────────────────────
argocd repo list
argocd repo add https://github.com/org/repo \
    --username git \
    --password $GITHUB_TOKEN
argocd repo add git@github.com:org/repo \
    --ssh-private-key-path ~/.ssh/argocd_deploy_key

# ── CLUSTERS ──────────────────────────────────────────────
argocd cluster list
argocd cluster add <context-name>                # Add from kubeconfig
argocd cluster get https://k8s.example.com

# ── PROJECTS ──────────────────────────────────────────────
argocd proj list
argocd proj create my-project \
    --src https://github.com/org/repo \
    --dest https://kubernetes.default.svc,production

# ── ACCOUNTS ──────────────────────────────────────────────
argocd account list
argocd account update-password
argocd account generate-token --account ci-bot   # For CI/CD

# ── CONTEXT ───────────────────────────────────────────────
argocd context                                   # Current context
argocd context prod-argocd                       # Switch context
```

## Application YAML Quick Reference

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
  finalizers: [resources-finalizer.argocd.argoproj.io]
  annotations:
    # Notifications
    notifications.argoproj.io/subscribe.on-sync-failed.slack: alerts
spec:
  project: default
  source:
    repoURL: https://github.com/org/k8s-configs
    targetRevision: HEAD       # branch, tag, or commit SHA
    path: apps/my-app/prod
    # For Helm:
    helm:
      valueFiles: [values.yaml, values-prod.yaml]
      parameters: [{name: image.tag, value: "1.2.3"}]
    # For Kustomize:
    kustomize:
      images: [myapp=registry.io/myapp:1.2.3]
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
      - ApplyOutOfSyncOnly=true
      - ServerSideApply=true   # Better for large resources
    retry:
      limit: 5
      backoff: {duration: 5s, factor: 2, maxDuration: 3m}
  # Ignore specific differences (don't mark as OutOfSync)
  ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers: [/spec/replicas]  # Ignore HPA-managed replicas
```

## Sync Waves Reference

```yaml
# Lower number = earlier in sync
# Use annotations on K8s resources:
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "-1"   # Before wave 0 (default)

# Typical ordering:
# Wave -2: Namespaces, CRDs
# Wave -1: Secrets, ConfigMaps, ServiceAccounts, RBAC
# Wave  0: Deployments, Services (default)
# Wave  1: Ingress (depends on Service existing)
# Wave  2: HPA (depends on Deployment existing)
# Wave  5: Smoke test Job
```
