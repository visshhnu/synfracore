# GitHub Actions — Prerequisites

## What to Know Before Starting GitHub Actions

GitHub Actions has one of the lowest barriers to entry of any CI/CD tool — no separate server to install or manage, since it's built directly into GitHub. The prerequisites are mostly about Git/GitHub fluency and YAML, not CI/CD infrastructure.

## Required (Must Have)

### 1. GitHub Fluency
```bash
git clone, git push, git branch
```
Plus comfort with GitHub-specific concepts: pull requests, repository settings, and where Actions/Secrets live in the UI — workflows are triggered by GitHub events (`push`, `pull_request`), so understanding the PR workflow itself matters.

### 2. YAML Syntax
```yaml
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
```
Every workflow lives as a YAML file in `.github/workflows/` — the same baseline YAML comfort needed for GitLab CI/CD or any YAML-configured tool.

### 3. Basic Linux Command Line
GitHub-hosted runners default to Ubuntu — steps are typically shell commands:
```bash
ls, cd, cat, export
```

## Nice to Have (Speeds Up Learning)

### Prior CI/CD Tool Experience
If you've used Jenkins, GitLab CI/CD, or CircleCI, the concepts (workflow, job, step, matrix build) transfer directly — Overview's own comparison ("Workflow vs Jenkins pipeline") is the fastest on-ramp if you already know Jenkins specifically.

### Docker Basics
Many real-world workflows build and push container images — this site's Docker section covers the container fundamentals that make those steps make sense.

### Cloud Provider Basics (For OIDC)
Module 03's OIDC-based cloud authentication (requesting short-lived credentials instead of storing long-lived cloud secrets) assumes basic familiarity with at least one cloud provider's IAM concepts (AWS IAM roles, Azure Managed Identity, or GCP Workload Identity).

## What You Do NOT Need

- A self-hosted runner or any infrastructure to start — GitHub-hosted runners are free for public repos and included (with usage limits) for private repos
- Prior Jenkins/Groovy knowledge, despite conceptual similarities
- Deep OIDC/federation expertise — Module 03 teaches the practical pattern, not the underlying protocol internals

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1 day
- Intermediate + Advanced: 4-5 days
- Job-ready (comfortable with reusable workflows, self-hosted runners, and OIDC-based cloud auth): 2 weeks

## Start Here

Go to the **Installation** section to set up a self-hosted runner (optional — GitHub-hosted runners need no setup), then proceed to **Fundamentals**.
