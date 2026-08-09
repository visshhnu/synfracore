# Loki + OpenTelemetry Learning Roadmap

**Goal**: From zero log-aggregation experience to production Loki operations, leveraging existing Prometheus knowledge

## Learning Phases

### Phase 1: Loki Fundamentals (1-2 days)

- Loki vs ELK architecture — why label-only indexing is cheaper
- Labels and streams — the same mental model as Prometheus label sets
- LogQL basics — stream selectors, line filters, `| json`/`| logfmt` parsing
- Promtail deployment and automatic Kubernetes pod-label attachment

### Phase 2: LogQL and Alerting (2-3 days)

- Metrics-from-logs queries (`rate`, `sum by`)
- Advanced LogQL — `unwrap`, `quantile_over_time`, deriving metrics from unstructured fields
- Grafana panel and dashboard building from LogQL queries
- Ruler-based alerting directly on log content, not just derived metrics

### Phase 3: Production Storage and Retention (2-3 days)

- Chunk vs. index storage model — what each actually stores and why the distinction matters for cost and query performance
- Retention configuration — `retention_period` + `compactor.retention_enabled` together, not either alone
- Cardinality safety nets — `max_streams_per_user` and what happens when it's hit

### Phase 4: Scaling and Advanced Operations (1 week)

- Distributed/microservices installation mode vs. the `loki-stack` bundled chart
- Independently scaling ingestion vs. query load
- Multi-tenancy configuration
- Alerting rules via the Ruler at scale

### Phase 5: Certification and Interview Readiness (ongoing)

- See `certification.md` for Grafana Labs' current Loki-relevant certification options — treat specifics as `(needs verification — recheck against current source)`
- Practice explaining the chunk-vs-index tradeoff and the ELK-cost comparison out loud — both are recurring interview topics for this guide

## Job Roles This Enables

- Observability/Monitoring Engineer
- Site Reliability Engineer
- DevOps Engineer (logging-focused)
- Platform Engineer maintaining a Grafana-stack-based internal platform

## Target Certifications

See `certification.md` in this guide.

## How to Use This Roadmap

1. If you already know Prometheus/PromQL, Phase 1 will move quickly — treat it as a mapping exercise, not new fundamentals
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and the Installation section's verification steps are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3, once retention/storage concepts are solid enough to configure correctly rather than by trial and error
4. Use the Troubleshooting section's real scenarios as a study aid, not just a reference — working through "why did this fail" builds the same diagnostic instinct an interviewer is testing for
5. Revisit Phase 2's Ruler-based alerting after Phase 3 — retention and storage decisions affect how far back an alert rule can meaningfully query

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 2-3 weeks (part-time), faster with strong prior Prometheus experience
The chunk-vs-index distinction and the retention_period + compactor.retention_enabled
pairing are the two concepts most likely to trip up someone new to Loki specifically —
budget extra review time there even if the rest of the roadmap feels fast
```
