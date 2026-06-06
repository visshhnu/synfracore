# Prometheus + Grafana — Complete Monitoring Guide

Prometheus is the industry-standard metrics monitoring system for Kubernetes and cloud-native environments. Combined with Grafana for visualization and Alertmanager for notifications, it forms the complete open-source observability stack used by thousands of engineering teams.

## Why Prometheus?

When something goes wrong at 3am, you need to answer:
- Was it slow **before** the last deployment?
- Was it **one pod** or all pods?
- Was CPU high, or memory, or network?
- Was the database slow?

Without time-series monitoring, you **cannot answer any of these retrospectively**. Prometheus records every metric as a timestamped value and stores it forever (configurable retention). Grafana lets you visualize and query that history.

## How It Works

```
Step 1: Application exposes metrics
   Your app exposes GET /metrics endpoint
   Returns text like: http_requests_total{status="200"} 1234

Step 2: Prometheus scrapes
   Every 15-30 seconds, Prometheus calls /metrics on every target
   Uses pull model (Prometheus comes to you, not push)

Step 3: Stored as time-series
   Each metric stored with timestamp + labels in local TSDB
   Efficient compression, fast queries

Step 4: Grafana queries
   Grafana sends PromQL queries to Prometheus HTTP API
   Renders beautiful dashboards

Step 5: Alert evaluation
   Prometheus evaluates alert rules every 30 seconds
   Fires alert if condition true for FOR duration

Step 6: Alertmanager routes
   Receives fired alert → routes to Slack/PagerDuty/email
   Handles deduplication, grouping, silencing
```

## Prometheus vs Alternatives

| | Prometheus | Datadog | Nagios | Azure Monitor |
|---|---|---|---|---|
| **Cost** | Free, open source | $15+/host/month | Free (complex) | Free with Azure |
| **Model** | Pull (scrape) | Push (agent) | Check-based | Push |
| **Kubernetes native** | Yes, ServiceMonitor CRD | DaemonSet agent | Plugins | Limited |
| **Query power** | PromQL — very powerful | Good | None | KQL |
| **Best for** | K8s, on-prem, multi-cloud | SaaS ease, APM | Legacy | Azure-only |

## Metric Types

**Counter** — Value that only increases. Resets to 0 on restart.
```
http_requests_total{method="GET", status="200"} 15234
# Always use rate() or increase() — never query raw counter
rate(http_requests_total[5m])  # Requests per second
```

**Gauge** — Value that goes up and down.
```
node_memory_MemAvailable_bytes 4294967296
container_memory_usage_bytes{pod="myapp-xyz"} 134217728
# Query directly or with avg/max/min
avg(container_memory_usage_bytes) by (pod)
```

**Histogram** — Samples observations into configurable buckets. Used for latency.
```
http_request_duration_seconds_bucket{le="0.1"} 890
http_request_duration_seconds_bucket{le="0.5"} 1200
# Use histogram_quantile for percentiles
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))
```

**Summary** — Similar to histogram but calculates quantiles on client side.
```
rpc_duration_seconds{quantile="0.9"} 0.012
```

## Essential PromQL Queries

```promql
# CPU
# Node CPU usage percentage
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Container CPU throttling
rate(container_cpu_throttled_seconds_total[5m])

# Memory
# Node memory available %
(node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100

# Pod memory usage
container_memory_usage_bytes{namespace="production"}

# HTTP
# Request rate per second
rate(http_requests_total[5m])

# Error rate percentage
rate(http_requests_total{status=~"5.."}[5m])
/ rate(http_requests_total[5m]) * 100

# P95 latency
histogram_quantile(0.95,
  rate(http_request_duration_seconds_bucket[5m]))

# Kubernetes
# Pod restarts in last 1 hour
increase(kube_pod_container_status_restarts_total[1h]) > 0

# Pods not running
kube_pod_status_phase{phase!~"Running|Succeeded"} == 1

# Deployment replicas available vs desired
kube_deployment_status_replicas_available
  / kube_deployment_spec_replicas < 0.5

# Node conditions
kube_node_status_condition{condition="Ready",status="true"} == 0

# Disk
# Disk usage % by mount
100 - ((node_filesystem_avail_bytes / node_filesystem_size_bytes) * 100)

# Kubernetes
# Certificate expiry (days remaining)
(x509_cert_expiry - time()) / 86400

# Kafka consumer lag
kafka_consumer_group_lag > 1000
```

## Setup in Kubernetes

