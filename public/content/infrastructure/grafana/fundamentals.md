# Grafana — Fundamentals

## What you're building on this page

Think of Grafana as a window, not a warehouse: it doesn't store any data itself, it just gives you a consistent way to look through it — the same dashboard-and-panel model works whether the data behind the glass is Prometheus metrics, Loki logs, or a Postgres table. Overview covered what Grafana is and why teams pair it with Prometheus; this page is the hands-on half — get a working Grafana + Prometheus stack running locally, then use it to build the dashboards, queries, and alerts below. Everything from here on assumes you have Docker available; if you don't, `installation.md` in this technology covers native-package and Kubernetes/Helm alternatives.

```
docker-compose.yml  →  Grafana container (the "window")
                    →  Prometheus container (one thing behind the glass)
                            │
                    provisioning/datasources/*.yml
                            │
                    Grafana auto-connects to it on startup —
                    no manual "Add data source" click needed
```

## Install & Verify

The fastest path to a working stack is the two-container Docker Compose setup below — Grafana for visualization, Prometheus as its first data source. Save it as `docker-compose.yml` and run `docker compose up -d`; both containers should report `Up` within a few seconds of `docker compose ps`.

```yaml
# docker-compose.yml
services:
  grafana:
    image: grafana/grafana:latest
    ports:
      - "3000:3000"
    environment:
      GF_SECURITY_ADMIN_PASSWORD: "admin123"
      GF_USERS_ALLOW_SIGN_UP: "false"
    volumes:
      - grafana_data:/var/lib/grafana
      - ./provisioning:/etc/grafana/provisioning

  prometheus:
    image: prom/prometheus:latest
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
```

```yaml
# provisioning/datasources/prometheus.yml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    isDefault: true
    jsonData:
      timeInterval: 15s

  - name: Loki
    type: loki
    url: http://loki:3100

  - name: PostgreSQL
    type: postgres
    url: postgres:5432
    database: myapp
    user: grafana_reader
    secureJsonData:
      password: readonly_password
```

**Try it (2 minutes):** with the stack running, open `http://localhost:3000` and log in with `admin` / `admin123` (the password set above). Go to Connections → Data Sources — you should already see Prometheus and Loki listed as provisioned data sources, not something you had to click through a setup wizard to add. That's the point of the `provisioning/` mount: data sources defined as files, not manual UI clicks, so a fresh environment comes up pre-wired. If Prometheus doesn't show as reachable, confirm both containers are on the same Docker Compose network (they are, by default, since they're defined in the same file) and that `prometheus.yml` exists at the path referenced above.

## Building Dashboards

**Key panel types:**
```
Time series:  Line/area chart over time — latency, requests, CPU
Stat:         Single big number — current error rate, active users
Gauge:        Dial/bar showing value in range — CPU %, disk usage
Bar chart:    Category comparison — requests by endpoint
Table:        Tabular data — top 10 slow queries
Logs:         Loki log stream — application logs
Heatmap:      Distribution over time — request latency buckets
```

**Panel configuration pattern:**
```
1. Choose panel type
2. Write query (PromQL, LogQL, SQL depending on data source)
3. Set visualization options (axes, legend, thresholds)
4. Set overrides for specific series
5. Set alert (optional)
```

## Useful PromQL for Dashboards

```promql
# Request rate by endpoint (time series)
sum(rate(http_requests_total[5m])) by (endpoint)

# Error percentage (stat panel with thresholds)
sum(rate(http_requests_total{status=~"5.."}[5m]))
/ sum(rate(http_requests_total[5m])) * 100

# P50/P95/P99 latency (multiple queries in one panel)
# Query A: histogram_quantile(0.50, rate(duration_bucket[5m]))
# Query B: histogram_quantile(0.95, rate(duration_bucket[5m]))
# Query C: histogram_quantile(0.99, rate(duration_bucket[5m]))

# CPU usage per pod
100 - (avg by (pod) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory usage %
(1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100

# Kubernetes pod restarts
increase(kube_pod_container_status_restarts_total[1h])
```

## Dashboard as Code (Provisioning)

```json
// provisioning/dashboards/slo.json
{
  "title": "Application SLOs",
  "panels": [
    {
      "title": "Error Rate",
      "type": "stat",
      "targets": [{
        "expr": "sum(rate(http_requests_total{status=~'5..'}[5m])) / sum(rate(http_requests_total[5m])) * 100",
        "legendFormat": "Error %"
      }],
      "fieldConfig": {
        "defaults": {
          "thresholds": {
            "steps": [
              {"value": 0, "color": "green"},
              {"value": 1, "color": "yellow"},
              {"value": 5, "color": "red"}
            ]
          },
          "unit": "percent"
        }
      }
    }
  ]
}
```

## Alerting in Grafana

```yaml
# Grafana Unified Alerting (Grafana 8+)
# Create alert rule in UI or via API

# Contact points (where alerts go)
POST /api/v1/provisioning/contact-points
{
  "name": "PagerDuty Production",
  "type": "pagerduty",
  "settings": {
    "integrationKey": "$PD_ROUTING_KEY"
  }
}

# Alert rule via API
{
  "title": "High Error Rate",
  "condition": "C",
  "data": [
    {
      "refId": "A",
      "queryType": "",
      "model": {
        "expr": "sum(rate(http_requests_total{status=~'5..'}[5m])) / sum(rate(http_requests_total[5m]))"
      }
    },
    {
      "refId": "C",
      "queryType": "classic_conditions",
      "model": {
        "conditions": [{"evaluator": {"type": "gt", "params": [0.01]}}]
      }
    }
  ],
  "for": "5m",
  "labels": {"severity": "critical"}
}
```

## Best Practices

A few conventions worth adopting from the start — they cost little now and get expensive to retrofit once a team has dozens of dashboards:

- **Provision, don't click-configure.** Data sources and dashboards defined as files (as in the setup above) survive a container restart and can be code-reviewed; dashboards built by hand in the UI and never exported live only in that Grafana instance's database, one `docker volume rm` away from gone.
- **Organize dashboards into folders with real access control**, not a flat list — separate folders per team or environment (e.g., `Production/`, `Staging/`, `Team-Payments/`), with folder-level permissions so a staging dashboard mistake can't be pushed to a production folder by accident.
- **Name variables and panels for what they mean, not what they query.** `$namespace` and `$pod` (used above) read clearly months later; a variable named `$var1` doesn't. The same applies to panel titles — "P95 Latency by Service" is immediately useful in an incident; "Panel 7" is not.
- **Keep alert conditions symptom-based, not cause-based** (this connects directly to the alert-fatigue guidance in Overview's interview section) — alert on "error rate exceeds 1% for 5 minutes," not on every individual cause that could produce that symptom. One well-tuned symptom alert catches every root cause; ten cause-specific alerts mean nine of them fire for problems that don't actually need a human yet.
- **Version-control provisioning configs and dashboard JSON** alongside application code, not as a side artifact — a dashboard that breaks after a metric rename is a regression like any other, and it should be caught in review, not discovered during the next incident.
- **Separate the Grafana admin password from example/demo values immediately in anything beyond a local sandbox** — `admin123` above is fine for the local stack in this section, but treat it as a placeholder to replace via a secrets manager or environment variable before this setup touches anything shared or production-facing.
