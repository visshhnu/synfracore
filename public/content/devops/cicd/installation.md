# CI/CD Pipelines — Getting Set Up

There's no single "install CI/CD" step — you're configuring a pipeline definition that a CI/CD *service* runs for you, not installing local software (with one exception: Jenkins, which you self-host). This page covers the two most common starting points.

## Option 1: GitHub Actions (fastest way to a working pipeline)

No installation at all if your code is already on GitHub — it's built in.

1. In your repo, create `.github/workflows/ci.yml`.
2. A minimal pipeline that runs on every push:
```yaml
name: CI
on: [push, pull_request]
jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm test
```
3. Commit and push — GitHub runs it automatically. Check the "Actions" tab in your repo to see it execute.

## Option 2: GitLab CI (if your code is on GitLab)

Also built in — no separate service to install.

1. Create `.gitlab-ci.yml` at your repo root:
```yaml
stages: [build, test]

build:
  stage: build
  script: [npm ci, npm run build]

test:
  stage: test
  script: [npm test]
```
2. Push — GitLab's shared runners pick it up automatically on most plans; self-hosted runners are a separate, later setup step you only need for private infrastructure access or heavier compute.

## Option 3: Jenkins (self-hosted, more setup, more control)

Unlike the above, Jenkins is real software you install and maintain yourself — appropriate when you need on-premises execution, deep plugin customization, or you're integrating with legacy infrastructure that hosted CI/CD can't reach.

```bash
# Quick local trial via Docker — not how you'd run it in production
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
Then open `localhost:8080`, complete the setup wizard (it prints an initial admin password to the container logs), and install the Git + Pipeline plugins before creating your first job.

## Which one should you actually start with?

If your code already lives on GitHub or GitLab, use that platform's built-in CI — zero infrastructure to maintain, and it's what most job postings expect familiarity with today. Reach for Jenkins specifically when a job or project requires it (common in larger, older enterprises), not as a default starting point — it has real operational overhead (you maintain the server, the plugins, the updates) that hosted CI/CD doesn't.
