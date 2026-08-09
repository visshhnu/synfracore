# KEDA — FAQ

## Does KEDA replace the Kubernetes HPA, or is it something separate I run alongside it?

KEDA works alongside the standard, unmodified HPA controller — it registers as an External Metrics API provider, and HPA queries that API the same way it queries CPU/memory metrics. KEDA never scales anything directly itself; it only supplies richer metric values into the existing HPA control loop. Understanding this distinction matters, because it means all standard HPA behavior (including `behavior`/stabilization tuning) still applies exactly as it would without KEDA.

## Why is my `ScaledObject` with `minReplicaCount: 0` not actually scaling to zero?

Check whether `idleReplicaCount` is explicitly set — `minReplicaCount` alone sets the floor maintained once a workload is considered *active*, but doesn't control whether it can go below that during genuinely idle periods. `idleReplicaCount` (typically set to 0) is the actual field enabling true scale-to-zero; without it explicitly set below `minReplicaCount`, the workload never goes below `minReplicaCount` even when idle.

## Is KEDA only useful for scaling on message queues, or does it apply more broadly?

Message queue lag (Kafka, RabbitMQ, Azure Service Bus) is the most commonly cited use case, but KEDA supports a wide range of trigger types — cron schedules, Prometheus query results, and (via a custom External Scaler) genuinely any bespoke metric a team can expose through the gRPC scaler contract. Anywhere HPA's CPU/memory-only model misses the actual relevant scaling signal for a workload is a candidate for KEDA.

## Why would I want asymmetric scale-up/scale-down timing instead of the same speed for both?

Because the cost of being slow in each direction is different — scaling up slowly during a genuine spike risks real user-facing latency impact, while scaling down too quickly risks prematurely removing capacity right before load returns, causing repeated thrashing. Fast scale-up, cautious scale-down is a deliberate reflection of that asymmetric risk, not an arbitrary default.

## Does using a cloud-native identity (like IRSA) for `TriggerAuthentication` actually eliminate the need for any credentials?

It eliminates the need for a *static, long-lived* credential specifically — KEDA still authenticates, but using the same short-lived, automatically-rotated identity mechanism the rest of a well-configured cluster already relies on, rather than a Kubernetes Secret that needs to be manually created, stored, and eventually rotated. It's not "no authentication at all," it's authentication without a standing secret to manage and secure.

## Why can't KEDA's built-in scalers handle scale-to-zero for a regular HTTP API the same way they handle a queue consumer?

A queue-based workload scaled to zero has no immediate problem — messages simply wait in the queue until a consumer scales up. An HTTP request has nowhere to wait; if there's no pod running when a request arrives, there's nothing to route it to. The KEDA HTTP Add-on specifically solves this with an interceptor proxy that holds the incoming request while triggering scale-up, then forwards it — a mechanism the core scalers don't provide because they don't need to for queue-based workloads.

## Is building a custom External Scaler difficult, or is it reserved for advanced use cases only?

It requires implementing a specific three-method gRPC contract (`IsActive`, `GetMetricSpec`, `GetMetrics`), which is a genuinely moderate engineering effort, not a trivial one — this guide treats it as advanced-tier content for good reason. But it's the only path to KEDA-based scaling for a genuinely bespoke internal system with no built-in scaler, and once built, it participates in the exact same trigger evaluation pipeline as any built-in scaler type.

## What happens if two ScaledObjects are accidentally created targeting the same Deployment?

This creates a real, avoidable conflict — a workload should have exactly one source of HPA-driving scaling logic, whether that's a single ScaledObject or a manually-managed HPA, never both simultaneously or multiple ScaledObjects targeting the same workload. Multiple competing scaling configurations can produce unpredictable, conflicting scaling decisions, since each ScaledObject would create and attempt to manage its own HPA against the same underlying Deployment.
