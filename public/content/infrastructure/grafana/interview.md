# Grafana Interview Questions

## Core Concepts

**Q: What is Grafana? How does it differ from Prometheus?**

Grafana is a visualisation and analytics platform — it queries data sources and renders dashboards.
Prometheus is a time-series database and alerting system that collects metrics.

**They work together:**
- Prometheus: collects, stores, and alerts on metrics
- Grafana: visualises Prometheus data (and 50+ other sources) in dashboards

**Grafana data sources**: Prometheus, Loki (logs), Tempo (traces), InfluxDB, Elasticsearch, PostgreSQL, CloudWatch, Datadog, and more.

**Grafana** (visualisation) + **Prometheus** (metrics) + **Loki** (logs) + **Tempo** (traces) = Grafana LGTM Stack (open source observability stack).

---

**Q: Walk me through building a dashboard.**

```
1. Add data source → Settings → Data Sources → Add Prometheus (URL: http://prometheus:9090)
2. Create Dashboard → Add Panel
3. Select data source (Prometheus), write PromQL query
4. Choose visualization type (Time series, Gauge, Stat, Table, Bar chart)
5. Configure display: unit, thresholds, legend
6. Set time range and refresh interval
7. Add variables for dynamic dashboards (select environment, host)
8. Save and set permissions
```

**Key panel types:**
- **Time series**: Metrics over time (CPU, request rate)
- **Stat**: Single current value with colour threshold
- **Gauge**: Current value with min/max
- **Table**: Tabular data (top N queries, server list)
- **Logs**: Log viewer (with Loki datasource)
- **Traces**: Distributed trace viewer (with Tempo)

---

**Q: Grafana variables — how do they work?**

Variables make dashboards dynamic — filter by environment, host, service without editing queries.

```
Dashboard Settings → Variables → Add variable

Type: Query
Data source: Prometheus
Query: label_values(up, instance)  # Get all instance label values
Name: instance
Multi-value: true  # Allow selecting multiple
Include All: true
```

```promql
# Use variable in panel query
rate(http_requests_total{instance="$instance", job="$job"}[5m])
```

Dropdown appears at top of dashboard. Change selection → all panels update.

---

**Q: Grafana alerting.**

```yaml
# Alert rule in Grafana UI:
Name: High Error Rate
Query: sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))
Condition: IS ABOVE 0.05   # 5% error rate
For: 5m                    # Must be true for 5 minutes
Labels: severity=critical, team=backend
Annotations:
  summary: "High error rate {{ $value | printf "%.1f" }}%"
  
Contact points: Slack (#alerts channel), PagerDuty
Notification policies: severity=critical → PagerDuty | severity=warning → Slack
```

**Grafana Alerting vs Prometheus Alertmanager:**
- Both can trigger alerts; Grafana can alert on any data source (not just Prometheus)
- Prometheus Alertmanager: more mature, used by many existing setups
- Grafana Alerting: unified across all data sources, better for multi-source correlation

---

**Q: Grafana as Code — how to manage dashboards in Git?**

```bash
# grafonnet (Jsonnet library for Grafana dashboards)
# OR Grafana dashboard JSON exported and stored in Git

# Helm chart with ConfigMap approach
kubectl create configmap grafana-dashboards   --from-file=dashboard.json   -n monitoring

# Grafana dashboard sidecar reads ConfigMaps with label
# grafana_dashboard: "1"
```

**Grafana Terraform provider:**
```hcl
resource "grafana_dashboard" "my_dashboard" {
  config_json = file("dashboards/my-dashboard.json")
  folder      = grafana_folder.devops.id
}
```

**Best practice**: Store dashboard JSON in Git, provision via Helm/Terraform, prevent manual edits in Grafana UI (or reconcile back to Git).

## Revision Notes
```
GRAFANA: Visualisation layer. Queries multiple data sources → dashboards.
Prometheus: collects/stores/alerts. Grafana: visualises Prometheus (and more).

LGTM STACK (open source):
Loki (logs) + Grafana (UI) + Tempo (traces) + Mimir (Prometheus-compatible scale)

PANEL TYPES: Time series, Stat, Gauge, Table, Logs, Traces, Heatmap
DATA SOURCES: Prometheus, Loki, Tempo, InfluxDB, CloudWatch, PostgreSQL, Elasticsearch

VARIABLES: label_values() query → dropdown → filter panels dynamically
Template syntax: {instance="$instance"}

ALERTING:
Alert rules → Contact points (Slack, PagerDuty, email) → Notification policies
Can alert on ANY data source (advantage over Prometheus-only alerting)
for: 5m (must be sustained before firing)

DASHBOARD AS CODE:
Store JSON in Git | Helm ConfigMap + sidecar | Terraform grafana_dashboard resource
Prevents config drift | Enables review workflow
```
