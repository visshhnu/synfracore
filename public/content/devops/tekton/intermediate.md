# Tekton — Intermediate

## Matrix Strategy — Parallel Task Execution Across Parameters

The same conceptual feature as GitLab CI's `parallel: matrix` — running one logical Task across multiple parameter combinations without duplicating the Task definition per combination:

```yaml
apiVersion: tekton.dev/v1
kind: Pipeline
metadata: { name: multi-version-test }
spec:
  tasks:
  - name: test
    matrix:
      params:
      - name: node-version
        value: ["18", "20", "22"]
    taskRef: { name: run-tests }
    params:
    - name: version
      value: $(matrix.node-version)
  # Generates 3 parallel TaskRuns, one per Node version, from one Task reference
```

## PipelineRun Timeouts and Cancellation

Without explicit timeouts, a hung Task step (a network call that never times out on its own, a build stuck waiting on a resource) can leave a `PipelineRun` running indefinitely, consuming cluster resources with nothing to show for it:

```yaml
apiVersion: tekton.dev/v1
kind: PipelineRun
metadata: { name: build-deploy-run }
spec:
  pipelineRef: { name: build-deploy }
  timeouts:
    pipeline: "1h0m0s"     # overall PipelineRun timeout
    tasks: "45m0s"          # per-task-phase timeout
    finally: "10m0s"        # timeout for finally tasks specifically
```

```bash
# Manually cancel a running PipelineRun that's clearly stuck
kubectl patch pipelinerun build-deploy-run --type=merge -p '{"spec":{"status":"PipelineRunCancelled"}}'
```

Setting `tasks` and `finally` timeouts separately from the overall `pipeline` timeout matters specifically for pipelines with cleanup logic in `finally:` — a single flat timeout risks the timeout firing mid-cleanup, leaving resources in a half-cleaned state.

## `finally` Tasks — Guaranteed Cleanup and Notifications

Tasks in a `finally:` block run after all regular tasks complete, **regardless of whether the pipeline succeeded or failed** — the direct equivalent of a `try/finally` block, useful for cleanup steps or notifications that need to run either way:

```yaml
spec:
  tasks:
  - name: build
    taskRef: { name: build-image }
  - name: deploy
    taskRef: { name: deploy-app }
    runAfter: [build]
  finally:
  - name: notify-slack
    taskRef: { name: slack-notify }
    params:
    - name: status
      value: $(tasks.deploy.status)   # available specifically in finally tasks
  - name: cleanup-workspace
    taskRef: { name: cleanup }
```

`$(tasks.<name>.status)` is only accessible from within `finally:` — this is the mechanism that lets a single notification task report "succeeded" or "failed" correctly, rather than needing separate success-path and failure-path notification tasks duplicated across the pipeline.

## Tekton Results — Retaining Run History Past Pod Garbage Collection

As covered in Troubleshooting, Kubernetes garbage-collects completed pods (and their logs) after a retention period — Tekton Results is the purpose-built solution for retaining `PipelineRun`/`TaskRun` history and logs beyond that window, storing them in a separate API and database rather than relying on the pods themselves persisting:

```bash
# Query historical run results via the Tekton Results API,
# available after the originating pods are long gone
tkn-results pipelinerun list --limit 20
tkn-results pipelinerun logs build-deploy-xyz
```

This is the direct fix for the exact gap Troubleshooting identified — Tekton itself doesn't retain logs long-term by default, and Results is the component that closes that gap, rather than needing a fully separate external logging pipeline for CI history specifically.

## Custom Tasks with Sidecars

A Task step sometimes needs a companion process running alongside it for the step's duration — a database proxy, a local cache server — without that companion being a pipeline step itself:

```yaml
apiVersion: tekton.dev/v1
kind: Task
metadata: { name: integration-test }
spec:
  sidecars:
  - name: postgres
    image: postgres:16
    env: [{ name: POSTGRES_PASSWORD, value: testpass }]
  steps:
  - name: test
    image: myapp:test
    script: |
      # postgres sidecar is already running and reachable at localhost:5432
      # for the duration of this step
      npm run test:integration
```

The sidecar starts before the step begins and is automatically torn down when the Task completes — this is the Tekton-native way to provide test dependencies without needing a separately-managed test database for CI specifically.
