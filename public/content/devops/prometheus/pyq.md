# Prometheus + Grafana — PYQ (Previously Asked / Practice Questions)

**Framing note:** Prometheus (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Prometheus behavior.

---

### 1. (Domain: Core Model) Why does Prometheus use a pull model (scraping targets) rather than a push model (targets sending metrics to Prometheus)?

**Answer:** A pull model means Prometheus itself controls the scrape schedule and can directly detect when a target becomes unreachable (a failed scrape is itself a meaningful signal — the target might be down). It also simplifies target discovery and configuration centrally, in Prometheus's own config, rather than requiring every target to be independently configured with where to push metrics. The tradeoff is that Prometheus needs network access to reach every target, which a push model wouldn't require.

---

### 2. (Domain: Metric Types) Why is it a mistake to graph a raw Counter value directly, rather than wrapping it in `rate()`?

**Answer:** A Counter only ever increases (or resets to zero on a process restart) — its raw value reflects the total accumulated count since the process started, which is rarely the actually useful signal. `rate()` computes the per-second rate of increase over a time window, which is what answers the actually useful question ("how many requests per second right now"), rather than an ever-climbing total that resets unpredictably whenever the underlying process restarts.

---

### 3. (Domain: Cardinality) Why does adding a `user_id` label to an existing metric risk degrading query performance across every dashboard querying that metric, not just the one panel that added it?

**Answer:** Each unique combination of label values creates an entirely new stored time series — a label with unbounded or very high cardinality (like `user_id`) can multiply the total number of stored series dramatically. Prometheus's storage and query performance scale with total series count globally, not per-dashboard — so a single high-cardinality label addition is a genuinely global change to system health, degrading performance for every query touching that metric, not just the specific panel the label was added for.

---

### 4. (Domain: PromQL) Write a PromQL query for P95 latency by endpoint, from a histogram metric `http_request_duration_seconds_bucket`, and explain why `le` must remain in the `by()` clause.

```promql
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le, endpoint))
```
**Answer:** `histogram_quantile` needs the full set of bucket boundaries (`le`, meaning "less than or equal") preserved per series to correctly interpolate the quantile — aggregating `le` away (using `by (endpoint)` alone) collapses all the bucket boundaries together, breaking the calculation entirely rather than just producing a slightly wrong number.

---

### 5. (Domain: Recording Rules) What specific problem do recording rules solve, and when is a metric/query a good candidate for one?

**Answer:** Recording rules pre-compute an expensive PromQL expression on a schedule, storing the result as a new, simple time series — a dashboard panel then reads that pre-computed result instead of re-running the expensive expression on every single dashboard load. A query is a good candidate for a recording rule when it's both computationally expensive (a complex aggregation over high-cardinality data) and queried frequently (a dashboard panel viewed often, or an alert rule evaluated on a tight interval) — the pre-computation cost is paid once on a schedule rather than repeatedly at query time.

---

### 6. (Domain: Absent Metrics) Why does `absent(up{job="api"})` catch a class of failure that a threshold-based alert on the metric's value wouldn't?

**Answer:** A threshold-based alert (like "alert if error rate exceeds 5%") requires the metric to actually exist and be reporting values — if a target stops being scraped entirely (crashed, network partition, misconfigured scrape job), there's no metric value at all for a threshold check to evaluate against, and the alert simply never fires because there's nothing to compare. `absent()` specifically detects the metric's total absence, catching exactly this "the thing that's supposed to alert us is itself missing" scenario that a value-threshold check structurally can't.

---

### 7. (Domain: Service Discovery) What's the practical advantage of `kubernetes_sd_configs` over a static, manually-maintained list of scrape targets?

**Answer:** In a Kubernetes environment, pods are created and destroyed dynamically (scaling, redeployments, node rescheduling) — a static target list would immediately go stale, missing newly-created pods and continuing to scrape terminated ones. `kubernetes_sd_configs` queries the Kubernetes API directly for current pod/service state, automatically discovering new scrape targets and removing gone ones, keeping the scrape target list continuously accurate without manual maintenance.

---

### 8. (Domain: Golden Signals) Why does the Saturation golden signal use `100 - (idle CPU percentage)` rather than directly querying a "busy CPU" metric?

**Answer:** `node_cpu_seconds_total` with `mode="idle"` is the metric that's actually and reliably exposed by the standard node exporter — computing busy percentage as the complement of idle percentage (100 minus idle%) is a derived calculation from an available, well-understood metric, rather than assuming a directly-exposed "busy" metric exists with the exact semantics needed. This is a common PromQL pattern: deriving the metric you actually want from the metric that's actually available, rather than assuming the ideal metric exists directly.

---

### 9. (Domain: Metric Types) What's the practical difference between a Histogram and a Summary, given both can represent latency distributions?

**Answer:** A Histogram exposes raw bucket counts, and quantile calculation (`histogram_quantile`) happens at query time in Prometheus — this means you can aggregate Histograms across multiple instances (`sum by (le, ...)`) before computing a quantile, which is essential for a multi-instance service. A Summary pre-computes quantiles client-side, at the instrumented application, which are correct for that single instance but can't be meaningfully aggregated across multiple instances afterward — averaging pre-computed P99s from different instances doesn't produce a mathematically valid overall P99. Histograms are generally preferred specifically because of this aggregation flexibility.

---

### 10. (Domain: Cardinality/Design) A team wants per-request debugging detail (which specific request caused a slow response) but is warned against adding a `request_id` label to a metric. What's the actual recommended alternative?

**Answer:** Move per-request detail into logs (via Loki) or traces, correlated back to the aggregate metric via exemplars, rather than adding the high-cardinality field as a metric label. Metrics are meant for aggregate, dimensional analysis at bounded cardinality; logs and traces are the right place for arbitrarily detailed, per-request information — exemplars provide the link between an aggregate metric spike and the specific logs/traces for that time window, without paying the cardinality cost of embedding that detail directly into the metric itself.
