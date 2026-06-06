# Grafana — Visualization & Observability Platform

Grafana is the industry-standard open-source platform for monitoring visualization. It doesn't store data — it queries data sources (Prometheus, Loki, Elasticsearch, CloudWatch, and 100+ others) and renders dashboards, sets alerts, and provides a unified observability UI.

## What Grafana Provides

- **Dashboards** — Beautiful, interactive charts from any data source
- **Alerting** — Unified alert rules with routing to Slack, PagerDuty, email
- **Explore** — Ad-hoc query interface for debugging
- **Annotations** — Mark deployments/incidents on graphs
- **Variables** — Dynamic dashboards (filter by environment, pod, namespace)
- **Plugins** — 150+ data source plugins

## Data Sources

```bash
# Most common data sources:
# Prometheus    — metrics (K8s, applications)
# Loki          — logs (Kubernetes logs)
# Elasticsearch — logs and search
# CloudWatch    — AWS metrics and logs
# Azure Monitor — Azure metrics
# InfluxDB      — time-series metrics
# PostgreSQL    — relational data for business metrics
# Jaeger/Tempo  — distributed traces
```

## Essential Dashboard Panels

```
Time series  — Line charts for metrics over time (CPU, memory, requests)
Stat         — Single big number with trend (current error rate, uptime)
Gauge        — Dial showing value vs thresholds (disk usage %)
Bar chart    — Comparisons across categories
Table        — Detailed data with sorting and filtering
Logs         — Log stream from Loki or Elasticsearch
Heatmap      — Request latency distributions over time
Geomap       — Geographic distribution of traffic
```

## PromQL Dashboard Queries

```promql
# CPU Usage by Pod — time series
rate(container_cpu_usage_seconds_total{
  namespace="$namespace",
  pod=~"$pod"
}[5m]) * 100

# Memory Usage — gauge (% of limit)
(
  container_memory_working_set_bytes{namespace="$namespace", pod=~"$pod"}
  /
  container_spec_memory_limit_bytes{namespace="$namespace", pod=~"$pod"}
) * 100

# HTTP Request Rate — time series with status breakdown
sum by (status_code) (
  rate(http_requests_total{job="$job"}[5m])
)

# P50/P95/P99 Latency — overlay on same graph
histogram_quantile(0.50, sum(rate(http_request_duration_seconds_bucket{job="$job"}[5m])) by (le))
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket{job="$job"}[5m])) by (le))
histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket{job="$job"}[5m])) by (le))

# Error Rate as percentage — stat panel
(
  sum(rate(http_requests_total{status=~"5.."}[5m]))
  /
  sum(rate(http_requests_total[5m]))
) * 100

# Pod Restarts in last 24h — table
sort_desc(
  sum by (pod, namespace) (
    increase(kube_pod_container_status_restarts_total[24h])
  )
)
```

## Variables — Dynamic Dashboards

```
# Create dashboard variables (Dashboard Settings → Variables)

# Variable: namespace
Type: Query
Query: label_values(kube_pod_info, namespace)
Multi-value: true
Include All: true

# Variable: pod (depends on namespace)
Type: Query
Query: label_values(kube_pod_info{namespace=~"$namespace"}, pod)
Regex: /^(.*)-[a-z0-9]+-[a-z0-9]+$/  # Strip pod hash

# Variable: environment
Type: Custom
Values: dev,staging,prod

# Use in queries:
container_cpu_usage_seconds_total{namespace="$namespace", pod=~"$pod"}
```

## Alert Rules in Grafana

```yaml
# Grafana managed alerts (via UI or provisioning)

# Create via Provisioning (rules as code)
# /etc/grafana/provisioning/alerting/rules.yaml
apiVersion: 1
groups:
  - orgId: 1
    name: Production Alerts
    folder: Alerts
    interval: 1m
    rules:
      - uid: high-error-rate
        title: High Error Rate
        condition: C
        data:
          - refId: A
            datasourceUid: prometheus
            model:
              expr: |
                sum(rate(http_requests_total{status=~"5.."}[5m]))
                / sum(rate(http_requests_total[5m])) * 100
          - refId: C
            datasourceUid: __expr__
            model:
              type: threshold
              conditions:
                - evaluator:
                    type: gt
                    params: [5]   # Alert if >5% errors
                  query:
                    params: [A]
        noDataState: NoData
        execErrState: Error
        for: 5m
        annotations:
          summary: "Error rate {{ $values.A.Value | printf \"%.2f\" }}% on {{ $labels.job }}"
        labels:
          severity: critical
        isPaused: false
```

