# GitHub Actions — Intermediate

## Composite Actions — Packaging Multiple Steps as One

A sequence of steps repeated across many workflows (checkout, setup, run a specific lint config) is a real duplication problem — a composite action packages multiple steps into a single, reusable action, callable as one line in any workflow:

```yaml
# .github/actions/setup-and-lint/action.yml — a composite action
name: 'Setup and Lint'
inputs:
  node-version:
    default: '20'
runs:
  using: "composite"
  steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with: { node-version: "${{ inputs.node-version }}" }
    - run: npm ci
      shell: bash
    - run: npm run lint
      shell: bash
```

```yaml
# Any workflow calls it with one line
steps:
  - uses: ./.github/actions/setup-and-lint
    with: { node-version: '20' }
```

`shell: bash` is required on every `run:` step inside a composite action — unlike a normal workflow step, composite actions don't inherit a default shell, and omitting it is a common, confusing first-time error.

## Job Outputs — Passing Data Between Jobs

Jobs run in isolated runners by default and don't share state — `outputs` is the mechanism for a downstream job to consume a value a previous job computed:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    outputs:
      image-tag: ${{ steps.set-tag.outputs.tag }}
    steps:
      - id: set-tag
        run: echo "tag=$(git rev-parse --short HEAD)" >> "$GITHUB_OUTPUT"

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying ${{ needs.build.outputs.image-tag }}"
```

`>> "$GITHUB_OUTPUT"` is the current mechanism for setting a step output — the older `::set-output::` workflow command syntax is deprecated, worth knowing since older workflow examples online still use it.

## Environment Protection Rules — Gated Deploys

Beyond a bare `environment: production` declaration, protection rules turn an environment into an actual approval gate — required reviewers, a wait timer, or branch restrictions, configured per-environment in repo settings:

```yaml
deploy-production:
  runs-on: ubuntu-latest
  environment:
    name: production   # protection rules configured in Settings > Environments > production
    url: https://app.company.com
  steps:
    - run: ./deploy.sh
  # The job pauses in "Waiting" status until a required reviewer approves,
  # exactly like the manual-approval pattern covered in Overview —
  # protection rules are the mechanism that makes it enforceable, not optional
```

Environment secrets (distinct from repository or organization secrets) are also scoped by these same protection rules — a secret defined at the environment level is only readable by a job that's actually deploying to that protected environment, which is what makes environment-scoped secrets meaningfully more restrictive than repository-wide ones.

## Concurrency Control — Preventing Overlapping Runs

Multiple pushes to the same branch in quick succession can trigger multiple overlapping workflow runs, wasting runner capacity on now-superseded work:

```yaml
concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: true   # cancel an in-progress run for the same ref when a new one starts
```

For a deploy workflow specifically, `cancel-in-progress: true` needs care — cancelling a deploy job mid-flight can leave infrastructure in a partially-applied state, so this is often set `true` for CI/test workflows but deliberately `false` (queue instead of cancel) for deploy workflows where mid-flight cancellation is actively dangerous.

## Reusable Workflows with Secrets

Beyond the basic `workflow_call` pattern from Fundamentals, a reusable workflow can explicitly declare which secrets it needs, making the secret-passing contract visible rather than implicit:

```yaml
# reusable-deploy.yml
on:
  workflow_call:
    secrets:
      DEPLOY_TOKEN:
        required: true
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - run: ./deploy.sh
        env: { TOKEN: "${{ secrets.DEPLOY_TOKEN }}" }
```

```yaml
# Calling workflow must explicitly pass it — secrets don't automatically
# flow into a reusable workflow just because it's called
jobs:
  deploy-prod:
    uses: company/shared-workflows/.github/workflows/reusable-deploy.yml@main
    secrets:
      DEPLOY_TOKEN: ${{ secrets.PROD_DEPLOY_TOKEN }}
```
