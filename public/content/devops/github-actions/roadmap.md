# GitHub Actions Learning Roadmap

**Goal**: From zero CI/CD experience to production-grade GitHub Actions workflow design

## Learning Phases

### Phase 1: GitHub Actions Fundamentals (1-2 days)

- Workflow YAML structure — `on:`, `jobs:`, `steps:`
- Event triggers — push, pull_request, schedule, workflow_dispatch
- Jobs run in parallel by default; `needs:` for dependencies
- GitHub-hosted vs. self-hosted runners

### Phase 2: Jobs, Steps, and Reusable Actions (2-3 days)

- Marketplace actions and pinning to SHA vs. version tag (security)
- Matrix strategy for parallel multi-version testing
- Job outputs and artifacts for passing data between jobs
- Composite actions

### Phase 3: Secrets, Environments, and OIDC (2-3 days)

- Repository vs. organization secrets
- Environment protection rules (required reviewers, wait timers)
- OIDC-based cloud authentication — no long-lived credentials

### Phase 4: Advanced Workflow Engineering (4-5 days)

- Reusable workflows with secrets
- Environment protection rules at production scale
- Concurrency control
- Self-hosted runner fleet via Actions Runner Controller (ARC)
- Larger GitHub-hosted runners for resource-intensive builds

### Phase 5: Security Hardening (3-4 days)

- OIDC trust-policy scoping beyond the basics
- Artifact attestations and build provenance
- Security hardening checklist for self-hosted runners specifically

## Job Roles This Enables

- CI/CD Engineer
- DevOps Engineer
- Platform Engineer
- Release Engineer

## Target Certifications

`(needs verification — recheck against current source for GitHub's current Actions-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 4's reusable workflows and ARC assume Phase 2's job/artifact model and Phase 3's secrets/OIDC concepts are already solid
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real GitHub repo (free, GitHub-hosted runners need no setup) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — OIDC-based cloud deployment is one of the most in-demand, interview-relevant skills this guide covers
4. Use the Troubleshooting section's real scenarios (composite action pinning mistakes, OIDC trust-policy mismatches) as active study material once Phase 3 is solid
5. Don't skip Phase 5 as "advanced trivia" — supply-chain security and self-hosted runner hardening are increasingly standard interview topics, not niche ones

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 2-3 weeks (part-time)
OIDC trust-policy mismatches are the single most common real-world
stumbling block once you move past Phase 3's basics — budget extra
review time there specifically, matching the Troubleshooting section's
own emphasis on this exact failure mode
```
