# Prometheus + Grafana — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Model

```
PULL model — Prometheus scrapes targets on a schedule (NOT push)
Time series = metric name + labels + timestamp + value
Four metric types:
  Counter    — ALWAYS increases (request count) — use rate(), NEVER
               raw counter values directly
  Gauge      — up/down (memory usage, current connections)
  Histogram  — distribution via buckets (response time)
  Summary    — pre-computed quantiles (P99 latency)
```

## Cardinality — the Core Performance Constraint

```
Labels add DIMENSIONS but high cardinality (millions of label combos)
  KILLS Prometheus performance — this is the single most important
  operational constraint to internalize.
Danger labels: user_id, request_id, raw IP, full URL w/ query params
  — unbounded values, belong in LOGS (Loki), not metric labels
```

## PromQL Essentials

```
rate(x[5m])              — per-second rate of a COUNTER over a window
                            (ALWAYS use on counters, never raw values)
histogram_quantile(0.99,
  sum(rate(x_bucket[5m])) by (le, label))
                             — P99 from histogram buckets — MUST keep
                             "le" in the by() clause or quantile breaks
sum(x) by (label)              — aggregation, split by meaningful dimension
absent(up{job="x"})              — fires if a metric is MISSING entirely
                                    (distinct from a zero VALUE)
```

## Recording Rules

```
Pre-compute EXPENSIVE queries so dashboards load fast — a dashboard
  panel querying a raw, complex PromQL expression on every load is
  slow at scale; a recording rule computes it on a schedule and the
  dashboard just reads the pre-computed result.
```

## Golden Signals

```
Latency    — histogram_quantile(0.95, rate(duration_bucket[5m]))
Traffic     — sum(rate(http_requests_total[5m])) by (method, route)
Errors       — sum(rate(..._total{status=~"5.."}[5m])) / sum(rate(..._total[5m]))
Saturation    — 100 - (avg(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```

## Service Discovery

```
kubernetes_sd_configs — auto-discovers scrape targets from the K8s
  API (pods, services) rather than a static, manually-maintained list
relabel_configs — transforms discovered target metadata BEFORE
  scraping (filter which pods get scraped, rewrite labels)
```

## Terminology Cross-Reference

```
Prometheus term    | Datadog equivalent
----------------------|--------------------------------
PromQL                  | Datadog query syntax
Recording rule            | (no direct equivalent — Datadog manages
                            aggregation server-side)
PrometheusRule (alert)      | Datadog Monitor
Scrape target                 | Agent-collected host/integration
```
