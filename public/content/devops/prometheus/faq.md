# Prometheus + Grafana — FAQ

## Why does Prometheus scrape (pull) metrics instead of applications pushing them?

The pull model gives Prometheus direct control over the scrape schedule and lets it detect target unavailability itself — a failed scrape is a meaningful signal that a target might be down, something a pure push model wouldn't surface the same way. It also centralizes target configuration in Prometheus rather than requiring every application to be independently configured with where to send metrics. The tradeoff is Prometheus needs network access to reach every target, which isn't always convenient in every network topology (there's a Pushgateway component for genuinely push-appropriate cases, like short-lived batch jobs).

## Why shouldn't I graph a raw Counter value directly?

A Counter only ever increases (or resets to zero on a restart), so its raw value reflects an ever-climbing total since the process started — rarely the actually useful signal. Wrap it in `rate()` to get the per-second rate of increase over a time window, which answers the practically useful question ("how many requests per second right now") without being thrown off by the counter's unpredictable resets on restart.

## Why does adding one seemingly small label to a metric sometimes cause a big performance problem?

Because each unique combination of label values creates a genuinely new, separate stored time series — a label with high or unbounded cardinality (a user ID, a request ID, a raw IP) can multiply the total number of series dramatically. Prometheus's storage and query performance scale with total series count globally, so a cardinality mistake on one metric can degrade performance across every dashboard querying that metric, not just the one panel the label was added for.

## When should I use a recording rule instead of just writing the PromQL query directly in a dashboard panel?

When a query is both computationally expensive and queried frequently — a recording rule pre-computes the result on a schedule, so the dashboard reads a cheap, pre-computed value instead of re-running an expensive aggregation on every single dashboard load. For a query that's cheap or rarely viewed, a recording rule adds unnecessary complexity; it earns its keep specifically for expensive, frequently-accessed queries.

## Does `absent()` behave the same as checking if a metric's value is zero?

No, and this distinction matters — a metric reporting a value of zero still exists and was successfully scraped; `absent()` specifically detects when a metric doesn't exist at all (the target stopped being scraped entirely, or never matched the query). This is the mechanism that catches a target going fully unreachable, which a threshold-based alert (checking the metric's actual value) can't catch, since there's no value to evaluate against a threshold when the metric is entirely missing.

## Why does this guide recommend Histograms over Summaries for latency, even though Summaries give exact quantiles?

Summaries compute quantiles client-side, at the individual instrumented instance — correct for that one instance, but mathematically invalid to aggregate across multiple instances (averaging several instances' pre-computed P99s doesn't produce a valid overall P99). Histograms expose raw bucket counts that can be correctly aggregated across instances before computing a quantile at query time, which matters for any service running multiple replicas — the near-exact-but-aggregatable tradeoff of Histograms usually wins for multi-instance services.

## Is `kubernetes_sd_configs` required for using Prometheus with Kubernetes, or can I use a static target list?

A static list technically works but requires manual maintenance as pods scale, redeploy, or reschedule — it goes stale quickly in any dynamic Kubernetes environment. `kubernetes_sd_configs` queries the Kubernetes API directly, automatically discovering current pods/services as scrape targets and removing gone ones — the practical default for any real Kubernetes deployment rather than a static list requiring constant manual upkeep.

## Where should I put per-request debugging detail if I've been told not to add it as a metric label?

In logs (via Loki) or traces, correlated back to the relevant aggregate metric via exemplars — this preserves the ability to drill into a specific request's detail without paying the cardinality cost of embedding that detail directly as a metric label. Metrics are the right tool for bounded, dimensional, aggregate analysis; logs and traces are the right tool for arbitrarily detailed, per-request information.
