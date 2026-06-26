# GitHub Actions

> **Cloud-native CI/CD — YAML workflows, reusable actions, matrix builds**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is GitHub Actions?

GitHub Actions is CI/CD built into GitHub — no separate server needed. Workflows are YAML files in .github/workflows/. Triggered by events: push, pull_request, schedule, workflow_dispatch (manual). Jobs run in parallel by default; use needs: to create dependencies. Each job runs on a fresh runner (VM). GitHub-hosted runners are free for public repos. Self-hosted runners for private networks or custom hardware.

## Why GitHub Actions?

Actions are reusable units from the GitHub Marketplace. Always pin actions to a SHA or version tag (not @master) for security. Matrix strategy runs the same job with different parameters in parallel — e.g., test on Node 18, 20, 22 simultaneously. Job outputs pass data between jobs. Artifacts upload/download files between jobs.

---

## Learning Modules

### Module 01 — GitHub Actions Fundamentals
*Workflows, jobs, steps, triggers*

GitHub Actions is CI/CD built into GitHub — no separate server needed. Workflows are YAML files in .github/workflows/. Triggered by events: push, pull_request, schedule, workflow_dispatch (manual). Jobs run in parallel by default; use needs: to create dependencies. Each job runs on a fresh runner (VM). GitHub-hosted runners are free for public repos. Self-hosted runners for private networks or custom hardware.

**Topics covered:**

- Workflow YAML structure — 🟢 Beginner
- on: triggers (push, PR, schedule) — 🟢 Beginner
- Jobs and steps — 🟢 Beginner
- Runners: ubuntu-latest vs self-hosted — 🟡 Intermediate
- Workflow vs Jenkins pipeline — 🟢 Beginner

### Module 02 — Jobs, Steps & Actions
*Reusable actions, marketplace*

Actions are reusable units from the GitHub Marketplace. Always pin actions to a SHA or version tag (not @master) for security. Matrix strategy runs the same job with different parameters in parallel — e.g., test on Node 18, 20, 22 simultaneously. Job outputs pass data between jobs. Artifacts upload/download files between jobs.

**Topics covered:**

- actions/checkout@v4 — 🟢 Beginner
- Marketplace actions — 🟢 Beginner
- Composite actions (reusable) — 🟡 Intermediate
- Job outputs and artifacts — 🟡 Intermediate
- Matrix strategy (parallel builds) — 🟡 Intermediate

### Module 03 — Secrets & Environments
*Secrets, vars, environment protection*

Secrets are encrypted at rest and masked in logs. Environment secrets only accessible when deploying to that environment — add protection rules (required reviewers, wait timer) for production. OIDC is the modern approach — no long-lived cloud credentials needed. The workflow requests a short-lived token from the cloud provider directly via OIDC federation.

**Topics covered:**

- Repository and organisation secrets — 🟢 Beginner
- Environment secrets with protection rules — 🟡 Intermediate
- OIDC for keyless cloud auth — 🔴 Advanced
- github.token automatic token — 🟡 Intermediate

### Module 04 — Reusable Workflows & Composite Actions
*DRY CI/CD patterns*

Reusable workflows (workflow_call trigger) are the equivalent of Jenkins Shared Libraries — define once, call from many repos. Composite actions bundle multiple steps into one action. Best practice: create a central .github repo in your organization with shared workflows that all teams call.

**Topics covered:**

- Reusable workflows (workflow_call) — 🟡 Intermediate
- Composite actions — 🟡 Intermediate
- Calling reusable workflows — 🟡 Intermediate

### Module 05 — Complete Production Pipeline
*Build, scan, push, deploy*

A production GitHub Actions pipeline has: dependency caching (save 60-80% build time), parallel security scanning and tests, image build with cache layers, environment-gated deployments with manual approval for production, and Slack/Teams notifications on failure. Key difference from Jenkins: no infrastructure to manage — runners scale automatically.

**Topics covered:**

- Build and push to ACR/ECR — 🟡 Intermediate
- Trivy security scanning — 🟡 Intermediate
- Deploy to AKS/EKS — 🔴 Advanced
- Slack notifications — 🟢 Beginner
- Cache optimization — 🟡 Intermediate

```bash
1
```

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is GitHub Actions and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does GitHub Actions work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of GitHub Actions?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in GitHub Actions?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with GitHub Actions?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe GitHub Actions in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for GitHub Actions?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does GitHub Actions compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain GitHub Actions Fundamentals in GitHub Actions."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Jobs, Steps & Actions in GitHub Actions."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Marketplace — Actions](https://github.com/marketplace?type=actions)
- [Security Hardening for Actions](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*