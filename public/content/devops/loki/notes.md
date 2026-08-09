# Loki + OpenTelemetry — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Architecture

```
LOKI: indexes only LABELS (like Prometheus), not full log content —
  this is what makes it much cheaper than ELK at high log volume.
LogQL is deliberately similar to PromQL in structure.
Promtail (or Grafana Agent/Alloy) — the log-shipping agent, roughly
  Filebeat's role in the ELK stack.
Loki is Grafana's NATIVE log backend — no separate UI needed.
```

## LogQL Reference

```
Stream selector (required):  {namespace="production", app="payment"}
Line filters:                |= "ERROR"   != "health"
Parsers:                     | json       | logfmt
Field filter after parse:    | json | status >= 500

Metrics from logs:
  sum(rate({app="payment"} |= "ERROR" [5m])) by (pod)
  sum by (status) (rate({app="nginx"} | logfmt | status =~ "5.." [5m]))

Advanced — unwrap for numeric fields already in structured logs:
  quantile_over_time(0.99, {app="api"} | json | unwrap duration [5m]) by (endpoint)
  — lets a service get a real p99 without ever having instrumented
  a dedicated metric, as long as duration is a structured log field
```

## Retention — the Two-Piece Gotcha (verified, real misconfiguration pattern)

```yaml
limits_config:
  retention_period: 30d        # by itself, does NOTHING

compactor:
  retention_enabled: true      # REQUIRED — this is what actually deletes data
```
**Critical:** `retention_period` alone silently retains everything forever. Both fields are required together — this is the single most common real Loki misconfiguration.

## Cardinality Safety Net

```
max_streams_per_user: 10000
— once a tenant hits this cap, NEW streams are REJECTED with an
  explicit error, rather than silently accepted into a slow-building
  Ingester memory crisis. A blunt but effective guard against a
  label-cardinality mistake.
```

## Chunk vs. Index Storage

```
Chunks  — the actual compressed log content
Index   — label-to-chunk mapping only (small, since only labels are indexed)
Label cardinality (NOT log volume alone) drives index size and cost —
  this is the direct consequence of "index only labels."
```

## Deployment Modes

```
loki-stack (bundled Helm chart) — Loki + Promtail + Grafana together,
  fastest path for evaluation/smaller deployments. NOT recommended for
  production scale — can't independently scale ingestion vs. query load.

Distributed/microservices mode — production scale, separately-scaled
  ingestion and query components.
```

## Alerting — Ruler

```
Loki's Ruler evaluates LogQL metric queries on a schedule, same
mechanism as Prometheus evaluating PromQL — catches problems that
were NEVER emitted as a metric, straight from raw log content.
```

## Terminology Cross-Reference

```
Loki term         | ELK equivalent
-------------------|----------------------------------
LogQL              | KQL / Lucene / DSL
Promtail            | Filebeat / Logstash (ingestion)
Label               | (no direct equivalent — ELK indexes full content)
Stream               | A specific label-combination's log series
Ruler                | Watcher / ElastAlert (log-based alerting)
```
