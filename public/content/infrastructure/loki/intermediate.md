# Loki — Intermediate

## Advanced LogQL

```logql
# Unwrap numeric values for metrics
{service="api"} | json | unwrap duration | rate([5m])

# Label filter after parsing
{service="api"} | json | method="POST" | status >= 400
| line_format "{{.method}} {{.path}} {{.status}} {{.duration}}ms"

# Top error sources
topk(10,
  sum by (service) (
    rate({env="prod"} |= "error" [5m])
  )
)

# P99 latency from logs
quantile_over_time(0.99,
  {service="api"} | json | unwrap duration [5m]
) by (endpoint)
```

## Loki in Kubernetes

```yaml
# Install via Helm (recommended for K8s)
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki grafana/loki-stack \
  --set grafana.enabled=true \
  --set promtail.enabled=true \
  --set loki.persistence.enabled=true \
  --set loki.persistence.size=10Gi

# Kubernetes logs auto-collected with pod labels as Loki labels
# {namespace="production", pod="api-7d8f9b-abc", container="api"}
```

## Log Retention and Storage

```yaml
# loki-config.yaml
limits_config:
  retention_period: 30d        # Delete logs older than 30 days
  ingestion_rate_mb: 10        # Max 10MB/s per tenant
  max_streams_per_user: 10000  # Max distinct label combinations

compactor:
  working_directory: /tmp/loki/compactor
  shared_store: filesystem
  retention_enabled: true      # Enable log deletion
```

## Alerting from Loki

```yaml
# Loki ruler config for alerting
ruler:
  alertmanager_url: http://alertmanager:9093
  enable_api: true

# Alert rule
groups:
  - name: loki-alerts
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate({env="prod"} |= "ERROR" [5m])) > 10
        for: 5m
        annotations:
          summary: "High error rate in production logs"
```