## Grafana Alerting — Contact Points

```yaml
# /etc/grafana/provisioning/alerting/contact_points.yaml
apiVersion: 1
contactPoints:
  - orgId: 1
    name: Slack Production
    receivers:
      - uid: slack-prod
        type: slack
        settings:
          url: https://hooks.slack.com/services/...
          channel: "#production-alerts"
          title: |
            {{ if eq .Status "firing" }}🔴{{ else }}✅{{ end }}
            {{ .CommonAnnotations.summary }}
          text: |
            *Severity:* {{ .CommonLabels.severity }}
            *Started:* {{ .StartsAt | timeZone "Asia/Kolkata" }}

  - orgId: 1
    name: PagerDuty Critical
    receivers:
      - uid: pagerduty
        type: pagerduty
        settings:
          integrationKey: YOUR_PD_INTEGRATION_KEY
          severity: critical
          class: "{{ .CommonLabels.alertname }}"
          component: "{{ .CommonLabels.job }}"
```

## Loki — Log Queries in Grafana

```logql
# Basic log stream
{namespace="production", pod=~"myapp-.*"}

# Filter by content
{namespace="production"} |= "ERROR"

# Parse JSON logs and filter
{namespace="production"} 
  | json 
  | level="error" 
  | line_format "{{.timestamp}} {{.message}}"

# Count errors over time (metric from logs)
sum(rate({namespace="production"} |= "ERROR" [5m])) by (pod)

# Extract and visualize response times from logs
{job="nginx"} 
  | pattern '<_> <_> <_> "<method> <uri> <_>" <status> <bytes> <_> "<_>" <duration>'
  | unwrap duration 
  | quantile_over_time(0.95, [5m]) by (uri)
```

## Production Dashboard: Kubernetes Cluster Overview

```
Row 1: Cluster Health
  - Stat: Node count (healthy/total)
  - Stat: Pod count (running/total)
  - Stat: CPU utilization (%)
  - Stat: Memory utilization (%)

Row 2: Workloads
  - Time series: Pod CPU usage by namespace
  - Time series: Pod memory usage by namespace
  - Table: Top 10 CPU consumers (pods)
  - Table: Pods not Running

Row 3: Application Performance
  - Time series: Request rate (RPS) by service
  - Time series: Error rate (%) by service
  - Time series: P95 latency by service
  - Heatmap: Latency distribution

Row 4: Infrastructure
  - Heatmap: Node CPU per AZ
  - Time series: Disk usage trend
  - Time series: Network I/O
  - Table: Node resource allocation
```

## Import Community Dashboards

```bash
# Best Grafana dashboard IDs to import immediately:
# 315   - Kubernetes cluster monitoring
# 6417  - Kubernetes pod monitoring
# 1860  - Node Exporter Full
# 12006 - Kubernetes Networking
# 7249  - Kubernetes Cluster (resource requests)
# 13659 - Kubernetes Deployments
# 14584 - ArgoCD
# 10991 - Prometheus stats

# Import via Grafana UI:
# + → Import → Enter dashboard ID → Load → Select data source → Import
```

## Interview Questions

**What is the difference between Grafana and Prometheus?**
Prometheus is a time-series database — it scrapes, stores, and evaluates metrics. Grafana is a visualization layer — it has no storage, just queries Prometheus (and 100+ other sources) via PromQL and renders the results as dashboards. Think of Prometheus as the database and Grafana as the dashboard on top. You can use Grafana without Prometheus (with other data sources), and Prometheus without Grafana (via its built-in expression browser), but together they are the industry-standard monitoring stack.

**How do you avoid alert fatigue?**
Alert only on symptoms that affect users (SLO violations), not causes. Use `for: 5m` — only alert if condition sustained, not on brief spikes. Group related alerts. Set correct severity levels — critical means wake someone up at 3am. Use inhibition rules — if the cluster is down, suppress pod-level alerts. Do monthly alert reviews — delete alerts that haven't fired in 6 months or have never led to action. The best alert is one that requires action every time it fires.
