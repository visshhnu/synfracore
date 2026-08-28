# Loki + OpenTelemetry

> **Label-based log aggregation + unified observability signals**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** this page assumes familiarity with Prometheus and Grafana (metrics, PromQL, dashboards) — Loki is explained largely by direct comparison to them. No prior log-aggregation-tool experience is needed.

## What is Loki + OpenTelemetry?

Loki indexes only labels (like Prometheus), not log content. This makes it much cheaper than ELK for high-volume logs. Loki is the native log backend for Grafana — no extra UI needed. LogQL is similar to PromQL. Promtail is the log collection agent (like Filebeat for ELK). Choose Loki when you already use Prometheus+Grafana and want to keep your stack consistent.

## Why Loki + OpenTelemetry?

Metrics answer "what is happening now" — CPU at 90%, error rate 2%. Logs answer "what happened and when" — show the actual error message. Traces answer "why is it slow" — show the full request path across services with timing. In Grafana you can link from a metric spike → to the logs at that timestamp → to the trace of that request. This correlation is the power of the unified stack.

```conceptgrid
{
  "boxes": [
    { "title": "Metrics", "description": "WHAT is happening now — CPU at 90%, error rate 2%. Prometheus", "color": "blue" },
    { "title": "Logs", "description": "WHAT happened and when — the actual error message. Loki/ELK", "color": "green" },
    { "title": "Traces", "description": "WHY it's slow — full request path across services, with timing. Tempo/Jaeger", "color": "purple" }
  ]
}
```

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

**Alerting on logs directly.** Loki's Ruler evaluates LogQL metric queries on a schedule, the same way Prometheus evaluates PromQL — this catches problems that were never emitted as a metric in the first place, straight from the raw log stream:

```yaml
# Loki alert rules — evaluated by the Ruler component
groups:
  - name: loki.rules
    rules:
    - alert: HighErrorRate
      expr: |
        sum(rate({namespace="production"} |= "ERROR"[5m])) > 10
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: "High error rate in production logs"

    - alert: OOMKilled
      expr: |
        count_over_time({namespace="production"} |= "OOMKilled"[5m]) > 0
      for: 1m
      labels:
        severity: critical
      annotations:
        summary: "Pod OOMKilled in production"

    - alert: NoPodLogs
      expr: |
        absent(rate({namespace="production", app="payment-api"}[5m]))
      for: 5m
      labels:
        severity: critical
      annotations:
        summary: "No logs from payment-api — may be down"
```

`NoPodLogs` is the alert teams forget to write — it fires on the *absence* of logs, which catches a service that's silently stopped emitting anything at all (crash-looped past its restart alerts, network-partitioned, or just dead) rather than only alerting on bad content within logs that are still arriving.

**Building Grafana panels on top of LogQL** turns the same queries into dashboards, not just ad-hoc Explore searches:

