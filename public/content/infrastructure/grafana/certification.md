# Grafana Certification Guide

## Certifications Available

| Cert | Full Name | Format | Passing |
|------|-----------|--------|---------|
| **Grafana Associate** | Grafana Certified Associate | MCQ + practical | 70% |
| **Grafana Associate — Loki** | Loki-focused associate | MCQ + practical | 70% |
| Grafana Cloud courses | Free badges on grafana.com/training | Online | — |

Exam available at: **grafana.com/training/certification/**

---

## Exam Domains

| Domain | Coverage |
|--------|----------|
| Data sources & connection | Prometheus, Loki, Tempo, InfluxDB, MySQL |
| PromQL / LogQL queries | Writing queries in dashboard panels |
| Dashboard creation | Panels, variables, links, annotations |
| Alerting | Alert rules, contact points, notification policies |
| Administration | Users, orgs, RBAC, provisioning |

---

## Dashboard Creation Patterns

```
PANEL TYPES:
  Time series: metrics over time (most common)
  Stat: single current value with threshold coloring
  Gauge: current value on a dial
  Bar chart: compare categories
  Table: tabular data with column mapping
  Logs: Loki log streams
  Traces: Tempo distributed traces
  Geomap: geographic data
  Heatmap: distribution over time (histogram data)
  State timeline: state changes over time
  Histogram: distribution of values

VARIABLES (make dashboards dynamic):
  Query: populate from data source (e.g., all namespaces)
  Custom: static list of values
  Textbox: free-form input
  Constant: non-overridable value
  Data source: switch between data sources

  Example variable query for K8s namespaces:
  label_values(kube_namespace_labels, namespace)

  Use in panel: sum(rate(http_requests_total{namespace="$namespace"}[5m]))
```

---

## Alerting in Grafana

```
ALERT RULE COMPONENTS:
  1. Query: PromQL or LogQL expression
  2. Condition: when to fire (Threshold, No data, Error)
  3. Pending period: how long before alerting
  4. Labels: route to correct contact point

CONTACT POINTS: Slack, PagerDuty, Email, OpsGenie, Webhook, Teams
NOTIFICATION POLICIES: label-based routing
  Default policy → specific policies by label
  matchers: [severity=critical] → PagerDuty
  matchers: [severity=warning] → Slack

SILENCES: suppress alerts during maintenance
NOTIFICATION TEMPLATES: customize alert messages with Go templates

ALERT STATE MACHINE:
  Normal → Pending (for: duration) → Firing → Resolved
```

---

## Provisioning (Code as Config)

```yaml
# datasources/prometheus.yaml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    access: proxy
    isDefault: true
    jsonData:
      scrapeInterval: 15s
      httpMethod: POST

# dashboards/dashboards.yaml
apiVersion: 1
providers:
  - name: Default
    type: file
    options:
      path: /etc/grafana/dashboards
```

```bash
# Grafana CLI
grafana-cli plugins install grafana-piechart-panel
grafana-cli admin reset-admin-password newpassword

# API (useful for automation)
curl -H "Authorization: Bearer $API_KEY" http://grafana:3000/api/dashboards/home
```

---

## Study Resources

- **Grafana Fundamentals** (grafana.com/tutorials) — free, official, best starting point
- **Play Grafana** (play.grafana.org) — live playground, no setup needed
- **Grafana YouTube** — free video tutorials
- **Grafana Community** (community.grafana.com) — forums for questions

## Revision Notes
```
GRAFANA = visualization layer for any time-series data source.
Core data sources: Prometheus (metrics) | Loki (logs) | Tempo (traces) | InfluxDB

DASHBOARD ESSENTIALS:
  Variables make dashboards reusable across services/namespaces
  Template variable syntax: $variable or ${variable}
  Panel links and dashboard links for navigation
  Annotations: mark events (deployments, incidents) on time series

ALERTING (Unified Alerting since Grafana 9):
  Alert rules live IN Grafana (not in Prometheus alertmanager for Grafana-managed)
  Contact points = receivers | Notification policies = routing
  Silences = maintenance windows

PROVISIONING: YAML config for datasources and dashboards → GitOps friendly
RBAC: Admin > Editor > Viewer roles | Teams for group permissions
```
