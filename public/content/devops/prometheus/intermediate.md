# Prometheus + Grafana — Intermediate

## Diagnosing an alert that fired but the dashboard looks normal

This is one of the most common real Prometheus/Grafana confusions, and it has a small, specific set of likely causes worth checking in order: **time range mismatch** (the dashboard's default view is showing the last hour, but the alert fired on a spike that's now outside that window — widen the range first before assuming anything's actually wrong); **missing `for` duration** (an alert with no `for` clause fires on a single data point and can resolve just as fast, leaving no visible sustained spike in the dashboard); **an active silence** in Alertmanager (someone silenced it mid-investigation — check Alertmanager's own UI, not just Grafana); **label mismatch** (the alert is scoped to `namespace=production` but the dashboard panel aggregates across all namespaces, hiding a real production-specific spike within a diluted overall average); or **recording rule lag** (if the alert reads from a recording rule, there's an evaluation-interval delay between the underlying data and what the rule reflects).

## High cardinality: the failure mode that quietly kills Prometheus

Every unique combination of label values creates a separate time series — this is the entire mechanism, and it's also the entire risk. A label like `user_id`, `request_id`, or a raw URL path with query parameters has effectively unbounded cardinality, and adding one as a metric label can produce millions of distinct series from what looked like one metric definition:

```bash
# Diagnose: Prometheus UI → Status → TSDB Status
# shows top series by metric name and by label name — the label with
# the most unique values is almost always the actual culprit
```

Fixes, roughly in order of how fast they help: increase memory / reduce retention as an immediate stopgap; drop the specific high-cardinality label via `metric_relabel_configs` in the scrape config as the actual fix; and, longer-term, review what labels application code is emitting on custom metrics before they ship, since this is much cheaper to catch in code review than after it's already caused a real production memory incident.

## `rate()` vs. raw counter values — a foundational PromQL distinction

```promql
# WRONG for dashboards/alerts — a raw, ever-increasing counter is not directly meaningful
http_requests_total

# CORRECT — per-second rate over a time window
rate(http_requests_total[5m])
```
A Counter metric only ever increases (or resets to zero on a process restart) — its raw value tells you a cumulative total, not a *rate*, which is almost always what you actually care about (requests per second, error rate). `rate()` computes the per-second average rate of increase over the given window, correctly handling counter resets from restarts along the way — using the raw counter value directly in a dashboard or alert threshold is a common, real beginner mistake that produces numbers with no useful interpretation.

## `histogram_quantile()`: computing percentile latency correctly

```promql
histogram_quantile(0.99,
  sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service)
)
```
Prometheus Histograms store pre-defined latency *buckets* (a count of requests falling under each threshold), not raw individual observations — `histogram_quantile()` estimates a percentile (P99 here) from that bucketed data. The `by (le, service)` grouping matters specifically: `le` (less-than-or-equal, the bucket boundary label) must be preserved in the aggregation for `histogram_quantile()` to work correctly at all — dropping it produces either an error or a meaningless result, a genuinely common mistake when writing this query from memory.

## Recording rules: pre-computing expensive queries

```yaml
groups:
- name: recording_rules
  rules:
  - record: job:http_requests:rate5m
    expr: sum(rate(http_requests_total[5m])) by (job)
```
A dashboard that re-runs a genuinely expensive aggregation query (across many series, a long time range) on every single page load or refresh is slow and puts real, repeated load on Prometheus. A recording rule computes that same query on a defined schedule and stores the result as a new, cheap-to-query metric — dashboards then query the pre-computed result directly, dramatically faster and lighter on Prometheus itself, at the cost of a small, defined evaluation-interval lag versus querying live.

## Service discovery for dynamic environments

```yaml
scrape_configs:
- job_name: kubernetes-pods
  kubernetes_sd_configs: [{ role: pod }]
  relabel_configs:
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
    action: keep
    regex: "true"
```
In a Kubernetes environment where pods are created and destroyed continuously, a static scrape target list goes stale within minutes. Kubernetes service discovery queries the API for current pods matching a filter (here, pods explicitly annotated `prometheus.io/scrape: "true"`) — Prometheus automatically starts/stops scraping targets as they actually appear and disappear, without any manual scrape-config editing per deployment.
