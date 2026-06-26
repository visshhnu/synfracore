# Grafana — Dashboards, Visualization & Observability

## What is Grafana?

Grafana is an open-source visualization and observability platform. It connects to data sources (Prometheus, Loki, Elasticsearch, CloudWatch, PostgreSQL, etc.) and provides rich dashboards, alerts, and panels.

**Key strengths:**
- Single pane of glass — metrics, logs, traces in one UI
- 50+ data source plugins
- Alerting with routing to Slack, PagerDuty, email
- Grafana Cloud — fully managed SaaS option
- LGTM Stack: Loki (logs) + Grafana + Tempo (traces) + Mimir (metrics)

---

## Core Concepts

### Data Sources
Grafana doesn't store data — it queries external sources:
- **Prometheus** — metrics (most common)
- **Loki** — logs
- **Tempo** — distributed traces
- **Elasticsearch/OpenSearch** — logs/search
- **CloudWatch** — AWS metrics
- **PostgreSQL/MySQL** — relational data
- **Influx DB** — time-series

### Panels
Visualization units inside a dashboard:
- **Time series** — line/area chart for metrics over time
- **Stat** — single big number (current value)
- **Gauge** — circular gauge for utilization %
- **Bar gauge** — horizontal/vertical bar
- **Table** — tabular data display
- **Logs** — log stream viewer (Loki)
- **Traces** — trace viewer (Tempo/Jaeger)
- **Heatmap** — distribution over time
- **Text** — markdown/HTML for documentation panels
- **Alert list** — current firing alerts

### Dashboards
Collection of panels arranged in rows. Key features:
- **Variables** — template variables make dashboards reusable across environments/clusters
- **Time range picker** — global time range control
- **Auto-refresh** — set interval (5s, 30s, 1m, etc.)
- **Annotations** — mark deployments, incidents on all panels
- **Playlists** — rotate dashboards on TV/wall displays

### Alerting
Grafana Unified Alerting (since v8):
- Define alert rules per panel using PromQL/LogQL queries
- Contact points: Slack, PagerDuty, OpsGenie, email, webhook
- Notification policies: route alerts to right contact point based on labels
- Silences: suppress alerts during maintenance

---

## Installation

### Docker (Development)
```bash
docker run -d -p 3000:3000 --name grafana grafana/grafana:latest
# Access: http://localhost:3000 (admin/admin default)
```

### Kubernetes (via Helm — kube-prometheus-stack)
```bash
# This installs Prometheus + Alertmanager + Grafana together
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace \
  --set grafana.adminPassword=yourpassword \
  --set grafana.ingress.enabled=true \
  --set grafana.ingress.hosts[0]=grafana.example.com

# Access Grafana
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring
```

---

## Common Dashboard Setup

### Kubernetes Cluster Dashboard
1. Import dashboard ID **3119** (Kubernetes cluster monitoring) from grafana.com/dashboards
2. Or ID **6417** (Kubernetes pods)
3. Select Prometheus as data source

### Node Exporter Dashboard
```
Dashboard ID: 1860 — Node Exporter Full
Data source: Prometheus
```

### Key PromQL Queries for Grafana Panels
```promql
# CPU Usage %
100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory Usage %
(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100

# HTTP error rate (5xx)
sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))

# Pod restart count
increase(kube_pod_container_status_restarts_total[1h])
```

---

## Production Tips

- **Use variables:** `$cluster`, `$namespace`, `$pod` — makes one dashboard work everywhere
- **Set up recording rules:** Pre-compute expensive PromQL in Prometheus, query the result in Grafana
- **Dashboard as code:** Use Grafana provisioning (YAML/JSON) so dashboards are in Git
- **Folder permissions:** Use RBAC — DevOps team can edit, developers can view
- **Backup dashboards:** Export JSON or use Grizzly/Jsonnet for GitOps-style management