```
Panel: Error Rate (Stat)
Query: sum(rate({namespace="production"} |= "ERROR"[5m]))
Threshold: > 10 = red, > 5 = yellow

Panel: Log Volume by Service (Time series)
Query: sum by (app) (rate({namespace="production"}[5m]))

Panel: Recent Errors (Logs panel)
Query: {namespace="production"} |= "ERROR" | json | level="error"
       | line_format "[{{.pod}}] {{.message}}"

Panel: HTTP 5xx Rate (Time series)
Query: sum by (app) (
  rate({namespace="production", app=~".*api.*"}
    | logfmt | status_code >= 500
  [5m])
)
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
#   - Regex: traceID=(\w+)
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
      key: ${DATADOG_API_KEY}

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

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Loki and why would you use it in production?**

**A:** **Problem:** A Kubernetes-native team already running Prometheus + Grafana needed log aggregation, but ELK's full-text indexing was operationally heavy (JVM tuning, shard management, a whole second UI in Kibana) for a team that mostly filters logs by namespace/pod/app rather than searching arbitrary text.

**Solution:** Adopted Loki because it indexes only labels, not log content — logs land as compressed chunks in cheap object storage instead of an expensive full-text index. Promtail ships logs as a DaemonSet, and Grafana becomes the single UI for both metrics and logs.

**Result:** Log storage cost dropped substantially versus a comparable ELK footprint, and the team stayed inside one tool (Grafana) instead of context-switching to Kibana — at the cost of weaker arbitrary full-text search, which was an acceptable tradeoff given the team's actual query patterns.

---

**Q2. How does Loki work internally? Explain the architecture.**

**A:** **Problem:** Needed to explain why Loki is cheap in a way that's more convincing than "it's Prometheus for logs."

**Solution:** Walked through the pipeline: Promtail discovers pods via the Kubernetes API, attaches labels (namespace, pod, app, container), and pushes log lines to Loki's Distributor. The Distributor hands off to Ingesters, which buffer and flush compressed chunks to object storage (S3/GCS). Only the label-to-chunk-ID mapping is indexed — never the log text itself — so the index stays tiny (label cardinality) while raw log volume can be arbitrarily large in cheap storage.

**Result:** Making the labels-vs-content indexing distinction concrete — with the actual component names, not just "it's like Prometheus" — is what separates a real understanding from a marketing-page answer.

---

**Q3. What are the main components of Loki?**

**A:** **Problem:** Needed a clean mental model to reason about where a slow query or a missing log was actually failing.

**Solution:** Four pieces: Promtail (collection agent, runs per-node), Distributor + Ingester (write path, label indexing and chunk buffering), object storage (S3/GCS — where compressed chunks actually live), and Querier + Query Frontend (read path, fetches the index then decompresses matching chunks). The Ruler sits alongside as the alerting component, evaluating LogQL rules on a schedule like Prometheus's rule evaluator.

**Result:** This mental model makes debugging directional — a missing log points at Promtail or the write path, a slow query points at the read path or an over-broad label-less query scanning too many chunks.

---

**Q4. How do you handle failures in Loki?**

**A:** **Problem:** A Promtail DaemonSet pod crash-looped silently on a handful of nodes after a config change, and logs from those nodes just stopped appearing — nobody noticed for hours because the absence of logs doesn't look like an alert-worthy event by default.

**Solution:** Added a `NoPodLogs`-style Ruler alert — `absent(rate({namespace="production", app="payment-api"}[5m]))` — that fires specifically on the absence of expected log volume, not just on bad content within logs that do arrive. Paired it with a Promtail DaemonSet readiness check in the cluster's standard health dashboard.

**Result:** Silent log gaps are now caught within minutes instead of being discovered days later during an unrelated incident review — the same blind spot metrics-only alerting has, closed on the logging side.

---

**Q5. What is your production experience with Loki?**

**A:** **Problem:** Needed to show real operational depth, not just "we point Promtail at Loki."

**Solution:** Described tuning label design after an early cardinality incident — a well-meaning engineer added `request_id` as a label, which created millions of unique streams and pushed Loki toward OOM — and rolling back to low-cardinality labels only (app, env, namespace, level), plus writing the drop-stage Promtail pipeline to filter noisy health-check logs before they're shipped at all.

**Result:** A concrete cardinality incident and the specific fix (drop `request_id` as a label, keep it queryable via `| json` parsing instead) is the kind of detail that proves hands-on time versus a documentation-level answer.

---

**Q6. How do you monitor and observe Loki in production?**

**A:** **Problem:** Loki itself can fail in ways that are invisible until someone needs a log that isn't there.

**Solution:** Tracked Loki's own exposed metrics (ingestion rate, rejected samples, query latency) in a dedicated Grafana dashboard, alongside the `NoPodLogs`/`HighErrorRate` Ruler alerts covering application-side symptoms.

**Result:** Distinguishes "Loki is unhealthy" from "the application stopped logging" — two different failure modes that look identical from the outside (no logs showing up) but need different responses.

---

**Q7. What are the security considerations for Loki?**

**A:** **Problem:** Logs frequently contain sensitive data (tokens, PII in request bodies) and Loki's object storage backend needs the same access controls as any other data store holding that content.

**Solution:** Scrubbed sensitive fields at the Promtail pipeline stage before shipment, restricted the S3/GCS bucket to least-privilege IAM roles, and used per-tenant retention overrides (shorter retention for lower-sensitivity environments like dev) via `limits_config`.

**Result:** Sensitive data never reaches long-term storage in the first place, which is a stronger guarantee than relying on retention deletion after the fact.

---

**Q8. How does Loki compare to alternatives?**

**A:** **Problem:** Needed to justify Loki over both ELK and Datadog Logs to a team weighing all three.

**Solution:** Framed it as an indexing tradeoff: ELK indexes full text (fast arbitrary search, expensive storage, real operational weight), Datadog Logs is fully managed full-text (fast, zero ops, expensive per-GB), Loki indexes only labels (cheap, simple, fast for label-based queries, slower for genuinely unstructured full-text scans). For a Kubernetes-native team with consistent labeling conventions already using Prometheus+Grafana, Loki's tradeoff profile fit best.

**Result:** The choice was framed as "which tradeoff matches our actual query patterns," not "which tool is objectively best" — which is the honest answer and the one that holds up under follow-up questions.

---

**Q9. What's the difference between Loki's chunk and index, and why does that distinction matter?**

**A:** **Problem:** A slow query needed root-causing, and the team's mental model conflated "the index" with "the logs," which led to debugging the wrong layer.

**Solution:** Clarified the two-part storage model precisely: the index maps label sets to chunk IDs (stored in object storage or DynamoDB, and it stays small because it never touches log content) while chunks are the actual compressed log data, stored separately in object storage. A query first hits the index to find relevant chunk IDs, then fetches and decompresses only those chunks — so a query with weak label selectivity (matching too many chunk IDs) is slow at the chunk-fetch stage, not the index-lookup stage.

**Result:** Once the team understood that a slow query is almost always an under-selective label filter forcing too many chunk fetches — not an index problem — the fix (tighten the label selector before adding text filters) became obvious instead of guesswork.

---

**Q10. How would you design label conventions to avoid a Loki cardinality incident?**

**A:** **Problem:** High-cardinality labels (user_id, request_id, raw timestamps) create one stream per unique value — millions of streams — which degrades ingestion and query performance and can OOM Loki outright.

**Solution:** Established a fixed low-cardinality label set (app, env, namespace, region, level) as policy, with anything higher-cardinality (request IDs, user IDs) kept inside the log line's JSON body and queried via `| json | field="value"` parsing at query time instead of promoted to a label.

**Result:** Query performance stayed predictable as log volume grew, because the label index size is bounded by the fixed label set regardless of how many unique requests or users are logged — the tradeoff being that filtering on those high-cardinality fields is a content scan, not an index lookup, which is the correct place for that cost to live.

---

## Official Resources

- [Grafana Loki Documentation](https://grafana.com/docs/loki/latest/)
- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [Grafana Tempo (Tracing)](https://grafana.com/docs/tempo/latest/)

---

