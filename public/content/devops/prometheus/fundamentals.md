# Prometheus + Grafana — Fundamentals

## What is Prometheus + Grafana?

When a user reports slow responses at 3pm on Tuesday, you need to answer: was it slow before the last deployment? Was it one pod or all pods? Was CPU high or memory? Was the database slow? Without time-series monitoring you can't answer any of these retrospectively. Prometheus records every metric as a timestamped value, forever; Grafana lets you visualise and query that history.

| Step | What happens |
|---|---|
| 1. Application exposes metrics | Your app has a `GET /metrics` endpoint returning Prometheus-format text |
| 2. Prometheus scrapes | Every 15-30 seconds, Prometheus calls `/metrics` on every target |
| 3. Stored as time-series | Each metric value is stored with a timestamp + labels in the local TSDB |
| 4. Grafana queries | Grafana sends PromQL queries to Prometheus and renders charts |
| 5. Alert evaluation | Prometheus evaluates alert rules every ~30 seconds |
| 6. Alertmanager routes | If a rule fires, Alertmanager sends it to Slack/PagerDuty/email |

|  | Prometheus | Datadog | Nagios |
|---|---|---|---|
| Cost | Free and open source | $15+/host/month | Free (but complex) |
| Model | Pull (scrape) | Push (agent) | Check-based |
| Kubernetes | Native, ServiceMonitor CRD | DaemonSet agent | Plugins, not native |
| Query power | PromQL — very powerful | Good | None |
| Best for | K8s, on-prem, multi-cloud, cost-sensitive | SaaS, ease of use, APM | Legacy, simple checks |

```bash
# Install the kube-prometheus-stack (Prometheus + Grafana + Alertmanager together)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace

# Access Grafana (default admin password is auto-generated — check the secret)
kubectl port-forward svc/kube-prometheus-grafana -n monitoring 3000:80
kubectl get secret kube-prometheus-grafana -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 -d
```

## Metric Types — What They Mean

Using the wrong metric type, or the wrong PromQL function for a given type, is the most common Prometheus mistake — a counter used with the wrong function looks like it's always zero or always at max.

```promql
# Counter — only ever increases (or resets on restart). NEVER use the
# raw value directly; always wrap in rate() to get a meaningful number.
http_requests_total                     # WRONG for dashboards — a raw, ever-growing total
rate(http_requests_total[5m])           # RIGHT — requests per second

# Gauge — goes up and down, current-value snapshot. Use directly.
node_memory_MemAvailable_bytes

# Histogram — bucketed observations, use histogram_quantile() for percentiles
histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))

# Summary — client-side pre-computed quantiles, cheaper to store but
# CANNOT be correctly aggregated across instances after the fact —
# prefer Histogram over Summary unless you specifically don't need
# cross-instance aggregation.
```

## PromQL — Essential Queries

PromQL is not SQL — it's designed for time-series data. Key operators: `rate()` for counter speed, `histogram_quantile()` for percentiles, `by()` for grouping, `without()` for removing labels, `topk()` for top N, `avg_over_time()` for a rolling average.

```promql
# CPU usage per pod
rate(container_cpu_usage_seconds_total{namespace="production"}[5m])

# Memory usage as a percentage of the limit
container_memory_working_set_bytes / container_spec_memory_limit_bytes

# Error rate — errors as a fraction of total requests
sum(rate(http_requests_total{status=~"5.."}[5m]))
/
sum(rate(http_requests_total[5m]))

# P99 latency
histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service))

# Top 5 pods by memory usage right now
topk(5, container_memory_working_set_bytes{namespace="production"})

# Pods that restarted in the last hour
increase(kube_pod_container_status_restarts_total[1h]) > 0
```

## Alert Rules — Writing Good Alerts

