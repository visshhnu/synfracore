# FluxCD — Installation Guide

## Install the Flux CLI

```bash
curl -s https://fluxcd.io/install.sh | sudo bash

# Verify
flux --version
```

## Pre-Flight Check

Before bootstrapping, confirm the target cluster meets Flux's requirements:

```bash
flux check --pre
# Validates Kubernetes version compatibility and cluster connectivity
# before attempting to install anything
```

## Bootstrap FluxCD Onto a Cluster (GitHub)

This is the standard install path — it installs Flux's controllers into the cluster AND sets up the Git repository Flux will reconcile against, in one command:

```bash
export GITHUB_TOKEN=<your-personal-access-token>

flux bootstrap github \
  --owner=myorg \
  --repository=gitops-fleet \
  --branch=main \
  --path=clusters/production \
  --personal
```

```bash
# Verify the controllers are running
kubectl get pods -n flux-system

# Expect to see:
# source-controller
# kustomize-controller
# helm-controller
# notification-controller
```

## Bootstrap FluxCD (GitLab)

```bash
export GITLAB_TOKEN=<your-personal-access-token>

flux bootstrap gitlab \
  --owner=myorg \
  --repository=gitops-fleet \
  --branch=main \
  --path=clusters/production
```

## Verify Everything Works

```bash
# 1. Confirm all controllers are healthy
flux check

# 2. Confirm the GitRepository source is syncing
flux get sources git

# 3. Create a test Kustomization and confirm reconciliation
flux create kustomization test-app \
  --source=GitRepository/gitops-fleet \
  --path="./apps/test-app" \
  --prune=true \
  --interval=1m

flux get kustomizations
# STATUS should show "Applied revision" — confirms the Git → cluster
# reconciliation loop is functioning end to end
```

## Common Installation Issues

**`flux bootstrap` fails with authentication errors**
```bash
# Confirm the token has the correct scope — repo creation/write access,
# not just read access — since bootstrap creates the repo if it doesn't exist
echo $GITHUB_TOKEN | flux bootstrap github --token-auth --owner=myorg --repository=gitops-fleet
```

**Controllers stuck in `CrashLoopBackOff` after install**
```bash
kubectl logs -n flux-system deploy/source-controller
kubectl logs -n flux-system deploy/kustomize-controller
# Most common cause: insufficient RBAC permissions in a locked-down
# cluster, or a resource-limit constraint too tight for the controllers
```

**`flux get kustomizations` shows no reconciliation happening**
```bash
flux get sources git
# If the GitRepository source itself shows an error, the Kustomization
# has nothing valid to reconcile from — always check the source status
# before debugging the Kustomization itself
```

**Bootstrap succeeds but nothing appears applied to the cluster**
Confirm the `--path` flag actually points to a directory containing valid manifests in the bootstrapped repo — a common early mistake is bootstrapping against an empty or wrong path.

## What's Installed

After a successful bootstrap:
- **source-controller** — watches Git repos, Helm repos, and OCI registries for changes
- **kustomize-controller** — applies `Kustomization` CRDs, reconciling cluster state to match Git
- **helm-controller** — manages `HelmRelease` CRDs
- **notification-controller** — sends alerts (Slack, Teams, webhook) on reconciliation events
- A Git repository (`gitops-fleet` in the examples above) now containing Flux's own bootstrap manifests, which is itself the first thing under GitOps management

## Next Steps

Go to the **Fundamentals** section to deploy your first application via GitOps.
