# Loki + OpenTelemetry

> **Label-based log aggregation + unified observability signals**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Loki + OpenTelemetry?

Loki indexes only labels (like Prometheus), not log content. This makes it much cheaper than ELK for high-volume logs. Loki is the native log backend for Grafana — no extra UI needed. LogQL is similar to PromQL. Promtail is the log collection agent (like Filebeat for ELK). Choose Loki when you already use Prometheus+Grafana and want to keep your stack consistent.

## Why Loki + OpenTelemetry?

Metrics answer "what is happening now" — CPU at 90%, error rate 2%. Logs answer "what happened and when" — show the actual error message. Traces answer "why is it slow" — show the full request path across services with timing. In Grafana you can link from a metric spike → to the logs at that timestamp → to the trace of that request. This correlation is the power of the unified stack.

---

## Learning Modules

### Module 01 — Grafana Loki
*Label-indexed logs, LogQL*

Loki indexes only labels (like Prometheus), not log content. This makes it much cheaper than ELK for high-volume logs. Loki is the native log backend for Grafana — no extra UI needed. LogQL is similar to PromQL. Promtail is the log collection agent (like Filebeat for ELK). Choose Loki when you already use Prometheus+Grafana and want to keep your stack consistent.

**Topics covered:**

- Loki vs ELK architecture — 🟢 Beginner
- Labels and streams — 🟡 Intermediate
- LogQL query language — 🟡 Intermediate
- Log pipeline stages — 🔴 Advanced
- Promtail agent — 🟡 Intermediate

```bash
# LogQL — Loki query language

# Stream selector (required) — filter by labels
{namespace="production", app="payment"}

# Log pipeline — filter and parse
{app="payment"} |= "ERROR"        # grep for ERROR
{app="payment"} != "health"       # exclude health checks
{app="payment"} | json            # parse JSON logs
{app="payment"} | json | status >= 500

# Metrics from logs — count errors per minute
sum(rate({app="payment"} |= "ERROR" [5m])) by (pod)

# Extract field and aggregate
sum by (status) (
  rate({app="nginx"}
    | logfmt
    | status =~ "5.." [5m])
)

# Promtail config — ship K8s pod logs to Loki
server:
  http_listen_port: 9080

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    pipeline_stages:
      - docker: {}      # Parse Docker log format
      - json:
          expressions:
            level: level
            message: msg
      - labels:
          level:
```

### Module 02 — Three Pillars of Observability
*Metrics + Logs + Traces unified*

Metrics answer "what is happening now" — CPU at 90%, error rate 2%. Logs answer "what happened and when" — show the actual error message. Traces answer "why is it slow" — show the full request path across services with timing. In Grafana you can link from a metric spike → to the logs at that timestamp → to the trace of that request. This correlation is the power of the unified stack.

**Topics covered:**

- Metrics (Prometheus) — WHAT happened — 🟢 Beginner
- Logs (Loki/ELK) — WHAT happened + context — 🟢 Beginner
- Traces (Tempo/Jaeger) — WHY it is slow — 🟡 Intermediate
- Correlating pillars in Grafana — 🔴 Advanced

```bash
# Unified observability in Grafana (Explore view)
# 1. Start with Prometheus metric — error rate spike at 14:23
#    sum(rate(http_requests_total{status=~"5.."}[5m]))

# 2. Jump to logs at same timestamp (Derived Fields in Grafana)
#    From Prometheus: click spike → "View logs"
#    Loki: {app="payment"} |= "ERROR" | timestamp > 14:20

# 3. From log line, click trace ID → jump to Tempo trace
#    See full call chain: API → Service → DB
#    DB query took 8 seconds — root cause found

# Grafana data source linking
# In Loki data source settings:
# Derived Fields:
#   - Name: TraceID
#   - Regex: traceID=(\\w+)
#   - URL: http://tempo:3000/explore?traceId=${__value.raw}
#   This turns trace IDs in logs into clickable links to Tempo

# Example: structured log with trace ID
{"level":"ERROR","msg":"DB timeout","traceID":"abc123def456","duration_ms":8234}
```

