# CI/CD Pipelines — Overview

**Before you start:** you should already know Git basics (commit, push, branches) and be comfortable running your project's build/test commands manually from a terminal — a pipeline automates that sequence, it doesn't teach it. No prior CI/CD-specific tool experience is assumed. See the **Prerequisites** tab for the full list.

## What is CI/CD?

CI/CD stands for Continuous Integration and Continuous Delivery. It automates the steps between writing code and running it in production.

**Continuous Integration:** Every commit triggers automated build and tests.
**Continuous Delivery:** After CI passes, artifact is deployed to staging automatically.
**Continuous Deployment:** Fully automated — code goes to production after all checks pass.

**Analogy** — Think of a CI/CD pipeline like an airport security checkpoint line, not a single guard waving everyone through. Each station does one specific check (ID verification, bag scan, metal detector), and you only reach the next one if you pass the current one — a failed bag scan stops you right there, it doesn't quietly let you board with an unchecked bag. A pipeline works the same way: a failed test stage stops the pipeline cold, so a broken build never reaches "deploy to production" just because nobody was watching closely enough to catch it manually.

## Pipeline Stages

```
┌────────┐   ┌───────┐   ┌────────────┐   ┌──────────┐   ┌─────────┐   ┌─────────────┐
│ Commit │ → │ Build │ → │ Test suite │ → │ Package  │ → │ Staging │ → │ Production  │
└────────┘   └───────┘   └────────────┘   │ artifact │   │ deploy  │   │ deploy      │
                  ↑             ↑          └──────────┘   └─────────┘   └─────────────┘
             fails here?   fails here?                                    (often behind
             pipeline           pipeline                                   a manual or
             stops              stops                                      automated gate)
```

Code Commit → Build → Unit Tests → Integration Tests → Security Scan → Artifact Push → Deploy Staging → Smoke Tests → [Approval] → Deploy Production → Monitor

## Tools Compared

| Tool | Type | Best For |
|------|------|---------|
| GitHub Actions | Cloud (GitHub) | GitHub repos, open source |
| Jenkins | Self-hosted | Enterprise, maximum flexibility |
| GitLab CI/CD | Both | Full DevSecOps platform |
| ArgoCD | K8s native | **GitOps** continuous delivery — a pattern where Git itself (not a manual `kubectl apply` or a push-based pipeline) is the single source of truth for what should be running; a controller inside the cluster continuously watches the Git repo and pulls changes into the cluster, rather than the pipeline pushing them in |
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

Each strategy below answers the same question differently: how do you replace the old version of an app with the new one, without breaking things for users currently using it?

| Strategy | What actually happens | Downtime | Rollback Speed |
|---------|---------|---------|---------------|
| Rolling update | Old instances are replaced with new ones gradually, a few at a time, so some capacity of each version is briefly running at once | No | Slow — has to roll the same way in reverse |
| Blue/Green | Two full environments exist side by side ("blue" = current live, "green" = new version) — traffic is switched from one to the other all at once, only after the new one is verified healthy | No | Instant (atomic traffic switch back to the still-running "blue" environment) |
| Canary | The new version is sent a small slice of real traffic first (e.g. 5%), and only rolled out further if it looks healthy | No | Fast, but only with automated monitoring + rollback wired up — not instant by default |
| Recreate | The old version is stopped completely, then the new version is started — simplest to reason about, but users see an outage during the gap | Yes | Slow |

## Try It (2 Minutes)

You don't need real infrastructure to see a pipeline's fail-fast behavior firsthand:

1. Fork or create any small GitHub repo (even an empty one with a single file), and add `.github/workflows/demo.yml`:
   ```yaml
   name: Demo Pipeline
   on: push
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - run: echo "Build stage running..."
         - run: echo "Now testing..." && exit 1   # simulate a failing test
         - run: echo "Deploying to production..."  # this line never runs
   ```
2. Push a commit and open the **Actions** tab on GitHub.
3. Watch the job stop at the failing "Now testing..." step — the "Deploying to production..." step is skipped entirely, shown grayed out, not just failed. That's the exact fail-fast behavior from the Pipeline Stages diagram above: a real deploy step never executes once an earlier stage fails, with zero manual intervention needed to stop it.
