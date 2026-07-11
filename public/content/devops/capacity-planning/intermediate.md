# Capacity Planning — Intermediate

## Forecasting demand: beyond "add 10% because that's what we usually do"

Ad hoc forecasting ("growth has been roughly linear, add a buffer") works until it doesn't — the more reliable approach combines a few distinct forecasting inputs rather than one gut-feel number:

- **Historical trend** — actual measured growth rate over the past several months, ideally with enough history to separate real trend from short-term noise
- **Seasonal decomposition** — separating a genuine underlying trend from recurring seasonal patterns (an e-commerce platform's Diwali/Black Friday spike is seasonal, not trend growth, and needs to be planned for as a distinct, larger event rather than folded into a smoothed average)
- **Known planned events** — a marketing campaign, a product launch, a migration bringing new traffic — these are known in advance and should be forecast explicitly, not left to be caught by autoscaling reacting after the fact
- **Leading indicators from the business side** — signups, active-user growth, feature adoption — these often predict infrastructure demand growth before the infrastructure metrics themselves show it, giving genuine lead time to provision ahead rather than reactively

```python
# A simple seasonal-trend decomposition — separates trend from repeating seasonal pattern
from statsmodels.tsa.seasonal import seasonal_decompose

result = seasonal_decompose(traffic_series, model='additive', period=7)  # weekly seasonality
trend = result.trend
seasonal = result.seasonal
```
The practical value of decomposition specifically: it stops a real seasonal spike (predictable, recurring) from being mistaken for permanent trend growth (which would lead to permanently over-provisioning based on a one-time event), and equally stops a genuine trend shift from being dismissed as "just seasonal noise."

## Autoscaling policy tuning: the tradeoffs that actually matter

An autoscaler configured naively (scale out aggressively, scale in slowly, or vice versa) either wastes money or risks capacity shortfalls — the actual tuning decisions worth understanding:

```yaml
# Kubernetes HPA — a tuned example, not just defaults
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: api-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: api
  minReplicas: 5
  maxReplicas: 50
  metrics:
    - type: Resource
      resource:
        name: cpu
        target: { type: Utilization, averageUtilization: 65 }
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 0     # react fast — a load spike shouldn't wait
      policies: [{ type: Percent, value: 100, periodSeconds: 60 }]
    scaleDown:
      stabilizationWindowSeconds: 300   # wait 5 min before scaling in — avoid thrashing
      policies: [{ type: Percent, value: 20, periodSeconds: 60 }]
```
The asymmetry here is deliberate and worth understanding, not copying blindly: scaling **up** fast avoids an SLO breach during a real spike, while scaling **down** slowly avoids "thrashing" — scaling in too eagerly the moment load dips slightly, then having to scale back out again minutes later, which wastes the exact reaction-time margin that headroom exists to provide.

## Queue-depth-based scaling: when CPU/memory isn't the right signal

For services processing work from a queue (background jobs, event consumers), CPU/memory utilization can be a genuinely misleading scaling signal — a worker can be at low CPU while a queue backs up simply because there aren't enough workers running, or work items are slow for reasons unrelated to CPU (waiting on an external API, for instance). Scaling on **queue depth relative to consumption rate** directly targets the actual problem:

```yaml
# KEDA ScaledObject — scale based on queue depth, not CPU
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: worker-scaler
spec:
  scaleTargetRef:
    name: queue-worker
  minReplicaCount: 2
  maxReplicaCount: 30
  triggers:
    - type: aws-sqs-queue
      metadata:
        queueURL: https://sqs.us-east-1.amazonaws.com/xxx/jobs
        queueLength: "50"   # target: 50 messages per worker before scaling further
```
This is a fundamentally different capacity signal from the CPU/memory thresholds covered on the Fundamentals tab — worth recognizing as a distinct pattern rather than trying to force queue-based workloads into a CPU-threshold model that doesn't actually reflect their real bottleneck.

## Planning for a known high-traffic event, step by step

Forecasting for an unplanned, organic growth trend is fundamentally different from planning for a specific known event (a product launch, a marketing campaign, a sale). The event case is actually the easier one to plan well, because the traffic pattern and timing are largely known in advance:

1. Forecast expected peak traffic for the event specifically, using the best available signal — historical data from a comparable past event, or marketing's own reach/conversion estimates if there's no direct precedent
2. Run a dedicated load test at that forecast peak, plus the standard safety margin, well before the event — not the week of
3. Pre-scale ahead of the event rather than relying solely on reactive autoscaling — a launch-day traffic ramp can be far faster than an autoscaler's normal reaction time was tuned for
4. Have an explicit rollback or circuit-breaker plan for the case where actual traffic exceeds even the forecast-plus-margin — a feature flag to degrade gracefully (disable a non-critical, expensive feature) is often more valuable in the moment than any amount of additional pre-provisioning
