# GitHub Actions Complete Guide

CI/CD › GitHub Actions
**GitHub Actions**
BeginnerEngineerProductionArchitectNative GitHub CI/CD — no servers, pure YAML, 2000 free minutes/month
[What is GHA](#sec-what)[Workflow Syntax](#sec-syntax)[Secrets & OIDC](#sec-secrets-env)[Matrix Builds](#sec-matrix)[Reusable](#sec-reuse)[Production](#sec-production)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## ⚡ What is GitHub Actions?›


GitHub Actions is CI/CD built directly into GitHub. No separate server. No Jenkins to manage. You write a YAML file, push it to your repo, and GitHub automatically runs your pipeline on every push, PR, or schedule.


#### Core Concept

**Event** happens (push to main) → **Workflow** triggers → **Jobs** run in parallel on separate VMs → each Job has **Steps** that run in sequence.


| Concept | What it is | Runs |
|---|---|---|
| Workflow | YAML file in .github/workflows/ | When event triggers it |
| Event | push, pull_request, schedule, manual | Triggers the workflow |
| Job | A set of steps running on one machine | In parallel with other jobs (default) |
| Step | One command or one reusable action | In sequence inside a job |
| Action | Reusable step from GitHub Marketplace | Inside a step |
| Runner | The VM that runs a job | ubuntu-latest, windows, macOS or self-hosted |


#### GitHub Actions vs Jenkins

|  | GitHub Actions | Jenkins |
|---|---|---|
| Infrastructure | GitHub manages everything | You manage servers + agents |
| Setup time | Minutes — just write YAML | Hours — install, configure, plugins |
| Scaling | Automatic — GitHub adds runners | Manual — add more agents |
| Cost (small teams) | Free 2000 min/month | Free but server costs |
| Best for | GitHub repos, new projects, teams that don't want infra overhead | Complex pipelines, existing enterprise, full control |


How GitHub Actions worksCopy

```

```


## 📄 Workflow Syntax — Complete Reference›


Every workflow lives in `.github/workflows/filename.yml`. You can have multiple workflows — one for CI, one for releases, one for nightly scans.


Complete workflow with all featuresCopy

```

```


## 🔒 Secrets, Environments & OIDC›


#### Why Secrets Management Matters

Hardcoding passwords or API keys in YAML files is dangerous — they are visible to everyone with repo access and permanently in Git history. GitHub Secrets encrypts values and automatically masks them in logs.


#### Three Levels of Secrets

| Level | Where stored | Accessible to | Use for |
|---|---|---|---|
| Repository secrets | Repo → Settings → Secrets | All workflows in this repo | Most secrets |
| Environment secrets | Repo → Settings → Environments | Only jobs using that environment | Prod vs staging values |
| Organisation secrets | Org → Settings → Secrets | Multiple repos | Shared credentials across repos |


#### OIDC — The Gold Standard (No Stored Credentials)

Instead of storing AWS/Azure/GCP access keys (which expire, get leaked, need rotation), OIDC lets GitHub prove its identity to cloud providers. GitHub gets a short-lived token per run — automatically. Nothing to rotate, nothing to store, nothing to leak.


Secrets and OIDC examplesCopy

```

```


## 🧮 Matrix Builds — Test Multiple Versions›


#### What is Matrix Strategy?

Instead of writing 6 separate jobs to test Python 3.9/3.10/3.11 on Ubuntu/Windows, define one job with a matrix. GitHub runs all combinations in parallel. If one fails, you know exactly which combination broke.


Matrix buildsCopy

```

```


## 📦 Reusable Workflows›


#### The Problem: Pipeline Duplication

50 microservices, each with their own deploy workflow. Someone updates the deploy pattern — now you update 50 files. Reusable workflows solve this: define once, call from anywhere.


Reusable workflow patternCopy

```

```


## 🚀 Production Pipeline›


Complete production pipeline with quality gates, security scanning, staging deployment, approval gate, and production deployment.


Full production pipelineCopy

```

```


## 🔍 Troubleshooting & Optimisation›


#### Most Common Issues

| Problem | Cause | Fix |
|---|---|---|
| Workflow not triggering | Wrong branch name, YAML syntax error | Check branch filter, validate YAML online |
| Resource not accessible | Missing permissions block | Add correct permissions (contents, packages, id-token) |
| Secret not found | Secret not added to repo or wrong name | Check Settings → Secrets → Actions |
| Works locally, fails in CI | Tool not installed on runner | Add explicit setup steps for tools |
| Running out of free minutes | No caching, no conditionals | Add actions/cache, add path filters, use self-hosted runners |


Debug + caching strategiesCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


GITHUB ACTIONS · ENGINEER
What is GitHub Actions and how is it different from Jenkins?
GitHub Actions is CI/CD built directly into GitHub — no server to manage, no plugins to update, no agents to configure. You write YAML workflows stored in .github/workflows/. When an event happens (push, PR, schedule), GitHub automatically runs the workflow on hosted servers (runners). Key differences from Jenkins: GitHub manages all infrastructure — you never think about agents going offline or Jenkins master running out of memory. GitHub Actions uses OIDC for cloud authentication, so no long-lived secrets stored anywhere. The free tier gives 2000 minutes/month which is enough for most projects. Jenkins gives more control and is better for complex pipelines with many dependencies, but GitHub Actions wins for simplicity and GitHub-integrated projects.

GITHUB ACTIONS · ENGINEER
Explain the difference between jobs and steps in GitHub Actions.
Jobs run in parallel by default on separate runner machines. Each job gets a fresh VM — nothing carries over between jobs unless you explicitly pass outputs or use artifacts. Steps run in sequence inside a job on the same machine. If a step fails, the job fails and remaining steps are skipped (unless you add if: always()). Common pattern: quality job (tests, SonarQube) runs in parallel with security job (Trivy, Checkov). Both must pass before the build job starts. Build job produces a Docker image, uploads it as an artifact. Deploy job downloads that artifact and deploys. The needs keyword creates a dependency graph between jobs.

GITHUB ACTIO
