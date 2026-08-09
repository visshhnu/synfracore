# GitHub Actions — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Model

```
Workflow — YAML file in .github/workflows/, triggered by events
  (push, pull_request, schedule, workflow_dispatch)
Jobs run in PARALLEL by default; needs: creates dependencies
Each job = fresh runner (VM), isolated per run
GitHub-hosted runners — free for public repos, ephemeral, isolated
Self-hosted runners — custom hardware, persistent cache, internal
  network access, but real security exposure on PUBLIC repos
```

## Action Pinning (Security)

```
ALWAYS pin to a SHA or version tag, NEVER @master/@main
  uses: actions/checkout@v4          # acceptable
  uses: actions/checkout@<full-sha>  # most secure — immutable
An unpinned @master action can change behavior (or be compromised)
between pipeline runs with zero warning.
```

## Matrix, Outputs, Artifacts

```
strategy: matrix — runs same job N times in parallel per combination
  (e.g., node-version: [18, 20, 22])
Job outputs — pass small data between jobs
Artifacts — upload/download FILES between jobs (like GitLab's artifacts)
Composite actions — bundle multiple steps into one reusable action
```

## Secrets and Environments

```
Repository/org secrets — encrypted at rest, masked in logs
Environment secrets — ONLY accessible when deploying to that
  specific environment
Environment protection rules — required reviewers, wait timer —
  the human-approval gate in front of automated deployment
```

## OIDC — No Long-Lived Cloud Credentials

```yaml
permissions:
  id-token: write
  contents: read
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::ACCOUNT:role/deploy-role
```
Workflow requests a SHORT-LIVED token directly from the cloud provider.
IAM trust policy `sub` claim MUST be scoped to repo+branch — the #1
real OIDC setup failure is a `sub` condition mismatch, not a workflow
YAML error.

## Self-Hosted Runner Fleet (ARC)

```
Actions Runner Controller (ARC) — Kubernetes-native autoscaling,
  same "runner as a pod" model as Tekton
Larger GitHub-hosted runners — more CPU/memory at higher per-minute
  cost, custom base image support — model the I/O-vs-CPU-bound
  tradeoff explicitly, bigger isn't always faster
```

## Advanced Security

```
Artifact attestations (actions/attest-build-provenance) — GitHub-
  native answer to the same supply-chain concern Tekton Chains
  addresses
concurrency: + cancel-in-progress: true — prevents two deploys to
  the same ref racing each other
workflow_call with explicit secrets: block — deliberate, auditable
  secret passing to reusable workflows, not implicit inheritance
```

## Terminology Cross-Reference

```
GitHub Actions term  | Jenkins/GitLab equivalent
------------------------|--------------------------------
Workflow                 | Pipeline
Composite action          | Shared Library function
Reusable workflow          | Jenkins Shared Library / GitLab include:
ARC                          | K8s executor (GitLab)
Environment protection rule   | Manual approval gate
```
