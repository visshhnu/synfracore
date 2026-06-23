# Loki Certification Guide

## Certifications Available

Loki is tested within the **Grafana Associate** certification and emerging LGTM stack courses.

| Path | Coverage | Provider |
|------|----------|----------|
| **Grafana Associate** | Loki + LogQL + Grafana Logs | Grafana Labs |
| Grafana for Beginners | Loki fundamentals | Grafana (free) |
| LG(T)M Stack courses | Full observability stack | Multiple platforms |

---

## Loki Architecture

```
Log Sources (Apps, K8s pods, servers)
    ↓ (via Promtail / Alloy / Fluentd / Logstash)
Distributor → validates, fans out
    ↓
Ingester → writes to memory (WAL) then object storage
    ↓
Object Storage (S3/GCS/Azure Blob) — chunks
Index Storage (DynamoDB/BoltDB/filesystem) — label index

Query path:
Query Frontend → Querier → reads from Ingester (recent) + Object Storage (historical)
```

---

## LogQL — The Core Skill

```logql
# ─── LOG STREAM SELECTORS ──────────────────────────────────────────────
{app="nginx"}                              # All nginx logs
{app="nginx", namespace="production"}      # Multiple labels
{app=~"nginx|apache"}                      # Regex OR
{app!="debug"}                             # Not equal
{app=~".+"}                                # All streams (AVOID in production)

# ─── LOG FILTER EXPRESSIONS ────────────────────────────────────────────
{app="nginx"} |= "error"                   # Contains "error"
{app="nginx"} != "health"                  # Does NOT contain "health"
{app="nginx"} |~ "error|warn"              # Regex match
{app="nginx"} !~ "GET /health"             # Regex NOT match

# ─── PARSER EXPRESSIONS ────────────────────────────────────────────────
{app="nginx"} | json                       # Parse JSON log
{app="nginx"} | logfmt                     # Parse logfmt (key=value)
{app="nginx"} | pattern `<ip> - - [<_>] "<method> <path> HTTP/<_>" <status> <_>`

# After parsing: filter on extracted fields
{app="nginx"} | json | status >= 500
{app="api"} | logfmt | level="error"

# ─── METRIC QUERIES ────────────────────────────────────────────────────
rate({app="nginx"}[5m])                    # Log lines per second
count_over_time({app="nginx"}[5m])         # Total lines in 5m
sum(rate({app="nginx"}[5m])) by (namespace)  # Rate per namespace

# Error rate
sum(rate({app="api"} |= "error" [5m])) /
sum(rate({app="api"}[5m]))

# Log volume by pod
sum by (pod) (count_over_time({namespace="production"}[5m]))

# Latency from structured logs
{app="api"} | json | latency_ms > 500      # Slow requests
quantile_over_time(0.99, {app="api"} | json | unwrap latency_ms [5m])  # p99
```

---

## Promtail Configuration

```yaml
# /etc/promtail/config.yaml
server:
  http_listen_port: 9080

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push
    tenant_id: my-team                     # Multi-tenancy

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
          level:                           # Promote JSON field to label
      - drop:
          expression: '.*health.*'         # Drop healthcheck logs
          source: msg
```

---

## Critical Label Design Rules

```
GOOD LABELS (low cardinality — <100 unique values):
  app, namespace, environment, level, pod_name (bounded set)

BAD LABELS (high cardinality — avoid!):
  trace_id, user_id, request_id, timestamp, IP address
  → Creates too many streams → OOM → performance collapse

RULE OF THUMB: if a label has thousands of unique values, DON'T label it.
  Instead: parse at query time using | json or | logfmt
```

## Revision Notes
```
LOKI: "Prometheus but for logs". Pull labels from log metadata.
Stores compressed log chunks in object storage. Index = only labels.

LOGQL:
  Stream selector {label="value"} — always required
  Log filter |= "text" / != / |~ regex / !~ regex
  Parser | json / | logfmt / | pattern
  Metric: rate() / count_over_time() / quantile_over_time()

LABEL CARDINALITY: #1 operational issue. Keep labels LOW cardinality.
  High cardinality → too many streams → OOM → cluster down

RETENTION: configure in Loki config, enforced by compactor
TABLE MANAGER vs COMPACTOR: older/newer retention implementation

MULTI-TENANCY: X-Scope-OrgID header or tenant_id in Promtail config
GRAFANA: add Loki datasource → Explore → label browse or LogQL
```
