# ArgoCD Complete Guide

CI/CD › ArgoCD
🐙**ArgoCD**
BeginnerEngineerProductionArchitectGitOps continuous delivery — sync, App of Apps, RBAC, multi-cluster
[What is ArgoCD](#sec-what)[Application](#sec-application)[App of Apps](#sec-app-of-apps)[Sync Waves](#sec-sync)[RBAC](#sec-rbac)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)


## 🐙 What is ArgoCD?›


#### GitOps — The Core Concept

|  | Traditional CD (Jenkins push) | GitOps (ArgoCD pull) |
|---|---|---|
| How it works | Jenkins runs kubectl apply when triggered | ArgoCD polls Git, applies when changed |
| Credentials | Jenkins has cluster credentials | Only ArgoCD has cluster credentials |
| Audit trail | Jenkins build log (can be deleted) | Git history (permanent, immutable) |
| Rollback | Re-run old Jenkins build | git revert — ArgoCD auto-applies |
| Drift detection | None | Auto-detects and can auto-revert manual changes |
| Access control | Anyone with Jenkins access can deploy | Deployment = PR approval in Git |


Install ArgoCDCopy

```

```


## 📄 Application Object›


#### The ArgoCD Application is the core object

One Application = one service + one environment. It defines: WHERE to get the config (Git repo, path, branch), WHERE to deploy (cluster + namespace), and HOW to sync (automatic or manual, with or without self-healing).


Complete Application YAML with all optionsCopy

```

```


## 🏗️ App of Apps Pattern›


#### Managing 15+ services

Instead of creating 15 Application objects manually, define them as YAML files in Git. A parent Application watches that directory. Add a service = add one YAML file. Bootstrap an environment = sync one parent app.


App of Apps + Git promotion workflowCopy

```

```


## ⏳ Sync Waves & Hooks›


#### Controlling deployment order

Wave 1 (database) must be ready before Wave 2 (app). PreSync hooks run database migrations. PostSync hooks run smoke tests. SyncFail hooks send alerts.


Sync waves and hooksCopy

```

```


## 🔐 RBAC & Projects›


#### Multi-team isolation

Projects in ArgoCD isolate teams. Team A cannot see or sync Team B's applications. Sync windows prevent production deployments outside business hours.


Projects + RBAC + sync windowsCopy

```

```


## 🔍 Troubleshooting›


OutOfSync, sync fails, rollbackCopy

```

```


## 🔁 ApplicationSets — Deploy to Many Clusters at Once›


#### The problem ApplicationSets solve

Without ApplicationSets: you create 10 ArgoCD Applications manually — one per environment or cluster. Each one is nearly identical. When you need to add a new environment, you create another Application manually. With ApplicationSets: define a template once, and a Generator automatically creates Applications for every environment, cluster, or Git directory.


#### Three key generators

| Generator | What it does | Use case |
|---|---|---|
| List Generator | Define a list of clusters/environments explicitly | Fixed number of known environments |
| Git Generator (Directories) | Create one Application per directory in a Git repo | Each microservice in its own folder |
| Cluster Generator | Create one Application per registered cluster | Same app deployed to all clusters |


```
# ApplicationSet — deploy same app to dev, staging, prod
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
namespace: payment-dev
values:
replicas: "1"
imageTag: "latest"
- cluster: staging
url: https://staging-cluster.example.com
namespace: payment-staging
values:
replicas: "2"
imageTag: "stable"
- cluster: production
url: https://prod-cluster.example.com
namespace: payment-prod
values:
replicas: "5"
imageTag: "v2.1.0"
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
values: |
replicaCount: {{values.replicas}}
image:
tag: {{values.imageTag}}
destination:
server: "{{url}}"
namespace: "{{namespace}}"
syncPolicy:
automated:
prune: true
selfHeal: true
```


## 🔔 ArgoCD Notifications and Webhooks›


#### Get alerted when deployments succeed, fail, or drift

ArgoCD Notifications sends alerts to Slack, Teams, email, PagerDuty, and more when Application state changes. Install via: `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/stable/manifests/install.yaml`


#### Common notification triggers

| Trigger | When it fires |
|---|---|
| on-sync-succeeded | Deployment completed successfully |
| on-sync-failed | Sync attempt failed |
| on-health-degraded | App health became Degraded (pods crashing) |
| on-deployed | New version successfully deployed |
| on-sync-status-unknown | ArgoCD cannot determine sync status |


#### Annotation to enable notifications on an Application

```
metadata:
annotations:
notifications.argoproj.io/subscribe.on-sync-succeeded.slack
