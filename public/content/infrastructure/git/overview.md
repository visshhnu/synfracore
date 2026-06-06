# GitHub Actions — CI/CD Automation

GitHub Actions is GitHub's built-in CI/CD platform. It automates your entire software delivery pipeline directly from your GitHub repository — no separate CI server needed.

## Core Concepts

**Workflow** — A YAML file in `.github/workflows/` that defines automation. Triggered by events (push, PR, schedule, manual).

**Event** — What triggers a workflow: `push`, `pull_request`, `schedule`, `workflow_dispatch` (manual), `release`.

**Job** — A set of steps that run on the same runner. Jobs run in parallel by default; use `needs:` to sequence them.

**Step** — A single task in a job. Either a shell command (`run:`) or a reusable action (`uses:`).

**Runner** — The machine that executes the job. GitHub-hosted (`ubuntu-latest`, `windows-latest`, `macos-latest`) or self-hosted.

**Action** — A reusable unit of automation. From GitHub Marketplace or your own repo.

## Complete CI/CD Pipeline

```yaml
# .github/workflows/deploy.yml
name: Build, Test & Deploy

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  # ─── JOB 1: Test ───────────────────────────────────
  test:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - name: Setup Python
      uses: actions/setup-python@v5
      with:
        python-version: '3.12'
        cache: 'pip'

    - name: Install dependencies
      run: pip install -r requirements.txt

    - name: Run tests
      run: pytest tests/ -v --cov=src --cov-report=xml

    - name: Upload coverage
      uses: codecov/codecov-action@v4
      with:
        token: ${{ secrets.CODECOV_TOKEN }}

  # ─── JOB 2: Security Scan ──────────────────────────
  security:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - name: Run Trivy vulnerability scanner
      uses: aquasecurity/trivy-action@master
      with:
        scan-type: 'fs'
        severity: 'HIGH,CRITICAL'
        exit-code: '1'

  # ─── JOB 3: Build & Push Docker Image ──────────────
  build:
    needs: [test, security]         # Only build if tests pass
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'

    outputs:
      image-digest: ${{ steps.push.outputs.digest }}
      image-tag: ${{ steps.meta.outputs.tags }}

    permissions:
      contents: read
      packages: write
      id-token: write               # For OIDC signing

    steps:
    - uses: actions/checkout@v4

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v3

    - name: Log in to GitHub Container Registry
      uses: docker/login-action@v3
      with:
        registry: ${{ env.REGISTRY }}
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}

    - name: Extract metadata (tags, labels)
      id: meta
      uses: docker/metadata-action@v5
      with:
        images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
        tags: |
          type=sha,prefix=,format=short
          type=raw,value=latest,enable=${{ github.ref == 'refs/heads/main' }}

    - name: Build and push
      id: push
      uses: docker/build-push-action@v5
      with:
        context: .
        push: true
        tags: ${{ steps.meta.outputs.tags }}
        labels: ${{ steps.meta.outputs.labels }}
        cache-from: type=gha         # GitHub Actions cache
        cache-to: type=gha,mode=max

  # ─── JOB 4: Deploy to Staging ──────────────────────
  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment: staging

    steps:
    - uses: actions/checkout@v4

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        role-to-assume: ${{ secrets.AWS_ROLE_ARN }}
        aws-region: us-east-1

    - name: Update kubeconfig
      run: aws eks update-kubeconfig --name staging-cluster --region us-east-1

    - name: Deploy with Helm
      run: |
        helm upgrade --install myapp ./helm \
          --namespace staging \
          --create-namespace \
          --set image.tag=${{ github.sha }} \
          --values helm/values-staging.yaml \
          --wait --timeout 5m --atomic

    - name: Smoke test
      run: |
        sleep 15
        curl -f https://staging.myapp.com/health

  # ─── JOB 5: Deploy to Production (with approval) ───
  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment: production          # Requires manual approval in GitHub

    steps:
    - uses: actions/checkout@v4

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        role-to-assume: ${{ secrets.PROD_AWS_ROLE_ARN }}
        aws-region: us-east-1

    - name: Update kubeconfig
      run: aws eks update-kubeconfig --name prod-cluster --region us-east-1

    - name: Deploy to production
      run: |
        helm upgrade --install myapp ./helm \
          --namespace production \
          --create-namespace \
          --set image.tag=${{ github.sha }} \
          --values helm/values-prod.yaml \
          --wait --timeout 10m --atomic

    - name: Notify Slack
      if: always()
      uses: slackapi/slack-github-action@v1.26.0
      with:
        payload: |
          {
            "text": "${{ job.status == 'success' && '✅' || '❌' }} Production deploy ${{ job.status }}: ${{ github.repository }}@${{ github.sha }}"
          }
      env:
        SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

## Reusable Workflows

```yaml
# .github/workflows/reusable-deploy.yml
name: Reusable Deploy

