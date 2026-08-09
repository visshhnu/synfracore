# GitHub Actions — Installation Guide

## No Installation Needed for GitHub-Hosted Runners

GitHub Actions is built into GitHub — there's no server to install. Add a workflow file and it runs automatically:

```bash
mkdir -p .github/workflows
cat > .github/workflows/ci.yml << 'EOF'
name: CI
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello from GitHub Actions"
EOF

git add .github/workflows/ci.yml
git commit -m "Add first workflow"
git push
# Check the Actions tab in the GitHub UI — the workflow runs automatically
```

## Install a Self-Hosted Runner (Single Machine)

Needed for custom hardware, persistent caches, or network access to internal resources — matching Advanced's coverage of self-hosted tradeoffs:

```bash
# From the repo/org's Settings > Actions > Runners > New self-hosted runner —
# GitHub generates a registration command specific to your repo, similar to:
mkdir actions-runner && cd actions-runner
curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/latest/download/actions-runner-linux-x64.tar.gz
tar xzf actions-runner.tar.gz

./config.sh --url https://github.com/myorg/myrepo --token <REGISTRATION_TOKEN>
./run.sh

# Verify it shows "Listening for Jobs" and appears online in Settings > Actions > Runners
```

## Install Actions Runner Controller (ARC) — Kubernetes Autoscaling Fleet

The production-scale option, matching Advanced's "runner as a pod" model:

```bash
helm install arc-controller \
  oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller \
  --namespace arc-systems --create-namespace

helm install ci-runners \
  oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set \
  --namespace arc-runners --create-namespace \
  --set githubConfigUrl="https://github.com/myorg/myrepo" \
  --set githubConfigSecret.github_token=<PAT_OR_APP_TOKEN>

kubectl get pods -n arc-systems
kubectl get pods -n arc-runners
```

## Set Up OIDC for Cloud Authentication (No Long-Lived Secrets)

The modern pattern Module 03 introduces — a workflow requests a short-lived credential directly from the cloud provider rather than storing a long-lived secret in GitHub:

```yaml
# In the workflow — request the OIDC token and assume a cloud role
permissions:
  id-token: write
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789012:role/github-actions-deploy
          aws-region: us-east-1
```

The corresponding AWS IAM trust policy must reference the GitHub OIDC provider and scope the `sub` claim to your specific repo — a genuinely separate, cloud-side configuration step from the workflow YAML itself.

## Verify Everything Works

```bash
# 1. Confirm a GitHub-hosted workflow runs on push (no setup required)

# 2. If self-hosted: confirm the runner shows "Idle" (not offline) in
#    Settings > Actions > Runners after `./run.sh` starts

# 3. If ARC: confirm runner pods scale up when a workflow is queued
kubectl get pods -n arc-runners -w

# 4. If OIDC: confirm a workflow using role-to-assume succeeds without
#    any AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY secret configured
```

## Common Installation Issues

**Self-hosted runner registers but never picks up jobs**
```bash
./run.sh
# Confirm the workflow's runs-on: label actually matches the runner's
# registered labels — a mismatch leaves jobs queued indefinitely with
# no error, just silence
```

**ARC runner pods never scale up**
```bash
kubectl logs -n arc-systems deploy/arc-controller-...
# Check the githubConfigSecret token has the correct scope/permissions
# for the target repo or org
```

**OIDC role assumption fails with "not authorized to perform sts:AssumeRoleWithWebIdentity"**
The IAM trust policy's `sub` claim condition almost always doesn't match the actual workflow's repo/branch/environment context — this is the single most common OIDC setup failure, and the fix is checking the trust policy condition against the workflow's real `sub` claim value, not the workflow YAML itself.

**Self-hosted runner on a public repo — security exposure**
Advanced flags this directly: self-hosted runners on a public repo are a real risk, since a malicious PR's workflow can run arbitrary code on infrastructure the org controls. Never enable self-hosted runners for `pull_request_target` or auto-run on fork PRs without review.

## What's Installed

- **GitHub-hosted runners** — nothing to install; ephemeral, isolated VMs provisioned per run automatically
- **Self-hosted runner** (if configured) — a persistent process (`run.sh`) polling GitHub for jobs matching its labels
- **ARC** (if configured) — a Kubernetes-native controller and autoscaling runner-pod fleet
- **OIDC trust** (if configured) — no artifact in GitHub itself; a trust relationship configured on the cloud provider's IAM side

## Next Steps

Go to the **Fundamentals** section to build your first multi-job workflow.
