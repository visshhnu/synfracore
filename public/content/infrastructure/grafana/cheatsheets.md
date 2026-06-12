# Grafana — Cheatsheet

## Dashboard Keyboard Shortcuts

```
d then s       Save dashboard
d then e       Settings
d then r       Refresh
?              Show all keyboard shortcuts
Escape         Close modal/editor
Ctrl+Z         Undo (in panel editor)
```

## PromQL for Common Dashboard Panels

```promql
# ── GOLDEN SIGNALS ────────────────────────────────────────

# Latency — P50, P95, P99
histogram_quantile(0.50, rate(http_request_duration_seconds_bucket[5m]))
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))
histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m]))

# Traffic — Requests per second
sum(rate(http_requests_total[5m])) by (method, route)

# Errors — 5xx rate
sum(rate(http_requests_total{status=~"5.."}[5m]))
/ sum(rate(http_requests_total[5m])) * 100

# Saturation — CPU usage
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory usage %
(1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100

# ── KUBERNETES ────────────────────────────────────────────

# Pod CPU usage
sum(rate(container_cpu_usage_seconds_total{container!="POD",container!=""}[5m]))
by (pod, namespace)

# Pod memory usage
container_memory_working_set_bytes{container!="POD",container!=""}

# Pod restarts (last 1h)
increase(kube_pod_container_status_restarts_total[1h])

# Node disk usage
(node_filesystem_size_bytes - node_filesystem_free_bytes)
/ node_filesystem_size_bytes * 100

# ── STAT PANEL THRESHOLDS ─────────────────────────────────
# In fieldConfig → thresholds:
# Value 0  → Green
# Value 80 → Yellow
# Value 90 → Red
```

## Alert Rule Example

```yaml
# Grafana unified alerting rule (via API or terraform-grafana provider)
apiVersion: 1
groups:
  - name: production-alerts
    folder: Production
    interval: 1m
    rules:
      - title: High Error Rate
        condition: B
        data:
          - refId: A
            queryType: ''
            model:
              expr: sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))
          - refId: B
            queryType: classic_conditions
            model:
              conditions:
                - evaluator:
                    type: gt
                    params: [0.01]   # 1% error rate
                  operator: { type: and }
                  reducer: { type: last }
        for: 5m
        labels:
          severity: critical
          team: backend
        annotations:
          summary: Error rate above 1%
```

## Grafana Provisioning (Infrastructure as Code)

```yaml
# /etc/grafana/provisioning/datasources/prometheus.yml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    isDefault: true
    jsonData:
      timeInterval: 15s

# /etc/grafana/provisioning/dashboards/dashboard.yml  
apiVersion: 1
providers:
  - name: default
    type: file
    options:
      path: /etc/grafana/dashboards    # Load all JSON files here
      foldersFromFilesStructure: true   # Use directory as folder name
```
