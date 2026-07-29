# Grafana — Prerequisites

## What You Need Before Starting

Grafana is a visualization and alerting layer that sits on top of data sources you need to already understand — the tool itself is genuinely quick to learn, but it can't compensate for not knowing what the underlying metrics/logs actually mean or how to query them.

### 1. Basic PromQL fluency (strongly recommended — this is the real prerequisite, not Grafana's UI)

Most of this course's Grafana material assumes you can already write basic PromQL (`rate()`, `sum by`, `histogram_quantile()`) — Grafana's panels are just a UI wrapped around whatever query you write, and it can't turn a query you don't know how to write into a useful dashboard. If Prometheus/PromQL is entirely new, this platform's dedicated Prometheus/monitoring-fundamentals material (if covering that technology) is worth a pass first — trying to learn Grafana's dashboard-building UI and PromQL simultaneously means neither builds as cleanly as learning them in sequence.

### 2. Basic understanding of what metrics, logs, and traces each are (recommended)

You don't need deep expertise in each, but understanding conceptually that metrics are numeric time-series data (a request count, a latency value), logs are discrete text records of events, and traces follow a single request's path across multiple services, will make this course's Loki (log) and Tempo (trace) sections click faster — Grafana visualizes all three, but they're genuinely different kinds of data requiring different query languages and different mental models.

### 3. Basic Kubernetes familiarity (helpful, not required)

A meaningful share of this course's dashboard examples reference Kubernetes concepts (pods, namespaces, `kube-state-metrics`) since that's an extremely common real-world deployment target for Grafana. If Kubernetes is unfamiliar, the examples will still mostly make sense at a surface level, but a basic pass over this platform's Kubernetes-fundamentals material first will help the Kubernetes-specific dashboard examples land as concrete rather than abstract.

### 4. Comfort with YAML and basic command-line usage (required)

Grafana's provisioning system (data sources, dashboards, alert rules as code) is YAML-based, and this course's material assumes you can read and lightly modify YAML without it being new syntax to decode. Basic Docker familiarity is also assumed for the installation examples (`docker run`, `docker-compose up`) — if these are unfamiliar, a quick pass over basic Docker usage first will remove friction from the Installation section specifically.

### 5. What you do *not* need yet

- Deep Prometheus administration expertise (scrape config tuning, storage internals) — you need to be able to *query* Prometheus effectively, not necessarily administer a Prometheus server from scratch; this course's material focuses on the Grafana side of the relationship
- Frontend/JavaScript/TypeScript skills — not needed for building and using dashboards; only relevant if you specifically want to build custom Grafana panel plugins (covered briefly in this course's Advanced section, clearly marked as an optional specialization, not core material)
- Prior alerting/on-call experience — this platform's dedicated Incident Management technology covers the human/process side; this course covers the technical alerting configuration side, and the two complement each other without either being a strict prerequisite for the other

### Quick self-check

Given the raw metric `http_requests_total` (a counter), can you say what `rate(http_requests_total[5m])` actually computes, and why you can't just use the raw counter value directly on a dashboard panel to show "current request rate"? If yes, you're ready for this course's Fundamentals section — that's the exact kind of PromQL fluency the rest of this material assumes. If that's not immediately clear, spend more time on basic PromQL first; this course teaches Grafana's dashboarding features on top of that foundation, not instead of it.
