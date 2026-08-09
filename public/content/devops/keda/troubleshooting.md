# KEDA — Troubleshooting

## `ScaledObject` shows `READY: False` and the workload never scales

**Symptom:** `kubectl get scaledobject` shows a `ScaledObject` with `READY` false, and the target Deployment stays at its current replica count regardless of actual load.

**Root cause:** almost always a trigger-connectivity or authentication failure — KEDA can't reach or authenticate against the external system (Kafka, RabbitMQ, Prometheus, a cloud queue) the trigger is configured against, so it has no metric value to scale on at all and reports not-ready rather than guessing.

**Fix:** `kubectl describe scaledobject <name>` surfaces the specific error in its Events section — this is the first and fastest diagnostic step, before digging into operator logs:

```bash
kubectl describe scaledobject payment-consumer-scaler -n production
kubectl logs -n keda -l app=keda-operator -f | grep <scaledobject-name>
```

A `TriggerAuthentication` referencing a Secret in the wrong namespace is a common specific cause — `TriggerAuthentication` and the `Secret` it references must be in the same namespace as the `ScaledObject`, and a cross-namespace reference fails silently rather than with an obvious "wrong namespace" error message.

## Consumer lag is genuinely high, but the Deployment never scales past 1-2 replicas

**Symptom:** the trigger metric (Kafka lag, queue depth) is clearly well above threshold, `ScaledObject` shows `READY: True`, but replica count stays low despite `maxReplicaCount` being set much higher.

**Root cause:** KEDA drives scaling through the standard Kubernetes HPA underneath — and HPA has its own default scaling-rate limits (a stabilization window and a maximum scale-up rate per period) that exist to prevent thrashing, but can also mean a genuine, sudden spike in load takes several scaling intervals to fully catch up to `maxReplicaCount`, not one immediate jump.

**Fix:** check the actual HPA KEDA created, not just the `ScaledObject` — its `status` shows the current vs. desired replica count and any scaling-rate limits currently in effect:

```bash
kubectl get hpa -n production   # KEDA creates and manages this underneath every ScaledObject
kubectl describe hpa keda-hpa-payment-consumer-scaler -n production
```

If the default HPA scaling-rate behavior is genuinely too slow for the workload's real spike pattern, `ScaledObject` supports an `advanced.horizontalPodAutoscalerConfig.behavior` block to tune the underlying HPA's scale-up policy directly, rather than assuming KEDA itself is the bottleneck when the HPA's own default pacing is the actual cause.

## Scale-to-zero workload has a noticeable latency spike on the first request after idle

**Symptom:** a `ScaledObject` with `minReplicaCount: 0` correctly scales to zero during idle periods, but the first request/message after a scale-to-zero period takes noticeably longer to be handled than normal.

**Root cause:** this is expected, mechanical behavior, not a bug — scaling from zero requires KEDA's polling interval to detect the new signal, then a pod to actually schedule and start (image pull if not cached, container startup, application init) before it can process anything, whereas a pod already running would handle the same request immediately. The gap between "message arrives" and "pod is ready to process it" is real, unavoidable latency inherent to scale-to-zero.

**Fix:** this isn't something to "fix" so much as a tradeoff to make deliberately — for workloads where this cold-start latency is acceptable (batch jobs, non-latency-sensitive consumers), scale-to-zero is worth the cost savings; for latency-sensitive workloads, set `minReplicaCount: 1` instead of `0` to keep a warm baseline while still scaling up further under real load:

```yaml
spec:
  minReplicaCount: 1     # keeps one warm replica — no cold-start latency, smaller cost saving than 0
  maxReplicaCount: 50
```

Reducing `pollingInterval` (how often KEDA checks the trigger) tightens the detection-lag portion of cold start, but doesn't touch pod scheduling/startup time, which is usually the larger component of the delay.

## Creating a `ScaledObject` fails with an error that an HPA already exists