### Module 03 — OpenTelemetry
*Unified instrumentation standard*

OpenTelemetry (OTel) is the CNCF standard for instrumentation. Instead of separate Prometheus client, Jaeger SDK, and log library in each service — one OTel SDK emits all three signals. The OTel Collector receives signals and routes them to any backend (Prometheus, Loki, Tempo, Datadog, Jaeger). Vendor-neutral: switch monitoring backends without changing application code.

**Topics covered:**

- OTel SDK vs per-tool clients — 🟡 Intermediate
- OTel Collector — routing hub — 🔴 Advanced
- Auto-instrumentation — 🟡 Intermediate
- Migrate from Jaeger/Zipkin to OTel — 🔴 Advanced

```bash
# OTel Collector — the routing hub
# collectors/otel-config.yaml
receivers:
  otlp:                       # Receives from apps via OTel SDK
    protocols:
      grpc:
        endpoint: 0.0.0.0:4317
      http:
        endpoint: 0.0.0.0:4318
  prometheus:                 # Also scrape existing Prometheus metrics
    config:
      scrape_configs:
        - job_name: myapp
          static_configs:
            - targets: ['myapp:8080']

processors:
  batch:
    timeout: 5s
  resource:                   # Add environment label to everything
    attributes:
    - key: environment
      value: production
      action: upsert

exporters:
  prometheus:                 # Metrics → Prometheus
    endpoint: "0.0.0.0:8889"
  loki:                       # Logs → Loki
    endpoint: http://loki:3100/loki/api/v1/push
  otlp/tempo:                 # Traces → Tempo
    endpoint: http://tempo:4317
  datadog:                    # OR: everything → Datadog
    api:
      key: \\${DATADOG_API_KEY}

service:
  pipelines:
    metrics:
      receivers: [otlp, prometheus]
      processors: [batch, resource]
      exporters: [prometheus]
    logs:
      receivers: [otlp]
      processors: [batch]
      exporters: [loki]
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlp/tempo]
```

---

## Production Example

```bash
# ELK vs Loki — Decision Framework

# CHOOSE LOKI when:
# ✓ Already running Prometheus + Grafana
# ✓ High log volume (cost is a concern)
# ✓ Structured logs with consistent labels
# ✓ Kubernetes-native workloads
# ✓ Want single UI (Grafana for metrics AND logs)

# CHOOSE ELK when:
# ✓ Need full-text search across all log content
# ✓ Complex log parsing (Logstash grok patterns)
# ✓ Existing ELK investment
# ✓ Need Kibana's advanced ML/anomaly features
# ✓ SIEM requirements (security event correlation)

# INTERVIEW ANSWER:
# "I've used both. ELK is more powerful for search but operationally
# heavier — Elasticsearch requires careful capacity planning and
# shard management. Loki is operationally simpler and cheaper at
# scale because it only indexes labels. For new greenfield projects
# on Kubernetes I'd choose Loki + Grafana. For organizations that
# need full-text search or have SIEM requirements, ELK remains the
# right choice."

# OTel migration path (from separate clients):
# Before: prometheus_client + jaeger_client + custom logging
# After:  one OTel SDK + OTel Collector
# Benefit: switch any backend without app code changes
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Loki + OpenTelemetry and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Loki + OpenTelemetry work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Loki + OpenTelemetry?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Loki + OpenTelemetry?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Loki + OpenTelemetry?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Loki + OpenTelemetry in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Loki + OpenTelemetry?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Loki + OpenTelemetry compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Grafana Loki in Loki + OpenTelemetry."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Three Pillars of Observability in Loki + OpenTelemetry."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Grafana Loki Documentation](https://grafana.com/docs/loki/latest/)
- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [Grafana Tempo (Tracing)](https://grafana.com/docs/tempo/latest/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*