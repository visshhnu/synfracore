# Capacity Planning

## How This Differs From SLOs

SLOs (Service Level Objectives) define your *reliability target*. Capacity planning is the separate discipline of making sure you have enough infrastructure — compute, storage, network — to actually **hit** that target under real and projected load. An SRE needs both, but they answer different questions: "what reliability do we promise?" vs "do we have enough headroom to deliver it?"

## The Core Capacity Planning Loop

1. **Measure current utilization** — CPU, memory, disk I/O, network throughput per service, at peak and average.
2. **Forecast demand** — using historical growth trends, planned feature launches, and seasonal patterns (e.g. e-commerce Diwali/Black Friday spikes).
3. **Determine headroom needed** — typically size for peak load + a safety margin (commonly 20–40%, higher for unpredictable traffic).
4. **Provision or set autoscaling policy** — either pre-provision capacity or configure autoscaling to react within an acceptable time window.
5. **Re-measure after changes** — capacity planning is continuous, not a one-time exercise.

## Load Testing

You can't plan capacity you haven't tested. Common approaches:
- **Load testing** — simulate expected peak traffic to confirm the system holds up.
- **Stress testing** — push well beyond expected peak to find the actual breaking point.
- **Soak testing** — sustained moderate load over hours/days to catch memory leaks and slow degradation.

```bash
# Example: simple load test with k6
k6 run --vus 500 --duration 10m load-test.js
```

## Scaling Thresholds

| Signal | Typical trigger | Action |
|---|---|---|
| CPU utilization | > 70% sustained for 5 min | Scale out (add instances) |
| Memory utilization | > 80% sustained | Scale out or investigate leak |
| Queue depth | Growing faster than consumption rate | Add consumers / scale workers |
| P99 latency | Breaching SLO threshold | Immediate scale + investigate |

## Cost-Aware Headroom

Over-provisioning "just to be safe" is a real cost — capacity planning at senior level is about finding the **minimum headroom that reliably meets demand**, not maximum headroom. This is where capacity planning and FinOps/cost optimization directly intersect.

## Forecasting for Planned Events

Before a known high-traffic event (product launch, sale, marketing campaign), capacity planning becomes proactive: pre-scale ahead of the event, run a dedicated load test at expected peak + margin, and have a rollback/circuit-breaker plan if actual traffic exceeds the forecast.

:::info Relationship to SLOs
An SLO tells you *when* you're in trouble (error budget burning). Capacity planning is what you do *before* that happens — provisioning ahead of demand so the error budget never has to be spent on a preventable capacity shortfall.
:::
