# CI/CD Pipelines — Overview

## What is CI/CD?

CI/CD stands for Continuous Integration and Continuous Delivery. It automates the steps between writing code and running it in production.

**Continuous Integration:** Every commit triggers automated build and tests.
**Continuous Delivery:** After CI passes, artifact is deployed to staging automatically.
**Continuous Deployment:** Fully automated — code goes to production after all checks pass.

## Pipeline Stages

Code Commit → Build → Unit Tests → Integration Tests → Security Scan → Artifact Push → Deploy Staging → Smoke Tests → [Approval] → Deploy Production → Monitor

## Tools Compared

| Tool | Type | Best For |
|------|------|---------|
| GitHub Actions | Cloud (GitHub) | GitHub repos, open source |
| Jenkins | Self-hosted | Enterprise, maximum flexibility |
| GitLab CI/CD | Both | Full DevSecOps platform |
| ArgoCD | K8s native | GitOps continuous delivery |
| Azure DevOps Pipelines | Cloud | Microsoft/Azure stack |

## GitHub Actions Example

```yaml
name: Build and Deploy
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm test
  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - run: helm upgrade --install myapp ./chart --set image.tag=${{ github.sha }}
```

## Deployment Strategies

| Strategy | Downtime | Rollback Speed |
|---------|---------|---------------|
| Rolling update | No | Slow |
| Blue/Green | No | Instant |
| Canary | No | Instant |
| Recreate | Yes | Slow |
