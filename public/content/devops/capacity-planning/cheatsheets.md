# Capacity Planning — Quick Reference

## k6 load testing — core commands

```bash
# Basic load test — fixed number of virtual users
k6 run --vus 500 --duration 10m load-test.js

# Ramping load — gradually increase VUs to find the breaking point (stress test)
k6 run --stage 2m:100,5m:500,5m:1000,2m:0 load-test.js

# Soak test — moderate sustained load over hours, catches slow leaks
k6 run --vus 200 --duration 4h load-test.js

# Output results to a file for later analysis
k6 run --out json=results.json load-test.js
```

## Scaling thresholds — starting reference

| Signal | Typical trigger | Action |
|---|---|---|
| CPU utilization | > 70% sustained for 5 min | Scale out |
| Memory utilization | > 80% sustained | Scale out, or investigate a leak |
| Queue depth | Growing faster than consumption rate | Add consumers/workers |
| P99 latency | Approaching SLO threshold | Immediate scale + investigate |

## Test type reference

| Test | Purpose | Duration |
|---|---|---|
| Load test | Confirm system holds at expected peak | Minutes |
| Stress test | Find the actual breaking point, beyond expected peak | Minutes to an hour |
| Soak test | Catch memory leaks / slow degradation | Hours to days |

## Kubernetes HPA — quick commands

```bash
# View current HPA status and target utilization
kubectl get hpa

# Describe an HPA — shows recent scaling events and why they triggered
kubectl describe hpa api-hpa

# Manually override replica count temporarily (bypasses HPA until it reconciles)
kubectl scale deployment api --replicas=20
```

## Headroom sizing — rough formula

```
Required capacity = Forecast peak × (1 + safety margin)

Typical safety margin: 20-40%
  - Lower end (20%): predictable traffic, fast/reliable autoscaling
  - Higher end (40%+): spiky/unpredictable traffic, slow autoscaling reaction

Multi-region failover headroom (if applicable):
  Region capacity ≥ own steady-state peak + failover share of a failed region's peak
```

## Forecasting inputs checklist

```
[ ] Historical growth trend (enough history to separate trend from noise)
[ ] Seasonal patterns (identified and decomposed, not folded into trend)
[ ] Known planned events (launches, campaigns) forecast explicitly
[ ] Business-side leading indicators (signups, active users) cross-checked
[ ] Peak — not average — utilization used as the baseline
```

## Pre-event capacity checklist (launch, sale, campaign)

```
[ ] Forecast expected peak using the best available comparable data
[ ] Dedicated load test run at forecast peak + margin, well before the event
[ ] Pre-scaled ahead of the event, not relying solely on reactive autoscaling
[ ] Rollback / circuit-breaker / graceful-degradation plan defined for
    the case where actual traffic exceeds forecast + margin
```
