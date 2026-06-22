# Grafana Loki Interview Questions

## Core Concepts

**Q: What is Loki? vs Elasticsearch?**

Loki is Grafana's log aggregation system. Key philosophy: index only metadata (labels), not content. Log content stored compressed in object storage (S3/GCS), queried on-demand.

| | Loki | Elasticsearch |
|---|---|---|
| Index | Labels only | Full-text index |
| Storage | Very cheap (S3) | Expensive (large index) |
| Query speed | Slower full-text | Faster full-text |
| Complexity | Simple | Complex, resource-heavy |

Loki stack: **Loki** (store) + **Promtail** (agent, ships logs) + **Grafana** (visualise). Pairs with Prometheus and Tempo for full observability.

---

**Q: LogQL — query language.**

```logql
# Label selector (required) — selects log stream
{app="nginx", env="production"}

# Filter log content
{app="nginx"} |= "error"          # Contains "error"
{app="nginx"} != "health"         # Doesn't contain
{app="nginx"} |~ "5[0-9]{2}"     # Regex: 5xx status codes

# Parse structured logs
{app="api"} | json                # Parse JSON fields
{app="api"} | logfmt              # Parse key=value format

# Metric queries (logs → metrics)
rate({app="nginx"} |= "error" [5m])          # Error rate/sec
count_over_time({app="nginx"}[5m])            # Log volume
sum(rate({app="nginx"}[5m])) by (status)     # Group by label
```

---

**Q: Label design (critical for performance).**

Good labels (low cardinality):
```
app=nginx | env=production | region=us-east-1 | level=error
```

Bad labels (high cardinality — creates millions of streams → OOM):
```
user_id=123456789  # Never — millions of unique values
request_id=abc123  # Never — unique per request
```

Each unique label combination = one log stream. Too many streams = Loki OOM and slow queries.

---

**Q: Loki deployment.**

```yaml
# Promtail config (ship K8s pod logs to Loki)
scrape_configs:
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    pipeline_stages:
      - json:
          expressions: {level: level}
      - labels:
          level:              # Extract level as label
    relabel_configs:
      - source_labels: [__meta_kubernetes_pod_name]
        target_label: pod
```

```bash
# Install Loki via Helm
helm upgrade --install loki grafana/loki \
  --set loki.storage.type=s3 \
  --set loki.storage.bucketNames.chunks=my-loki-chunks
```

---

**Q: Retention configuration.**

```yaml
limits_config:
  retention_period: 744h  # 31 days default
# Per-tenant/label override:
overrides:
  "dev-team":
    retention_period: 168h   # 7 days for dev
```

## Revision Notes
```
LOKI: Log aggregation. Index labels only (not content). Cheap S3 storage.
vs ES: Loki=cheap+simple | ES=expensive+full-text-search

COMPONENTS: Loki (store) + Promtail (agent) + Grafana (UI)

LOGQL:
{app="nginx"} = stream selector (required)
|= "error" (filter) | |~ "regex" | | json (parse)
rate(...[5m]) = convert logs to rate metric

LABELS: Low cardinality ONLY (app, env, region, level)
Never: user_id, request_id, timestamp as labels -> millions of streams -> OOM

RETENTION: retention_period in limits_config
Per-tenant overrides possible
```
