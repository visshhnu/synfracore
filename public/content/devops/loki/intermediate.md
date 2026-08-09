# Loki — Intermediate

## Advanced LogQL — unwrap, top-K, and percentile queries

Beyond basic label selection and text filtering, LogQL's real power for operational work is turning log content into numeric aggregates without a separate metrics pipeline. `unwrap` is the key mechanism — it extracts a numeric field from a parsed log line and treats it as a value to aggregate, rather than just counting matching lines:

```logql
# Unwrap a numeric field from parsed JSON, then compute its rate
{service="api"} | json | unwrap duration | rate([5m])

# Filter on a parsed field, then reformat the output line for readability
{service="api"} | json | method="POST" | status >= 400
| line_format "{{.method}} {{.path}} {{.status}} {{.duration}}ms"

# Which services are producing the most errors right now
topk(10,
  sum by (service) (
    rate({env="prod"} |= "error" [5m])
  )
)

# P99 latency computed directly from log content, no separate metric needed
quantile_over_time(0.99,
  {service="api"} | json | unwrap duration [5m]
) by (endpoint)
```

The practical value here: a service that never explicitly emitted a `request_duration_seconds` metric can still get a real p99 latency figure, as long as it logs `duration` as a structured field — `unwrap` plus `quantile_over_time` derives the metric after the fact from logs that were already being written for other reasons.

## Running Loki in Kubernetes

The `loki-stack` Helm chart bundles Loki, Promtail, and Grafana together — the fastest path to a working setup for evaluation or a smaller deployment:

```yaml
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki grafana/loki-stack \
  --set grafana.enabled=true \
  --set promtail.enabled=true \
  --set loki.persistence.enabled=true \
  --set loki.persistence.size=10Gi
```

Kubernetes pod logs are picked up automatically once Promtail is running, with pod metadata already attached as labels without any additional configuration:

```
{namespace="production", pod="api-7d8f9b-abc", container="api"}
```

For production deployments at real scale, the distributed/microservices installation mode (covered in Advanced) is the better fit than this bundled single-chart approach — `loki-stack` is deliberately optimized for getting something running quickly, not for independently scaling ingestion versus query load.

## Log retention and storage configuration

Retention needs two pieces configured together, not just one — a common early misconfiguration is setting `retention_period` alone and assuming that's sufficient:

```yaml
# loki-config.yaml
limits_config:
  retention_period: 30d        # delete logs older than 30 days
  ingestion_rate_mb: 10        # max sustained ingestion rate per tenant
  max_streams_per_user: 10000  # hard cap on distinct label combinations — a cardinality safety net

compactor:
  working_directory: /tmp/loki/compactor
  shared_store: filesystem
  retention_enabled: true      # actually enables deletion — retention_period alone does nothing without this
```

`max_streams_per_user` is worth calling out specifically — it's a blunt but effective safety net against a label-cardinality mistake turning into a full Ingester OOM: once a tenant hits the cap, new streams are rejected rather than silently accepted, which surfaces a cardinality problem as an explicit error instead of a slow-building memory crisis.

## Alerting directly from log content

Loki's Ruler evaluates LogQL metric queries on a schedule and can fire alerts through the same Alertmanager most teams already use for Prometheus — meaning log-based and metric-based alerting share one notification pipeline rather than needing two separate systems:

```yaml
# Ruler config — points at the same Alertmanager Prometheus already uses
ruler:
  alertmanager_url: http://alertmanager:9093
  enable_api: true
```

```yaml
# An alert rule defined entirely in terms of log content
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

This is genuinely useful for exactly the class of problem that never had a metric emitted for it in the first place — a specific exception type, a business-logic error condition logged as text — without needing to add application code to also emit a corresponding Prometheus metric before it becomes alertable.
