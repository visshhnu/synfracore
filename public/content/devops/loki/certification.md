# Loki — Certification

## Certification paths

Loki doesn't have a dedicated standalone certification the way some tools do — it's covered within Grafana Labs' broader certification track, plus free standalone courses that focus on Loki specifically:

| Path | Coverage | Provider |
|---|---|---|
| Grafana Associate | Loki + LogQL + Grafana Logs | Grafana Labs |
| Grafana for Beginners | Loki fundamentals | Grafana Labs (free) |
| LGTM stack courses | Full observability stack (Loki, Grafana, Tempo, Mimir) | Multiple platforms |

For a resume-facing credential specifically about logging/observability skills, Grafana Associate is the one to target — it tests LogQL and Grafana Logs integration directly, not just Loki in isolation.

## Architecture — the full request path

Understanding the write path and read path separately is what the certification (and, more usefully, real debugging) actually tests:

```
Log Sources (Apps, K8s pods, servers)
    ↓ (via Promtail / Grafana Alloy / Fluentd / Logstash)
Distributor → validates incoming streams, fans out
    ↓
Ingester → writes to memory (with a write-ahead log for durability) then flushes to object storage
    ↓
Object Storage (S3/GCS/Azure Blob) — holds the compressed chunks
Index Storage (DynamoDB/BoltDB/filesystem, or TSDB) — holds the label index only

Query path:
Query Frontend → Querier → reads from the Ingester for recent data + Object Storage for historical data
```

The detail worth internalizing: a query for very recent logs (still in the Ingester's in-memory buffer) is fast because it never touches object storage at all, while a query reaching back further has to actually fetch and decompress chunks from S3/GCS — which is why time-range selection has such an outsized effect on query latency.

## LogQL — the core tested skill

LogQL is the single largest portion of any Loki-focused assessment. The four building blocks, composed together:

```logql
# ─── LOG STREAM SELECTORS (always required, always comes first) ───────
{app="nginx"}                              # All nginx logs
{app="nginx", namespace="production"}      # Multiple labels, AND'd together
{app=~"nginx|apache"}                      # Regex OR
{app!="debug"}                             # Not equal
{app=~".+"}                                # Matches all streams — avoid in production, scans everything

# ─── LOG FILTER EXPRESSIONS (applied after the selector) ──────────────
{app="nginx"} |= "error"                   # Contains "error"
{app="nginx"} != "health"                  # Does NOT contain "health"
{app="nginx"} |~ "error|warn"              # Regex match
{app="nginx"} !~ "GET /health"             # Regex NOT match

# ─── PARSER EXPRESSIONS (structure the line for further filtering) ────
{app="nginx"} | json                       # Parse JSON log
{app="nginx"} | logfmt                     # Parse logfmt (key=value)
{app="nginx"} | pattern `<ip> - - [<_>] "<method> <path> HTTP/<_>" <status> <_>`

# After parsing, filter on the extracted fields directly:
{app="nginx"} | json | status >= 500
{app="api"} | logfmt | level="error"

# ─── METRIC QUERIES (turn log lines into a time series) ───────────────
rate({app="nginx"}[5m])                       # Log lines per second
count_over_time({app="nginx"}[5m])            # Total lines in the 5m window
sum(rate({app="nginx"}[5m])) by (namespace)   # Rate broken down per namespace

# Error rate as a ratio
sum(rate({app="api"} |= "error" [5m])) /
sum(rate({app="api"}[5m]))

# Log volume by pod
sum by (pod) (count_over_time({namespace="production"}[5m]))

# Latency percentile from a numeric field inside structured logs
{app="api"} | json | latency_ms > 500                                  # Slow requests only
quantile_over_time(0.99, {app="api"} | json | unwrap latency_ms [5m])  # p99 latency
```

The `unwrap` keyword is the one piece people consistently forget — it's required whenever you're computing a numeric aggregate (percentile, sum, average) from a field's *value*, as opposed to just counting matching log lines.

## Promtail configuration reference

```yaml
# /etc/promtail/config.yaml
server:
  http_listen_port: 9080

positions:
  filename: /tmp/positions.yaml   # Tracks read offset per file so restarts don't re-ship old logs

clients:
  - url: http://loki:3100/loki/api/v1/push
    tenant_id: my-team            # Required if the target Loki has auth_enabled: true

scrape_configs:
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    relabel_configs:
      - source_labels: [__meta_kubernetes_pod_label_app]
        target_label: app
      - source_labels: [__meta_kubernetes_namespace]
        target_label: namespace
    pipeline_stages:
      - json:
          expressions:
            level: level
            msg: message
      - labels:
          level:                     # Promote the parsed JSON field to a queryable label
      - drop:
          expression: '.*health.*'   # Drop healthcheck noise before it's ever shipped
          source: msg
```

## Critical label design rules

This is the single most-tested operational concept, because getting it wrong is the most common way to actually break a Loki deployment in production, not just query it inefficiently:

```
GOOD LABELS (low cardinality — a bounded, small set of possible values):
  app, namespace, environment, level, pod_name

BAD LABELS (high cardinality — do not label these, ever):
  trace_id, user_id, request_id, timestamp, client IP address
  → Each unique value creates a separate log stream
  → Millions of streams → Ingester memory exhaustion → OOM → cluster-wide outage

RULE OF THUMB: if a field could plausibly have thousands (or more) of unique values,
it does not belong as a label. Parse it out of the log line at query time instead,
using `| json` or `| logfmt` — this keeps the label index small and bounded while
the field is still fully queryable, just via content parsing rather than the index.
```

## Quick reference

```
LOKI: label-indexed log aggregation ("Prometheus, but for logs").
Index = labels only. Log content = compressed chunks in object storage.

LOGQL:
  Stream selector {label="value"} — always required, always first
  Log filter |= "text" / != / |~ regex / !~ regex
  Parser | json / | logfmt / | pattern
  Metric functions: rate() / count_over_time() / quantile_over_time() (needs unwrap)

LABEL CARDINALITY: the #1 operational failure mode.
  High-cardinality labels → too many streams → Ingester OOM → cluster down.

RETENTION: configured in limits_config, enforced by the Compactor.
  (Older deployments may reference a Table Manager — Compactor is the current mechanism.)

MULTI-TENANCY: X-Scope-OrgID header, or tenant_id in the Promtail client config.

GRAFANA: add Loki as a data source → Explore tab → browse labels or write LogQL directly.
```
