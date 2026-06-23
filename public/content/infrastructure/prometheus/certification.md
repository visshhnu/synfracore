# Prometheus Certification Guide

## Certifications Available

No official Prometheus-specific certification exists. Prometheus knowledge tested in:

| Cert | Coverage | Provider |
|------|----------|----------|
| **Grafana Associate** | Prometheus + PromQL + Grafana | Grafana Labs |
| **CKA/CKAD** | Prometheus as cluster monitoring tool | CNCF |
| **AWS/GCP/Azure DevOps** | Managed monitoring equivalents | Cloud vendors |

---

## Grafana Associate Certification — Prometheus Focus

```
Exam: Multiple choice + practical
  PromQL queries
  Grafana dashboard creation
  Alerting rules
  Data source configuration
```

---

## PromQL — The Core Skill

```promql
# ─── SELECTORS ────────────────────────────────────────────────────────
http_requests_total                         # All series with this name
http_requests_total{job="api"}              # Filter by label
http_requests_total{status=~"5.."}          # Regex: 5xx errors
http_requests_total{status!="200"}          # Not equal
http_requests_total[5m]                     # Range vector (last 5 min)

# ─── FUNCTIONS ────────────────────────────────────────────────────────
rate(http_requests_total[5m])               # Per-second rate (for counters)
irate(http_requests_total[5m])              # Instant rate (last 2 samples)
increase(http_requests_total[1h])           # Absolute increase in range

# Use rate() for dashboards (smoothed), irate() for alerts (responsive)

# ─── AGGREGATION ──────────────────────────────────────────────────────
sum(rate(http_requests_total[5m]))                         # Total RPS
sum by (status)(rate(http_requests_total[5m]))             # RPS per status
sum without (instance)(rate(http_requests_total[5m]))      # Remove instance label

avg(node_memory_MemAvailable_bytes) by (instance)
max_over_time(cpu_usage[1h])
topk(5, rate(http_requests_total[5m]))                     # Top 5 endpoints

# ─── HISTOGRAMS & PERCENTILES ─────────────────────────────────────────
histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m]))
# 99th percentile latency — SLO measurement

histogram_quantile(0.50, sum by (le)(rate(http_request_duration_seconds_bucket[5m])))
# Median latency across all instances

# ─── ARITHMETIC & COMPARISON ──────────────────────────────────────────
node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100
# Memory available percentage

(1 - avg(rate(node_cpu_seconds_total{mode="idle"}[5m]))) * 100
# CPU usage percentage

# ─── RECORDING RULES (pre-compute expensive queries) ──────────────────
# In rules file:
groups:
  - name: performance
    interval: 1m
    rules:
      - record: job:http_requests_total:rate5m
        expr: sum by (job)(rate(http_requests_total[5m]))
```

---

## Alert Rules

```yaml
# alerts.yml
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m]))
          / sum(rate(http_requests_total[5m])) > 0.01
        for: 5m                         # Must be true for 5 min before firing
        labels:
          severity: critical
          team: backend
        annotations:
          summary: "High error rate on {{ $labels.job }}"
          description: "Error rate is {{ $value | humanizePercentage }} (threshold: 1%)"

      - alert: NodeMemoryHigh
        expr: |
          (1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) > 0.90
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "Node {{ $labels.instance }} memory > 90%"
```

---

## Prometheus Architecture

```
Scrape targets (apps expose /metrics endpoint)
    ↓ pull every 15s
Prometheus server (TSDB - time series database)
    ↓ evaluate alert rules
Alertmanager (route → silence → inhibit → notify)
    ↓
Receivers: Slack / PagerDuty / Email / OpsGenie

Service discovery (K8s, EC2, Consul, file-based)
Pushgateway: for batch jobs (push instead of pull)
Remote write: to Thanos/Mimir/Cortex for long-term storage
```

## Revision Notes
```
METRIC TYPES:
  Counter: always increases (requests, errors) → use rate()
  Gauge: goes up/down (memory, connections) → use directly
  Histogram: distribution (latency) → histogram_quantile()
  Summary: pre-calculated percentiles (less flexible)

PROMQL PATTERNS:
  Error rate: rate(errors[5m]) / rate(total[5m])
  Latency p99: histogram_quantile(0.99, rate(duration_bucket[5m]))
  CPU: 1 - avg(rate(cpu_seconds_total{mode="idle"}[5m]))
  Memory: 1 - available_bytes / total_bytes

ALERTMANAGER:
  route → receiver (Slack/PD/email)
  group_by: avoid alert storms
  inhibit_rules: suppress child alerts when parent fires
  silences: suppress during maintenance

SCALING: Federation (hierarchical) | Remote write to Thanos (long-term, HA)
```
