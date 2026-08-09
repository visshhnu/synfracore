# Splunk — Advanced

## Indexer Clustering — Replication and Search Factor

A single indexer is a single point of failure — lose it, and both the data it holds and the ability to search it are gone. Indexer clustering solves this with two independently-configured factors that are easy to conflate but control different guarantees:

- **Replication factor (RF)** — how many total copies of each bucket of data exist across the cluster. An RF of 3 means losing any 2 indexers still leaves at least one full copy of every event.
- **Search factor (SF)** — how many of those copies are kept immediately *searchable* (fully indexed and ready to query), versus stored but requiring a rebuild step before they can serve a search. SF is always ≤ RF, since a searchable copy is a strict superset of a merely-replicated one.

```
Example: RF=3, SF=2 in a 3-indexer cluster
  - Every bucket has 3 total copies (durability)
  - 2 of those 3 copies are immediately searchable (fast failover)
  - The 3rd copy exists for durability but would need a rebuild
    before it could directly serve search traffic
```

A **cluster master** (the coordinating node — note: Splunk has moved toward "cluster manager" as the current terminology `(needs verification — recheck against current source for the exact current release's terminology)`) tracks bucket state across all indexers and orchestrates rebalancing when a node joins, leaves, or fails. Choosing RF/SF is a direct tradeoff between storage cost (more copies = more disk) and both durability and search availability during a node failure — a common real mistake is setting RF high for durability while leaving SF too low, which protects the data but doesn't actually protect search performance during a failure, since the "extra" durable copies aren't immediately query-ready.

## Multi-Site Clustering

For deployments spanning multiple physical sites (data centers, regions) — often for disaster-recovery or compliance reasons — indexer clustering extends to **site-aware replication**, where RF/SF can be specified *per site*, not just cluster-wide.

```
Example multi-site policy: site_replication_factor = origin:2, site2:1, total:3
  - The originating site keeps 2 copies (fast local search)
  - A second site keeps 1 copy (DR — data survives losing the entire
    origin site, not just one node within it)
  - Total 3 copies across the whole cluster
```

This distinction matters specifically because standard single-site RF only protects against losing individual nodes, not an entire site going offline — a common compliance or DR requirement ("must survive loss of an entire data center") isn't actually satisfied by a high RF alone if every copy lives in the same site.

## `tstats` vs. `stats` — the Real Performance Difference

`stats` operates on raw, retrieved events — Splunk has to pull and decompress the actual event data before `stats` can aggregate it, which is expensive at large scale. `tstats` operates directly against Splunk's tsidx (time-series index) files — the pre-built index structures Splunk maintains regardless — without retrieving raw events at all, for statistics that can be answered purely from indexed fields. The performance difference at real scale is substantial, often an order of magnitude or more for the same logical aggregation, because `tstats` skips the raw-event-retrieval step entirely.

```spl
` stats — retrieves and decompresses raw events, then aggregates `
index=web_logs status>=500
| stats count by host

` tstats — same logical result, but reads directly from the indexed
  tsidx structures without ever touching raw event data `
| tstats count where index=web_logs status>=500 by host
```

The tradeoff: `tstats` can only use indexed fields (fields Splunk extracted at index time, not something computed later via `rex`/`eval` at search time) — a field that only exists via search-time extraction isn't visible to `tstats` at all. `tstats` against an **accelerated data model** extends this further, letting even data-model-defined fields be queried with `tstats`-level performance, which is the standard pattern behind fast, frequently-run dashboards in a large Splunk deployment.

## Summary Indexing and Data Model Acceleration

For a search expensive enough that even `tstats` isn't fast enough to run interactively (a genuinely large historical aggregation, run repeatedly), **summary indexing** pre-computes and stores the result of an expensive search on a schedule, so later queries read the small, pre-aggregated summary index instead of re-running the expensive computation every time.

```spl
` A scheduled search that writes its own summarized output into a
  separate summary index, instead of just displaying results `
index=web_logs
| stats count by host, status
| collect index=summary_web_stats
```

**Data model acceleration** is a related but distinct mechanism specifically for data models — Splunk maintains a tsidx-backed accelerated structure behind the model automatically, kept in sync on a schedule, so `tstats` queries against it stay fast even as the underlying raw data grows. The choice between summary indexing and data model acceleration generally comes down to whether the need is a specific, fixed aggregation (summary indexing) or a general-purpose accelerated structure multiple different queries can reuse (data model acceleration).

## Splunk Enterprise Security — Notable Events and Risk-Based Alerting

`(needs verification — recheck against current source: Splunk Enterprise Security's specific feature set and terminology are updated across releases; the concepts below are the stable underlying model, not a specific version's exact UI.)`

Splunk Enterprise Security (ES) is a purpose-built application layered on top of the base platform for SOC/SIEM use cases, adding structure around what a raw correlation search alone doesn't provide. A **correlation search** is fundamentally still a saved search — SPL, on a schedule, checking a condition — but when it fires in ES, it can create a **Notable Event** instead of (or in addition to) a plain alert: a structured, triaged, assignable record with its own workflow (status, owner, disposition), rather than just a search result or a raw notification.

**Risk-Based Alerting (RBA)** changes the underlying model further — instead of every correlation search independently deciding "alert or don't," individual events contribute **risk scores** to specific entities (a user, a host, an IP), accumulating over time and across multiple, individually low-confidence signals. A single failed login isn't independently alertable noise; that same user's risk score crossing a threshold *because of* five different low-signal events across a day is what actually triggers a Notable Event. This directly addresses the alert-fatigue problem that a purely rule-per-search model produces — many individually low-confidence signals converging on the same entity is a materially stronger indicator than any one of them alone, and RBA is the mechanism that lets that accumulation actually drive alerting instead of requiring one single search to somehow catch the whole pattern in one query.

## License Enforcement — What Actually Happens at the Limit

`(needs verification — recheck against current source: license enforcement behavior has changed across Splunk versions and license types — the mechanism below describes the general model, not a guaranteed current-version specific behavior.)`

Ingest-based Splunk licenses cap daily indexing volume (GB/day). Historically, exceeding the license triggered a **license violation warning**, and accumulating enough violations within a rolling window could trigger **search restriction** — the platform continuing to index data (so nothing is lost) while blocking the ability to search it until the violation clears. This is a specific, non-obvious failure mode worth knowing explicitly: a license breach doesn't necessarily mean data loss, but it can mean a fully-functioning, fully-ingesting Splunk deployment that a SOC analyst suddenly can't query during exactly the kind of high-ingest-volume event (a real incident, a burst of activity) when they need it most — which is precisely why proactively monitoring license usage (via the internal `_internal`/license-usage indexes covered in Overview) matters operationally, not just as a cost-control exercise.

## Distributed Search Performance Tuning

Beyond `tstats` and acceleration, a few structural choices affect distributed search performance at scale: search head clusters distribute query load across multiple search heads rather than one becoming a bottleneck; a well-chosen **bucket time range** (how source data is time-partitioned on disk) affects how much irrelevant data an indexer has to scan past before reaching the relevant time window for a search; and restricting searches to the narrowest reasonable index/sourcetype/time-range combination remains the single highest-leverage optimization available to any individual search author, regardless of cluster-level tuning — an imprecise search that has to scan far more data than necessary will be slow no matter how well the underlying cluster is provisioned.
