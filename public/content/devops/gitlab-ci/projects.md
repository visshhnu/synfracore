# GitLab CI/CD — Portfolio Projects

Build these 3 projects to prove GitLab CI/CD mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Multi-Stage Pipeline With Artifacts and Cache

**Level:** Beginner | **Time:** 1 day | **GitLab:** `gitlab-ci-multistage-pipeline`

**What you build:** A build → test → deploy pipeline for a small application, correctly using artifacts to pass build output between stages and cache to speed up dependency installation across runs.

### `.gitlab-ci.yml`
```yaml
stages: [build, test, deploy]

variables:
  PIP_CACHE_DIR: "$CI_PROJECT_DIR/.cache/pip"

cache:
  paths: [.cache/pip]

build:
  stage: build
  script:
    - pip install -r requirements.txt
    - python -m build
  artifacts:
    paths: [dist/]
    expire_in: 1 hour

test:
  stage: test
  script:
    - pip install -r requirements.txt
    - pytest tests/

deploy:
  stage: deploy
  script:
    - echo "Deploying $(ls dist/)"
  rules:
    - if: '$CI_COMMIT_BRANCH == "main"'
```

### Interview points
- Cache speeds up repeated runs (same dependencies reused); artifacts pass specific files between stages of the *same* pipeline run — conflating the two is a common early mistake
- `rules:` gating deploy to `main` only, replacing the deprecated `only:`/`except:` syntax
- `expire_in` on artifacts — a real cost/storage consideration, not just a default to leave alone

### Steps
1. Create a small application with a real build step (not just an echo)
2. Write the three-stage pipeline above, verifying the artifact actually carries build output into the test stage
3. Add a cache key scoped to the dependency lockfile so cache invalidates correctly when dependencies change
4. Confirm the deploy stage only runs on `main`, not on feature branches
5. Document the artifact-vs-cache distinction in the README in your own words

---

## Project 2: DAG Pipeline With Security Scanning

**Level:** Intermediate | **Time:** 2 days | **GitLab:** `gitlab-ci-dag-security-scan`

**What you build:** A `needs:`-based DAG pipeline (jobs depending on specific other jobs, not full stages) with GitLab's built-in SAST and dependency scanning integrated.

### DAG structure with `needs:`
```yaml
stages: [build, test, scan, deploy]

build-frontend:
  stage: build
  script: [echo "building frontend"]

build-backend:
  stage: build
  script: [echo "building backend"]

test-frontend:
  stage: test
  needs: [build-frontend]   # Doesn't wait on build-backend
  script: [echo "testing frontend"]

test-backend:
  stage: test
  needs: [build-backend]    # Doesn't wait on build-frontend
  script: [echo "testing backend"]

include:
  - template: Security/SAST.gitlab-ci.yml
  - template: Security/Dependency-Scanning.gitlab-ci.yml
```

### Interview points
- `needs:` removes the stage-bottleneck problem — `test-frontend` starts the moment `build-frontend` finishes, without waiting for `build-backend` to also complete, which a plain stage-sequential pipeline would force
- `include:` pulling GitLab-provided security templates is the concrete DevSecOps advantage over Jenkins referenced throughout this guide — SAST and dependency scanning in a few lines, not custom tooling
- Reading scan results in the Merge Request security widget, not just the pipeline log — this is where the security findings actually surface to a reviewer

### Steps
1. Build a repo with genuinely independent frontend/backend build+test paths
2. Write the DAG pipeline with `needs:` and confirm (via pipeline visualization) that frontend and backend jobs run in parallel rather than stage-sequential
3. Include GitLab's SAST and Dependency Scanning templates
4. Introduce one intentional vulnerability (an outdated dependency) and confirm it surfaces in the Security Dashboard
5. Document the DAG's actual time savings versus a stage-sequential equivalent in the README

---

## Project 3: Multi-Project Pipeline With Runner Fleet Autoscaling

**Level:** Advanced | **Time:** 3-4 days | **GitLab:** `gitlab-ci-multiproject-fleet`

**What you build:** A pipeline that triggers a downstream pipeline in a separate project, running on a Kubernetes-executor runner fleet that autoscales.

### Multi-project trigger
```yaml
trigger-deploy-project:
  stage: deploy
  trigger:
    project: my-group/deploy-project
    branch: main
    strategy: depend   # Parent pipeline waits on and reflects child's status
```

### Kubernetes executor runner (autoscaling)
```bash
helm install gitlab-runner gitlab/gitlab-runner \
  --namespace gitlab-runner --create-namespace \
  --set gitlabUrl=https://gitlab.com/ \
  --set runnerRegistrationToken=<TOKEN> \
  --set 'runners.executor=kubernetes' \
  --set 'runners.kubernetes.namespace=gitlab-runner'
```

### Interview points
- `strategy: depend` is the specific config that makes a multi-project pipeline behave as one logical deployment rather than a fire-and-forget trigger — the parent pipeline's success/failure genuinely reflects the child's outcome
- Kubernetes executor autoscaling to zero when idle is the concrete production answer to "how do you avoid paying for idle CI capacity"
- Multi-project pipelines are the real-world pattern for a CI/CD system split across microservices in separate repos, each with independent pipelines that still need to coordinate a shared deployment

### Steps
1. Set up two GitLab projects — an application project and a deploy project
2. Configure the application project's pipeline to trigger the deploy project's pipeline with `strategy: depend`
3. Set up a Kubernetes-executor runner and confirm job pods scale up and back down to zero
4. Intentionally fail the downstream pipeline and confirm the parent pipeline correctly reflects the failure
5. Document the autoscaling behavior observed (pod count over time) in the README

---

## Portfolio Checklist
- [ ] All repos public on GitLab with clear READMEs
- [ ] README includes the full `.gitlab-ci.yml` and how to reproduce the pipeline
- [ ] Can explain the artifact-vs-cache distinction and `needs:`-based DAG pipelines without notes in an interview
- [ ] Project 2's security scan findings are screenshotted from the Security Dashboard, not just described
- [ ] Project 3 demonstrates real observed autoscaling (pod count before/during/after a pipeline run), not just the runner configuration
