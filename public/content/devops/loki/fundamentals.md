# Loki — Fundamentals

## What is Loki?

Loki is a log aggregation system built by Grafana Labs — designed as the logging equivalent of Prometheus. It collects logs from your applications and infrastructure, stores them cost-efficiently, and lets you query them with LogQL, a language with the same feel as PromQL.

Loki is part of the **PLG stack**: **P**romtail (log collector on every node) → **L**oki (log storage and query engine) → **G**rafana (visualisation and alerting). All three integrate natively — metrics and logs are queried side by side in the same Grafana dashboard.

**Why Loki is different from Elasticsearch:** the fundamental difference is the indexing strategy. Elasticsearch indexes the full text of every log — every word becomes searchable, which is fast for arbitrary searches but produces a large index (20-30% of raw log volume) that's expensive to operate. Loki indexes *only labels* (metadata: namespace, app, pod, environment) — never the log content itself. Log content is stored as compressed text chunks in cheap object storage (S3, GCS, Azure Blob).

|  | Loki | Elasticsearch (ELK) |
|---|---|---|
| What is indexed | Labels only (namespace, app, pod) | Full text of every log message |
| Storage cost | Very low — compressed chunks in S3/GCS | High — Elasticsearch index + shard storage |
| Query speed | Fast for label-based, slower for full-text scan | Fast for any text search |
| Setup complexity | Simple — 3 components, one Helm chart | Complex — ES cluster sizing, JVM tuning |
| Integration | Native Grafana data source | Kibana (separate UI) |
| Best for | K8s logs with consistent labels | Full-text search, unknown log patterns |

## Architecture — Promtail, Loki, Grafana

| Component | What it does |
|---|---|
| Promtail | Agent running on every node — reads container logs from `/var/log/pods/`, attaches K8s labels (pod, namespace, app), sends to Loki |
| Loki | The log aggregation server — receives logs, indexes only labels, stores compressed chunks in object storage |
| Grafana | Queries and visualises logs via the Explore tab plus LogQL — dashboards combine Prometheus metrics and Loki logs |
| Ruler | Evaluates LogQL rules and sends alerts — the logs equivalent of Prometheus's Alertmanager |

```bash
# Install Loki + Promtail + Grafana together
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install loki-stack grafana/loki-stack \
  --namespace monitoring \
  --set grafana.enabled=true \
  --set prometheus.enabled=true \
  --set loki.persistence.enabled=true \
  --set loki.persistence.size=50Gi
```

```yaml
# Promtail config — scrape and parse Kubernetes pod logs
scrape_configs:
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    pipeline_stages:
      - docker: {}                # parse Docker log format
      - json:                     # parse JSON-structured app logs
          expressions:
            level: level
            msg: message
            duration: duration
    relabel_configs:
      - source_labels: [__meta_kubernetes_pod_label_app]
        target_label: app
      - source_labels: [__meta_kubernetes_namespace]
        target_label: namespace
```

## LogQL — Querying Logs

Every LogQL query starts with a **log stream selector** in curly braces (selects logs using the label index — fast), followed by optional **pipeline stages** that filter or parse the content.

```logql
# Basic label selection
{namespace="production"}
{namespace="production", app="payment-api"}

# Text filters
{namespace="production"} |= "ERROR"            # contains "ERROR"
{namespace="production"} != "DEBUG"            # excludes "DEBUG"
{namespace="production"} |~ "timeout|refused"  # regex match

# JSON log parsing
{app="payment-api"} | json | level="error"
{app="payment-api"} | json | duration > 1000

# Metric queries — count log lines over time
rate({namespace="production"} |= "ERROR" [5m])

# Error rate per service
sum by (app) (rate({namespace="production"} |= "ERROR" [5m]))

# Error ratio (errors / total requests)
sum(rate({namespace="production"} |= "ERROR" [5m])) /
sum(rate({namespace="production"} [5m]))
```

| Use case | LogQL query |
|---|---|
| All errors in a namespace | `{namespace="production"} \|= "ERROR"` |
| Specific pod's logs | `{pod="payment-api-7d8f9-xyz"}` |
| JSON field filter | `{app="api"} \| json \| status_code >= 500` |
| Error rate per app | `sum by(app)(rate({ns="prod"} \|= "ERROR" [5m]))` |
| Slowest requests | `{app="api"} \| json \| unwrap duration \| p99 by (endpoint) [5m]` |

**Using Loki in Grafana:** go to Explore, select Loki as the data source, and paste a LogQL query — the result shows matching log lines in a timeline, and switching to Metrics view shows the rate chart. Dashboard panels can combine a Prometheus error-rate metric with the corresponding Loki log lines for the same service side by side, giving correlation without switching tools.

## Promtail — Log Collection

```yaml
# Drop noisy health-check logs before they're even shipped to Loki —
# reduces both storage cost and search noise
pipeline_stages:
  - match:
      selector: '{app="payment-api"}'
      stages:
        - drop:
            expression: ".*GET /health.*"
```

## Alerting from Logs

Loki's Ruler evaluates LogQL expressions on a schedule and fires alerts, the same way Prometheus evaluates PromQL — alerting on ERROR rate, specific exception messages, or any log pattern, without needing to instrument the application to emit a corresponding metric.

```yaml
# A Loki alerting rule — fire if error rate exceeds 5% for 5 minutes
groups:
  - name: log-alerts
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate({app="payment-api"} |= "ERROR" [5m]))
          /
          sum(rate({app="payment-api"} [5m])) > 0.05
        for: 5m
        labels: { severity: critical }
        annotations:
          summary: "Error rate above 5% for payment-api"
```

## Interview Questions

**What is Loki and how does it differ from ELK?**
Loki is a log aggregation system by Grafana Labs, designed to be cost-effective and Kubernetes-native. The key architectural difference from ELK is that Loki does not index the content of log messages at all — it only indexes labels (metadata like namespace, app, and pod), and stores the actual log text as compressed chunks in cheap object storage like S3. Elasticsearch, by contrast, indexes the full text of every log line, making it fast for arbitrary free-text search but producing a much larger, more expensive index — commonly 20-30% of raw log volume. This makes Loki dramatically cheaper to operate at scale, and it integrates natively into Grafana alongside Prometheus metrics, letting you correlate a metric spike with the exact log lines from the same time window in one dashboard. The tradeoff: Loki's label-based indexing means queries need consistent, well-chosen labels to be fast, and full-text search across log content (not filtered by label first) is genuinely slower than Elasticsearch's purpose-built full-text index — Loki is the right choice for Kubernetes environments with consistent labeling conventions, while ELK remains stronger for genuinely unpredictable, full-text-search-heavy log analysis.