```bash
# Install kube-prometheus-stack (everything in one chart)
helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus \
  prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set grafana.adminPassword=YourSecurePassword \
  --set prometheus.prometheusSpec.retention=30d \
  --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage=50Gi

# This installs: Prometheus, Grafana, Alertmanager,
# node_exporter (host metrics), kube-state-metrics (K8s metrics)

# Access Grafana
kubectl port-forward svc/prometheus-grafana 3000:80 -n monitoring
# http://localhost:3000  admin / YourSecurePassword

# Import community dashboards
# 315  = Kubernetes cluster overview
# 6417 = Kubernetes pod monitoring
# 1860 = Node Exporter Full
# 7249 = Kubernetes Cluster
```

## ServiceMonitor — Tell Prometheus What to Scrape

```yaml
# Your app must expose /metrics endpoint
# Then create ServiceMonitor

apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: myapp-metrics
  namespace: production
  labels:
    release: prometheus    # Must match Prometheus selector
spec:
  selector:
    matchLabels:
      app: myapp            # Find Services with this label
  endpoints:
  - port: http              # Port name on the Service
    path: /metrics
    interval: 30s
  namespaceSelector:
    matchNames:
    - production
```

## Alert Rules

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: production-alerts
  namespace: monitoring
spec:
  groups:
  - name: production.rules
    rules:

    # High error rate
    - alert: HighErrorRate
      expr: |
        rate(http_requests_total{status=~"5.."}[5m])
        / rate(http_requests_total[5m]) > 0.05
      for: 5m              # Must be true for 5 min before firing
      labels:
        severity: critical
      annotations:
        summary: "High error rate on {{ $labels.job }}"
        description: "Error rate is {{ $value | humanizePercentage }}"

    # Pod crash loop
    - alert: PodCrashLooping
      expr: increase(kube_pod_container_status_restarts_total[1h]) > 3
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: "Pod {{ $labels.pod }} is crash looping"

    # Certificate expiry
    - alert: CertificateExpiringSoon
      expr: (x509_cert_expiry - time()) / 86400 < 30
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: "Certificate expires in {{ $value | humanizeDuration }}"

    # Node disk pressure
    - alert: NodeDiskSpaceHigh
      expr: |
        100 - (node_filesystem_avail_bytes
               / node_filesystem_size_bytes * 100) > 85
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: "Node {{ $labels.instance }} disk {{ $value }}% full"
```

## Alertmanager Configuration

```yaml
# alertmanager.yaml — Route alerts to Slack and PagerDuty
global:
  resolve_timeout: 5m

route:
  group_by: [alertname, cluster, namespace]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  receiver: slack-default

  routes:
  - matchers:
    - severity = critical
    receiver: pagerduty-critical
    repeat_interval: 1h

  - matchers:
    - severity = warning
    receiver: slack-warnings

receivers:
- name: slack-default
  slack_configs:
  - api_url: https://hooks.slack.com/services/...
    channel: '#alerts'
    title: '[{{ .Status | toUpper }}] {{ .CommonAnnotations.summary }}'
    text: '{{ .CommonAnnotations.description }}'
    send_resolved: true

- name: pagerduty-critical
  pagerduty_configs:
  - service_key: YOUR_PD_SERVICE_KEY
    description: '{{ .CommonAnnotations.summary }}'
```

## Common Issues & Fixes

| Issue | Cause | Fix |
|-------|-------|-----|
| Metrics not in Grafana | ServiceMonitor labels mismatch | Check `kubectl get servicemonitor` — verify labels match Prometheus selector |
| Prometheus OOM crash | Too many metrics or long retention | Set `--storage.tsdb.retention.time=15d`, increase memory limits |
| Alert firing constantly | Threshold too sensitive | Add `for: 5m` — only fires if condition sustained |
| Grafana dashboard blank | Wrong time range or data source | Check Configuration → Data Sources → Test |
| High cardinality slow | Too many unique label values | Remove high-cardinality labels (user_id, request_id) from metrics |
| Targets showing DOWN | App not exposing /metrics | curl http://pod-ip:port/metrics — verify endpoint works |

## Interview Questions

**Explain the Prometheus pull model and why it's better than push.**
Prometheus scrapes metrics from targets by calling their `/metrics` endpoint. In a push model, agents send metrics to a central server. Pull is better because: Prometheus controls the scrape rate (no agent flooding), you can easily see which targets are down (they stop appearing), service discovery is simpler, and you can run Prometheus locally against production safely without affecting it.

**What is a recording rule and when would you use it?**
Recording rules pre-compute expensive PromQL queries and store results as new time-series. Use them when: a dashboard query takes too long, you use the same complex expression in multiple alerts, or you need to aggregate across high-cardinality data. Example: pre-compute hourly request rates per service instead of calculating at query time.

**How do you handle Prometheus high availability?**
Run two identical Prometheus instances scraping the same targets. Both evaluate alerts independently — use Alertmanager's deduplication to prevent double alerts. For long-term storage, use Thanos or Cortex which add global query view, downsampling, and object storage (S3) for unlimited retention.
