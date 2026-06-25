# Loki Intermediate

## LogQL — Parsing and Extracting Fields

```logql
# JSON parsing
{service="api"} | json
{service="api"} | json level, method, status_code

# JSON with nested fields
{service="api"} | json | response_body_size > 10000

# Logfmt parsing (key=value format)
{service="worker"} | logfmt | level="error"

# Pattern parser (lightweight grok)
{service="nginx"} | pattern `<method> <path> HTTP/<_> <status> <bytes>`

# Regex extraction
{service="api"} | regexp `latency=(?P<latency>[0-9]+)ms`

# Combine: parse then filter
{service="api"} | json | level="error" | duration > 500
```

## Metric Queries from Logs

```logql
# Request rate per service
sum by (service) (rate({namespace="prod"}[5m]))

# Error rate
sum(rate({namespace="prod"} |= "ERROR" [5m])) by (service)
  /
sum(rate({namespace="prod"}[5m])) by (service)

# P99 latency from parsed logs
quantile_over_time(0.99,
  {service="api"} | json | unwrap latency_ms [5m]
) by (endpoint)

# Bytes received over time
sum(bytes_rate({job="nginx"}[5m]))
```

## Loki Ruler — Log Alerting

```yaml
# loki-config.yaml
ruler:
  storage:
    type: local
    local:
      directory: /etc/loki/rules
  rule_path: /tmp/loki-rules
  alertmanager_url: http://alertmanager:9093
  ring:
    kvstore:
      store: inmemory
  enable_api: true
```

```yaml
# /etc/loki/rules/prod/error-alerts.yaml
groups:
  - name: error_alerts
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate({namespace="prod"} |= "ERROR" [5m])) by (service)
          /
          sum(rate({namespace="prod"}[5m])) by (service) > 0.05
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate in {{ $labels.service }}"
```

## Kubernetes with Promtail Daemonset

```yaml
# promtail on Kubernetes via Helm
helm repo add grafana https://grafana.github.io/helm-charts
helm install promtail grafana/promtail   --set config.lokiAddress=http://loki:3100/loki/api/v1/push   -n monitoring
```

Promtail auto-discovers pods and attaches labels from Kubernetes metadata: `pod`, `namespace`, `container`, `node_name`, `app`.

## Structured Metadata (Loki 3.0+)

```
Structured metadata = per-log-line key-value pairs (not stream labels)
Use for: trace_id, span_id, request_id, user_id
These don't affect indexing but are searchable
```

```bash
# Push with structured metadata
curl -X POST http://loki:3100/loki/api/v1/push   -d '{"streams": [{"stream": {"service": "api"},
       "values": [["timestamp", "log line", {"trace_id": "abc123", "user_id": "456"}]]}]}'
```

## Retention Configuration

```yaml
# loki-config.yaml
compactor:
  working_directory: /loki/compactor
  shared_store: s3
  compaction_interval: 10m
  retention_enabled: true
  retention_delete_delay: 2h

limits_config:
  retention_period: 30d  # global default

# Per-stream retention via override
overrides:
  "team-debug":
    retention_period: 7d
  "team-compliance":
    retention_period: 365d
```

## Pipeline Stages Reference

```yaml
pipeline_stages:
  - docker:    {}                    # parse Docker log format
  - cri:       {}                    # parse CRI (Kubernetes) log format
  - json:
      expressions:
        level: severity
        ts: timestamp
  - timestamp:
      source: ts
      format: RFC3339Nano
  - labels:
      level:
      service:
  - drop:
      expression: ".*health.*"       # drop health check logs
      drop_counter_reason: health_check
  - limit:
      rate: 1000                     # rate limit log lines
      burst: 2000
  - output:
      source: message                # use parsed field as final log line
```
