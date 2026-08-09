# Tekton — Troubleshooting

## `PipelineRun` created but no Task pods ever start

**Symptom:** `kubectl get pipelinerun` shows a `PipelineRun` in a pending/running state, but `kubectl get pods` shows no corresponding Task pods actually scheduled.

**Root cause:** because every Task step is a real Kubernetes pod, this is a scheduling problem, not a Tekton-specific one — insufficient cluster resources for the pod's requests, a missing `ServiceAccount` the `PipelineRun` references, or an unbound `Workspace` PVC that the pod can't mount are the most common causes. Tekton itself won't report this clearly as "scheduling failed" — it just shows the PipelineRun as not progressing.

**Fix:** check pod-level events directly, not just Tekton's own status, since the failure is one layer below Tekton:

```bash
kubectl get pipelinerun build-deploy-xyz -o yaml | grep -A5 conditions
kubectl get pods --selector=tekton.dev/pipelineRun=build-deploy-xyz
kubectl describe pod <task-pod-name>   # shows the actual scheduling failure reason
```

A `Workspace` backed by a `volumeClaimTemplate` that can't bind (no matching StorageClass, insufficient capacity in the cluster) is a frequent, easy-to-miss cause — `kubectl describe pvc` on the generated PVC shows this directly, and it won't show up in the PipelineRun's own status at all.

## `EventListener` never fires — pushes to Git don't create a `PipelineRun`

**Symptom:** code is pushed, the webhook appears configured, but no `PipelineRun` is ever created — nothing shows up in `tkn pipelinerun list`.

**Root cause:** this splits into two independent failure points that need checking separately. Either the webhook never reached the `EventListener` at all (a network/ingress problem, or the webhook secret configured on the Git provider's side doesn't match the `EventListener`'s `secretRef`), or the webhook reached the `EventListener` but its `interceptors:` filtered it out (an `eventTypes:` filter that doesn't include the actual event type sent, most commonly).

**Fix:** check delivery status on the Git provider side first (GitHub's webhook delivery log shows whether the request even left GitHub and what response code came back) — a non-2xx response there means the `EventListener` is unreachable or rejecting it, which is a different problem than "reachable but filtered." If delivery succeeded, check the `EventListener`'s own logs for interceptor rejection:

```bash
kubectl logs -n <namespace> -l eventlistener=github-listener
```

```yaml
apiVersion: triggers.tekton.dev/v1beta1
kind: EventListener
metadata:
  name: github-listener
spec:
  triggers:
  - name: github-push
    interceptors:
    - ref:
        name: github
      params:
      - name: secretRef
        value:
          secretName: github-webhook-secret   # must match the Git provider's configured webhook secret exactly
          secretKey: token
      - name: eventTypes
        value: [push]                          # a push arriving with a different event type is silently dropped here
```

## Task step fails abruptly with no application-level error in the log

**Symptom:** a step in a Task terminates unexpectedly mid-run, with a generic pod failure rather than an error from the actual command being run.

**Root cause:** the same OOMKill pattern as any other Kubernetes pod — Task steps run without explicit resource limits by default unless a `Task` or the cluster's `LimitRange` sets them, and a memory-hungry step (a large `npm install`, a Kaniko image build) can be killed by the kubelet before it ever produces its own error output.

**Fix:** check the pod's actual termination reason, not just the Tekton-level status:

```bash
kubectl get pod <task-pod-name> -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}'
# OOMKilled confirms this specific cause
```

Set explicit resource requests/limits on the Task's step if the default (or the cluster's `LimitRange`) is too tight for the actual workload:

```yaml
steps:
- name: build-and-push
  image: gcr.io/kaniko-project/executor:latest
  resources:
    requests: { memory: "1Gi", cpu: "500m" }
    limits: { memory: "4Gi", cpu: "2" }     # raised after confirming OOMKill was the cause
```

## A `ClusterTask` from the Catalog starts behaving differently after no visible change

**Symptom:** a pipeline that previously worked starts failing (or silently changes behavior) on a step using a Catalog `ClusterTask` like `git-clone` or `kaniko`, without any change to the pipeline's own YAML.

**Root cause:** referencing a Catalog Task without pinning its version — installing `git-clone` from the `main` branch of the catalog repo, or re-applying a Task manifest without checking its version, means a later re-install can silently pull in a newer version with different defaults or parameter names.

**Fix:** always install and reference Catalog Tasks at a specific version, not an unpinned "latest" path:

```bash
# Pinned to a specific version — reproducible, won't silently change
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml
```

```yaml
taskRef:
  name: git-clone
  kind: ClusterTask
  # if the Catalog Task supports it, pin explicitly via params/version rather than
  # assuming whatever is currently installed in the cluster is the version intended
```

If a Task's behavior changed unexpectedly, `kubectl get clustertask git-clone -o yaml` shows exactly what's currently installed — compare that against the version the pipeline was written and tested against.

## Parameter substitution silently resolves to an empty string instead of failing

**Symptom:** a Task step runs successfully (no error) but produces obviously wrong output — a file path with a blank segment, an image tag of just `:`, or similar — traceable to a `$(params.X)` reference.

**Root cause:** Tekton's parameter substitution doesn't fail the run if a referenced parameter name is misspelled or doesn't exist in scope — a `$(params.imageTag)` referencing a parameter actually named `image-tag` (hyphen vs. camelCase mismatch) resolves to an empty string rather than erroring, because the substitution engine doesn't validate parameter names against a schema at that layer.

**Fix:** treat any unexpectedly-empty value in Task output as a first suspect for a parameter name typo, and verify the exact parameter names declared on the `Task`/`Pipeline` match every `$(params.X)` reference used inside steps exactly, including case and hyphenation:

```yaml
spec:
  params:
  - name: image-name        # declared name uses a hyphen
  steps:
  - name: build
    script: |
      echo "Building $(params.imageName)"   # BUG: references imageName (camelCase) — resolves empty, no error
```

## `tkn pipelinerun logs` or the Dashboard shows nothing for a run that clearly executed

**Symptom:** `kubectl get pods` confirms Task pods ran and completed, but `tkn pipelinerun logs` or the Tekton Dashboard shows no log output for the run.

**Root cause:** most commonly a namespace mismatch — the CLI or Dashboard is pointed at a different namespace than where the `PipelineRun` actually executed, or the pod's logs were already garbage-collected by the cluster's log retention before being viewed (Kubernetes doesn't retain pod logs indefinitely once a pod is deleted, and Tekton doesn't archive them separately unless a results/logging backend is explicitly configured).

**Fix:** always pass the explicit namespace rather than relying on a default context, and confirm the pod itself still exists before assuming logs are lost:

```bash
tkn pipelinerun logs build-deploy-xyz -n <correct-namespace> -f
kubectl get pods -n <correct-namespace> --selector=tekton.dev/pipelineRun=build-deploy-xyz
```

For logs that need to survive past pod garbage collection, this needs an explicit external logging pipeline (shipping pod logs to Loki/ELK/Datadog, same as any other Kubernetes workload) — Tekton itself doesn't provide long-term log retention out of the box.

---

## Official Resources

- [Tekton Documentation](https://tekton.dev/docs/)
- [Tekton Triggers Documentation](https://tekton.dev/docs/triggers/)
- [Tekton Hub (ClusterTasks)](https://hub.tekton.dev/)

---
