# Grafana — Fundamentals

## Setup and Data Sources

```yaml
# docker-compose.yml
services:
  grafana:
    image: grafana/grafana:latest
    ports:
      - "3000:3000"
    environment:
      GF_SECURITY_ADMIN_PASSWORD: "admin123"
      GF_USERS_ALLOW_SIGN_UP: "false"
    volumes:
      - grafana_data:/var/lib/grafana
      - ./provisioning:/etc/grafana/provisioning

  prometheus:
    image: prom/prometheus:latest
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
```

```yaml
# provisioning/datasources/prometheus.yml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    isDefault: true
    jsonData:
      timeInterval: 15s

  - name: Loki
    type: loki
    url: http://loki:3100

  - name: PostgreSQL
    type: postgres
    url: postgres:5432
    database: myapp
    user: grafana_reader
    secureJsonData:
      password: readonly_password
```

## Building Dashboards

**Key panel types:**
```
Time series:  Line/area chart over time — latency, requests, CPU
Stat:         Single big number — current error rate, active users
Gauge:        Dial/bar showing value in range — CPU %, disk usage
Bar chart:    Category comparison — requests by endpoint
Table:        Tabular data — top 10 slow queries
Logs:         Loki log stream — application logs
Heatmap:      Distribution over time — request latency buckets
```

**Panel configuration pattern:**
```
1. Choose panel type
2. Write query (PromQL, LogQL, SQL depending on data source)
3. Set visualization options (axes, legend, thresholds)
4. Set overrides for specific series
5. Set alert (optional)
```

## Useful PromQL for Dashboards

```promql
# Request rate by endpoint (time series)
sum(rate(http_requests_total[5m])) by (endpoint)

# Error percentage (stat panel with thresholds)
sum(rate(http_requests_total{status=~"5.."}[5m]))
/ sum(rate(http_requests_total[5m])) * 100

# P50/P95/P99 latency (multiple queries in one panel)
# Query A: histogram_quantile(0.50, rate(duration_bucket[5m]))
# Query B: histogram_quantile(0.95, rate(duration_bucket[5m]))
# Query C: histogram_quantile(0.99, rate(duration_bucket[5m]))

# CPU usage per pod
100 - (avg by (pod) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory usage %
(1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100

# Kubernetes pod restarts
increase(kube_pod_container_status_restarts_total[1h])
```

## Dashboard as Code (Provisioning)

```json
// provisioning/dashboards/slo.json
{
  "title": "Application SLOs",
  "panels": [
    {
      "title": "Error Rate",
      "type": "stat",
      "targets": [{
        "expr": "sum(rate(http_requests_total{status=~'5..'}[5m])) / sum(rate(http_requests_total[5m])) * 100",
        "legendFormat": "Error %"
      }],
      "fieldConfig": {
        "defaults": {
          "thresholds": {
            "steps": [
              {"value": 0, "color": "green"},
              {"value": 1, "color": "yellow"},
              {"value": 5, "color": "red"}
            ]
          },
          "unit": "percent"
        }
      }
    }
  ]
}
```

## Alerting in Grafana

```yaml
# Grafana Unified Alerting (Grafana 8+)
# Create alert rule in UI or via API

# Contact points (where alerts go)
POST /api/v1/provisioning/contact-points
{
  "name": "PagerDuty Production",
  "type": "pagerduty",
  "settings": {
    "integrationKey": "$PD_ROUTING_KEY"
  }
}

# Alert rule via API
{
  "title": "High Error Rate",
  "condition": "C",
  "data": [
    {
      "refId": "A",
      "queryType": "",
      "model": {
        "expr": "sum(rate(http_requests_total{status=~'5..'}[5m])) / sum(rate(http_requests_total[5m]))"
      }
    },
    {
      "refId": "C",
      "queryType": "classic_conditions",
      "model": {
        "conditions": [{"evaluator": {"type": "gt", "params": [0.01]}}]
      }
    }
  ],
  "for": "5m",
  "labels": {"severity": "critical"}
}
```
