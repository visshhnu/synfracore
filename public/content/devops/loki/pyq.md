# Loki + OpenTelemetry — PYQ (Previously Asked / Practice Questions)

**Framing note:** Loki (via Grafana Labs) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Loki behavior rather than invented content.

---

### 1. (Domain: Architecture) Why is Loki significantly cheaper than ELK at high log volume, and what's the tradeoff for that cost savings?

**Answer:** Loki indexes only labels, not full log content — the index stays small regardless of log volume, since it's mapping label combinations to chunk locations rather than indexing every word in every log line. ELK's full-text indexing (Lucene) is far more storage- and compute-intensive at the same volume. The tradeoff: Loki can't do arbitrary full-text search as efficiently as ELK — a LogQL query still needs a stream selector (label match) as its starting filter; you can't search across all logs by content alone the way you can in Elasticsearch.

---

### 2. (Domain: LogQL) Write a LogQL query showing the rate of 5xx status codes per pod, from JSON-formatted logs with a `status` field, over a 5-minute window.

```logql
sum by (pod) (rate({app="api"} | json | status >= 500 [5m]))
```
**What's being tested:** correct pipeline construction — stream selector first, then `| json` to parse, then the field filter, then wrapping in `rate()` and `sum by()` for the aggregation. Getting the pipe order wrong (filtering before parsing, for instance) is a common early mistake.

---

### 3. (Domain: Production Configuration) A team sets `retention_period: 30d` in their Loki config and expects old logs to be deleted after 30 days. They aren't. What's missing?

**Answer:** `compactor.retention_enabled: true` is a separate, required setting — `retention_period` alone configures the *intended* retention window but does nothing to actually enforce deletion without the compactor's retention flag also being enabled. This is a real, common misconfiguration, not a hypothetical edge case — both pieces are required together.

---

### 4. (Domain: Advanced LogQL) A service logs `duration` as a structured JSON field but has never instrumented a dedicated latency metric. How can you still get a real p99 latency figure for it?

```logql
quantile_over_time(0.99, {app="api"} | json | unwrap duration [5m]) by (endpoint)
```
**What's being tested:** understanding `unwrap` as the mechanism for deriving metrics from an existing numeric log field, without needing separate metrics instrumentation — a genuinely useful pattern for services that log rich detail but weren't built with a metrics pipeline from day one.

---

### 5. (Domain: Cardinality) What does `max_streams_per_user` actually protect against, and what happens when a tenant hits the limit?

**Answer:** It protects against a label-cardinality mistake (an unbounded label like a raw request ID or user ID applied to a log stream) silently building toward an Ingester out-of-memory crisis. Once a tenant hits the cap, new streams are explicitly rejected with an error — this surfaces the problem immediately and loudly, rather than allowing it to degrade performance slowly and invisibly until a crash.

---

### 6. (Domain: Deployment) When is the `loki-stack` bundled Helm chart the right choice, and when should a team move to the distributed/microservices installation mode instead?

**Answer:** `loki-stack` (bundling Loki, Promtail, and Grafana together) is the right choice for evaluation or a smaller deployment — it's the fastest path to something working. At real production scale, the distributed mode is the better fit specifically because it allows independently scaling ingestion load and query load, which the single bundled chart can't do — a spike in log ingestion and a spike in dashboard query load are genuinely different scaling problems that a monolithic deployment can't address separately.

---

### 7. (Domain: Alerting) How does Loki's Ruler-based alerting differ from alerting on a metric that was explicitly instrumented, and why does this matter?

**Answer:** The Ruler evaluates LogQL queries directly against raw log content on a schedule, the same mechanism Prometheus uses to evaluate PromQL against metrics — this means you can alert on a condition that was never emitted as a structured metric at all, straight from log lines. This matters because it catches problems that would otherwise require going back and adding instrumentation before they could be alerted on at all — the alert can exist immediately, based on logs already being written for other reasons.

---

### 8. (Domain: Storage Internals) What specifically drives Loki's index size and cost — log volume, or something else?

**Answer:** Label cardinality, not raw log volume. Since Loki only indexes labels (not full log content), a high-volume but low-label-cardinality log stream stays cheap to index, while a low-volume stream with many distinct label combinations can bloat the index disproportionately. This is the direct consequence of Loki's core design choice (index labels, not content) and is why the `max_streams_per_user` cardinality safety net exists specifically, rather than a raw ingestion-volume cap alone being sufficient.

---

### 9. (Domain: Kubernetes Integration) When Promtail runs as a DaemonSet collecting Kubernetes pod logs, what labels are attached automatically, and what does this remove the need for?

**Answer:** Pod metadata — namespace, pod name, container name — is attached as labels automatically by Promtail, with zero additional configuration needed. This removes the need for manual per-workload log-labeling configuration that other logging pipelines sometimes require, since the Kubernetes-awareness is built directly into Promtail's service discovery.

---

### 10. (Domain: Cost/Architecture) A team already runs Prometheus and Grafana. What's the concrete architectural argument for adding Loki specifically, rather than a separate logging stack like ELK?

**Answer:** Loki is Grafana's native log backend — no separate UI to learn or maintain, and LogQL's deliberate similarity to PromQL means a team already fluent in Prometheus querying has a significantly shorter ramp-up than learning Lucene/KQL for ELK. Architecturally, keeping metrics (Prometheus) and logs (Loki) both queryable from the same Grafana instance, with a consistent query-language mental model, is a genuine operational simplification over running two structurally different stacks side by side.
