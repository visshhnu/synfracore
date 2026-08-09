# GitLab CI/CD — Troubleshooting

## Job stuck in "pending" and never starts

**Symptom:** a job sits in the `pending` state indefinitely — no logs, no runner picks it up, and the pipeline appears stalled entirely.

**Root cause:** this is almost always a runner-availability problem, not a script problem — "pending" means GitLab has created the job record but no runner has claimed it yet. The most common causes are a `tags:` mismatch (the job requests a tag no available runner has), all matching runners being busy or paused, or — on GitLab.com specifically — the project's free CI/CD minutes for the month being exhausted.

**Fix:** check Settings → CI/CD → Runners to confirm at least one active, non-paused runner has every tag the job requests — a job with `tags: [kubernetes, gpu]` will stay pending forever if no runner is tagged with both. For self-hosted runners, `gitlab-runner verify` from the runner host confirms it's actually registered and reachable. If tags and runner status both look correct on GitLab.com, check the group/project's CI/CD minutes usage — pipelines silently queue rather than failing loudly when minutes run out.

```bash
# From the runner host — confirms registration and connectivity
gitlab-runner verify

# List a runner's configured tags
gitlab-runner list
```

## Artifacts from an earlier stage aren't available in a later job

**Symptom:** a `test` job fails because it can't find the build output from the `build` job — files that were clearly created earlier in the pipeline appear missing.

**Root cause:** artifacts and cache solve two different problems and are not interchangeable. Artifacts pass this pipeline run's outputs forward between jobs and stages; cache persists files (like `node_modules`) across separate pipeline runs to speed up repeated work, but isn't guaranteed to survive — it can be evicted at any time. A job that declares its build output as `cache:` instead of `artifacts:` will frequently "work" in local testing and then intermittently fail in CI once the cache is evicted, which makes this a confusing, non-deterministic-looking bug rather than a hard failure.

**Fix:** declare build outputs consumed by later jobs as `artifacts:`, not `cache:`. Cache is for genuinely reusable, regenerable state (installed dependencies); artifacts are for this run's actual deliverables.

```yaml
build-job:
  stage: build
  script: [npm run build]
  artifacts:
    paths: [dist/]        # reliably available to later jobs in this pipeline
    expire_in: 1 week

test-job:
  stage: test
  needs: [build-job]       # explicitly depends on build-job's artifacts
  script: [npm test]        # dist/ is present here because it's an artifact, not cache
```

## Pipeline fails immediately with a YAML syntax error, no jobs ever run

**Symptom:** the entire pipeline shows a single red X before any job log even exists — nothing to debug in job output because no job ran.

**Root cause:** `.gitlab-ci.yml` has invalid YAML syntax or an invalid keyword GitLab's schema doesn't recognize — indentation errors, a duplicate top-level key, or a typo'd keyword (`scripts:` instead of `script:`) are the most common causes.

**Fix:** use the CI Lint tool *before* pushing, not after — Project → CI/CD → Editor → Lint tab validates the file against GitLab's actual schema and reports the specific line. The same check is available via API for pre-commit hooks:

```bash
curl --header "Content-Type: application/json" \
  https://gitlab.com/api/v4/projects/:id/ci/lint \
  --data '{"content": "'"$(cat .gitlab-ci.yml | sed 's/"/\\"/g')"'"}'
```

## `needs:` job fails with "is not in any previous stage"

**Symptom:** adding a `needs:` dependency produces a pipeline-creation error rather than the expected DAG behavior — the pipeline won't even start.

**Root cause:** by default, `needs:` requires the referenced job to be in an earlier stage than the job declaring the dependency — GitLab enforces stage ordering unless explicitly told not to. Referencing a job in the same or a later stage without additional configuration fails at pipeline-creation time.

**Fix:** either move the dependency to an earlier stage (the common case), or, if same-stage parallelism is genuinely intended, remove `stages:` ordering constraints from the mental model entirely by combining `needs:` with `stage:` values that reflect the real dependency graph rather than treating stages as a strict sequence. In most real pipelines the fix is simpler than it looks: the job list was written stage-first instead of dependency-first, and reordering the `stages:` array to match the actual DAG resolves it.

## Protected CI/CD variable is empty inside a merge request pipeline

**Symptom:** a deploy or scan job that reads a protected variable (an API token, a cloud credential) gets an empty string instead of the real value — but only in merge request pipelines from certain branches, not on `main`.

**Root cause:** variables marked **Protected** in Settings → CI/CD → Variables are only exposed to pipelines running on protected branches (or protected tags). A merge request pipeline running from a non-protected feature branch — and especially one from a forked project — does not receive protected variables at all, by design, since exposing deploy credentials to arbitrary fork-originated pipelines would be a real security hole.

