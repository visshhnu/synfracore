# ArgoCD Certification Guide

## Certifications Available

No official ArgoCD-specific certification exists. ArgoCD/GitOps knowledge tested in:

| Cert | Coverage | Provider |
|------|----------|----------|
| **GitOps Fundamentals** | GitOps principles + ArgoCD | Codefresh (free) |
| **GitOps at Scale** | ApplicationSets, multi-cluster | Codefresh (free) |
| **CKA/CKAD** | ArgoCD as deployment tool | CNCF |
| Platform Engineering certs | GitOps as core discipline | Various |

GitOps Fundamentals at: **codefresh.io/learn/gitops/**

---

## ArgoCD Core Concepts

```yaml
# Application CRD — the core resource
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
spec:
  project: default

  source:
    repoURL: https://github.com/org/repo.git
    targetRevision: HEAD                 # branch, tag, or commit SHA
    path: k8s/overlays/production        # Path within repo

    # For Helm charts:
    # chart: my-chart
    # helm:
    #   values: |
    #     replicas: 3

  destination:
    server: https://kubernetes.default.svc  # Current cluster
    namespace: production

  syncPolicy:
    automated:
      prune: true          # Delete resources removed from Git
      selfHeal: true       # Revert manual changes to cluster
    syncOptions:
      - CreateNamespace=true
      - PrunePropagationPolicy=foreground
    retry:
      limit: 5
      backoff:
        duration: 5s
        maxDuration: 3m
        factor: 2
```

---

## ArgoCD CLI Commands

```bash
# Connect and login
argocd login argocd.example.com --username admin --password $PASS
argocd login argocd.example.com --sso                          # SSO login

# App management
argocd app list
argocd app get my-app
argocd app sync my-app                                         # Trigger sync
argocd app sync my-app --revision v1.2.0                      # Sync specific revision
argocd app diff my-app                                         # What will change
argocd app history my-app                                      # Sync history
argocd app rollback my-app 5                                   # Roll back to revision 5

# Create app from CLI
argocd app create my-app   --repo https://github.com/org/repo   --path k8s/production   --dest-server https://kubernetes.default.svc   --dest-namespace production   --sync-policy automated   --auto-prune --self-heal

# Cluster management
argocd cluster list
argocd cluster add arn:aws:eks:us-east-1:123:cluster/prod     # Add EKS cluster

# Projects
argocd proj list
argocd proj create my-project   --src-repo https://github.com/org/*   --dest-namespace production   --dest-server https://kubernetes.default.svc
```

---

## ApplicationSet (Multi-app Patterns)

```yaml
# Generate one Application per directory in repo
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: microservices
  namespace: argocd
spec:
  generators:
    - git:
        repoURL: https://github.com/org/monorepo.git
        revision: HEAD
        directories:
          - path: services/*            # One app per service directory

    # Cluster generator: deploy same app to multiple clusters
    - clusters:
        selector:
          matchLabels:
            environment: production

  template:
    metadata:
      name: '{{path.basename}}'        # service directory name
    spec:
      project: default
      source:
        repoURL: https://github.com/org/monorepo.git
        path: '{{path}}'
      destination:
        server: '{{server}}'
        namespace: '{{path.basename}}'
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
```

---

## Sync Hooks and Waves

```yaml
# Control sync order with hooks and waves
apiVersion: batch/v1
kind: Job
metadata:
  name: db-migrate
  annotations:
    argocd.argoproj.io/hook: PreSync          # Run before sync
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
    argocd.argoproj.io/sync-wave: "-1"        # Lower = earlier
spec:
  template:
    spec:
      containers:
        - name: migrate
          image: myapp:latest
          command: ["python", "manage.py", "migrate"]
      restartPolicy: Never
```

**Hook types**: PreSync → Sync → PostSync → SyncFail

## Revision Notes
```
ARGOCD: Pull-based GitOps. Agent in cluster watches Git → applies to cluster.

KEY CONCEPTS:
  Application: Git source → K8s destination
  Sync: bring cluster state to match Git state
  prune: delete resources removed from Git (enable carefully!)
  selfHeal: revert manual kubectl changes to match Git

SYNC STATUS: Synced | OutOfSync | Unknown
HEALTH STATUS: Healthy | Degraded | Progressing | Missing | Unknown

APP-OF-APPS: one Application that manages other Applications
ApplicationSet: template-driven multi-app generation
  Generators: Git directories, clusters, list, matrix, merge

HOOKS: PreSync (DB migrate) | PostSync (smoke test) | SyncFail (notify)
WAVES: sync-wave annotation controls order within a hook phase

RBAC: AppProjects control which repos/clusters/namespaces teams can use
SSO: integrate with GitHub/Google/LDAP via Dex OIDC provider
```
