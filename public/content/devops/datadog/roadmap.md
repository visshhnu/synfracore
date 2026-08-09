# Datadog Learning Roadmap

**Goal**: From zero Datadog experience to production-ready observability engineering

## Learning Phases

### Phase 1: Datadog Basics (2-3 days)

- Agent architecture and deployment (Kubernetes DaemonSet, host, Docker)
- Metrics vs Logs vs APM traces — the three pillars
- Infrastructure List and Host Map navigation
- Datadog vs Prometheus+Grafana+ELK — the mapping mindset

### Phase 2: Metrics, Dashboards, Monitors (3-4 days)

- Datadog Query Language syntax and metric queries
- Building dashboards with template variables
- Monitors (alerts) — thresholds, notification routing
- SLO tracking — UI-configured and Terraform-as-code

### Phase 3: APM and Distributed Tracing (4-5 days)

- Auto-instrumentation vs manual instrumentation
- Service Map and dependency visualization
- Log-trace correlation (`dd.trace_id`/`dd.span_id` injection)
- Continuous Profiler

### Phase 4: Production Operations (1 week)

- Cost control — trace sampling, log exclusion filters, cardinality management
- Security — PII scrubbing, API/App key scoping
- Meta-monitoring — alerting on the Agent's own health
- Terraform-managed SLOs and Monitors as code

### Phase 5: Migration and Team Onboarding (ongoing)

- Mapping an existing Prometheus/Grafana/ELK stack to Datadog equivalents
- Building the PromQL → Datadog query translation habit
- Onboarding a team used to open-source tooling

## Job Roles This Enables

- Observability/Monitoring Engineer
- Site Reliability Engineer
- DevOps Engineer (monitoring-focused)
- Platform Engineer

## Target Certifications

See `certification.md` in this guide for Datadog's current certification track — treat any specific exam details there as `(needs verification — recheck against current source)` given how frequently vendor certification programs change.

## How to Use This Roadmap

1. Work through phases in order — APM (Phase 3) assumes the metrics/dashboards mental model from Phase 2 is already solid
2. Use the free trial for hands-on practice — this technology doesn't have a separate Labs tab, so the Fundamentals/Intermediate/Advanced code blocks and the Installation section's verification steps are the hands-on material
3. If you already run Prometheus/Grafana/ELK in production, treat Phase 1's Module 04 mapping table as your fastest on-ramp, not optional review
4. Build the portfolio projects in `projects.md` after Phase 3 to cement APM and cost-control skills specifically
5. Use the Interview Prep section's PSR-format answers to practice explaining tradeoffs (cost vs. operational overhead), not just features

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-4 weeks (part-time)
Datadog's biggest learning curve isn't the tool itself — it's translating
observability concepts you may already know from Prometheus/Grafana/ELK
into Datadog's specific query syntax and UI layout
Track a real cost lever early (sampling rate, log exclusion) — cost
control is a recurring interview topic, not just an operational afterthought
```
