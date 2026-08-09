# GitLab CI/CD — Intermediate

## Dynamic Child Pipelines

A single monolithic `.gitlab-ci.yml` gets unwieldy fast for a monorepo with many independently-deployable services — every change to any service re-evaluates the entire pipeline definition. Child pipelines solve this by letting a job generate its own pipeline YAML at runtime and trigger it as a separate, nested pipeline:

```yaml
generate-pipeline:
  stage: build
  script:
    - ./scripts/generate-service-pipeline.sh > generated-pipeline.yml
  artifacts:
    paths: [generated-pipeline.yml]

trigger-child:
  stage: deploy
  trigger:
    include:
      - artifact: generated-pipeline.yml
        job: generate-pipeline
    strategy: depend   # parent pipeline waits on and reflects the child's status
```

`strategy: depend` matters — without it, the parent pipeline reports success the moment it *triggers* the child, regardless of whether the child pipeline itself later fails, which produces a misleadingly green parent pipeline for a deploy that actually broke.

## Merge Trains

For a high-velocity repo where multiple merge requests land close together, merging them one at a time (each re-running the full pipeline against `main` before the next starts) is slow and serializes unnecessarily. A **merge train** queues approved MRs and tests each one *as if* the previous ones in the queue had already merged — catching integration conflicts between queued MRs before they actually merge, not after:

```yaml
# Merge trains are enabled per-project (Settings > Merge Requests) —
# no special YAML needed beyond a normal merge-request pipeline;
# GitLab handles the queuing and speculative-merge testing automatically
# once "Merge Trains" is enabled and merge requests use "Merge when pipeline succeeds"
```

The practical value: two MRs that each pass CI individually but conflict when combined get caught by the train's speculative merge-and-test step, rather than discovered only after both are already on `main`.

## Review Apps — Dynamic Environments per Merge Request

A review app spins up a genuinely deployed, live instance of the application for a specific merge request — reviewers can click a real link and interact with the actual change, not just read a diff:

```yaml
review-app:
  stage: deploy
  script:
    - kubectl create namespace review-$CI_MERGE_REQUEST_IID --dry-run=client -o yaml | kubectl apply -f -
    - kubectl set image deployment/app app=$IMAGE -n review-$CI_MERGE_REQUEST_IID
  environment:
    name: review/$CI_COMMIT_REF_SLUG
    url: https://$CI_MERGE_REQUEST_IID.review.company.com
    on_stop: stop-review-app   # cleanup job, see below
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'

stop-review-app:
  stage: deploy
  script:
    - kubectl delete namespace review-$CI_MERGE_REQUEST_IID
  environment:
    name: review/$CI_COMMIT_REF_SLUG
    action: stop
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
  when: manual
```

`on_stop` wiring a dedicated cleanup job is what prevents review-app namespaces from accumulating indefinitely — without it, every MR leaves behind a running environment nobody tears down.

## Parallel Matrix Jobs

Testing the same job across multiple parameter combinations (Node versions, target platforms) without hand-writing one job per combination:

```yaml
test:
  stage: test
  parallel:
    matrix:
      - NODE_VERSION: ["18", "20", "22"]
        OS: ["ubuntu", "alpine"]
  image: node:$NODE_VERSION-$OS
  script: [npm test]
  # Generates 6 parallel jobs (3 Node versions × 2 OS images) from one job definition
```

## CI/CD Variable Scoping in Depth

Beyond basic Protected/Masked flags, variables can be scoped to specific environments, which matters once staging and production share the same pipeline definition but need different secrets:

```yaml
variables:
  DEPLOY_TOKEN: $STAGING_TOKEN

deploy-staging:
  environment: staging
  # A variable defined with an environment scope of "staging" in
  # Settings > CI/CD > Variables only resolves here, not in deploy-production
```

The common mistake this prevents: a single unscoped `DEPLOY_TOKEN` variable available to every environment means a staging deploy job could technically access production credentials if the pipeline definition ever changes — environment-scoped variables make that structurally impossible rather than relying on job authors being careful.
