# CI/CD Pipelines — Quick Reference

## GitHub Actions

```yaml
# Minimal CI workflow
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 20 }
      - run: npm ci
      - run: npm test

# Caching dependencies
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: npm-${{ hashFiles('package-lock.json') }}

# Matrix / parallel jobs
strategy:
  matrix:
    node: [18, 20, 22]
runs-on: ubuntu-latest
steps:
  - uses: actions/setup-node@v4
    with: { node-version: ${{ matrix.node }} }

# Using secrets
steps:
  - run: deploy.sh
    env:
      API_KEY: ${{ secrets.API_KEY }}

# Manual approval gate (via environments)
jobs:
  deploy:
    environment: production   # requires reviewer approval, configured in repo settings
    runs-on: ubuntu-latest
```

## GitLab CI

```yaml
stages: [build, test, deploy]

build:
  stage: build
  script: [npm ci, npm run build]
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths: [node_modules/]

test:
  stage: test
  script: [npm test]

deploy_production:
  stage: deploy
  script: [./deploy.sh]
  environment: production
  when: manual              # manual gate
  only: [main]
```

## Docker build/push (common artifact step)

```bash
docker build -t myapp:$(git rev-parse --short HEAD) .
docker tag myapp:$(git rev-parse --short HEAD) registry.example.com/myapp:latest
docker push registry.example.com/myapp:$(git rev-parse --short HEAD)
```

## Useful conceptual checklist before shipping a pipeline

- [ ] Tests actually block deployment on failure (verify by intentionally breaking a test once)
- [ ] Secrets are in the platform's secrets store, never hardcoded in the pipeline file
- [ ] Dependency install step uses a lockfile-based install (`npm ci`, not `npm install`) for reproducibility
- [ ] Caching is keyed by lockfile hash, not something that changes every run
- [ ] There's a defined, tested rollback path — not just a plan on paper
- [ ] Production deploy has an explicit gate (manual approval or automated health-check gate), not an instant push from every merge
- [ ] Pipeline secrets/credentials are scoped to the jobs that actually need them, not global to the whole pipeline

## Common CI/CD terminology, quick definitions

| Term | Meaning |
|---|---|
| Trigger | What starts a pipeline run (push, PR, schedule, manual) |
| Artifact | The build output carried between stages (binary, image, bundle) |
| Runner/Agent | The machine (often ephemeral/containerized) that executes pipeline jobs |
| Matrix build | Running the same job across multiple parameter combinations in parallel |
| Canary | Progressive rollout to a small traffic percentage before full deployment |
| Blue-green | Two full environments, atomic traffic switch between them |
| GitOps | Deployment driven by a controller reconciling cluster state to match a Git repo |
| OIDC federation | Minting short-lived cloud credentials for a pipeline run instead of static keys |
