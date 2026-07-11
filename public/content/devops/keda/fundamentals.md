# KEDA — Fundamentals

## The problem KEDA solves: HPA only sees CPU and memory

The standard Horizontal Pod Autoscaler scales based on CPU and memory utilization only (or custom metrics, with real additional setup). This is a genuine, common blind spot: a Kafka consumer processing a backed-up queue can show low CPU and normal memory the entire time — it's I/O- and network-bound waiting on messages, not compute-bound — while a million messages sit unprocessed. HPA sees "everything looks fine" and never scales it. KEDA (Kubernetes Event-Driven Autoscaling) closes this gap by scaling on the *actual* signal that matters for a given workload: consumer lag, queue depth, a scheduled time window, or any Prometheus metric — not just CPU/memory as a proxy for real load.

## `ScaledObject`: KEDA's replacement for a raw HPA

```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: payment-consumer-scaler
  namespace: production
spec:
  scaleTargetRef:
    name: payment-consumer
  minReplicaCount: 0
  maxReplicaCount: 50
  pollingInterval: 15
  cooldownPeriod: 60
  triggers:
  - type: kafka
    metadata:
      bootstrapServers: kafka.production:9092
      consumerGroup: payment-processor
      topic: payment-events
      lagThreshold: "1000"
      activationLagThreshold: "100"
```

Under the hood, KEDA actually creates and manages a standard Kubernetes HPA — `kubectl get hpa` shows it directly. KEDA's real contribution is the **scaler** layer: translating an external signal (Kafka lag, in this example) into the metric HPA scales against, something HPA has no native way to consume on its own.

## `minReplicaCount: 0` — genuine scale-to-zero, which HPA cannot do

Standard HPA has a hard minimum of 1 replica — it can never scale a workload down to zero, even during periods of guaranteed zero load. KEDA can, for event-driven workloads that are genuinely idle much of the time (a batch processor, an off-hours job): zero replicas when there's nothing to do, scaling up automatically the moment work actually arrives. For a workload that's idle a meaningful fraction of the time, this is a real, direct cost reduction, not just an operational nicety — you're not paying for standing capacity with nothing to process.

## `activationLagThreshold`: the specific setting that prevents thrashing

Without a defined activation threshold, a workload could scale from 0 to 1 replica the instant a single message arrives, then immediately back to 0 once it's processed, repeating rapidly — real, wasteful pod-churn overhead. `activationLagThreshold` sets a minimum lag/signal level required specifically for the 0→1 scale-up transition (separate from the regular scaling threshold used once already running), smoothing out this rapid oscillation for genuinely bursty, low-volume workloads.

## Combining multiple triggers

```yaml
triggers:
- type: kafka
  metadata: { lagThreshold: "1000", ... }
- type: cpu
  metadata: { type: Utilization, value: "70" }
```
Multiple triggers on one `ScaledObject` combine with OR logic by default — the workload scales up if *either* condition indicates it should, taking the maximum recommended replica count across all triggers. This is genuinely useful for a workload that has more than one real reason to need more capacity (queue lag *or* CPU pressure), rather than only ever monitoring one signal.

## Cron-based scaling: predictable, scheduled capacity changes

```yaml
triggers:
- type: cron
  metadata:
    timezone: Asia/Kolkata
    start: "0 8 * * 1-5"
    end: "0 20 * * 1-5"
    desiredReplicas: "10"
```
For workloads with genuinely predictable, time-based traffic patterns (business-hours-only APIs, batch jobs that only make sense to run overnight), scheduled scaling avoids the reaction lag of purely metric-driven autoscaling — capacity is already in place *before* the predictable demand arrives, rather than scaling up reactively after load has already increased.
