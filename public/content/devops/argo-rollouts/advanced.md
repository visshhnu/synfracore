# Argo Rollouts — Enterprise Patterns, Metric Providers & Notifications

## Metric providers beyond Prometheus

AnalysisTemplates aren't locked to Prometheus — the same pattern (query a provider, evaluate a success condition, act on the result) works across several backends:

```yaml
provider:
  prometheus:
    address: http://prometheus.monitoring:9090
    query: |
      sum(rate(http_requests_total{status!~"5.*"}[2m]))
      / sum(rate(http_requests_total[2m]))
# or:
  datadog:
    interval: 5m
    query: "avg:trace.http.request.errors{service:payment}"
# or:
  wavefront:
    query: "..."
# or:
  cloudWatch:
    metricDataQueries: [...]
# or:
  newRelic:
    profile: my-profile
    query: "..."
# or:
  job:                         # run an arbitrary Kubernetes Job as the check
    spec: {...}
```

The choice of provider is a function of what a team already uses for observability, not a functional limitation of Argo Rollouts itself — the `AnalysisTemplate`/`AnalysisRun` mechanism is provider-agnostic, and the `job` provider specifically exists as an escape hatch for a custom check that doesn't fit any built-in metrics-provider integration.

## Multiple analysis metrics in one template, with different weights

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: comprehensive-check
spec:
  metrics:
  - name: error-rate
    successCondition: result[0] <= 0.01
    failureLimit: 1
    provider:
      prometheus: {...}
  - name: latency-p99
    successCondition: result[0] <= 500
    failureLimit: 2
    provider:
      prometheus: {...}
```

Multiple metrics in one `AnalysisTemplate` are evaluated independently, each with its own `successCondition` and `failureLimit` — a rollout fails if *any* metric in the template exceeds its own failure limit, not only if all of them do. This lets a single analysis gate check several genuinely different health signals (error rate AND latency, not just one) without requiring separate, sequential analysis steps for each.

## Notifications: making rollout state visible without polling

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argo-rollouts-notification-configmap
data:
  trigger.on-rollout-completed: |
    - send: [rollout-completed]
  template.rollout-completed: |
    message: Rollout {{.rollout.metadata.name}} completed successfully.
  subscriptions: |
    - recipients: [slack:deployments]
      triggers: [on-rollout-completed, on-rollout-aborted]
```

The Argo Rollouts notification system (built on the shared Argo Events/Notifications engine used across the Argo project family) subscribes to rollout lifecycle events — completion, abort, analysis failure — and pushes them to Slack, email, webhooks, or other configured integrations, rather than requiring a human to run `kubectl argo rollouts get rollout --watch` and stay looking at it. This matters specifically for automated rollbacks: without notifications, an automatic rollback triggered by a failed analysis can happen silently, and nobody investigates the underlying regression until a much later, separate signal surfaces it.

## RBAC considerations specific to Argo Rollouts

Because `promote`, `abort`, and `undo` are real, production-affecting actions, the `Rollout` custom resource (and its subresources like `AnalysisRun`) should be governed by Kubernetes RBAC the same as any other production-affecting resource — commonly, broader read access (viewing rollout status) paired with narrower write access (promote/abort/undo) restricted to a smaller group, mirroring the same separation-of-duties principle that applies to `kubectl delete` on a Deployment in production, just extended to Argo Rollouts' own verbs.

## Restarting a Rollout vs. a new rollout

```bash
kubectl argo rollouts restart payment-service
```

A `restart` recreates all pods (useful for picking up a ConfigMap/Secret change that doesn't itself trigger a new rollout via image tag change) but does **not** go through canary/blue-green steps — it's closer to a rolling pod restart than a progressive delivery event. This distinction matters operationally: a `restart` isn't the safety-checked path a real version change gets, so it shouldn't be used as a substitute for an actual canary rollout when the underlying application code has changed.

## Scaling considerations during an active canary

During a canary rollout, both stable and canary ReplicaSets run simultaneously at whatever proportion the current step dictates — meaning total resource consumption (CPU/memory requests across both ReplicaSets) can temporarily exceed the steady-state Deployment-equivalent footprint, especially at intermediate weights like 50%. Capacity planning for a namespace running progressive-delivery rollouts needs to account for this temporary overhead, not just the steady-state replica count — a cluster sized exactly for one full replica count of an application can hit resource pressure during its own canary rollouts if this isn't budgeted for.

## Try It (2 Minutes)

Using the multi-metric AnalysisTemplate example above:

1. If an AnalysisTemplate defines both an error-rate metric and a latency metric, does the rollout only fail if BOTH exceed their failure limits, or if EITHER one does?
2. Does `kubectl argo rollouts restart` go through canary/blue-green steps the way a normal image-tag-triggered rollout does?
3. Why does capacity planning for canary rollouts need to account for more than just the application's normal steady-state replica count?

You should land on: the rollout fails if EITHER metric exceeds its own failure limit — metrics are evaluated independently, not requiring all to fail together; no, `restart` recreates pods without going through progressive-delivery steps, so it isn't a safety-checked substitute for an actual version-change rollout; because stable and canary ReplicaSets run simultaneously during an active canary, temporarily exceeding the steady-state resource footprint at intermediate weights.
