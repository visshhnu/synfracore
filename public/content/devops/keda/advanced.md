# KEDA — Advanced

## KEDA's Own Metrics-Server Internals

KEDA doesn't replace the Kubernetes Metrics Server — it registers itself as a **Kubernetes External Metrics API** provider (`keda-operator-metrics-apiserver`), which the standard HPA controller then queries the same way it would query any metrics source. Understanding this chain matters for diagnosing scaling behavior at a deeper level than Troubleshooting's symptom-level fixes:

```
HPA controller (standard Kubernetes component, unmodified)
  -> queries the External Metrics API
  -> KEDA's metrics-apiserver answers, translating the request
     into a poll against the actual trigger source (Kafka lag,
     queue depth, Prometheus query result, etc.)
  -> KEDA Operator evaluates the ScaledObject's trigger config
     and returns a computed metric value
  -> HPA controller scales based on that value, exactly as it
     would for CPU/memory metrics
```

The practical implication: KEDA never scales anything itself — it only ever supplies metric values into the standard HPA control loop. Every HPA behavior already understood (target-utilization math, `behavior` stabilization windows covered in Intermediate) still applies unchanged; KEDA's entire job is being a richer metric *source* than CPU/memory alone.

## Building a Custom External Scaler

For a trigger source with no built-in KEDA scaler, the **External Scaler** interface lets a custom gRPC service supply metric values, following the same contract KEDA's own built-in scalers use internally:

```protobuf
// Simplified from KEDA's externalscaler.proto contract
service ExternalScaler {
  rpc IsActive(ScaledObjectRef) returns (IsActiveResponse);
  rpc GetMetricSpec(ScaledObjectRef) returns (GetMetricSpecResponse);
  rpc GetMetrics(GetMetricsRequest) returns (GetMetricsResponse);
}
```

```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: custom-backend-scaler }
spec:
  triggers:
  - type: external
    metadata:
      scalerAddress: custom-scaler-svc.production:50051   # the custom gRPC service
      metricName: internal-queue-depth
```

This is the deliberate escape hatch for any bespoke or internal system (a proprietary message bus, an internal job-tracking database) that will never have an official KEDA scaler — implement the three-method gRPC contract, point a `ScaledObject` at it, and it participates in the same scaling pipeline as Kafka or RabbitMQ triggers.

## Multi-Cluster and Federation Patterns

KEDA itself has no built-in cross-cluster awareness — each cluster's KEDA installation only ever sees triggers and workloads local to that cluster. A genuine multi-cluster scaling strategy (e.g., "the aggregate queue depth across all regions should drive per-region scaling proportionally") has to be built on top of KEDA, not inside it — typically by having each region's `ScaledObject` query a trigger source that already reflects the global/aggregate state (a globally-visible queue metric, or a Prometheus federation setup aggregating metrics across clusters) rather than KEDA attempting cross-cluster coordination directly:

```yaml
spec:
  triggers:
  - type: prometheus
    metadata:
      serverAddress: http://prometheus-federation.company.com:9090
      # This query already reflects a globally-federated metric,
      # not a per-cluster-local one — the federation/aggregation
      # work happens at the Prometheus layer, not KEDA's
      query: sum(global_pending_jobs{service="payment-processor"})
      threshold: "100"
```

The key conceptual point worth being precise about: "multi-cluster KEDA" isn't a KEDA feature — it's a pattern of feeding KEDA an already-global metric per cluster, letting each cluster's independent HPA loop scale based on shared visibility into global state.

## KEDA Operator High Availability

The KEDA Operator itself (the controller reconciling `ScaledObject`/`ScaledJob` resources) needs to be highly available in a genuinely production-critical deployment — a single-replica Operator going down doesn't stop already-running scaled workloads immediately, but it does stop *new* scaling decisions from being evaluated until it recovers:

```yaml
# values.yaml — Helm install with HA operator
operator:
  replicaCount: 2
```

KEDA's Operator uses Kubernetes' standard leader-election mechanism (via a `Lease` object) for this — with `replicaCount: 2`, only one replica is actively reconciling at a time (the leader), while the second stands by ready to take over immediately if the leader's lease isn't renewed, rather than both replicas reconciling simultaneously and risking conflicting scaling decisions.

## CRD Versioning and Upgrade Migration

KEDA's CRDs (`ScaledObject`, `ScaledJob`, `TriggerAuthentication`) have gone through API version changes across major KEDA releases (e.g., `v1alpha1` fields being deprecated or restructured between major versions) — upgrading KEDA itself without checking CRD compatibility is a real, avoidable source of production breakage:

```bash
# Before upgrading KEDA itself, check the target version's changelog
# for CRD/breaking-change notes, and validate existing ScaledObjects
# against the new CRD schema in a non-production cluster first
kubectl get scaledobjects -A -o yaml > pre-upgrade-scaledobjects-backup.yaml

helm upgrade keda kedacore/keda -n keda --version <target-version>

# Confirm every existing ScaledObject is still successfully reconciling
# post-upgrade — a schema change can leave an old-format resource
# silently un-reconciled rather than erroring loudly
kubectl get scaledobjects -A -o custom-columns=NAME:.metadata.name,READY:.status.conditions[?\(@.type==\"Ready\"\)].status
```

The backup-and-verify step matters specifically because a CRD schema change doesn't necessarily reject an old-format resource outright — it can instead leave it in a state the new Operator version simply doesn't reconcile correctly, which looks identical to the Troubleshooting scenario's silent scaling failure but has a completely different root cause (an incompatible resource format, not a misconfigured trigger).
