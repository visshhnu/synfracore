# Prometheus Interview Questions

## Core Concepts

**Q: What is Prometheus? How does it work?**

Prometheus is an open-source monitoring and alerting system. Unlike push-based monitoring (agents push metrics to server), Prometheus uses a **pull model**: it scrapes (fetches) metrics from targets at regular intervals.

**Architecture:**
```
[Your App] → exposes /metrics endpoint
[Prometheus Server] → scrapes /metrics every 15s → stores in TSDB
[Alertmanager] → receives alerts from Prometheus → sends to Slack/PagerDuty/email
[Grafana] → queries Prometheus → visualises dashboards
```

**Data model:**
Prometheus stores data as **time series** — streams of timestamped values.
Each time series is identified by: metric name + set of key-value labels.

Example: `http_requests_total{method="GET", status="200", path="/api"} 1234 1703000000`

---

**Q: Explain Prometheus metric types.**

**Counter:** Only goes up (or resets to 0 on restart). For counts that accumulate.
```
http_requests_total{method="GET", status="200"} 15234
# Use rate() to get per-second rate
rate(http_requests_total[5m])
```

**Gauge:** Can go up or down. For current values.
```
node_memory_MemAvailable_bytes 1234567890
go_goroutines 42
```

**Histogram:** Samples observations into configurable buckets. For latency/size distributions.
```
http_request_duration_seconds_bucket{le="0.1"} 2400   # requests < 100ms
http_request_duration_seconds_bucket{le="0.5"} 4800   # requests < 500ms
http_request_duration_seconds_sum 12345.6              # total seconds
http_request_duration_seconds_count 5000               # total requests
# P99 latency:
histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m]))
```

**Summary:** Similar to Histogram but calculates quantiles on client side (not aggregatable).
Use Histogram (server-side quantiles) over Summary for multi-instance scenarios.

---

**Q: What is PromQL? Give examples of common queries.**

PromQL (Prometheus Query Language) is a functional language for querying time series data.

**Instant vector**: Single value at current time.
```promql
# Current CPU usage per core
node_cpu_seconds_total{mode="idle"}
```

**Range vector**: Values over time window (for rate calculations).
```promql
# HTTP request rate over last 5 minutes
rate(http_requests_total[5m])

# P95 latency
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))

# Memory usage %
(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100

# CPU usage % per node
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Error rate (5xx responses)
sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))

# Active Kubernetes pods per namespace
count by (namespace) (kube_pod_status_phase{phase="Running"})

# Disk usage % per device
(1 - node_filesystem_free_bytes / node_filesystem_size_bytes) * 100
```

**Aggregation operators:**
`sum`, `avg`, `max`, `min`, `count`, `topk`, `bottomk`

**Binary operators:** `+`, `-`, `*`, `/`, `==`, `!=`, `>`, `<`, `and`, `or`, `unless`

---

**Q: How do you configure Prometheus scraping?**

```yaml
# prometheus.yml
global:
  scrape_interval: 15s      # Default scrape frequency
  evaluation_interval: 15s  # Rule evaluation frequency

scrape_configs:
  # Static targets
  - job_name: 'myapp'
    static_configs:
      - targets: ['app1:9090', 'app2:9090']
    metrics_path: /metrics
    scheme: http

  # Kubernetes service discovery
  - job_name: 'kubernetes-pods'
    kubernetes_sd_configs:
      - role: pod
    relabel_configs:
      # Only scrape pods with annotation prometheus.io/scrape: "true"
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      # Use custom metrics path from annotation
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)

  # Node Exporter (hardware metrics)
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node1:9100', 'node2:9100', 'node3:9100']
```

**Kubernetes annotations on pod:**
```yaml
annotations:
  prometheus.io/scrape: "true"
  prometheus.io/path: "/metrics"
  prometheus.io/port: "8080"
```

---

**Q: Explain Prometheus alerting rules and Alertmanager.**

**Alert rules (in Prometheus):**
```yaml
# rules/alerts.yml
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m])) /
          sum(rate(http_requests_total[5m])) > 0.05
        for: 5m          # Must be true for 5 min before firing
        labels:
          severity: critical
          team: backend
        annotations:
          summary: "High error rate on {{ $labels.job }}"
          description: "Error rate is {{ $value | humanizePercentage }} for {{ $labels.instance }}"
          runbook_url: "https://wiki.example.com/runbooks/high-error-rate"

      - alert: PodCrashLooping
        expr: rate(kube_pod_container_status_restarts_total[15m]) > 0
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "Pod {{ $labels.pod }} is crash looping"
```

