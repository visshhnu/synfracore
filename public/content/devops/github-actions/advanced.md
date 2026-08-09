# GitHub Actions — Advanced

## Self-Hosted Runner Fleet Management

GitHub-hosted runners are zero-ops but come with real constraints — fixed hardware profiles, no persistent local cache beyond `actions/cache`, and (for private repos) real per-minute billing at scale. A self-hosted runner fleet trades that operational simplicity for control — custom hardware (GPUs, more memory), persistent local caches between runs, and network access to internal-only resources a GitHub-hosted runner could never reach:

```yaml
# Actions Runner Controller (ARC) — Kubernetes-native autoscaling
# self-hosted runners, the same "runner as a pod" model Tekton and
# GitLab's Kubernetes executor both use
apiVersion: actions.github.com/v1alpha1
kind: AutoscalingRunnerSet
metadata: { name: ci-runners }
spec:
  githubConfigUrl: https://github.com/my-org
  minRunners: 2
  maxRunners: 50
  template:
    spec:
      containers:
      - name: runner
        image: ghcr.io/actions/actions-runner:latest
        resources:
          requests: { cpu: "1", memory: "2Gi" }
```

The specific operational risk worth naming: self-hosted runners on a *public* repo are a real security exposure — a malicious PR's workflow can run arbitrary code on infrastructure the org controls, unlike GitHub-hosted runners which are ephemeral and isolated per-run by design. Self-hosted runners for public repos need `pull_request` (not `pull_request_target`, and never auto-running on fork PRs without review) as a hard rule, not a suggestion.

## Larger Runners and Custom Images

For workloads GitHub's standard-size hosted runners can't handle well (large monorepo builds, resource-intensive test suites), GitHub-hosted **larger runners** offer more CPU/memory/disk at a higher per-minute cost, plus the ability to use a custom base image rather than the standard `ubuntu-latest`:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest-8-cores   # a larger GitHub-hosted runner size
```

The cost/speed tradeoff here is genuinely worth modeling explicitly rather than assuming bigger is always better — a build that's I/O-bound rather than CPU-bound may see little speedup from more cores while still paying the larger runner's premium rate.

## OIDC Trust Policy Scoping — Beyond the Basics

Intermediate/Troubleshooting covered getting OIDC working at all; at real security maturity, the IAM trust policy's `sub` claim condition should be scoped as tightly as the deployment model allows — not just to a specific repo, but to a specific environment or branch, so a compromised or malicious workflow run from a different context can't assume the same role:

```json
{
  "Condition": {
    "StringEquals": {
      "token.actions.githubusercontent.com:sub": "repo:my-org/my-repo:environment:production"
    }
  }
}
```

Scoping to `environment:production` specifically (rather than the broader `repo:my-org/my-repo:ref:refs/heads/main`) means the role can only be assumed by a workflow run that's actually deploying through the protected `production` environment — including its required-reviewer approval gate — not just any workflow running on the `main` branch, which is a materially tighter blast radius if a workflow file itself is ever compromised.

## Artifact Attestations and Build Provenance

The GitHub Actions equivalent of Tekton Chains — `actions/attest-build-provenance` generates a signed attestation linking a built artifact back to the specific workflow run, commit, and inputs that produced it, without needing a separate supply-chain-security tool bolted on:

```yaml
permissions:
  id-token: write
  attestations: write
  contents: read
steps:
  - run: docker build -t $IMAGE .
  - uses: actions/attest-build-provenance@v1
    with:
      subject-name: ${{ env.IMAGE }}
      subject-digest: ${{ steps.build.outputs.digest }}
```

```bash
# Verify provenance before deploying — same purpose as Tekton Chains'
# cosign verify-attestation, GitHub's own tooling for the equivalent check
gh attestation verify oci://registry.company.com/myapp:v1.2.3 --owner my-org
```

## Workflow-Level Security Hardening Checklist

Beyond the `pull_request_target` risk already covered in Troubleshooting, a few additional hardening practices matter at scale: setting `permissions:` explicitly and minimally at the workflow (or job) level rather than relying on the repository's default `GITHUB_TOKEN` permissions, which can be broader than any individual workflow actually needs; pinning every third-party action to a full commit SHA rather than a version tag, since tags are mutable and a compromised action's maintainer account could push a malicious update to an existing tag; and auditing which workflows have `id-token: write` permission, since that's specifically what enables OIDC cloud authentication and shouldn't be granted to workflows that don't need it. None of these are exotic — they're the direct, concrete version of "least privilege," applied to the specific places GitHub Actions' permission model actually has levers.
