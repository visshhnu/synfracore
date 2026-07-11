# GitLab CI — Fundamentals

## What is GitLab CI?

|  | GitLab CI | Jenkins | GitHub Actions |
|---|---|---|---|
| Where config lives | `.gitlab-ci.yml` in repo | Jenkinsfile in repo or UI | `.github/workflows/*.yml` |
| Infrastructure | GitLab-hosted or self-hosted runners | Self-managed servers + agents | GitHub-hosted runners |
| Registry | Built-in container registry | External | GHCR (GitHub Packages) |
| Best for | GitLab users, integrated DevOps platform | Complex enterprise pipelines | GitHub repos, open source |

```bash
# Validate a .gitlab-ci.yml before pushing, using the CI Lint API
curl --header "Content-Type: application/json" \
  https://gitlab.com/api/v4/projects/:id/ci/lint \
  --data '{"content": "'"$(cat .gitlab-ci.yml | sed 's/"/\\"/g')"'"}'

# Or use the built-in editor: Project → CI/CD → Editor → Lint tab
```

## Pipeline Syntax

Every pipeline has **stages** (ordered groups), **jobs** (the unit of work inside a stage), **artifacts** (files passed between jobs), and **cache** (persisted between pipeline runs). Jobs in the same stage run in parallel.

```yaml
stages: [build, test, deploy]

build-job:
  stage: build
  image: node:20
  script:
    - npm ci
    - npm run build
  artifacts:
    paths: [dist/]
    expire_in: 1 week
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths: [node_modules/]

test-job:
  stage: test
  image: node:20
  script: [npm test]

deploy-job:
  stage: deploy
  script:
    - kubectl set image deployment/myapp myapp=myapp:$CI_COMMIT_SHA
  environment:
    name: production
    url: https://myapp.example.com
  only: [main]
```

## Advanced — Rules, Needs, Cache, Include

```yaml
# rules — more flexible than only/except, evaluated top to bottom
deploy-prod:
  stage: deploy
  rules:
    - if: '$CI_COMMIT_BRANCH == "main"'
      when: manual
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
      when: never
  script: [echo "Deploying"]

# needs — run a job as soon as its specific dependencies finish,
# instead of waiting for the entire previous stage
test-fast:
  stage: test
  needs: [build-job]     # doesn't wait for other build-stage jobs
  script: [npm run test:unit]

# include — reuse pipeline definitions across projects
include:
  - project: 'company/ci-templates'
    file: '/templates/security-scan.yml'

# environments — track what's deployed where
deploy-staging:
  environment:
    name: staging
    url: https://staging.example.com
    on_stop: stop-staging
```

## Runners

| Type | Pros | Cons |
|---|---|---|
| Shared (GitLab.com) | Zero setup, 400 min/month free | Limited minutes, public runner (a security concern for sensitive code) |
| Self-hosted (shell) | No minute limits, fast (no startup) | Build pollution between jobs |
| Self-hosted (Docker) | Clean environment per job, reproducible | Docker pull on every job (mitigate with a registry cache) |
| Self-hosted (Kubernetes) | Scales to zero, unlimited parallel jobs | Pod startup time (10-30 sec) |

```bash
# Register a runner
gitlab-runner register \
  --url https://gitlab.com/ \
  --registration-token $REGISTRATION_TOKEN \
  --executor kubernetes \
  --kubernetes-namespace gitlab-runner \
  --description "k8s-runner"

# Kubernetes executor config — each job gets its own pod
# /etc/gitlab-runner/config.toml
[[runners]]
  executor = "kubernetes"
  [runners.kubernetes]
    namespace = "gitlab-runner"
    cpu_limit = "1"
    memory_limit = "2Gi"
```

## Variables & Secrets

```yaml
variables:
  NODE_ENV: production            # visible in job logs unless marked protected/masked

# Predefined variables GitLab provides automatically:
# $CI_COMMIT_SHA, $CI_COMMIT_BRANCH, $CI_PROJECT_NAME, $CI_PIPELINE_ID

deploy:
  script:
    - echo "Deploying commit $CI_COMMIT_SHA to $CI_ENVIRONMENT_NAME"
    - aws s3 cp dist/ s3://my-bucket/ --recursive
  # AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY set as masked, protected
  # CI/CD variables in Settings → CI/CD → Variables — never in the YAML file
```
Marking a variable **Protected** restricts it to protected branches only (main, release branches); marking it **Masked** hides its value in job logs. Both should be enabled by default for any real secret.

## Interview Questions

**What is GitLab CI and how does it differ from Jenkins?**
GitLab CI is CI/CD built directly into the GitLab platform — the pipeline is defined in a `.gitlab-ci.yml` file in the repository root, and when code is pushed, GitLab automatically reads this file and runs the pipeline with no separate server and no plugins to manage. Key differences from Jenkins: GitLab CI configuration lives in the repo itself, pipeline-as-code from day one, while Jenkins requires a separate server, plugin management, and manual Jenkinsfile setup. GitLab CI has a built-in container registry, artifact storage, and environment tracking. GitLab CI runners are simpler to scale on Kubernetes than Jenkins agents, while Jenkins has a more mature shared-library ecosystem and more plugin options for complex enterprise workflows. Choose GitLab CI when the team already uses GitLab for code, issues, and merge requests, since the integrated experience (pipeline status directly on the MR) is genuinely valuable; choose Jenkins for very complex pipeline logic requiring Groovy, existing enterprise Jenkins infrastructure, or working across multiple source control systems.

**What is the difference between artifacts and cache in GitLab CI?**
Artifacts are files produced by a job that need to be passed to later jobs *in the same pipeline* — they're uploaded to the GitLab server and downloaded by dependent jobs. For example, a build job compiles a JAR file and the deploy job needs it: the build job declares it as an artifact, and the deploy job automatically receives it. Cache, by contrast, is meant to persist *across pipeline runs* to speed up repeated work — `node_modules` or a Maven `.m2` directory cached between runs so dependencies aren't re-downloaded every single pipeline execution. The practical distinction: artifacts are for passing this run's outputs forward within the same pipeline; cache is for avoiding redundant work across separate runs. Using cache where an artifact is needed (or vice versa) is a common beginner mistake — cache isn't guaranteed to be available (it can be evicted), while artifacts reliably exist for the pipeline that created them.
