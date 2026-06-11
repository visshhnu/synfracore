# Prometheus — Fundamentals

## Architecture

```
Targets (apps)  →  Prometheus scrapes /metrics  →  TSDB storage
                                                      ↓
                                               PromQL queries
                                                      ↓
                                          Alertmanager → PagerDuty/Slack
                                                      ↓
                                               Grafana dashboards
```

## Metric Types

```
Counter:   Monotonically increasing (requests_total, errors_total)
           Use: Count of events. Always use _total suffix.
           Never subtract — reset to 0 on restart, use rate()

Gauge:     Goes up and down (memory_bytes, queue_size, temperature)
           Use: Current value at a point in time

Histogram: Samples observations in configurable buckets (request duration)
           Creates: _bucket, _sum, _count
           Use: Latency, request sizes — enables percentile calculation

Summary:   Like histogram but calculates quantiles client-side
           Use: Prefer Histogram (server-side percentiles more flexible)
```

## Instrumenting Your Application

```python
# pip install prometheus-client
from prometheus_client import Counter, Histogram, Gauge, start_http_server
import time

# Define metrics at module level
REQUEST_COUNT = Counter(
    'http_requests_total',
    'Total HTTP requests',
    ['method', 'endpoint', 'status']
)

REQUEST_LATENCY = Histogram(
    'http_request_duration_seconds',
    'HTTP request latency',
    ['method', 'endpoint'],
    buckets=[0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0]
)

ACTIVE_CONNECTIONS = Gauge(
    'active_connections',
    'Number of active connections'
)

# Use in your handlers
@app.route('/api/users')
def get_users():
    with REQUEST_LATENCY.labels(method='GET', endpoint='/api/users').time():
        REQUEST_COUNT.labels(method='GET', endpoint='/api/users', status='200').inc()
        # ... your logic ...
        return users

# Expose metrics endpoint
start_http_server(8000)  # http://localhost:8000/metrics
```

## PromQL — Query Language

```promql
# Rate of requests per second (last 5 min window)
rate(http_requests_total[5m])

# Error rate percentage
rate(http_requests_total{status=~"5.."}[5m])
/ rate(http_requests_total[5m]) * 100

# P95 latency (requires Histogram)
histogram_quantile(0.95,
  rate(http_request_duration_seconds_bucket[5m])
)

# Memory usage in GB
process_resident_memory_bytes / 1024 / 1024 / 1024

# Sum requests across all pods
sum(rate(http_requests_total[5m])) by (endpoint)

# Top 5 slowest endpoints
topk(5,
  histogram_quantile(0.99,
    rate(http_request_duration_seconds_bucket[5m])
  )
)

# Alert: error rate > 1% for 5 minutes
sum(rate(http_requests_total{status=~"5.."}[5m]))
/ sum(rate(http_requests_total[5m])) > 0.01
```

## Prometheus Configuration

```yaml
# prometheus.yml
global:
  scrape_interval: 15s      # How often to scrape
  evaluation_interval: 15s  # How often to evaluate rules

# Alerting rules
rule_files:
  - "alerts/*.yml"

# Where to send alerts
alerting:
  alertmanagers:
    - static_configs:
        - targets: ['alertmanager:9093']

scrape_configs:
  # Scrape Prometheus itself
  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']

  # Kubernetes pods with annotations
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    relabel_configs:
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
```

## Alerting Rules

```yaml
# alerts/slo.yml
groups:
  - name: slo
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m]))
          / sum(rate(http_requests_total[5m])) > 0.01
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "Error rate above 1%"
          description: "Error rate is {{ $value | humanizePercentage }}"

      - alert: HighLatency
        expr: |
          histogram_quantile(0.95,
            rate(http_request_duration_seconds_bucket[5m])
          ) > 1.0
        for: 10m
        labels:
          severity: warning
        annotations:
          summary: "P95 latency above 1 second"
```
