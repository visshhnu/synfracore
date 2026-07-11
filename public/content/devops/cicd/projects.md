# CI/CD Pipelines — Portfolio Projects

Real projects that demonstrate actual pipeline design skill, not just "I followed a tutorial." Each one below names what a reviewer/interviewer should actually be able to see in your repo.

## Project 1: Full pipeline for a real app you already built (Beginner)

Take any existing personal project and add a complete CI pipeline: lint → test → build, failing loudly and correctly on each stage. Then add deployment to a free-tier target (Render, Railway, Fly.io).

**What this demonstrates:** you can build a working pipeline from scratch, not just modify a template. **What to show:** the `.github/workflows/` (or equivalent) file in your repo, plus a README section explaining each stage's purpose — the explanation matters as much as the YAML, since it shows you understand *why*, not just *how*.

## Project 2: Multi-environment pipeline with manual production gate (Intermediate)

Extend Project 1 (or a new project) with a real staging environment separate from production, deploying the *same built artifact* to both (see Intermediate's note on why rebuilding per environment is wrong), with an explicit manual-approval step before production.

**What this demonstrates:** you understand Continuous Delivery vs. Continuous Deployment as a real, implemented distinction, not just a definition you can recite. **What to show:** a documented diagram (even a simple one) of your pipeline's stages and gates, and evidence of at least one deploy that went through the full flow.

## Project 3: Containerized app with registry push + caching (Intermediate)

Build a pipeline that builds a Docker image, tags it meaningfully (git SHA, not just `latest`), pushes it to a registry (Docker Hub, GHCR, ECR), and uses layer caching to keep rebuild times low. Deploy by pulling that specific tagged image, not rebuilding at deploy time.

**What this demonstrates:** you understand the artifact-based deployment model that almost all real production pipelines use. **What to show:** your Dockerfile, the pipeline's build/push steps, and — ideally — a before/after build-time comparison showing the caching's actual impact.

## Project 4: Rollback demonstration (Intermediate/Advanced)

Deliberately deploy a broken version of an app (a genuine bug, not a fake one) through your pipeline, then execute your rollback path and document exactly how long it took and what happened at each step.

**What this demonstrates:** most portfolios show the happy path only; a genuine, documented rollback shows you've thought about failure, not just success. **What to show:** a short write-up (a "postmortem," written in the same style real incident postmortems are) of what broke, how it was caught, and how it was rolled back.

## Project 5: Canary or blue-green deployment, built for real (Advanced)

Implement either pattern against a real (even small-scale) deployment target — a canary with traffic-split routing and an automated rollback trigger tied to an actual metric (error rate, latency), or a true blue-green setup with an atomic traffic switch.

**What this demonstrates:** production-grade deployment safety thinking, genuinely differentiates a senior-track candidate from a mid-level one. **What to show:** the routing/traffic-split configuration, the automated rollback trigger logic (not a manual watch-and-decide process), and a demonstration (screen recording or detailed write-up) of it actually catching and rolling back a bad deploy.
