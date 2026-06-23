# Prometheus Learning Roadmap

**Goal**: From no monitoring to production observability with Prometheus + Grafana

## Learning Phases

### Phase 1: Basics (1 week)

- What Prometheus is: pull-based time series
- Install with Docker or Kubernetes operator
- prometheus.yml: scrape configs
- Explore metrics in Prometheus UI

### Phase 2: PromQL (2 weeks)

- Instant vectors and range vectors
- Aggregation: sum, avg, rate, irate
- Filtering with label matchers
- Functions: increase, topk, histogram_quantile

### Phase 3: Alerting (1 week)

- Recording rules for pre-computed queries
- Alert rules: expr, for, labels, annotations
- Alertmanager: routing, receivers, silences
- Integrations: Slack, PagerDuty, email

### Phase 4: Integration (2 weeks)

- Node Exporter for host metrics
- kube-state-metrics for Kubernetes
- Application instrumentation (client libraries)
- Service discovery: kubernetes_sd_configs

### Phase 5: Scale & Production (2 weeks)

- Federation for hierarchical Prometheus
- Remote write to Thanos/Mimir/Cortex
- Long-term storage with Thanos
- Grafana dashboards from PromQL

## Job Roles This Enables

- SRE
- DevOps Engineer
- Platform Engineer
- Observability Engineer

## Target Certifications

- Grafana Associate covers Prometheus + Grafana

## How to Use This Roadmap

1. Work through phases in order — each builds on the previous
2. Complete the labs section for each phase before moving on
3. Build a project after each phase to cement learning
4. Use the interview section to test understanding regularly
5. Track progress: revisit earlier sections as concepts compound

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 10-15 weeks (part-time)
Daily practice more effective than weekend marathons
Build real things — theory alone not enough for these tools
Join communities: CNCF Slack, relevant subreddits, Discord servers
```
