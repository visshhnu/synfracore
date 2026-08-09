# GitHub Actions — Portfolio Projects

Build these 3 projects to prove GitHub Actions mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Matrix Build and Test Workflow

**Level:** Beginner | **Time:** 1 day | **GitHub:** `gha-matrix-build-test`

**What you build:** A workflow testing an application across multiple language/runtime versions in parallel using matrix strategy, with job outputs feeding a summary job.

### Workflow
```yaml
name: Matrix CI
on: [push, pull_request]

jobs:
  test:
    strategy:
      matrix:
        node-version: [18, 20, 22]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: "${{ matrix.node-version }}" }
      - run: npm ci && npm test

  summary:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - run: echo "All matrix jobs passed"
```

### Interview points
- Matrix strategy runs the same job definition N times in parallel, one per matrix value — a common real use case being confirming compatibility across supported runtime versions without duplicating workflow YAML
- `needs: test` means `summary` only runs if every matrix job succeeds — a genuine dependency, not just sequential ordering
- Pinning `actions/checkout@v4` to a version tag (not `@master`) as a deliberate security practice, not just convention

### Steps
1. Build a small application with a real test suite
2. Write the matrix workflow above with at least 3 version combinations
3. Confirm all matrix jobs run in parallel (check the Actions tab's visualization)
4. Add the summary job with `needs:` and confirm it only runs after all matrix jobs succeed
5. Intentionally break one matrix combination and confirm the summary job correctly doesn't run

---

## Project 2: OIDC-Authenticated Cloud Deployment

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `gha-oidc-cloud-deploy`

**What you build:** A deployment workflow authenticating to a cloud provider entirely via OIDC — no long-lived cloud credentials stored in GitHub at all.

### Workflow with OIDC
```yaml
name: Deploy
on:
  push: { branches: [main] }

permissions:
  id-token: write
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789012:role/github-actions-deploy
          aws-region: us-east-1
      - run: aws s3 sync ./dist s3://my-app-bucket/
```

### Corresponding IAM trust policy condition
```json
{
  "StringEquals": {
    "token.actions.githubusercontent.com:sub": "repo:myorg/gha-oidc-cloud-deploy:ref:refs/heads/main"
  }
}
```

### Interview points
- Explaining exactly why OIDC is preferred over stored cloud secrets: the credential is short-lived and requested fresh per run, so there's no long-lived secret sitting in GitHub that could leak or need rotation
- The `sub` claim condition scoped to a specific repo AND branch — being able to explain why scoping to the repo alone isn't sufficient (any branch, including a malicious fork's PR branch in some misconfigurations, could otherwise assume the role)
- `environment: production` combined with environment protection rules (required reviewers) as the human-approval gate sitting in front of an otherwise fully automated OIDC deployment

### Steps
1. Set up an IAM role (or equivalent for another cloud) with a GitHub OIDC trust policy scoped to your specific repo and branch
2. Write the deploy workflow using `role-to-assume`, with zero stored AWS credentials
3. Add an `environment: production` with a required-reviewer protection rule
4. Deliberately misconfigure the trust policy's `sub` condition and confirm the expected `AssumeRoleWithWebIdentity` failure
5. Fix it and document the corrected trust policy alongside the working workflow in the README

---

## Project 3: Reusable Workflow With Security Hardening

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `gha-reusable-hardened-workflow`

**What you build:** A reusable workflow (callable from multiple repos) with secrets passed correctly, concurrency control, and artifact attestation for build provenance.

### Reusable workflow (`reusable-deploy.yml`)
```yaml
on:
  workflow_call:
    secrets:
      DEPLOY_TOKEN: { required: true }

concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: true

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Deploying with token"
        env: { TOKEN: "${{ secrets.DEPLOY_TOKEN }}" }
```

### Caller workflow
```yaml
jobs:
  call-deploy:
    uses: myorg/shared-workflows/.github/workflows/reusable-deploy.yml@v1
    secrets:
      DEPLOY_TOKEN: "${{ secrets.DEPLOY_TOKEN }}"
```

### Artifact attestation
```yaml
- uses: actions/attest-build-provenance@v1
  with:
    subject-path: dist/app-binary
```

### Interview points
- `workflow_call` with an explicit `secrets:` block is what makes secrets passing to a reusable workflow deliberate and auditable, rather than an implicit inheritance a caller might not realize is happening
- `concurrency` with `cancel-in-progress: true` prevents two deploys to the same ref racing each other — a real, common production incident cause without this
- Build provenance attestation is the GitHub-native answer to the same supply-chain-security concern Tekton Chains addresses in that guide — being able to draw the parallel across tools demonstrates transferable security understanding, not tool-specific trivia

### Steps
1. Build a reusable workflow with an explicit `secrets:` interface
2. Call it from at least one other workflow, confirming the secret passes correctly
3. Add `concurrency` control and demonstrate (by triggering two rapid pushes) that the first run gets cancelled correctly
4. Add build provenance attestation and verify it on a real built artifact
5. Write a security hardening checklist in the README — pinned action SHAs, minimal `permissions:`, `concurrency` control, attestation — as if handing it to another team adopting this pattern

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the full workflow YAML and how to reproduce the setup
- [ ] Can explain OIDC-based cloud authentication end-to-end without notes in an interview
- [ ] Project 2 documents both the failing and fixed trust-policy configurations, not just the final working one
- [ ] Project 3's security hardening checklist is genuinely reusable, not just a description of what this one repo did
