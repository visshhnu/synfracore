# GitLab CI/CD — Installation Guide

## Using GitLab.com's Shared Runners (No Installation Needed)

The fastest path to a working pipeline — GitLab.com provides free shared runners, so no runner installation is required to start learning:

```bash
# In any GitLab.com repo, add .gitlab-ci.yml at the repo root
cat > .gitlab-ci.yml << 'EOF'
test-job:
  stage: test
  script:
    - echo "Hello from GitLab CI"
EOF

git add .gitlab-ci.yml
git commit -m "Add first pipeline"
git push
# Pipeline runs automatically — check CI/CD > Pipelines in the GitLab UI
```

## Install a Self-Managed GitLab Runner (Docker Executor)

Needed once you're running your own infrastructure rather than relying on GitLab.com's shared runners — the Docker executor is the most common production choice, per Module 03:

```bash
# Install gitlab-runner (Linux)
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt-get install gitlab-runner

# Register the runner against your GitLab instance/project
sudo gitlab-runner register \
  --url https://gitlab.com/ \
  --registration-token <YOUR_TOKEN> \
  --executor docker \
  --docker-image alpine:latest \
  --description "docker-runner-01"

# Verify the runner is registered and running
sudo gitlab-runner list
sudo gitlab-runner verify
```

The registration token is found in the project or group's **Settings → CI/CD → Runners** page.

## Install a Kubernetes Executor Runner (Production Autoscaling)

For the autoscale-to-zero pattern Module 03 describes as the production-scale option:

```bash
helm repo add gitlab https://charts.gitlab.io
helm repo update

helm install gitlab-runner gitlab/gitlab-runner \
  --namespace gitlab-runner --create-namespace \
  --set gitlabUrl=https://gitlab.com/ \
  --set runnerRegistrationToken=<YOUR_TOKEN> \
  --set 'runners.executor=kubernetes'

kubectl get pods -n gitlab-runner
```

## Verify Everything Works

```bash
# 1. Confirm the runner shows as available in the UI
#    Settings > CI/CD > Runners should show the registered runner as "green"/online

# 2. Trigger a real pipeline and confirm it picks up the self-managed runner
#    (rather than a shared runner) by checking the job's "Runner" field in the UI

# 3. Confirm artifacts/cache work
cat > .gitlab-ci.yml << 'EOF'
build:
  stage: build
  script:
    - echo "built" > output.txt
  artifacts:
    paths: [output.txt]

test:
  stage: test
  script:
    - cat output.txt   # Should succeed — artifact carried over from build stage
EOF
```

## Common Installation Issues

**Runner registers but jobs stay stuck "pending"**
```bash
sudo gitlab-runner verify
# Common cause: runner tags don't match a job's tags: requirement,
# or the runner is registered but not enabled for the specific project
```

**Docker executor jobs fail with "Cannot connect to the Docker daemon"**
The runner's own `config.toml` needs Docker-in-Docker or a mounted Docker socket configured correctly — this is a distinct, common gotcha from a job's own Docker usage failing.

**Kubernetes executor pods never start**
```bash
kubectl describe pod -n gitlab-runner <pod-name>
# Check for resource-quota limits or an RBAC issue preventing the
# runner's service account from creating job pods
```

**Shared runner pipeline stuck queued for a long time**
GitLab.com's free-tier shared runners have real, if generous, usage limits per group `(needs verification — recheck against current source for the current CI/CD minutes allowance)` — a stuck queue is sometimes a quota issue, not a configuration bug.

## What's Installed

After a self-managed runner setup:
- **gitlab-runner** — the agent process polling GitLab for jobs and executing them via the configured executor (Shell, Docker, or Kubernetes)
- A runner registration, visible and manageable from the project/group's CI/CD settings

## Next Steps

Go to the **Fundamentals** section to build your first multi-stage pipeline.