**Fix:** this is working as intended, not a bug — don't unprotect the variable to "fix" it. Instead, split the pipeline so jobs that need real credentials (deploys, anything touching production) only run on protected branches via `rules:`, while feature-branch/MR pipelines run tests and linting that don't need secrets at all.

```yaml
deploy_production:
  stage: deploy
  script: [kubectl set image deployment/app app=$IMAGE -n production]
  rules:
    - if: '$CI_COMMIT_BRANCH == "main"'   # main is a protected branch — variable is available here
      when: manual
    - when: never                          # never runs on unprotected branches/forks
```

## Docker build fails inside a job with "Cannot connect to the Docker daemon"

**Symptom:** a job running `docker build` fails immediately with a connection error to the Docker daemon, even though the exact same command works on a developer's laptop.

**Root cause:** the job is running under the Docker or Kubernetes executor, where the job itself executes *inside* a container — there's no Docker daemon available inside that container by default, because running Docker inside Docker requires deliberate additional setup (privileged mode, or a separate `docker:dind` service), not something that works out of the box.

**Fix:** add the Docker-in-Docker service and set the required host explicitly:

```yaml
build:
  stage: build
  image: docker:24
  services:
    - docker:24-dind          # provides the Docker daemon the job connects to
  variables:
    DOCKER_HOST: tcp://docker:2376
    DOCKER_TLS_CERTDIR: "/certs"
  script:
    - docker build -t $IMAGE .
    - docker push $IMAGE
```

On shared GitLab.com runners this is the standard, supported pattern; on self-hosted Kubernetes-executor runners it additionally requires the runner itself to be configured with `privileged = true` in `config.toml` — a real security tradeoff worth being explicit about rather than enabling blindly project-wide.

## Kubernetes-executor job is killed mid-run with no clear error, just "Job failed"

**Symptom:** a job running under the Kubernetes executor terminates abruptly partway through, with a generic failure and no application-level error in the log.

**Root cause:** this is most often an OOMKill — the job's pod exceeded the `memory_limit` configured for the Kubernetes executor and Kubernetes terminated the container, which GitLab surfaces as a bare job failure rather than an explicit out-of-memory message in the job log itself.

**Fix:** check the pod's actual termination reason directly against the cluster, not just the GitLab job log — `kubectl describe pod` on the (possibly already-deleted) job pod, or the cluster's own event history, will show `OOMKilled` explicitly if that's the cause. If confirmed, raise the runner's configured memory limit for that job class:

```toml
# /etc/gitlab-runner/config.toml
[[runners]]
  executor = "kubernetes"
  [runners.kubernetes]
    namespace = "gitlab-runner"
    cpu_limit = "1"
    memory_limit = "4Gi"    # raised from a lower default that was too tight for this job
```

A build step that intermittently OOMs (rather than consistently) is a strong signal the limit is marginal for real workload variance, not that the job is simply broken.

## Production deploy shows "green" pipeline but the old version is still live

**Symptom:** the pipeline completes successfully end to end, but the running application in production is still the previous version.

**Root cause:** a `when: manual` gate on the deploy job means the pipeline can complete "successfully" through every automatic stage while the deploy job itself sits unstarted, waiting for a human to click it in the UI — a manual job that's never triggered doesn't fail the pipeline, it just never runs, and the overall pipeline still shows green because every job that *did* run succeeded.

**Fix:** this is intended behavior for a gated production deploy, not a defect — the fix is checking Operations → Environments, not the pipeline status, to see what's actually live. If the expectation was that deploys happen automatically, remove `when: manual` from the rule instead; if the gate is intentional (as it usually should be for production), make sure whoever owns the release actually knows they need to click "deploy" — a green pipeline is not the same signal as "this is live," and conflating the two is what causes this confusion.

## Security scan (SAST/Secret Detection) blocks a merge request unexpectedly

**Symptom:** a merge request that looks clean gets blocked by a failed SAST or Secret Detection job, and it's not obvious what triggered it.

**Root cause:** the built-in scanning templates run against the full diff, and false positives are common — a test fixture containing a string that looks like an API key pattern, or a SAST rule flagging a genuinely safe pattern used in a non-security-relevant context, are both routine occurrences, not signs the scanner is broken.

**Fix:** check the Security Dashboard or the MR's Security widget for the specific finding before assuming either "the code is fine, ignore it" or "the scanner is wrong, disable it" — both are common but usually premature reactions. Genuine false positives can be dismissed per-finding with a documented reason (Security Dashboard → dismiss → reason), which keeps an audit trail, rather than disabling the scanning template entirely for the whole project, which silently removes a real security control for every future MR, not just this one.

---

## Official Resources

- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)
- [GitLab CI/CD Variables Documentation](https://docs.gitlab.com/ee/ci/variables/)
- [GitLab Runner Executors](https://docs.gitlab.com/runner/executors/)
- [GitLab CI/CD Troubleshooting Documentation](https://docs.gitlab.com/ee/ci/debugging.html)

---
