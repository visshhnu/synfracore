# ArgoCD — Fundamentals

## What is ArgoCD?

|  | Traditional CD (Jenkins push) | GitOps (ArgoCD pull) |
|---|---|---|
| How it works | Jenkins runs `kubectl apply` when triggered | ArgoCD polls Git, applies when changed |
| Credentials | Jenkins has cluster credentials | Only ArgoCD has cluster credentials |
| Audit trail | Jenkins build log (can be deleted) | Git history (permanent, immutable) |
| Rollback | Re-run an old Jenkins build | `git revert` — ArgoCD auto-applies |
| Drift detection | None | Auto-detects and can auto-revert manual changes |
| Access control | Anyone with Jenkins access can deploy | Deployment = PR approval in Git |

```bash
# Install ArgoCD into a cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Access the UI (port-forward for local access)
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd login localhost:8080
```

## Application Object

An ArgoCD `Application` is the core object — one Application equals one service plus one environment. It defines *where* to get the config (Git repo, path, branch), *where* to deploy (cluster + namespace), and *how* to sync (automatic or manual, with or without self-healing).

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: payment-service-prod
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/company/payment-service
    targetRevision: main
    path: helm/payment-service
    helm:
      valueFiles: [values-prod.yaml]
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true      # remove resources deleted from Git
      selfHeal: true    # revert manual cluster changes back to Git state
    syncOptions: [CreateNamespace=true]
```

## App of Apps Pattern

Managing 15+ services by creating 15 Application objects manually doesn't scale. Instead, define them as YAML files in Git — a parent Application watches that directory. Adding a service means adding one YAML file; bootstrapping an environment means syncing one parent app.

```yaml
# apps/root-app.yaml — the parent Application watching a directory of Applications
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root-app
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/company/gitops-config
    path: apps/production
    directory: { recurse: true }
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated: { prune: true, selfHeal: true }
```
Adding `apps/production/new-service.yaml` (a normal Application manifest) is now enough to onboard a new service — the root app detects and applies it automatically on its next sync.

## Sync Waves & Hooks

Wave 1 (database) must be ready before Wave 2 (app). PreSync hooks run database migrations, PostSync hooks run smoke tests, and SyncFail hooks send alerts.

```yaml
# Database migration Job — runs BEFORE the main sync
apiVersion: batch/v1
kind: Job
metadata:
  name: db-migrate
  annotations:
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-1"
spec:
  template:
    spec:
      containers:
        - name: migrate
          image: myapp/migrate:latest
          command: ["./migrate", "up"]
      restartPolicy: Never
---
# Smoke test — runs AFTER the main sync
apiVersion: batch/v1
kind: Job
metadata:
  name: smoke-test
  annotations:
    argocd.argoproj.io/hook: PostSync
spec:
  template:
    spec:
      containers: [{ name: test, image: myapp/smoke-test:latest }]
      restartPolicy: Never
```

## RBAC & Projects

Projects in ArgoCD isolate teams — Team A cannot see or sync Team B's applications. Sync windows prevent production deployments outside business hours.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: payment-team
  namespace: argocd
spec:
  sourceRepos: ["https://github.com/company/payment-*"]
  destinations:
    - { server: https://kubernetes.default.svc, namespace: "payment-*" }
  roles:
    - name: developer
      policies:
        - "p, proj:payment-team:developer, applications, sync, payment-team/*, allow"
        - "p, proj:payment-team:developer, applications, get, payment-team/*, allow"
  syncWindows:
    - kind: deny
      schedule: "0 18 * * 5"    # deny Friday 6pm...
      duration: 60h              # ...through Monday 6am
      applications: ["payment-service-prod"]
```

## Troubleshooting

```bash
# Application shows OutOfSync — see exactly what differs
argocd app diff payment-service-prod

# Force a manual sync
argocd app sync payment-service-prod

# Sync keeps failing — check the actual error, not just "failed"
argocd app get payment-service-prod --show-operation

# Roll back to a previous, known-good revision
argocd app history payment-service-prod
argocd app rollback payment-service-prod <HISTORY_ID>
```
`OutOfSync` most commonly means someone made a manual `kubectl edit` against the live cluster (drift) — with `selfHeal: true` this self-corrects automatically on the next sync cycle; without it, the drift persists until someone manually syncs.

## ApplicationSets — Deploy to Many Clusters at Once

Without ApplicationSets, deploying to 10 environments means creating 10 nearly-identical ArgoCD Applications manually, and adding a new environment means creating another one by hand. With ApplicationSets, a template is defined once, and a Generator automatically creates Applications for every environment, cluster, or Git directory.

| Generator | What it does | Use case |
|---|---|---|
| List Generator | Defines a list of clusters/environments explicitly | Fixed number of known environments |
| Git Generator (Directories) | One Application per directory in a Git repo | Each microservice in its own folder |
| Cluster Generator | One Application per registered cluster | Same app deployed to all clusters |

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: payment-service-appset
  namespace: argocd
spec:
  generators:
    - list:
        elements:
          - cluster: dev
            url: https://dev-cluster.example.com
            replicas: "1"
          - cluster: staging
            url: https://staging-cluster.example.com
            replicas: "2"
          - cluster: production
            url: https://prod-cluster.example.com
            replicas: "5"
  template:
    metadata:
      name: "payment-service-{{cluster}}"
    spec:
      project: payment-team
      source:
        repoURL: https://github.com/company/payment-service
        targetRevision: HEAD
        path: helm/payment-service
        helm:
          parameters: [{ name: replicaCount, value: "{{replicas}}" }]
      destination:
        server: "{{url}}"
        namespace: "payment-{{cluster}}"
      syncPolicy:
        automated: { prune: true, selfHeal: true }
```

## ArgoCD Notifications and Webhooks

ArgoCD Notifications sends alerts to Slack, Teams, email, and PagerDuty when Application state changes.

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/stable/manifests/install.yaml
```

| Trigger | When it fires |
|---|---|
| `on-sync-succeeded` | Deployment completed successfully |
| `on-sync-failed` | A sync attempt failed |
| `on-health-degraded` | App health became Degraded (pods crashing) |
| `on-deployed` | A new version successfully deployed |
| `on-sync-status-unknown` | ArgoCD can't determine sync status |

```yaml
metadata:
  annotations:
    notifications.argoproj.io/subscribe.on-sync-failed.slack: payment-alerts
    notifications.argoproj.io/subscribe.on-health-degraded.slack: payment-alerts
```
Subscribing an Application to `on-sync-failed` and `on-health-degraded` specifically (rather than every event) is a reasonable default — routing every successful sync to Slack too quickly becomes noise nobody reads.
