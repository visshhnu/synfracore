# Prometheus -- Portfolio Projects

---

## Project 1: Full Monitoring Stack with Alerting

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `prometheus-monitoring-stack`

Complete Prometheus + Grafana + AlertManager stack monitoring a Node.js application.

```yaml
# docker-compose.yml
services:
  prometheus:
    image: prom/prometheus:latest
    ports: ["9090:9090"]
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - ./alerts.yml:/etc/prometheus/alerts.yml

  alertmanager:
    image: prom/alertmanager:latest
    ports: ["9093:9093"]
    volumes:
      - ./alertmanager.yml:/etc/alertmanager/alertmanager.yml

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin123
```

```yaml
# alerts.yml -- SLO-based alerts
groups:
- name: slo
  rules:
  - alert: HighErrorRate
    expr: |
      (sum(rate(http_requests_total{status=~"5.."}[5m]))
       / sum(rate(http_requests_total[5m]))) > 0.01
    for: 5m
    labels: {severity: critical}
    annotations:
      summary: "Error rate {{ $value | humanizePercentage }} exceeds 1% SLO"

  - alert: HighLatency
    expr: |
      histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m])) > 1.0
    for: 5m
    annotations:
      summary: "P99 latency {{ $value }}s exceeds 1s SLO"
```

**Steps:** Full stack via Docker Compose, custom app metrics, Grafana dashboards, Slack alerts

---

## Project 2: Custom Prometheus Exporter

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `custom-prometheus-exporter`

Write a Python exporter that exposes custom business metrics to Prometheus.

```python
from prometheus_client import start_http_server, Gauge, Counter, Histogram
import psutil, time

# Business metrics
active_users  = Gauge("app_active_users", "Currently active users")
orders_total  = Counter("app_orders_total", "Total orders placed", ["status"])
order_value   = Histogram("app_order_value_rupees",
                          "Order value in rupees",
                          buckets=[100, 500, 1000, 5000, 10000])

# System metrics (custom)
disk_io_reads = Counter("system_disk_io_reads_total", "Total disk reads", ["device"])

def collect_metrics():
    while True:
        active_users.set(get_active_user_count())
        disk_io = psutil.disk_io_counters(perdisk=True)
        for device, stats in disk_io.items():
            disk_io_reads.labels(device=device)._value.set(stats.read_count)
        time.sleep(15)

if __name__ == "__main__":
    start_http_server(8000)
    collect_metrics()
```

**Steps:** Expose metrics at `/metrics`, scrape from Prometheus, create Grafana dashboard, write alert rules

---

## Portfolio Checklist
- [ ] Full stack runs with `docker compose up`
- [ ] Alert fires within 5 minutes of threshold breach
- [ ] Grafana dashboard exported as JSON (version controlled)
- [ ] Custom exporter with at least 5 meaningful metrics
- [ ] Can explain: Counter vs Gauge vs Histogram vs Summary