**Alertmanager routes notifications:**
```yaml
# alertmanager.yml
route:
  receiver: 'default'
  group_by: ['alertname', 'namespace']
  group_wait: 30s       # Wait before sending first notification
  group_interval: 5m    # Wait between group notifications
  repeat_interval: 4h   # Repeat if still firing
  routes:
    - match:
        severity: critical
      receiver: 'pagerduty'
    - match:
        severity: warning
      receiver: 'slack'

receivers:
  - name: 'slack'
    slack_configs:
      - api_url: 'https://hooks.slack.com/services/...'
        channel: '#alerts'
        title: '{{ .CommonAnnotations.summary }}'
        
  - name: 'pagerduty'
    pagerduty_configs:
      - service_key: '<key>'
```

---

**Q: What are Prometheus exporters? Name important ones.**

Exporters expose metrics from systems that don't natively support Prometheus format.

| Exporter | What it monitors | Port |
|---|---|---|
| node_exporter | Linux hardware (CPU, memory, disk, network) | 9100 |
| blackbox_exporter | External endpoints (HTTP, TCP, ICMP probes) | 9115 |
| postgres_exporter | PostgreSQL metrics | 9187 |
| redis_exporter | Redis metrics | 9121 |
| mongodb_exporter | MongoDB metrics | 9216 |
| kafka_exporter | Apache Kafka metrics | 9308 |
| jmx_exporter | JVM/Java applications | 9404 |
| kube-state-metrics | K8s object state (pods, deployments) | 8080 |
| dcgm_exporter | NVIDIA GPU metrics | 9400 |

---

**Q: What are recording rules and why use them?**

Recording rules pre-compute expensive PromQL queries and save as new metrics.

```yaml
groups:
  - name: http_metrics
    interval: 30s
    rules:
      # Pre-compute 5-minute error rate
      - record: job:http_requests_total:error_rate5m
        expr: |
          sum by (job) (rate(http_requests_total{status=~"5.."}[5m]))
          /
          sum by (job) (rate(http_requests_total[5m]))
          
      # Pre-compute P95 latency per job
      - record: job:http_request_duration:p95_5m
        expr: |
          histogram_quantile(0.95,
            sum by (job, le) (rate(http_request_duration_seconds_bucket[5m]))
          )
```

**Benefits:**
- Faster dashboard loads (pre-computed, not calculated on query)
- Reduce query load on Prometheus
- Create hierarchical aggregations

---

**Q: How does Prometheus handle high availability?**

Prometheus itself is **not** HA by design (no built-in clustering). Approaches:

1. **Run two identical Prometheus instances** (same config, same targets): Both scrape everything, Alertmanager deduplicates alerts.

2. **Thanos**: Sidecar beside each Prometheus → uploads to object storage (S3/GCS) → unified global query view. Handles long-term retention and cross-cluster queries.

3. **Cortex/Mimir**: Horizontally scalable, multi-tenant Prometheus backend. Grafana Mimir is the most popular today.

4. **VictoriaMetrics**: Drop-in Prometheus replacement with better performance and HA.

**For Kubernetes (Prometheus Operator):**
```yaml
# PrometheusOperator CRD
apiVersion: monitoring.coreos.com/v1
kind: Prometheus
spec:
  replicas: 2                    # HA with 2 replicas
  podMonitorSelector: {}         # Auto-discover PodMonitors
  serviceMonitorSelector: {}     # Auto-discover ServiceMonitors
  retention: 30d
  storage:
    volumeClaimTemplate:
      spec:
        storageClassName: fast-ssd
        resources:
          requests:
            storage: 100Gi
```

## Revision Notes
```
PROMETHEUS: Pull-based monitoring. Scrapes /metrics endpoint.
DATA MODEL: metric_name{label="value"} value timestamp

METRIC TYPES:
Counter: only goes up → use rate()
Gauge: up/down → current values
Histogram: buckets for distributions → histogram_quantile()
Summary: client-side quantiles (not aggregatable cross-instance)

PROMQL ESSENTIALS:
rate(counter[5m]): per-second rate over 5 min
sum/avg/max/min/count by (label): aggregation
histogram_quantile(0.99, rate(bucket[5m])): P99 latency
{label=~"pattern"}: regex match | {label!="value"}: exclude

ALERTING:
Rules in Prometheus → fire to Alertmanager → routes to Slack/PagerDuty/email
for: 5m (pending before firing) | severity labels | runbook annotations

EXPORTERS:
node_exporter: hardware | kube-state-metrics: K8s objects
blackbox: external probes | postgres/redis/kafka: databases/MQ

RECORDING RULES: pre-compute expensive queries → faster dashboards

HA: Run 2 identical instances + Alertmanager dedup
Long-term: Thanos (object storage) | Mimir (scalable backend)
```
