# Loki — Kubernetes-Native Log Management

Grafana Loki is a horizontally scalable, highly available log aggregation system. Unlike ELK which indexes all log content, Loki only indexes labels (metadata) — making it dramatically cheaper while still providing fast log search.

## Loki vs ELK vs Datadog Logs

| | Loki | ELK Stack | Datadog Logs |
|--|--|--|--|
| **Indexing** | Labels only | Full text | Full text |
| **Storage cost** | Very low | High (10× more) | High (pay per GB) |
| **Query speed** | Fast for label queries | Fast (indexed) | Fast |
| **Setup complexity** | Simple | Complex | SaaS (zero setup) |
| **Kubernetes native** | Yes (Promtail DaemonSet) | Yes but more work | DaemonSet agent |
| **Integration** | Grafana | Kibana | Datadog UI |
| **Best for** | K8s, cost-conscious | Full text search, SIEM | Already using Datadog |

## Architecture

```
Kubernetes Pods generate logs
         │
    [Promtail]              ← DaemonSet on every node
    Reads container logs     Attaches Kubernetes labels
    from /var/log/           (namespace, pod, app, etc.)
         │
         ▼
      [Loki]               ← Stores log streams
    Indexes only labels      Compresses log content
    Stores in chunks         (S3, GCS, or local)
         │
         ▼
    [Grafana]              ← Query with LogQL
    Log Explorer panel       Dashboards and alerts
```

## Installation

```bash
# Install Loki stack with Helm
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Simple single-binary mode (dev/small deployments)
helm install loki grafana/loki \
  --namespace monitoring \
  --create-namespace \
  --set loki.auth_enabled=false \
  --set loki.commonConfig.replication_factor=1 \
  --set loki.storage.type=filesystem

# Production: distributed mode with S3
helm install loki grafana/loki \
  --namespace monitoring \
  --values loki-values.yaml
```

```yaml
# loki-values.yaml — production config
loki:
  auth_enabled: false
  commonConfig:
    replication_factor: 3
  storage:
    type: s3
    s3:
      region: us-east-1
      bucketnames: my-loki-logs
      insecure: false

# Retention
  limits_config:
    retention_period: 30d     # Keep logs 30 days
    ingestion_rate_mb: 16
    ingestion_burst_size_mb: 32

# Install Promtail to ship logs
helm install promtail grafana/promtail \
  --namespace monitoring \
  --set config.lokiAddress=http://loki:3100/loki/api/v1/push
```

## LogQL — Loki Query Language

LogQL has two query types: **Log queries** (return log lines) and **Metric queries** (return counts/rates from logs).

```logql
# ── Log queries ──

# Stream selector (always required)
{namespace="production"}                              # All logs from namespace
{namespace="production", app="myapp"}                # Specific app
{namespace=~"prod.*"}                                # Regex match
{namespace!="kube-system"}                           # Exclude namespace

# Filter operators
{app="myapp"} |= "error"                            # Contains "error"
{app="myapp"} != "debug"                            # Does NOT contain
{app="myapp"} |~ "error|warning"                   # Regex match
{app="myapp"} !~ "health|ready"                    # Regex NOT match

# Parse JSON logs
{app="myapp"} | json                                # Parse JSON
{app="myapp"} | json | level="error"               # Filter after parse
{app="myapp"} | json | status_code > 400           # Numeric filter

# Parse logfmt (key=value format)
{app="nginx"} | logfmt | method="POST"

# Pattern parsing
{app="nginx"} | pattern `<ip> - - [<_>] "<method> <path> <_>" <status> <size>`

# Line format (extract and reformat)
{app="myapp"} | json
  | line_format "{{.level}} {{.message}} ({{.request_id}})"

# ── Metric queries ──

# Count log lines over time
count_over_time({app="myapp"}[5m])

# Rate of logs per second
rate({app="myapp"}[5m])

# Count errors per second
rate({app="myapp"} |= "error"[5m])

# Error rate by service
sum by (app) (rate({namespace="production"} |= "error"[5m]))

# Top 10 error-producing pods
topk(10, sum by (pod) (count_over_time({namespace="production"} |= "ERROR"[1h])))

# Extract metric from log field (unwrap)
# Log line: method=POST duration_ms=234 status=200
sum by (method) (
  rate({app="nginx"} | logfmt | unwrap duration_ms [5m])
)
```

## Promtail Configuration

```yaml
# promtail-config.yaml
server:
  http_listen_port: 9080

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  # Kubernetes pod logs
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    pipeline_stages:
      # Parse JSON logs
      - json:
          expressions:
            level: level
            message: message
            timestamp: time
      # Set timestamp from log
      - timestamp:
          source: timestamp
          format: RFC3339
      # Add log level as label
      - labels:
          level:
      # Drop debug logs in production (save cost)
      - match:
          selector: '{namespace="production"}'
          stages:
          - drop:
              expression: ".*level=debug.*"
    relabel_configs:
      # Use Kubernetes pod labels
      - source_labels: [__meta_kubernetes_pod_label_app]
        target_label: app
      - source_labels: [__meta_kubernetes_namespace]
        target_label: namespace
      - source_labels: [__meta_kubernetes_pod_name]
        target_label: pod
      - source_labels: [__meta_kubernetes_pod_container_name]
        target_label: container
```

## Grafana Dashboards with Loki

```
Panel: Error Rate (Stat)
Query: sum(rate({namespace="production"} |= "ERROR"[5m]))
Threshold: > 10 = red, > 5 = yellow

Panel: Log Volume by Service (Time series)
Query: sum by (app) (rate({namespace="production"}[5m]))

Panel: Recent Errors (Logs panel)
Query: {namespace="production"} |= "ERROR" | json | level="error"
       | line_format "[{{.pod}}] {{.message}}"

Panel: HTTP 5xx Rate (Time series)
Query: sum by (app) (
  rate({namespace="production", app=~".*api.*"}
    | logfmt | status_code >= 500
  [5m])
)
```

## Loki Alerts

```yaml
# Loki alert rules
groups:
  - name: loki.rules
    rules:
    - alert: HighErrorRate
      expr: |
        sum(rate({namespace="production"} |= "ERROR"[5m])) > 10
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: "High error rate in production logs"

    - alert: OOMKilled
      expr: |
        count_over_time({namespace="production"} |= "OOMKilled"[5m]) > 0
      for: 1m
      labels:
        severity: critical
      annotations:
        summary: "Pod OOMKilled in production"

    - alert: NoPodLogs
      expr: |
        absent(rate({namespace="production", app="payment-api"}[5m]))
      for: 5m
      labels:
        severity: critical
      annotations:
        summary: "No logs from payment-api — may be down"
```

## Interview Questions

**What is the main advantage of Loki over ELK?**
Loki only indexes labels (namespace, pod, app) rather than the full text of log content. This means Loki uses dramatically less storage and compute for indexing — typically 10× cheaper than ELK for similar log volume. The trade-off: full-text search on log content requires scanning matching streams, which is slower than an indexed full-text search. For Kubernetes environments where you primarily filter by pod/namespace/service (all labels), Loki performs excellently and at a fraction of the cost.

**How does Loki handle high log volume in production?**
Loki uses horizontal scaling: separate read, write, and backend components (microservices mode). Writes go to Distributors → Ingesters (in-memory buffer) → long-term storage (S3/GCS). Reads go through Query Frontend (caching and splitting) → Queriers → storage. Rate limiting via `ingestion_rate_mb` prevents any single tenant from overwhelming the system. For very high volume, drop unnecessary logs at the Promtail pipeline stage (debug logs in prod) before they reach Loki.
