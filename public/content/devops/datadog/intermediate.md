# Datadog — Intermediate

## Datadog Query Language vs. PromQL — same concepts, different syntax

```
# Datadog query
avg:http.requests{env:production} by {service}.rollup(sum, 300)

# PromQL equivalent concept
sum(rate(http_requests_total{env="production"}[5m])) by (service)
```
Both express the same underlying idea (aggregate a rate/average, grouped by a dimension, over a time window) — the syntax differs, but the mental model of "aggregation function, metric, tag filter, group-by" transfers directly between them. If you already know PromQL, Datadog's query builder is a syntax translation, not a new conceptual model to learn from scratch.

## Monitors: Datadog's equivalent of Alertmanager

A Datadog **Monitor** combines what Prometheus splits across an alerting rule (in Prometheus itself) and routing/notification config (in Alertmanager) into one resource — a query, a threshold, and notification targets, defined together. This is a real, practical simplification: no separate alerting-rules-file plus separate Alertmanager routing-config to keep in sync, at the cost of Datadog managing that reconciliation logic for you rather than it being visible/configurable the way Alertmanager's routing tree is.

## SLO tracking: built-in, without hand-written recording rules

```
# Datadog SLO definition (conceptual — configured via UI or API)
Target: 99.9% of requests succeed over a rolling 30-day window
Based on: sum:http.requests{status:2xx} / sum:http.requests{*}
```
Where a Prometheus-based SLO setup typically needs hand-written recording rules and careful multi-window burn-rate alerting configured manually, Datadog's SLO feature provides this as a first-class object — define the target and the underlying good/total query, and error-budget tracking, burn-rate alerting, and historical SLO-compliance views come built in. The real tradeoff: less customization flexibility than a hand-rolled Prometheus SLO setup, in exchange for meaningfully less setup and maintenance overhead.

## APM: automatic instrumentation, and what it actually gives you

```yaml
# Enabling APM via the Datadog Agent, typically as a sidecar or agent-injected library
DD_APM_ENABLED: "true"
DD_ENV: production
DD_SERVICE: payment-api
```
Datadog's APM auto-instruments common frameworks/libraries without requiring manual code changes for basic distributed tracing — a request's full path across multiple services becomes visible as one connected trace, showing exactly where time was spent across service boundaries. This is genuinely valuable for diagnosing latency in a microservices architecture where the actual bottleneck service isn't obvious from any single service's own logs/metrics — the trace shows the full call chain and where it slowed down, directly.

## Watchdog: AI-driven anomaly detection, and its real limitation

Watchdog automatically surfaces anomalies (unusual error rate spikes, latency deviations) without requiring you to manually configure alert thresholds for every metric — genuinely useful for catching issues you hadn't specifically thought to alert on. The real limitation worth knowing: automatic anomaly detection is a complement to explicit, deliberately-configured Monitors on your genuinely critical metrics, not a replacement for them — Watchdog can miss domain-specific anomalies that don't look statistically unusual in isolation but are meaningful given business context Watchdog has no visibility into (a specific metric combination that only matters together, for instance).

## The real cost consideration at scale

Datadog's per-host, per-custom-metric pricing model means cost scales directly with infrastructure size and metric cardinality — a genuinely important operational consideration once evaluating Datadog against a self-hosted Prometheus+Grafana+ELK stack (see this site's Prometheus and ELK content for the self-hosted alternative). The tradeoff is explicit: Datadog trades ongoing, scaling cost for zero infrastructure to operate yourself; self-hosted observability trades lower marginal cost at scale for real, ongoing operational burden (running and scaling Prometheus/Elasticsearch clusters yourself). Neither is universally correct — the right choice depends on whether your team's actual scarce resource is engineering time or budget.
