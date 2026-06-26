# Prometheus + Grafana

> **Metrics collection, PromQL, alerting and dashboards**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Prometheus + Grafana?

Prometheus scrapes metrics from targets (pull model) on a schedule. Metrics are stored as time series — a metric name + labels + timestamp + value. Four metric types: Counter (always increases — request count), Gauge (up/down — memory usage), Histogram (distribution — response time buckets), Summary (quantiles — P99 latency). Labels add dimensions but high cardinality (millions of label combos) kills Prometheus performance.

## Why Prometheus + Grafana?

PromQL is what interviewers test. rate() calculates per-second rate of a counter over a time window — always use rate() on counters, never raw counter values. histogram_quantile(0.99, ...) calculates P99 latency from histogram buckets. Recording rules pre-compute expensive queries so dashboards are fast. Always use by() to split metrics by meaningful labels.

---

## Learning Modules

### Module 01 — What is Prometheus?
*Pull-based metrics, time series*

Prometheus scrapes metrics from targets (pull model) on a schedule. Metrics are stored as time series — a metric name + labels + timestamp + value. Four metric types: Counter (always increases — request count), Gauge (up/down — memory usage), Histogram (distribution — response time buckets), Summary (quantiles — P99 latency). Labels add dimensions but high cardinality (millions of label combos) kills Prometheus performance.

**Topics covered:**

- Pull vs push model — 🟢 Beginner
- Metrics types: counter, gauge, histogram, summary — 🟡 Intermediate
- Labels and cardinality — 🟡 Intermediate
- Scrape config and service discovery — 🟡 Intermediate

```bash
# prometheus.yml — basic scrape config
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  # Scrape Prometheus itself
  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']

  # Kubernetes pod auto-discovery
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    relabel_configs:
      # Only scrape pods with annotation prometheus.io/scrape: "true"
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        target_label: __address__
        regex: (.+)
        replacement: \\${1}:\\${2}

  # Node exporter — host metrics
  - job_name: node
    static_configs:
      - targets: ['node-exporter:9100']
```

### Module 02 — PromQL — The Query Language
*Rate, sum, histogram_quantile*

PromQL is what interviewers test. rate() calculates per-second rate of a counter over a time window — always use rate() on counters, never raw counter values. histogram_quantile(0.99, ...) calculates P99 latency from histogram buckets. Recording rules pre-compute expensive queries so dashboards are fast. Always use by() to split metrics by meaningful labels.

**Topics covered:**

- rate() and irate() — 🟡 Intermediate
- sum() by label — 🟡 Intermediate
- histogram_quantile() for P99 — 🔴 Advanced
- Recording rules for expensive queries — 🔴 Advanced
- Boolean operators and filtering — 🟡 Intermediate

```bash
# PromQL — essential queries for production

# Error rate (% of requests that are 5xx)
sum(rate(http_requests_total{status=~"5.."}[5m])) /
sum(rate(http_requests_total[5m])) * 100

# P99 latency from histogram
histogram_quantile(0.99,
  sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service))

# CPU usage per pod (cores)
sum(rate(container_cpu_usage_seconds_total{container!=""}[5m]))
  by (pod, namespace)

# Memory usage as % of limit
container_memory_working_set_bytes
  / container_spec_memory_limit_bytes * 100

# Kafka consumer lag
kafka_consumergroup_lag_sum{consumergroup="payment-processor"}

# Requests per second by service
sum(rate(http_requests_total[5m])) by (service)

# Recording rule — pre-compute expensive query
groups:
- name: recording_rules
  rules:
  - record: job:http_requests:rate5m
    expr: sum(rate(http_requests_total[5m])) by (job)
  - record: job:http_errors:rate5m
    expr: sum(rate(http_requests_total{status=~"5.."}[5m])) by (job)
```

### Module 03 — AlertManager
*Routes, receivers, silences, inhibition*

AlertManager handles deduplication, grouping, silencing and routing of alerts. Routing tree: route alerts to the right team based on labels. Inhibition: suppress child alerts when parent alert fires (e.g. suppress all app alerts when node is down). Silences: temporary muting during maintenance. Always check silences first when an expected alert is not firing.

**Topics covered:**

- Alert rules in PrometheusRule — 🟡 Intermediate
- AlertManager routing tree — 🔴 Advanced
- Slack and PagerDuty receivers — 🟡 Intermediate
- Silences and inhibition rules — 🟡 Intermediate
- Debugging firing alerts — 🔴 Advanced

```bash
# PrometheusRule — define alerts (on OCP/K8s)
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: app-alerts
  namespace: production
spec:
  groups:
  - name: app.slo
    rules:
    - alert: HighErrorRate
      expr: |
        sum(rate(http_requests_total{status=~"5.."}[5m]))
        / sum(rate(http_requests_total[5m])) > 0.01
      for: 5m          # Must be true for 5 min before firing
      labels:
        severity: critical
        team: platform
      annotations:
        summary: "Error rate above 1% SLO"
        runbook: "https://wiki/runbooks/high-error-rate"

# alertmanager.yml — route critical to PagerDuty
route:
  receiver: slack-general
  group_by: [alertname, cluster]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  routes:
  - match:
      severity: critical
    receiver: pagerduty
  - match:
      team: platform
    receiver: slack-platform

receivers:
- name: pagerduty
  pagerduty_configs:
  - routing_key: <PAGERDUTY_KEY>
- name: slack-platform
  slack_configs:
  - api_url: <WEBHOOK>
    channel: '#platform-alerts'
    title: '{{ .CommonAnnotations.summary }}'

# Inhibition — suppress app alerts when node is down
inhibit_rules:
- source_match:
    alertname: NodeDown
  target_match_re:
    alertname: .*
  equal: [node]
```

