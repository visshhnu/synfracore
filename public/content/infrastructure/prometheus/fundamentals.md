# Prometheus — Fundamentals

**Analogy** — Instrumenting your application (adding `Counter`/`Histogram`/`Gauge` calls, below) is like installing a utility meter in a building, not hiring someone to estimate usage by eye. A `Counter` is the odometer-style meter that only ever ticks upward (total requests served, ever); a `Gauge` is the dial that swings up and down live (current active connections); a `Histogram` is a meter that also sorts what it measures into buckets (this request took 50-100ms, that one took 100-250ms), which is exactly what makes computing "95% of requests were faster than X" possible later — you can't reconstruct percentile buckets from a single running total.

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

## Try It (2 Minutes)

See a Counter's "only ever increases, use rate() not the raw value" behavior directly:

```bash
pip install prometheus-client
python3 -c "
from prometheus_client import Counter, start_http_server
import time
c = Counter('demo_requests_total', 'Demo counter')
start_http_server(8000)
while True:
    c.inc()
    time.sleep(1)
"
```

Leave it running, then in another terminal: `curl -s http://localhost:8000/metrics | grep demo_requests_total`. Run that `curl` a few times, seconds apart — the raw number only ever goes up (5, then 8, then 12...), which is exactly why you always wrap a Counter in `rate()` for dashboards and alerts: the raw value tells you "how many total since this process started," not "how fast is this happening right now." `rate(demo_requests_total[1m])` against this running counter would report a steady ~1/sec, which is the actually useful number.
