# GitHub Actions — Fundamentals

## What is GitHub Actions?

GitHub Actions is CI/CD built directly into GitHub — no separate server, no Jenkins to manage. Write a YAML file, push it to your repo, and GitHub automatically runs your pipeline on every push, PR, or schedule.

**Core concept:** an **Event** happens (push to main) → a **Workflow** triggers → **Jobs** run in parallel on separate VMs → each Job has **Steps** that run in sequence.

| Concept | What it is | Runs |
|---|---|---|
| Workflow | YAML file in `.github/workflows/` | When an event triggers it |
| Event | push, pull_request, schedule, manual | Triggers the workflow |
| Job | A set of steps running on one machine | In parallel with other jobs by default |
| Step | One command or one reusable action | In sequence inside a job |
| Action | A reusable step from GitHub Marketplace | Inside a step |
| Runner | The VM that runs a job | ubuntu-latest, windows, macOS, or self-hosted |

|  | GitHub Actions | Jenkins |
|---|---|---|
| Infrastructure | GitHub manages everything | You manage servers + agents |
| Setup time | Minutes — just write YAML | Hours — install, configure, plugins |
| Scaling | Automatic — GitHub adds runners | Manual — add more agents |
| Cost (small teams) | Free 2000 min/month | Free but server costs |
| Best for | GitHub repos, new projects, no infra overhead | Complex pipelines, existing enterprise, full control |

```yaml
# .github/workflows/ci.yml — the minimal shape every workflow follows
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Event triggered a workflow, which ran a job, which ran this step"
```

## Workflow Syntax — Complete Reference

Every workflow lives in `.github/workflows/filename.yml`. You can have multiple workflows — one for CI, one for releases, one for nightly scans.

```yaml
name: Full CI Pipeline
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: "0 2 * * *"   # nightly at 2am
  workflow_dispatch:        # manual trigger button in the UI

env:
  NODE_ENV: production

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18, 20]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: "${{ matrix.node-version }}" }
      - run: npm ci
      - run: npm test
```

## Secrets, Environments & OIDC

Hardcoding passwords or API keys in YAML files is dangerous — they're visible to anyone with repo access and permanently in Git history. GitHub Secrets encrypts values and automatically masks them in logs.

| Level | Where stored | Accessible to | Use for |
|---|---|---|---|
| Repository secrets | Repo → Settings → Secrets | All workflows in this repo | Most secrets |
| Environment secrets | Repo → Settings → Environments | Only jobs using that environment | Prod vs. staging values |
| Organisation secrets | Org → Settings → Secrets | Multiple repos | Shared credentials across repos |

**OIDC — the gold standard (no stored credentials).** Instead of storing AWS/Azure/GCP access keys, OIDC lets GitHub prove its identity directly to the cloud provider — GitHub gets a short-lived token per run, automatically, with nothing to rotate, store, or leak.

```yaml
permissions:
  id-token: write
  contents: read
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::123456789:role/GitHubActionsRole
      aws-region: ap-south-1
  - run: aws s3 ls   # authenticated via the short-lived OIDC token, no stored keys
```

## Matrix Builds — Test Multiple Versions

Instead of writing 6 separate jobs to test Python 3.9/3.10/3.11 on Ubuntu/Windows, define one job with a matrix — GitHub runs all combinations in parallel, and if one fails you know exactly which combination broke.

```yaml
jobs:
  test:
    strategy:
      matrix:
        python-version: ["3.9", "3.10", "3.11"]
        os: [ubuntu-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: "${{ matrix.python-version }}" }
      - run: pip install -r requirements.txt && pytest
```

## Reusable Workflows

50 microservices each with their own deploy workflow means that when someone updates the deploy pattern, they have to update 50 files. Reusable workflows solve this — define once, call from anywhere.

```yaml
# .github/workflows/reusable-deploy.yml — the shared definition
on:
  workflow_call:
    inputs:
      environment: { required: true, type: string }
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying to ${{ inputs.environment }}"
```
```yaml
# Any service's workflow calls it with one line
jobs:
  deploy-prod:
    uses: company/shared-workflows/.github/workflows/reusable-deploy.yml@main
    with:
      environment: production
```

## Production Pipeline

```yaml
name: Production Deploy
on: { push: { branches: [main] } }
jobs:
  quality:
    runs-on: ubuntu-latest
    steps: [{ run: "npm test && npm run lint" }]
  security:
    runs-on: ubuntu-latest
    steps: [{ run: "trivy fs --exit-code 1 --severity CRITICAL ." }]
  build:
    needs: [quality, security]
    runs-on: ubuntu-latest
    steps: [{ run: "docker build -t myapp:${{ github.sha }} ." }]
  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment: staging
    steps: [{ run: "kubectl set image deployment/myapp myapp=myapp:${{ github.sha }}" }]
  approval-gate:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment: production-approval   # configured to require manual approval
    steps: [{ run: "echo Approved" }]
  deploy-prod:
    needs: approval-gate
    runs-on: ubuntu-latest
    environment: production
    steps: [{ run: "kubectl set image deployment/myapp myapp=myapp:${{ github.sha }}" }]
```
The `quality` and `security` jobs run in parallel (both listed independently, neither depends on the other) and `build` waits for both via `needs: [quality, security]` — this is the `needs` keyword building an explicit dependency graph between jobs, rather than a purely sequential pipeline.

## Troubleshooting & Optimisation

| Problem | Cause | Fix |
|---|---|---|
| Workflow not triggering | Wrong branch name, YAML syntax error | Check branch filter, validate YAML online |
| Resource not accessible | Missing permissions block | Add correct permissions (`contents`, `packages`, `id-token`) |
| Secret not found | Secret not added to repo, or wrong name | Check Settings → Secrets → Actions |
| Works locally, fails in CI | Tool not installed on the runner | Add explicit setup steps for the tool |
| Running out of free minutes | No caching, no conditionals | Add `actions/cache`, path filters, or self-hosted runners |

```yaml
# Caching dependencies to avoid reinstalling on every run
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('package-lock.json') }}
```

## Interview Questions

**What is GitHub Actions and how is it different from Jenkins?**
GitHub Actions is CI/CD built directly into GitHub — no server to manage, no plugins to update, no agents to configure. Workflows are YAML files in `.github/workflows/`, and when an event happens (push, PR, schedule) GitHub automatically runs the workflow on hosted runners. Key differences from Jenkins: GitHub manages all infrastructure, so you never think about agents going offline or a Jenkins master running out of memory; GitHub Actions uses OIDC for cloud authentication, so no long-lived secrets need to be stored anywhere; and the free tier gives 2000 minutes/month, enough for most projects. Jenkins gives more control and is better for complex pipelines with many dependencies, but GitHub Actions wins for simplicity and GitHub-integrated projects.

**Explain the difference between jobs and steps in GitHub Actions.**
Jobs run in parallel by default on separate runner machines — each job gets a fresh VM, and nothing carries over between jobs unless you explicitly pass outputs or use artifacts. Steps run in sequence inside a job, on the same machine — if a step fails, the job fails and remaining steps are skipped unless you add `if: always()`. A common pattern: a quality job (tests, SonarQube) runs in parallel with a security job (Trivy, Checkov); both must pass before the build job starts, using `needs`. The build job produces a Docker image and uploads it as an artifact; the deploy job downloads that artifact and deploys it — the `needs` keyword is what creates this dependency graph between otherwise-parallel jobs.
