# CI/CD Pipelines — Fundamentals

**Analogy** — A pipeline's stages are like a relay race, not a single runner doing the whole distance. Each leg (build, test, deploy) hands off a baton (the artifact) to the next one, and a runner who drops the baton (a stage that fails) stops the race right there — the next leg never starts with a dropped baton, the same way a deploy stage never runs against a build that failed its tests.

```
Trigger (push/PR/schedule)
        │
        ▼
   Stage 1: Build ──── fails? ──→ pipeline stops, nothing downstream runs
        │ succeeds
        ▼
   Stage 2: Test ───── fails? ──→ pipeline stops, nothing downstream runs
        │ succeeds
        ▼
   Stage 3: Package → Deploy
```

## What CI/CD actually means, precisely

**Continuous Integration (CI)** is the practice of merging code changes frequently (multiple times a day, ideally) and automatically verifying each merge with a build + test run — the goal is catching integration problems within minutes of them being introduced, not weeks later when several people's changes collide. **Continuous Delivery** means every change that passes CI is automatically packaged into a deployable artifact and is *ready* to release at any time, with an explicit human approval step before it actually goes to production. **Continuous Deployment** goes one step further: that final approval step is removed too — every change that passes all automated checks deploys to production automatically, no human in the loop.

The distinction between Delivery and Deployment trips people up constantly in interviews: Delivery = always release-ready, human decides when. Deployment = no human gate at all. Most real organizations practice Continuous Delivery, not Continuous Deployment — full auto-deploy-to-prod-on-every-merge is less common than the term's popularity suggests, mainly because most teams want at least one human checkpoint before production for anything beyond the lowest-risk changes.

## The core building blocks of any pipeline

- **Trigger** — what starts the pipeline: a push, a pull request, a tag, a schedule (nightly builds), or a manual button.
- **Stages** — the ordered phases: typically build → test → (package) → deploy. Later stages only run if earlier ones succeed — this "fail fast" ordering is deliberate, so you don't waste time deploying something that never even passed its tests.
- **Jobs/steps** — the individual commands within a stage. A "test" stage might run unit tests, then integration tests, then a linter, as separate steps.
- **Artifacts** — the actual output that gets carried between stages or deployed: a compiled binary, a Docker image, a static site bundle. The build stage produces it; later stages consume it without rebuilding.
- **Secrets/credentials** — injected into the pipeline environment by the CI/CD platform's own secrets manager, never hardcoded in the pipeline file itself, since that file lives in version control.

## Why pipelines are defined as code (and why that matters)

Modern CI/CD pipelines are defined in a YAML file that lives in the same repository as the code it builds (`.github/workflows/*.yml`, `.gitlab-ci.yml`, `Jenkinsfile`) — this is deliberate, not incidental. It means: the pipeline definition is version-controlled alongside the code it builds, changes to the pipeline go through the same review process (pull requests) as code changes, and a given commit's pipeline behavior is reproducible even if you check out an old commit later. This is a meaningful shift from older CI tools where pipeline configuration lived in a separate UI, disconnected from the codebase and its history.

## The build → test → deploy flow, concretely

1. A developer pushes a commit (or opens a pull request).
2. The CI/CD platform detects the trigger and spins up a clean, ephemeral execution environment (a fresh container or VM — this matters: it guarantees "works on my machine" issues get caught, since the pipeline never inherits your local machine's state).
3. **Build stage**: dependencies are installed, the code is compiled/bundled.
4. **Test stage**: automated tests run against the build output. A failure here stops the pipeline — nothing downstream executes.
5. **Package stage** (if applicable): the build output is packaged into a deployable artifact — commonly a Docker image, pushed to a registry.
6. **Deploy stage**: the artifact is shipped to an environment — staging first in most real setups, production after either an automated gate (all checks green) or a manual approval click.

## A common beginner misconception worth correcting directly

CI/CD is not "automated deployment" alone — automating *only* the deploy step, with no automated testing gate before it, is automating the fast delivery of broken code to production. The value of CI/CD comes specifically from the testing/verification gates between stages, not from speed alone. A pipeline with no tests is just a fancy deploy script with extra steps.

## Try It (2 Minutes)

See the "fail fast" ordering for yourself, locally, with no CI platform needed — this is exactly what a real pipeline's build-then-test stages do internally, just run by hand:

```bash
echo "Build stage..." && sleep 1 && echo "Build OK"
echo "Test stage..." && false   # simulates a failing test (`false` always exits non-zero)
echo "Deploy stage..."          # run this line only if the line above succeeded
```

Run these three lines as a script with `set -e` at the top (`#!/bin/bash` then `set -e`, then the three lines) and you'll see the script stop after "Test stage..." — the "Deploy stage..." line never prints, because `set -e` makes the script exit the instant `false` returns a non-zero code. That's the entire mechanical idea behind every CI/CD pipeline's stage ordering, just running on your own machine instead of a CI platform's runner.
