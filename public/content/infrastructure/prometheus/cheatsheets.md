# Prometheus — Cheatsheet

## PromQL Reference

```promql
# ── RATES AND COUNTERS ───────────────────────────────────────
rate(http_requests_total[5m])                  # Per-second rate over 5m
irate(http_requests_total[5m])                 # Instantaneous rate (last 2 points)
increase(http_requests_total[1h])              # Total increase over 1 hour

# ── AGGREGATION ──────────────────────────────────────────────
sum(rate(requests[5m]))                        # Total across all instances
sum by (endpoint) (rate(requests[5m]))         # Sum per endpoint
sum without (instance) (rate(requests[5m]))    # Sum, excluding instance label
topk(5, sum by (endpoint)(rate(requests[5m]))) # Top 5 endpoints by rate
count(up == 1)                                 # Count healthy targets

# ── HISTOGRAMS ───────────────────────────────────────────────
histogram_quantile(0.50, rate(duration_bucket[5m]))   # P50
histogram_quantile(0.95, rate(duration_bucket[5m]))   # P95
histogram_quantile(0.99, rate(duration_bucket[5m]))   # P99

# ── LABEL FILTERING ──────────────────────────────────────────
http_requests_total{status="200"}             # Exact match
http_requests_total{status!="200"}            # Not equal
http_requests_total{status=~"2.."}            # Regex match (2xx)
http_requests_total{status!~"2.."}            # Regex not match
http_requests_total{service=~"api|web"}       # OR condition

# ── MATH AND FUNCTIONS ───────────────────────────────────────
rate(errors[5m]) / rate(requests[5m]) * 100   # Error percentage
(memory_used / memory_total) * 100            # Memory percentage
abs(x)                                         # Absolute value
ceil(x) / floor(x) / round(x, 2)
delta(temperature[1h])                         # Change over time
deriv(memory_bytes[5m])                        # Rate of change
predict_linear(disk_free[1h], 4*3600)         # Predict value in 4h

# ── TIME RANGE ───────────────────────────────────────────────
metric[5m]    5 minutes
metric[1h]    1 hour
metric[7d]    7 days
offset 1h     Look at data from 1 hour ago
metric[5m] offset 1h   5m range, starting from 1h ago
```

## Alerting Rules Template

```yaml
groups:
- name: availability
  rules:
  - alert: ServiceDown
    expr: up == 0
    for: 2m
    labels: { severity: critical }
    annotations:
      summary: "{{ $labels.job }} is down"

  - alert: HighErrorRate
    expr: |
      sum(rate(http_requests_total{status=~"5.."}[5m])) by (service)
      / sum(rate(http_requests_total[5m])) by (service) > 0.01
    for: 5m
    labels: { severity: critical }
    annotations:
      summary: "Error rate > 1% on {{ $labels.service }}"
      description: "Current error rate: {{ $value | humanizePercentage }}"

  - alert: HighLatency
    expr: |
      histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 1
    for: 10m
    labels: { severity: warning }

  - alert: DiskRunningOut
    expr: |
      predict_linear(node_filesystem_free_bytes[1h], 4 * 3600) < 0
    for: 30m
    labels: { severity: warning }
    annotations:
      summary: "Disk will be full in < 4 hours on {{ $labels.instance }}"
```

## scrape_config Patterns

```yaml
# Kubernetes service discovery
- job_name: kubernetes-pods
  kubernetes_sd_configs: [{role: pod}]
  relabel_configs:
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
    action: keep
    regex: 'true'
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_port]
    action: replace
    target_label: __address__
    regex: (.+)
    replacement: ${1}

# Static targets with authentication
- job_name: external-api
  static_configs:
    - targets: [api.example.com:443]
  scheme: https
  tls_config:
    insecure_skip_verify: false
  authorization:
    credentials_file: /etc/prometheus/token
```
