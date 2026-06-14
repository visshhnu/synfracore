# ArgoCD — Learning Roadmap

## Time to Job-Ready: 4 weeks (2 hours/day)

**Goal:** Implement GitOps workflows that automatically sync Kubernetes clusters to Git state.

## Phase 1 — GitOps Fundamentals (Week 1)
- Understand GitOps principles: Git as single source of truth
- How ArgoCD works: watches Git repo → compares to cluster → syncs differences
- Install ArgoCD: `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
- ArgoCD UI: login, explore dashboard
- Connect a Git repository (HTTPS or SSH)
- Deploy first application, understand sync status (Synced/OutOfSync/Degraded)

## Phase 2 — Core Features (Week 2-3)
- Application CRD: `source`, `destination`, `syncPolicy`
- Sync waves and hooks: control deployment order across resources
- Health checks: built-in and custom health assessments
- Automated sync: `automated.prune`, `automated.selfHeal`
- AppProjects: isolate teams, restrict allowed repos/clusters
- RBAC: role-based access control for team members

## Phase 3 — Advanced (Week 3-4)
- ApplicationSets: deploy same app to 100 clusters with one manifest
- Argo Rollouts: canary and blue-green deployments
- Integration with Helm and Kustomize
- Notifications: Slack/GitHub status checks on sync events
- Multi-cluster management from a single ArgoCD instance
- Disaster recovery: backup ArgoCD state with `argocd-backup`

## Certifications
- **CGOA** — Certified GitOps Associate (CNCF, includes Flux and ArgoCD)

## Jobs After ArgoCD Mastery
Platform Engineer · GitOps Engineer · DevOps Engineer · SRE

## Resources
- **argo-cd.readthedocs.io** — official documentation
- **ArgoCon talks** — YouTube, real production case studies