A good alert is **actionable** (someone waking up at 3am must know exactly what to do), has a **FOR duration** (transient spikes shouldn't fire alerts), has a **runbook_url** (a link to the documented response procedure), **tests symptoms not causes** (alert on high error rate, not on "database connection timeout" specifically), and has the **right severity** (CRITICAL wakes people up, WARNING can wait until morning).

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata: { name: payment-api-alerts }
spec:
  groups:
    - name: payment-api
      rules:
        - alert: HighErrorRate
          expr: |
            sum(rate(http_requests_total{service="payment-api",status=~"5.."}[5m]))
            /
            sum(rate(http_requests_total{service="payment-api"}[5m])) > 0.05
          for: 5m
          labels: { severity: critical }
          annotations:
            summary: "payment-api error rate above 5%"
            runbook_url: "https://runbooks.internal/payment-api-errors"
        - alert: HighMemoryUsage
          expr: |
            container_memory_working_set_bytes{pod=~"payment-api-.*"}
            / container_spec_memory_limit_bytes{pod=~"payment-api-.*"} > 0.9
          for: 10m
          labels: { severity: warning }
          annotations: { summary: "payment-api pod approaching memory limit" }
```

## Alertmanager — Routing Alerts

Alertmanager handles routing, deduplication, grouping, and silencing of alerts — Prometheus evaluates rules and fires alerts, and Alertmanager decides who gets notified, how, and when. Without it, a single incident could generate a separate Slack message for every one of 50 crashing pods; with it, those 50 restarts become one grouped notification.

```yaml
route:
  receiver: default-slack
  group_by: [alertname, service]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  routes:
    - match: { severity: critical }
      receiver: pagerduty
      continue: true
    - match: { severity: critical }
      receiver: slack-critical

receivers:
  - name: slack-critical
    slack_configs:
      - api_url: "$SLACK_WEBHOOK"
        channel: "#alerts-critical"
  - name: pagerduty
    pagerduty_configs:
      - service_key: "$PAGERDUTY_KEY"

inhibit_rules:
  # if a whole service is down, suppress the more specific
  # "high latency" alert for that same service — it's a symptom
  - source_match: { alertname: ServiceDown }
    target_match: { alertname: HighLatency }
    equal: [service]
```

## Troubleshooting

The Prometheus targets page at `http://prometheus:9090/targets` is the first debugging stop — green means scraping successfully, red means failing (with an error message). From there you can determine if the problem is ServiceMonitor labels, network policy, or the application itself.

```bash
# A ServiceMonitor isn't picking up a target — check label matching
kubectl get servicemonitor payment-api -n monitoring -o yaml
kubectl get service payment-api -n production --show-labels
# the ServiceMonitor's selector must match the Service's actual labels exactly

# Confirm the /metrics endpoint actually works
kubectl exec -it prometheus-0 -n monitoring -- \
  wget -qO- http://payment-api.production:8080/metrics | head -20

# Check Prometheus's own logs for scrape errors
kubectl logs prometheus-kube-prometheus-0 -n monitoring | grep -i error
```

## Interview Questions

**What is Prometheus and how does it differ from traditional monitoring tools like Nagios?**
Prometheus is a pull-based, time-series monitoring system — it periodically scrapes metrics from HTTP endpoints on applications and infrastructure. Nagios and Zabbix are check-based — they periodically run a check script ("is the service responding?", "is disk below 90%?") and return OK/WARNING/CRITICAL. The fundamental difference: Prometheus stores actual metric values over time as numbers, enabling powerful queries like trends, rates, and percentile calculations, while Nagios only knows the current state. With Prometheus you can ask "what was the 99th percentile latency last Tuesday between 2pm and 4pm?" or "what's the rate of change in memory usage over the last 6 hours?" — Nagios simply cannot answer these, since it never retained the historical numeric data needed to compute them. Prometheus is also cloud-native by design — built for containers and Kubernetes with native service discovery, while Nagios was designed for a relatively static, long-lived fleet of servers and needs plugins bolted on to work reasonably with dynamic, ephemeral container environments.
