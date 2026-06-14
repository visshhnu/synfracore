# Prometheus — Certification Guide

## PCA — Prometheus Certified Associate

| Detail | Info |
|---|---|
| **Provider** | CNCF (Cloud Native Computing Foundation) |
| **Cost** | $250 |
| **Validity** | 2 years |
| **Format** | 60 questions, 90 minutes, multiple choice |
| **Passing score** | 75% |
| **Delivery** | Online proctored |

### Domain Breakdown
- **20%** Observability Concepts
- **18%** Prometheus Fundamentals
- **20%** PromQL
- **18%** Instrumentation and Metrics
- **14%** Data Visualization (Grafana)
- **10%** Alerting & Dashboarding

### Key Topics to Study

**PromQL (20% of exam — highest weight):**
- Rate vs increase: `rate(counter[5m])` for per-second, `increase()` for total
- Aggregation operators: `sum`, `avg`, `min`, `max`, `count` with `by()` and `without()`
- `histogram_quantile(0.99, rate(http_duration_bucket[5m]))` — P99 latency
- Offset modifier and subqueries

**Metric Types:**
- Counter: only goes up (requests_total, errors_total)
- Gauge: can go up or down (memory_usage, temperature)
- Histogram: samples observations into buckets (request durations)
- Summary: similar to histogram, calculated client-side (less flexible)

**AlertManager:**
- `route` tree: how alerts are matched and routed to receivers
- `inhibit_rules`: suppress child alerts when parent fires
- `silence`: temporarily mute alerts during maintenance

### Exam Tips
- PromQL is 20% — practice writing queries against real data
- Understand when to use each metric type — common exam scenario questions
- Know the difference between Histogram and Summary (important gotcha)
- AlertManager routing tree — practice reading complex configurations
- Grafana: know how to create panels, use variables, set up alerts

### Study Resources
- **prometheus.io/docs** — official documentation
- **PCA study guide** — training.linuxfoundation.org
- **Awesome Prometheus alerts** — example alert rules to study
- **Grafana Play** — play.grafana.org (free sandbox)
