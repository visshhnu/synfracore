# Grafana — Intermediate

## Transformations

```
Transformations process query results before visualization.
Access: Panel editor → Transform tab

Key transformations:
  Merge:           Combine data from multiple queries into one table
  Filter by name:  Show only specific fields
  Organize fields: Rename, reorder, hide columns
  Group by:        Aggregate rows (like SQL GROUP BY)
  Sort by:         Sort rows by a field
  Reduce:          Collapse time series to single stat (Last, Mean, Max)
  Add field:       Calculated column (e.g., Revenue = Price * Quantity)
  Lookup fields:   Join data from different queries by key
```

```json
// Example: Add calculated field (% of total)
{
  "id": "calculateField",
  "options": {
    "mode": "reduceRow",
    "reduce": { "reducer": "sum" },
    "alias": "Total"
  }
}
```

## Variables and Templating

```sql
-- Variable: $namespace — populated from Prometheus labels
-- Type: Query
-- Query: label_values(kube_pod_info, namespace)

-- Variable: $pod — dependent on $namespace
-- Query: label_values(kube_pod_info{namespace="$namespace"}, pod)

-- Variable: $interval — time interval
-- Type: Interval
-- Values: 1m,5m,10m,30m,1h
-- In panel query: rate(metric[${interval}])
```

```promql
-- Use variables in queries
sum(rate(http_requests_total{
  namespace=~"$namespace",
  pod=~"$pod"
}[$interval])) by (pod)

-- $__timeFilter — auto time range filter for SQL datasources
SELECT time, value FROM metrics
WHERE $__timeFilter(time)
  AND service = '$service'
```

## Grafana as Code (Grafonnet / Jsonnet)

```jsonnet
// dashboard.jsonnet
local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local prometheus = grafana.prometheus;
local graphPanel = grafana.graphPanel;
local template = grafana.template;

dashboard.new(
  'Application SLOs',
  tags=['slo', 'production'],
  refresh='30s',
  time_from='now-1h',
)
.addTemplate(
  template.datasource('datasource', 'prometheus', 'Prometheus', hide='label')
)
.addTemplate(
  template.new(
    'service',
    '$datasource',
    'label_values(http_requests_total, service)',
    multi=true,
    includeAll=true,
  )
)
.addPanel(
  graphPanel.new(
    'Error Rate',
    datasource='$datasource',
    format='percentunit',
  )
  .addTarget(
    prometheus.target(
      'sum(rate(http_requests_total{service=~"$service",status=~"5.."}[5m])) / sum(rate(http_requests_total{service=~"$service"}[5m]))',
      legendFormat='{{service}}',
    )
  ),
  gridPos={ x: 0, y: 0, w: 12, h: 8 }
)
```

```bash
# Generate JSON dashboard from Jsonnet
jsonnet -J grafonnet-lib/ dashboard.jsonnet > dashboard.json

# Apply to Grafana via API
curl -X POST https://grafana.example.com/api/dashboards/import \
  -H 'Content-Type: application/json' \
  -u admin:password \
  -d "{\"dashboard\": $(cat dashboard.json), \"overwrite\": true}"
```

## Loki + Grafana (Log Aggregation)

```yaml
# Promtail — ship logs to Loki
# Like Filebeat but for Loki

apiVersion: v1
kind: ConfigMap
metadata:
  name: promtail-config
data:
  promtail.yaml: |
    server:
      http_listen_port: 3101

    clients:
      - url: http://loki:3100/loki/api/v1/push

    scrape_configs:
      - job_name: kubernetes-pods
        kubernetes_sd_configs:
          - role: pod
        pipeline_stages:
          - docker: {}          # Parse Docker JSON log format
          - json:               # Extract fields from JSON logs
              expressions:
                level: level
                msg: message
                trace_id: trace_id
          - labels:             # Promote extracted fields to Loki labels
              level:
              trace_id:
        relabel_configs:
          - source_labels: [__meta_kubernetes_pod_name]
            target_label: pod
          - source_labels: [__meta_kubernetes_namespace]
            target_label: namespace
```

```logql
# LogQL — query language for Loki (similar to PromQL)

# Filter logs
{namespace="production", pod=~"api-.*"} |= "ERROR"

# Parse JSON and filter
{app="api"} | json | level="error" | line_format "{{.message}}"

# Count error rate over time
sum(rate({namespace="production"} |= "ERROR" [5m])) by (pod)

# P99 latency from logs (if duration is in log)
{app="api"} | json | unwrap duration_ms | p99 by (endpoint)

# Find logs by trace ID (distributed tracing correlation)
{namespace="production"} | json | trace_id="abc123"
```
