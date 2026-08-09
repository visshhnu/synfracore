# KEDA — Intermediate

## `TriggerAuthentication` — Credential Management in Depth

Overview's examples embedded connection details inline for simplicity; real deployments separate credentials into a dedicated `TriggerAuthentication` resource, referencing a Kubernetes Secret (or a cloud-native identity mechanism) rather than hardcoding anything in the `ScaledObject` itself:

```yaml
apiVersion: keda.sh/v1alpha1
kind: TriggerAuthentication
metadata: { name: kafka-trigger-auth, namespace: production }
spec:
  secretTargetRef:
  - parameter: sasl
    name: kafka-credentials
    key: sasl
  - parameter: password
    name: kafka-credentials
    key: password
---
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: payment-consumer-scaler }
spec:
  triggers:
  - type: kafka
    authenticationRef:
      name: kafka-trigger-auth   # ScaledObject references auth separately, doesn't embed credentials
    metadata:
      bootstrapServers: kafka.production:9092
      consumerGroup: payment-processor
      topic: payment-events
```

For cloud-managed message services, `TriggerAuthentication` can reference a pod identity mechanism (IRSA on AWS, Workload Identity on GKE, Managed Identity on Azure) instead of a static secret at all — the scaler authenticates using the same short-lived, credential-free identity mechanism the rest of a well-configured cluster already uses, rather than introducing a static secret specifically for KEDA's own polling.

## HPA `behavior` — Tuning the Scaling Rate Directly

Troubleshooting covered that KEDA drives scaling through a standard HPA with its own default rate limits; `advanced.horizontalPodAutoscalerConfig.behavior` is the direct lever for tuning that rate, rather than accepting the Kubernetes default stabilization windows:

```yaml
spec:
  advanced:
    horizontalPodAutoscalerConfig:
      behavior:
        scaleUp:
          stabilizationWindowSeconds: 0     # scale up immediately, no smoothing delay
          policies:
          - type: Percent
            value: 100                       # can double replica count per evaluation period
            periodSeconds: 15
        scaleDown:
          stabilizationWindowSeconds: 300     # wait 5 minutes of sustained low load before scaling down
          policies:
          - type: Pods
            value: 1
            periodSeconds: 60                 # remove at most 1 replica per minute
```

The asymmetry here is deliberate and common in real configurations — scaling up fast (minimize latency impact of a genuine spike) while scaling down cautiously (avoid prematurely removing capacity right before load returns) is a standard, sound default pattern, not an oversight.

## `idleReplicaCount` vs. `minReplicaCount`

These are easy to conflate but control different states. `minReplicaCount` is the floor the HPA maintains once active — the workload never goes below this while actively scaled. `idleReplicaCount` (when set below `minReplicaCount`, most commonly `0`) is specifically the replica count during genuinely idle periods, letting a workload scale all the way down when there's no work, then up to at least `minReplicaCount` the moment activation triggers:

```yaml
spec:
  idleReplicaCount: 0       # true zero when idle
  minReplicaCount: 3         # floor once actually active — not maintained during idle periods
  maxReplicaCount: 50
```

Without `idleReplicaCount` explicitly set below `minReplicaCount`, a `ScaledObject` simply never goes below `minReplicaCount` even when idle — this is the actual field controlling whether scale-to-zero happens at all, distinct from `minReplicaCount` alone.

## KEDA HTTP Add-on — Scale-to-Zero for Synchronous HTTP Services

The core KEDA scalers covered so far (Kafka, RabbitMQ, cron, Prometheus) work well for asynchronous, queue-driven workloads — but a synchronous HTTP service scaled to zero has a structural problem: an incoming HTTP request needs *something* running to receive it in the first place, and a scaled-to-zero Deployment has no pod to route to. The KEDA HTTP Add-on solves this with a lightweight interceptor proxy that queues/holds incoming requests while triggering scale-up, then forwards once a pod is ready:

```yaml
apiVersion: http.keda.sh/v1alpha1
kind: HTTPScaledObject
metadata: { name: internal-api-scaler }
spec:
  hosts: ["internal-api.company.com"]
  scaleTargetRef:
    name: internal-api
    service: internal-api-svc
    port: 8080
  replicas: { min: 0, max: 20 }
```

This is genuinely necessary infrastructure, not an edge case — without the interceptor proxy in front of a scale-to-zero HTTP service, the first request after an idle period would simply fail (nothing to route to) rather than triggering scale-up and then succeeding, which is the entire point of the add-on's existence.
