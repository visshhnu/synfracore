# Grafana Fundamentals

## What is Grafana?
Grafana is the open-source observability and data visualization platform. It connects to dozens of data sources (Prometheus, Loki, Elasticsearch, CloudWatch, PostgreSQL, and more) and lets you build dashboards, set alerts, and explore metrics and logs in a unified UI.

## Install and Start

```bash
# Docker (quickest)
docker run -d -p 3000:3000 --name grafana grafana/grafana:latest

# Access: http://localhost:3000  admin/admin (change on first login)

# With persistent storage
docker run -d   -p 3000:3000   -v grafana-data:/var/lib/grafana   -e GF_SECURITY_ADMIN_PASSWORD=yourpassword   --name grafana   grafana/grafana:latest
```

```bash
# Kubernetes via Helm
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana   --set adminPassword=admin   --set persistence.enabled=true   --namespace monitoring
```

## Add Data Source

1. Settings → Data Sources → Add data source
2. Select Prometheus → URL: `http://prometheus:9090` → Save & Test
3. Select Loki → URL: `http://loki:3100`

## First Dashboard

1. Create → Dashboard → Add visualization
2. Select data source (Prometheus)
3. Enter PromQL query: `rate(http_requests_total[5m])`
4. Choose visualization type (Time series)
5. Set title, unit, thresholds
6. Save dashboard (Ctrl+S)

## Panel Types
| Panel | Use Case |
|-------|---------|
| Time series | Metrics over time |
| Stat | Single current value |
| Gauge | % of max value |
| Bar chart | Comparisons |
| Table | Multi-column data |
| Heatmap | Distribution over time |
| Logs | Log stream (Loki) |
| Node graph | Service dependencies |

## Variables (Template Variables)

Make dashboards reusable across environments.

```
# Create variable: $namespace
Type: Query
Data source: Prometheus
Query: label_values(kube_pod_info, namespace)

# Use in panels
rate(http_requests_total{namespace="$namespace"}[5m])
```

## Alerting Basics

1. Edit panel → Alert → Create alert rule
2. Set condition: `avg() of query > 100`
3. Set evaluation interval: every 1m, for 5m
4. Add contact point (Slack, PagerDuty, email)
5. Assign notification policy

## Dashboard Best Practices
- Use template variables for env, cluster, service, pod
- Group related panels in rows
- Include a "Key Metrics" row at top with SLI stats
- Add links to runbooks in panel descriptions
- Keep time range selector visible
- Use consistent color themes (red=bad, green=good)