**Symptom:** applying a new `ScaledObject` for a Deployment that previously had a manually-created HPA fails, or silently doesn't take effect as expected.

**Root cause:** KEDA creates and owns its own HPA for each `ScaledObject` — if a manually-created (non-KEDA) HPA already targets the same Deployment, the two conflict, since Kubernetes doesn't allow two HPAs targeting the same scale target simultaneously.

**Fix:** delete the pre-existing manual HPA before applying the `ScaledObject` — KEDA needs to be the sole owner of the scaling configuration for that Deployment, not layered on top of an existing one:

```bash
kubectl get hpa -n production   # check for a pre-existing HPA on the same target
kubectl delete hpa <old-manual-hpa-name> -n production
kubectl apply -f scaledobject.yaml   # KEDA now creates and owns its own HPA
```

## `ScaledJob` creates far more Jobs than expected under load

**Symptom:** a `ScaledJob` (used for one-off batch processing rather than scaling a Deployment) creates a large, unexpected number of concurrent Jobs when a queue backs up, straining cluster resources.

**Root cause:** `ScaledJob`'s `queueLength` setting controls roughly how many messages each Job instance is expected to handle — a low `queueLength` (e.g. `"1"`, one Job per message) combined with a high `maxReplicaCount` means a large backlog translates directly into a correspondingly large number of simultaneous Jobs, each consuming cluster resources, which can be a legitimate design choice for fast-draining a backlog or an unintended resource storm depending on whether it was sized deliberately.

**Fix:** review whether `queueLength` and `maxReplicaCount` together produce a Job count the cluster can actually absorb at the backlog sizes that realistically occur — raising `queueLength` (more messages processed per Job instance) trades processing latency for a smaller peak Job count:

```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledJob
metadata:
  name: report-generator
spec:
  maxReplicaCount: 20        # hard ceiling on concurrent Jobs regardless of backlog size
  triggers:
  - type: rabbitmq
    metadata:
      queueName: report-requests
      queueLength: "5"        # raised from 1 — each Job now expected to handle ~5 messages, fewer concurrent Jobs
```

`maxReplicaCount` is the actual hard ceiling worth setting deliberately here — relying on `queueLength` alone to bound concurrency without also capping `maxReplicaCount` still allows an extreme backlog to spike Job count far higher than the cluster can schedule at once.

## Cron trigger doesn't scale up at the expected time

**Symptom:** a `ScaledObject` with a `cron` trigger doesn't scale as configured — the expected business-hours scale-up (or scale-down) simply doesn't happen at the scheduled time.

**Root cause:** almost always a `timezone` mismatch — the cron schedule strings (`start`/`end`) are evaluated in the `timezone` field explicitly set on the trigger, not the cluster's or the operator pod's local timezone, and a schedule authored assuming local time without setting `timezone` correctly runs at the wrong actual time (typically UTC) rather than failing outright, which makes the bug easy to miss until someone notices the scaling happens at a strange hour.

**Fix:** confirm `timezone` is set explicitly and matches the intended business timezone, and validate the cron expression itself independently (a misplaced field in the 5-part cron string is a separate, equally common cause):

```yaml
triggers:
- type: cron
  metadata:
    timezone: Asia/Kolkata      # without this, cron evaluates in UTC — a common silent mismatch
    start: "0 8 * * 1-5"        # verify this actually means 8am in the INTENDED timezone, not UTC
    end: "0 20 * * 1-5"
    desiredReplicas: "10"
```

`kubectl describe scaledobject` shows the operator's interpretation of the next scheduled transition, which is the fastest way to confirm whether the schedule is being read correctly before waiting for the actual scheduled time to arrive to find out.

---

## Official Resources

- [KEDA Documentation](https://keda.sh/docs/)
- [KEDA Troubleshooting Guide](https://keda.sh/docs/latest/troubleshooting/)
- [KEDA Scalers Reference](https://keda.sh/docs/latest/scalers/)

---
