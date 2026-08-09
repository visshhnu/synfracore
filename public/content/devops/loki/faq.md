# Loki + OpenTelemetry — FAQ

## Do I need to already know Prometheus to learn Loki?

Strongly recommended, though not strictly impossible without it. LogQL is deliberately structured to mirror PromQL — labels, stream selectors, `rate()`/`sum()` aggregation patterns — and this guide's own Prerequisites section names Prometheus fluency as the fastest on-ramp specifically because the Learning Modules build directly on that mental model rather than re-teaching it from zero.

## Why did my logs stop showing up after 30 days when I set `retention_period: 30d`? I want them retained longer, not deleted.

This question usually appears in reverse of the intended config — but the underlying gotcha is the same either direction: `retention_period` requires `compactor.retention_enabled: true` to actually take effect at all. If logs are disappearing at exactly 30 days and you didn't intend that, check whether `retention_enabled` was set — if it was, the configuration is working as designed and the fix is adjusting `retention_period` itself, not the enablement flag.

## Why does Loki need labels at all if it's not indexing full log content — isn't that the point of a "label-based" system needing less structure?

Labels are exactly what Loki *does* index, and that's precisely what keeps it cheap — the index maps label combinations to chunk locations, not full text. Without labels, there'd be nothing to query against at all; the tradeoff is that a LogQL query always starts with a label-based stream selector (`{app="x"}`) before any content filtering happens, rather than supporting arbitrary full-text search the way Elasticsearch does. Labels aren't optional structure layered on top of an otherwise unstructured system — they're the actual mechanism that makes the whole cost model work.

## Is `unwrap`/`quantile_over_time` a replacement for instrumenting real metrics?

Not generally, no — it's a genuinely useful escape hatch for getting a real, usable figure (like p99 latency) from log data that's already being written for other reasons, without needing to go add dedicated metrics instrumentation first. But for a metric that's queried constantly, at high query volume, proper metrics instrumentation (a real Prometheus counter/histogram) is usually the better long-term investment — deriving metrics from logs at query time is more computationally expensive per query than reading an already-aggregated metric.

## Why does my new label addition suddenly cause stream-creation errors?

This is almost certainly `max_streams_per_user` doing exactly what it's designed to do — a newly-added high-cardinality label (a raw request ID, a user ID) can multiply the number of distinct streams dramatically, and once a tenant's cardinality cap is hit, new streams are rejected outright rather than silently accepted into a slow-building memory problem. The fix is removing the unbounded label from the stream's label set (move that detail into the log line content instead, filterable via `| json`), not raising the cap to accommodate it.

## When should I move off the `loki-stack` bundled Helm chart to the distributed installation mode?

When ingestion load and query load are both meaningfully high and start contending for the same shared resources — `loki-stack` bundles Loki, Promtail, and Grafana together for fast evaluation setup, but can't independently scale ingestion versus query components the way the distributed/microservices mode can. Watch for query latency degrading specifically during high-ingestion periods as the concrete signal that it's time to migrate, rather than waiting for it to become a production incident.

## What's the actual difference between Loki's Ruler-based alerting and just building a Grafana alert on a dashboard panel?

Both can technically alert on log-derived data, but the Ruler evaluates LogQL queries on its own schedule directly against raw log content — including queries that were never built into a saved dashboard panel at all. This means you can alert on a condition straight from log content without first building a dashboard for it, which matters for the "we never explicitly instrumented this, but the logs already show it" pattern this guide covers with `unwrap`/`quantile_over_time`.

## Does choosing Loki mean giving up full-text search entirely?

Not entirely, but the tradeoff is real: within a given stream selector, LogQL's line filters (`|=`, `!=`) do support text matching against log content — but you can't search across the entire index by content alone the way Elasticsearch's full-text indexing allows, since Loki never indexed that content in the first place. If a use case genuinely requires broad, label-independent full-text search across enormous log volumes, that's a real point in ELK's favor specifically — Loki's cost advantage comes directly from not building that capability.
