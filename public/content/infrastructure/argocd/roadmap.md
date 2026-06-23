# Argocd Learning Roadmap

**Goal**: From imperative kubectl to GitOps-driven continuous delivery

## Learning Phases

### Phase 1: GitOps Concepts (1 week)

- What GitOps is: Git as single source of truth
- Push vs pull deployment models
- ArgoCD architecture: app controller, repo server, API
- Install ArgoCD in Kubernetes

### Phase 2: First Application (1 week)

- Application CRD: source, destination, sync policy
- argocd CLI and UI
- Manual sync and auto-sync
- Health status and sync status

### Phase 3: Advanced Features (2 weeks)

- App-of-apps pattern for multiple apps
- ApplicationSet: generators and templates
- Sync hooks and waves for ordering
- Resource health customisation

### Phase 4: Multi-cluster & Security (2 weeks)

- AppProjects: scope and restrictions
- RBAC for ArgoCD users
- SSO integration (Dex, GitHub OAuth)
- Multi-cluster deployment with external clusters

### Phase 5: Progressive Delivery (1 week)

- Argo Rollouts for canary/blue-green
- Analysis templates for automated verification
- Integration with Argo Workflows
- Notifications for sync events

## Job Roles This Enables

- Platform Engineer
- DevOps Engineer
- Release Engineer

## Target Certifications

- GitOps Fundamentals (Codefresh, free)

## How to Use This Roadmap

1. Work through phases in order — each builds on the previous
2. Complete the labs section for each phase before moving on
3. Build a project after each phase to cement learning
4. Use the interview section to test understanding regularly
5. Track progress: revisit earlier sections as concepts compound

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 10-15 weeks (part-time)
Daily practice more effective than weekend marathons
Build real things — theory alone not enough for these tools
Join communities: CNCF Slack, relevant subreddits, Discord servers
```