### Module 04 — Grafana
*Dashboards as code, panels, variables*

Grafana visualizes Prometheus metrics. Every service should have a RED dashboard: Rate (requests/second), Errors (error rate %), Duration (P50/P95/P99 latency). Dashboard variables make one dashboard work for all namespaces/services. Store dashboards as JSON in Git — never recreate manually. Grafana Terraform provider manages dashboards as code.

**Topics covered:**

- Prometheus data source setup — 🟢 Beginner
- Dashboard variables for dynamic filtering — 🟡 Intermediate
- Key panels: RED metrics — 🟡 Intermediate
- Alerting in Grafana vs AlertManager — 🟡 Intermediate
- Dashboard as code (JSON/Terraform) — 🔴 Advanced

```bash
# Key Grafana panels for every service (RED method)
# Panel 1: Request Rate
# PromQL: sum(rate(http_requests_total[5m])) by (service)
# Visualization: Time series

# Panel 2: Error Rate %
# PromQL: sum(rate(http_requests_total{status=~"5.."}[5m]))
#         / sum(rate(http_requests_total[5m])) * 100
# Thresholds: green<1, yellow<5, red>5

# Panel 3: P99 Latency
# PromQL: histogram_quantile(0.99,
#   sum(rate(http_request_duration_seconds_bucket[5m])) by (le))
# Unit: seconds → milliseconds

# Panel 4: Pod restarts (signals instability)
# PromQL: increase(kube_pod_container_status_restarts_total[1h])

# Import dashboard via API (store dashboards as code)
curl -X POST \\\\
  -H "Content-Type: application/json" \\\\
  -d @my-dashboard.json \\\\
  http://admin:password@grafana:3000/api/dashboards/import

# Grafana dashboard variable — makes one dashboard work for all namespaces
# Variable name: namespace
# Type: Query
# Query: label_values(kube_pod_info, namespace)
# Use in panels: {namespace="$namespace"}
```

### Module 05 — Production Setup on Kubernetes
*kube-prometheus-stack Helm chart*

In production, deploy Prometheus using the kube-prometheus-stack Helm chart — it installs Prometheus, Grafana, AlertManager, node-exporter, kube-state-metrics all pre-configured. ServiceMonitor CRD tells Prometheus which services to scrape without editing prometheus.yml. Thanos extends Prometheus with unlimited retention and global querying across clusters.

**Topics covered:**

- kube-prometheus-stack Helm chart — 🟡 Intermediate
- ServiceMonitor CRD — 🟡 Intermediate
- Persistent storage for metrics — 🟡 Intermediate
- Thanos for long-term retention — 🔴 Advanced

```bash
# Install kube-prometheus-stack
helm repo add prometheus-community \\\\
  https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring \\\\
  prometheus-community/kube-prometheus-stack \\\\
  --namespace monitoring \\\\
  --create-namespace \\\\
  --values prometheus-values.yaml

# prometheus-values.yaml (key settings)
prometheus:
  prometheusSpec:
    retention: 30d
    storageSpec:
      volumeClaimTemplate:
        spec:
          storageClassName: managed-premium
          resources:
            requests:
              storage: 100Gi

grafana:
  adminPassword: "changeme"
  persistence:
    enabled: true
    size: 10Gi

alertmanager:
  config:
    global:
      slack_api_url: <WEBHOOK>

# ServiceMonitor — tell Prometheus to scrape your app
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: myapp
  namespace: production
spec:
  selector:
    matchLabels:
      app: myapp
  endpoints:
  - port: metrics        # Port name in Service spec
    interval: 30s
    path: /metrics
```

---

## Production Example

```bash
# Prometheus Troubleshooting Guide

# ── ALERT FIRING BUT NOTHING LOOKS WRONG ──────────────────
# 1. Check silences first
# Prometheus UI → Alerting → Silences

# 2. Query the exact metric in Prometheus UI
# If alert threshold is 0.01 (1%), query:
sum(rate(http_requests_total{status=~"5.."}[5m])) /
sum(rate(http_requests_total[5m]))

# 3. Check if alert labels still match the rule
kubectl get prometheusrule -n monitoring -o yaml

# 4. Check AlertManager is receiving alerts
kubectl logs -n monitoring alertmanager-0 | grep -i "dispatch\\|route"

# 5. Verify AlertManager config
kubectl exec -n monitoring alertmanager-0 -- \\\\
  amtool check-config /etc/alertmanager/alertmanager.yml

# ── PROMETHEUS TARGET DOWN ─────────────────────────────────
# Prometheus UI → Status → Targets
# Common causes:
# - Pod label changed → ServiceMonitor selector no longer matches
# - /metrics endpoint not exposed
# - Network policy blocking Prometheus scrape port

# Check what Prometheus is trying to scrape
kubectl get servicemonitor -n production -o yaml | grep -A5 selector

# ── HIGH CARDINALITY (Prometheus OOM) ─────────────────────
# Query cardinality of a metric
# Prometheus UI: http_requests_total
# If result has 10,000+ series → cardinality problem
# Fix: remove high-cardinality labels (user_id, request_id from metrics)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Prometheus + Grafana and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Prometheus + Grafana work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Prometheus + Grafana?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Prometheus + Grafana?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Prometheus + Grafana?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Prometheus + Grafana in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Prometheus + Grafana?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Prometheus + Grafana compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is Prometheus? in Prometheus + Grafana."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain PromQL — The Query Language in Prometheus + Grafana."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [PromQL Tutorial](https://prometheus.io/docs/prometheus/latest/querying/basics/)
- [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*