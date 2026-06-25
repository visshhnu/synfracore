# Grafana Intermediate

## Grafana as Code — Provisioning

Store dashboards and data sources in Git.

```yaml
# /etc/grafana/provisioning/datasources/prometheus.yaml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    access: proxy
    isDefault: true
    jsonData:
      timeInterval: 15s

  - name: Loki
    type: loki
    url: http://loki:3100
    access: proxy
```

```yaml
# /etc/grafana/provisioning/dashboards/default.yaml
apiVersion: 1
providers:
  - name: Default
    folder: Platform
    type: file
    options:
      path: /etc/grafana/dashboards
      foldersFromFilesStructure: true
```

```bash
# Mount dashboards as ConfigMap in Kubernetes
kubectl create configmap grafana-dashboards   --from-file=./dashboards/   -n monitoring
```

## Grafonnet (Dashboard as Code)

```jsonnet
// dashboard.jsonnet
local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local graphPanel = grafana.graphPanel;
local prometheus = grafana.prometheus;

dashboard.new('API Overview', tags=['api', 'prod'])
.addPanel(
  graphPanel.new('Request Rate', datasource='Prometheus')
  .addTarget(
    prometheus.target('rate(http_requests_total[5m])', legendFormat='{{method}} {{status}}')
  ),
  gridPos={x: 0, y: 0, w: 24, h: 8}
)
```

## Advanced PromQL in Grafana

```promql
# Request rate by status class
sum by (status_class) (
  label_replace(
    rate(http_requests_total[5m]),
    "status_class", "${1}xx", "status_code", "([0-9]).*"
  )
)

# P99 latency
histogram_quantile(0.99,
  sum by (le, service) (
    rate(http_request_duration_seconds_bucket[5m])
  )
)

# Error ratio (for SLO panel)
1 - (
  sum(rate(http_requests_total{status_code!~"5.."}[5m]))
  /
  sum(rate(http_requests_total[5m]))
)

# Apdex score
(
  sum(rate(http_request_duration_seconds_bucket{le="0.3"}[5m]))
  +
  sum(rate(http_request_duration_seconds_bucket{le="1.2"}[5m]))
) / 2 / sum(rate(http_request_duration_seconds_count[5m]))
```

## Grafana Alerting — Unified Alerts

```yaml
# Alert rule via API
POST /api/v1/provisioning/alert-rules
{
  "title": "High Error Rate",
  "condition": "C",
  "data": [
    {
      "refId": "A",
      "relativeTimeRange": {"from": 300, "to": 0},
      "datasourceUid": "prometheus",
      "model": {
        "expr": "rate(http_errors_total[5m]) / rate(http_requests_total[5m]) > 0.05",
        "intervalMs": 15000
      }
    },
    {
      "refId": "C",
      "datasourceUid": "__expr__",
      "model": {
        "type": "threshold",
        "conditions": [{"evaluator": {"params": [0], "type": "gt"}}]
      }
    }
  ],
  "for": "5m",
  "labels": {"severity": "critical", "team": "platform"},
  "annotations": {
    "summary": "Error rate above 5% for {{ $labels.service }}"
  }
}
```

## Transformations

Chain transforms to reshape query results without writing complex queries.

```
Common transformations:
- Filter by value — hide zero-value rows
- Group by — aggregate multiple series
- Join by field — merge two queries on a common field
- Sort by — order rows
- Rename by regex — clean up label names
- Calculate field — arithmetic between columns
- Merge — combine results from multiple queries
```

## RBAC and Organizations

```
Organizations:  separate tenants (e.g., per team)
Roles:          Admin, Editor, Viewer
Teams:          group users; assign dashboard permissions
Folder perms:   restrict dashboard folders by team
Service accounts: API access for provisioning/CI
```

## Grafana OnCall Integration

```yaml
# Connect to PagerDuty
Contact point type: PagerDuty
Integration Key: your_pagerduty_routing_key

# Escalation policy
Level 1: notify primary oncall (5 min)
Level 2: notify backup oncall (10 min)
Level 3: notify manager (20 min)
```
