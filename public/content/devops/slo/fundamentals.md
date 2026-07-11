# SLO & Error Budget — Fundamentals

## SLA, SLO, SLI — Core Concepts

These three terms are related but distinct — getting them confused in an interview signals you haven't worked at the architectural level.

| Term | What it is | Who sets it | Example |
|---|---|---|---|
| SLI — Indicator | The actual measured value | Engineering (what can we measure?) | 99.3% availability this month |
| SLO — Objective | Internal reliability target | Engineering + Product | Must maintain 99.9% availability |
| SLA — Agreement | External customer contract | Business + Legal | We guarantee 99.5% or give credits |

**Error budget** is the key insight: error budget = 100% − SLO — the amount of unreliability you're *allowed*. It transforms reliability from a vague aspiration into a quantitative resource teams manage consciously.

| SLO | Error Budget/month | Allowed downtime/month |
|---|---|---|
| 99% | 1% | 7.3 hours |
| 99.9% | 0.1% | 43 minutes |
| 99.95% | 0.05% | 21.9 minutes |
| 99.99% | 0.01% | 4.4 minutes |

```
Concrete example: an SLO of 99.9% availability gives 43 minutes of
allowed downtime per month. If 30 minutes have already been spent on
incidents this month, only 13 minutes of error budget remain — this
is the quantitative trigger for an error budget policy (see below)
to shift priority from new features to reliability work.
```

## Implementing SLOs in Prometheus

SLOs aren't just a concept — they're implemented in code. Recording rules calculate the SLI continuously, and alerts fire when the *burn rate* is too high, not only once the budget is already fully exhausted.

```yaml
# Recording rule — continuously compute the availability SLI
groups:
  - name: availability-slo
    rules:
      - record: sli:availability:ratio_rate5m
        expr: |
          sum(rate(http_requests_total{status!~"5.."}[5m]))
          /
          sum(rate(http_requests_total[5m]))

# Multi-window, multi-burn-rate alert — the Google SRE-recommended pattern:
# alert fast on a SEVERE burn rate over a SHORT window, and alert on a
# smaller but SUSTAINED burn rate over a LONGER window, to catch both
# a sudden severe outage and a slow, steady budget drain
  - name: burn-rate-alerts
    rules:
      - alert: ErrorBudgetBurnFast
        expr: |
          (1 - sli:availability:ratio_rate5m) > (14.4 * 0.001)  # 14.4x burn rate over 5m
        for: 2m
        labels: { severity: critical }
        annotations: { summary: "Burning error budget 14.4x normal rate — will exhaust in ~2 days" }
      - alert: ErrorBudgetBurnSlow
        expr: |
          (1 - sli:availability:ratio_rate5m) > (1 * 0.001)     # 1x burn rate, sustained
        for: 1h
        labels: { severity: warning }
        annotations: { summary: "Sustained elevated error rate — will exhaust budget within the month" }
```

## Latency SLOs

```yaml
# P99 latency SLO — track directly against a defined budget, not just
# an absolute threshold alert
- record: sli:latency:p99_5m
  expr: |
    histogram_quantile(0.99,
      sum(rate(http_request_duration_seconds_bucket[5m])) by (le))

- alert: LatencySLOBurnRate
  expr: sli:latency:p99_5m > 0.5   # SLO target: P99 under 500ms
  for: 10m
  labels: { severity: warning }
```
```
Grafana panel setup for a latency SLO dashboard:
  Panel 1: current P99 latency vs. the SLO threshold line
  Panel 2: error budget remaining this month (a single stat, %)
  Panel 3: burn rate over the last 24h (is it accelerating or stable?)
This three-panel layout answers "are we on track" at a glance,
rather than requiring someone to mentally compute budget status
from a raw latency time-series alone.
```

## Error Budget Policy

Without an error budget policy, reliability is a vague concern and feature pressure always wins. With one, reliability has a measurable, agreed-upon impact on feature delivery — teams automatically balance both, rather than relying on someone remembering to prioritize reliability work.

```
A concrete error budget policy, as an example:

Budget remaining > 50%:  ship features normally
Budget remaining 10-50%: new feature launches require a review;
                          reliability work gets equal priority
Budget remaining < 10%:  feature freeze — only reliability work
                          ships until the budget recovers
Budget fully exhausted:  postmortem required before ANY new
                          feature work resumes, regardless of
                          how urgent it seems
```
This policy converts a subjective "should we prioritize reliability" argument into an objective, pre-agreed trigger — nobody has to convince anyone in the moment, because the policy was agreed to before the pressure existed, which is exactly what makes it effective at actually changing behavior rather than being ignored under deadline pressure.

## Interview Questions

**Explain SLA, SLO, and SLI. Give a concrete example of each.**
SLI is the actual measurement — a number you can query directly from monitoring, like availability (percentage of successful HTTP requests in a time period), latency (P99 request duration), or error rate (percentage of 5xx responses). SLO is the internal reliability target the engineering team commits to maintaining, always set stricter than the SLA to leave a buffer — an availability SLO of 99.9% means the team alerts and acts if availability drops below that, which is 43 minutes of allowed downtime per month. SLA is the external customer contract with commercial consequences — an availability SLA of 99.5% means a customer experiencing more than roughly 3.6 hours of downtime in a month receives service credits. The key relationships: SLI is what you actually measure, SLO is what you internally aim for (with buffer above the SLA), and SLA is what you've externally promised — the gap between SLO and SLA is deliberate breathing room, so a single bad incident that breaches the internal SLO doesn't automatically mean a customer-facing SLA violation and financial penalty.
