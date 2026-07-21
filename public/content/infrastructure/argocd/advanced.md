# Platform Engineering with ArgoCD — Production Patterns

## Multi-Cluster GitOps

### Hub and Spoke Pattern
```
ArgoCD (Hub cluster) manages:
├── dev-cluster     (namespace: apps-dev)
├── staging-cluster (namespace: apps-staging)
└── prod-cluster    (namespace: apps-prod)
```

Each cluster registered in ArgoCD:
```bash
argocd cluster add prod-context --name production
argocd cluster list
```

### Environment Promotion Pattern
```
main branch → deploy to dev (auto)
    ↓ tag/PR merge
staging branch → deploy to staging (auto)
    ↓ manual approval
prod branch → deploy to prod (manual sync required)
```

## Production Hardening

### Disaster Recovery
```bash
# There is no built-in "argocd backup" command -- back up the ArgoCD
# control-plane objects themselves (they are just Kubernetes resources):
kubectl get applications -n argocd -o yaml > apps-backup.yaml
kubectl get appprojects -n argocd -o yaml > projects-backup.yaml
kubectl get secrets -n argocd -l argocd.argoproj.io/secret-type=repository -o yaml > repo-creds-backup.yaml
kubectl get configmap argocd-cm argocd-rbac-cm -n argocd -o yaml > config-backup.yaml

# The deployed workload manifests themselves don't need backing up --
# Git is already the source of truth for those and ArgoCD re-applies them
# on restore. What actually needs backing up is ArgoCD's OWN state: which
# Applications/AppProjects exist, repo credentials, and RBAC/config, since
# none of that is reconstructable from the target clusters' Git repos alone.
```

### High Availability Setup
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ArgoCD
metadata:
  name: argocd
spec:
  ha:
    enabled: true     # Redis HA, multiple app controller replicas
  server:
    replicas: 2
  applicationSet:
    replicas: 2
```

### RBAC Configuration
```
# argocd-rbac-cm ConfigMap
policy.csv: |
  # Admins can do everything
  p, role:admin, *, *, *, allow
  
  # Devs can sync and view only
  p, role:developer, applications, get, */*, allow
  p, role:developer, applications, sync, dev-*/*, allow
  
  # Map GitHub teams to roles
  g, myorg:platform-team, role:admin
  g, myorg:developers, role:developer
```

## Integration Patterns

### Notifications
```yaml
# ArgoCD Notifications
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-notifications-cm
data:
  trigger.on-sync-failed: |
    - when: app.status.operationState.phase in ['Error', 'Failed']
      send: [slack-message]
  template.slack-message: |
    message: |
      Application {{.app.metadata.name}} sync {{.app.status.operationState.phase}}
      Repo: {{.app.spec.source.repoURL}}
      Commit: {{.app.status.operationState.operation.sync.revision}}
  service.slack: |
    token: $slack-token
    username: ArgoCD
```

### Webhook Integration
ArgoCD registers webhooks with GitHub/GitLab → instant sync on push (no polling delay).
```bash
# ArgoCD server webhook endpoint
https://argocd.company.com/api/webhook
```

## Key Commands Reference
```bash
# Application management
argocd app list
argocd app get myapp
argocd app sync myapp
argocd app sync myapp --dry-run    # Preview sync without applying
argocd app diff myapp              # Show diff between Git and cluster
argocd app history myapp           # Show sync history
argocd app rollback myapp 3        # Rollback to revision 3

# Clusters
argocd cluster add context-name
argocd cluster list

# Projects
argocd proj list
argocd proj get team-backend
argocd proj role list team-backend

# Login
argocd login argocd.company.com --sso
argocd logout

# App-of-apps bootstrap
argocd app create root-app \
  --repo https://github.com/org/gitops \
  --path argocd-apps \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace argocd \
  --sync-policy automated \
  --auto-prune \
  --self-heal
```
