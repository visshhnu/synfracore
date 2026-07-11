# Capacity Planning — Fundamentals

## Measuring current utilization correctly, before forecasting anything

Forecasting future capacity needs is meaningless if the baseline it's built on is wrong — and the most common baseline mistake is measuring average utilization instead of peak utilization. A service averaging 40% CPU across a day can still regularly spike to 85% during a specific hourly window, and average-based planning would miss that entirely:

```promql
# Peak, not average — the metric that actually matters for headroom
max_over_time(
  avg(rate(container_cpu_usage_seconds_total{pod=~"api-.*"}[5m]))[1d:]
)
```
Track per-service, per-resource utilization (CPU, memory, disk I/O, network throughput) specifically at your actual peak windows — for most consumer-facing services this means identifying the real daily/weekly peak (evening hours, a specific weekday), not assuming peak is evenly distributed across the day.

## Running a first load test: confirming the system holds at expected peak

Before capacity planning can forecast anything credibly, you need a real, measured data point for how the system behaves under load — not an assumption:

```bash
# k6 — simulate 500 concurrent virtual users for 10 minutes
k6 run --vus 500 --duration 10m load-test.js
```
```javascript
// load-test.js — minimal k6 script
import http from 'k6/http';
import { sleep, check } from 'k6';

export default function () {
  const res = http.get('https://staging.example.com/api/products');
  check(res, { 'status is 200': (r) => r.status === 200 });
  sleep(1);
}
```
The number to design against isn't "does it work" — it's the specific point where a measured metric (P99 latency, error rate) crosses an unacceptable threshold as load increases. Running the same test at increasing VU counts (100, 250, 500, 1000) until something breaks gives you an actual, measured capacity ceiling to plan headroom against, rather than a guess.

## The three test types, and when each one is the right one to run

- **Load testing** — simulate expected peak traffic, confirm the system holds within SLO at that specific load; this is the test that validates "we have enough capacity for what we actually expect"
- **Stress testing** — push well beyond expected peak deliberately, to find the actual breaking point; this answers "how much headroom do we really have before things fail," which is different from and more useful than just confirming expected peak is fine
- **Soak testing** — sustained moderate load over hours, not minutes; this is specifically what catches memory leaks and slow resource degradation that a short load test would never reveal, since a 10-minute test simply doesn't run long enough for a slow leak to become visible

Skipping soak testing is a common gap — many teams run load and stress tests but never a multi-hour sustained test, and then discover a memory leak in production days after a deploy that a 10-minute load test had no chance of catching.

## Basic scaling thresholds: a starting point, not a fixed rule

| Signal | Typical trigger | Action |
|---|---|---|
| CPU utilization | > 70% sustained for 5 min | Scale out (add instances) |
| Memory utilization | > 80% sustained | Scale out, or investigate a possible leak first |
| Queue depth | Growing faster than consumption rate | Add consumers/workers |
| P99 latency | Approaching or breaching the SLO threshold | Immediate scale + investigate root cause |

These thresholds are a reasonable starting point, not a universal constant — a service with genuinely spiky, unpredictable traffic needs a lower CPU trigger and faster scale-out reaction time than a service with smooth, predictable load, since the margin between "triggering a scale event" and "actually running out of capacity" needs to account for how fast demand can realistically grow within your autoscaler's actual reaction time.

## Headroom: sizing above peak, not just at peak

Provisioning to exactly match measured peak load leaves zero margin for normal variance, a slightly-larger-than-forecast event, or the time an autoscaler actually takes to react — the standard practice is sizing for peak load **plus** a safety margin, commonly 20-40%, with the higher end reserved for services with genuinely unpredictable or rapidly-growing traffic. This margin isn't padding for its own sake — it's specifically buying reaction time: if a scale-out takes 3 minutes to bring new capacity online, headroom is what absorbs the load during those 3 minutes without breaching SLO.
