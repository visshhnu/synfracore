# KEDA — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Problem KEDA Solves

```
HPA scales ONLY on CPU/memory. A Kafka consumer with LOW CPU but
  MASSIVE lag (1M+ messages backed up) is INVISIBLE to plain HPA —
  "everything looks fine" while users experience real delays.
KEDA scales on ANY metric: Kafka lag, RabbitMQ queue depth, Azure
  Service Bus, cron, Prometheus query results.
Killer feature: scale to ZERO when idle, scale up when work arrives.
```

## Architecture — the Metrics Chain

```
HPA controller (standard, UNMODIFIED Kubernetes component)
  -> queries External Metrics API
  -> KEDA's metrics-apiserver answers (polls the real trigger source)
  -> KEDA Operator evaluates ScaledObject trigger config
  -> HPA scales based on the computed value

KEDA NEVER scales anything itself — it only ever supplies metric
  VALUES into the standard HPA loop. Every existing HPA behavior
  (target-utilization math, behavior/stabilization windows) still
  applies unchanged.
```

## Key Fields — Easy to Confuse

```
idleReplicaCount  — replica count during TRUE IDLE (usually 0)
minReplicaCount   — floor MAINTAINED ONCE ACTIVE (not during idle)
Without idleReplicaCount set BELOW minReplicaCount, scale-to-zero
  NEVER HAPPENS even if minReplicaCount looks low.

activationLagThreshold — minimum before scaling FROM ZERO — prevents
  thrashing (distinct from lagThreshold, the ongoing scaling trigger)
```

## HPA Behavior Tuning

```
Asymmetric pattern (deliberate, not an oversight):
  scaleUp:   stabilizationWindowSeconds: 0    (fast — minimize spike latency)
  scaleDown: stabilizationWindowSeconds: 300  (cautious — avoid premature shed)
```

## TriggerAuthentication

```
secretTargetRef — Kubernetes Secret-based credentials
OR cloud-native identity (IRSA/Workload Identity/Managed Identity) —
  NO static secret needed at all for cloud-managed message services
ScaledObject references auth SEPARATELY via authenticationRef — never
  embed credentials directly in the ScaledObject
```

## KEDA HTTP Add-on

```
Problem: a scaled-to-zero HTTP service has NOTHING to route the FIRST
  request to — core scalers (Kafka/RabbitMQ/cron) don't solve this
Solution: interceptor proxy QUEUES the request while triggering
  scale-up, then forwards once a pod is ready
```

## Advanced — Custom External Scaler (gRPC contract)

```
Three required methods: IsActive, GetMetricSpec, GetMetrics
Use case: ANY bespoke internal system with no built-in KEDA scaler
  (an internal job-tracking DB is a realistic example)
```

## Troubleshooting Quick Reference

```
READY: False           -> check ScaledObject status conditions first
Scaling rate limits    -> tune advanced.horizontalPodAutoscalerConfig.behavior
Cold-start latency      -> minReplicaCount > 0 for latency-sensitive services
Cron timezone bugs       -> ALWAYS set timezone explicitly, defaults to UTC
HPA conflicts             -> a workload should have ONE HPA source, not both
                             manual HPA and KEDA-managed HPA simultaneously
```