on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string
      image-tag:
        required: true
        type: string
    secrets:
      AWS_ROLE_ARN:
        required: true

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: ${{ inputs.environment }}
    steps:
    - uses: actions/checkout@v4
    - name: Deploy
      run: |
        helm upgrade --install myapp ./helm \
          --set image.tag=${{ inputs.image-tag }} \
          --values helm/values-${{ inputs.environment }}.yaml

# ─── Call it from another workflow ───
# jobs:
#   deploy-prod:
#     uses: ./.github/workflows/reusable-deploy.yml
#     with:
#       environment: production
#       image-tag: ${{ github.sha }}
#     secrets:
#       AWS_ROLE_ARN: ${{ secrets.PROD_AWS_ROLE_ARN }}
```

## Matrix Strategy — Test Multiple Versions

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ['3.10', '3.11', '3.12']
        os: [ubuntu-latest, windows-latest]
      fail-fast: false    # Don't cancel all if one fails
    steps:
    - uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}
    - run: pytest tests/
```

## Caching — Speed Up Builds

```yaml
# Cache pip dependencies
- uses: actions/cache@v4
  with:
    path: ~/.cache/pip
    key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
    restore-keys: ${{ runner.os }}-pip-

# Cache node modules
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}

# Cache Terraform providers
- uses: actions/cache@v4
  with:
    path: ~/.terraform.d/plugin-cache
    key: ${{ runner.os }}-terraform-${{ hashFiles('**/.terraform.lock.hcl') }}
```

## Secrets and Environments

```yaml
# Access secrets
env:
  DATABASE_URL: ${{ secrets.DATABASE_URL }}
  API_KEY: ${{ secrets.API_KEY }}

# GitHub OIDC — no stored AWS keys!
- uses: aws-actions/configure-aws-credentials@v4
  with:
    role-to-assume: arn:aws:iam::123456789:role/github-actions
    aws-region: us-east-1

# In AWS IAM trust policy:
# {
#   "Condition": {
#     "StringEquals": {
#       "token.actions.githubusercontent.com:sub":
#         "repo:myorg/myrepo:ref:refs/heads/main"
#     }
#   }
# }
```

## Scheduled Workflows

```yaml
on:
  schedule:
    - cron: '0 2 * * *'    # Daily at 2am UTC
    - cron: '0 9 * * 1'    # Every Monday at 9am UTC

jobs:
  nightly-security-scan:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Full security audit
      run: |
        trivy image --severity HIGH,CRITICAL myapp:latest
        npm audit --audit-level=high
        safety check
```

## Interview Questions

**What is the difference between `on: push` and `on: pull_request`?**
`push` triggers when code is pushed to a branch. `pull_request` triggers when a PR is opened, updated, or synchronized. Best practice: run full test suite on both, but only deploy on `push` to `main`. PR checks give developers fast feedback; the `main` push triggers actual deployment.

**How do you prevent secrets from being exposed in logs?**
GitHub automatically masks values of secrets defined in Settings → Secrets — they appear as `***` in logs. Never echo a secret or assign it to an unmasked variable. Never pass secrets as positional arguments to commands (they appear in `ps aux`). Use `${{ secrets.MY_SECRET }}` syntax which GitHub automatically masks.

**What is OIDC and why is it better than stored AWS credentials?**
OIDC (OpenID Connect) lets GitHub Actions request temporary AWS credentials by presenting a signed JWT token to AWS STS. AWS verifies the token with GitHub's OIDC endpoint and issues short-lived credentials (valid 1 hour). No AWS access keys are stored in GitHub Secrets. If the credentials are compromised, they expire automatically. Stored credentials are long-lived and must be manually rotated.
