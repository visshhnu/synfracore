# Prometheus — Learning Roadmap

## Time to Job-Ready: 5 weeks (2 hours/day)

**Goal:** Set up comprehensive monitoring with SLO-based alerts and dashboards for any infrastructure.

## Phase 1 — Core Concepts (Week 1-2)
- Understand the pull model: Prometheus scrapes targets on a schedule
- Metric types: Counter, Gauge, Histogram, Summary
- Labels: the key-value pairs that make metrics multi-dimensional
- `prometheus.yml`: `global`, `scrape_configs`, `alerting`
- Deploy with Docker Compose: Prometheus + Node Exporter
- PromQL basics: selectors `{}`, `rate()`, `increase()`, `sum()`, `avg()`

## Phase 2 — Alerting (Week 3)
- Write alert rules in YAML: `groups`, `rules`, `expr`, `for`, `labels`, `annotations`
- AlertManager: `route`, `receiver`, `inhibit_rules`, `silence`
- Notification channels: Slack, PagerDuty, email
- SLO-based alerts: error rate > 1%, P99 latency > 1s
- Alert severity levels: `critical`, `warning`, `info`

## Phase 3 — Production (Week 4)
- Prometheus Operator and ServiceMonitor / PodMonitor CRDs
- Kube-state-metrics and node-exporter for Kubernetes monitoring
- Recording rules: pre-compute expensive queries
- Long-term storage: Thanos or VictoriaMetrics
- High-availability Prometheus: duplicate instances + deduplication

## Phase 4 — Grafana (Week 5)
- Connect Grafana to Prometheus data source
- Build dashboards: panels, variables, time ranges
- Import community dashboards (grafana.com/grafana/dashboards)
- Grafana alerting: migrate from Prometheus alerts to Grafana Unified Alerting
- Dashboard as code: Grafonnet or Terraform Grafana provider

## Certifications
- **PCA** — Prometheus Certified Associate (CNCF, $250)

## Jobs After Prometheus Mastery
SRE · Observability Engineer · Platform Engineer · DevOps Engineer

## Resources
- **prometheus.io/docs** — official documentation
- **Prometheus: Up & Running** by O'Reilly
- **Awesome Prometheus alerts** — github.com/samber/awesome-prometheus-alerts
