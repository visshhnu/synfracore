# Elasticsearch — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, with corrections folded in from a senior-instructor review pass.

---

## Core Concepts

```
CLUSTER: one or more nodes working together
NODE TYPES:
  Master: cluster coordination, index management (3 dedicated
    recommended — quorum = 2, survives losing any 1 node safely;
    an even number like 4 doesn't improve this the way it might seem to)
  Data: stores shards, executes queries
  Ingest: pre-processing pipeline (parse, enrich, transform)
  Coordinating: routes requests, aggregates results

INDEX: collection of documents (like a database/table)
  Shard: unit of distribution, each a self-contained Lucene index
  Primary shard: set at CREATION, cannot change without reindex
  Replica shard: copy of primary — HA + read scaling

Document: JSON object with unique _id
Mapping: schema, but flexible — DYNAMIC (auto-inferred) or EXPLICIT
```

## Licensing — a genuine three-way choice, not the old two-way "dual license"

```
As of a 2024 licensing change *(needs verification — confirm exact date
with Elastic's own announcement)*, Elastic added AGPLv3 as a THIRD
option — Elasticsearch and Kibana are open source again (AGPLv3 is
OSI-approved). Current reality: a three-way choice
(SSPL / Elastic License 2.0 / AGPLv3), not the older two-way framing.

This softens (doesn't eliminate) the "OpenSearch = no licensing
concerns" argument — OpenSearch remains a fully independent, actively-
developed AWS fork with its own roadmap, genuinely different by now in
some features/internals since the 2021 split, but "must avoid
Elasticsearch's license" is a weaker argument than it used to be.
```

## Query DSL

```
match:  full-text, ANALYZED (tokenized/stemmed) — NOT substring search;
        "running shoes" also matches "run shoe" via stemming
term:   EXACT match, NOT analyzed — use on keyword fields
range:  numeric/date comparisons

bool query:
  must:     AND, CONTRIBUTES TO relevance score
  filter:   AND, NO score contribution, CACHED — use for exact-match/
            range conditions that shouldn't affect ranking
  should:   OR, BOOSTS score if matched, doesn't exclude on its own
  must_not: NOT, excludes

Substring/"contains" search: match does NOT do this (it's analyzed,
  not literal). Use wildcard (careful with leading wildcards — slow),
  an ngram analyzer, or reconsider whether keyword+regexp fits better.
```

## Mapping — text vs. keyword

```
text:    full-text search, tokenized/analyzed — CANNOT aggregate/sort on
keyword: exact match, aggregations, sorting — NOT tokenized

Multi-field pattern (MOST COMMON production setup): map the SAME field
as both — "status": {"type":"text","fields":{"keyword":{"type":"keyword"}}}
Query status for full-text match; query status.keyword for exact/sort/agg.

DYNAMIC MAPPING RISK (real, not theoretical — see this course's Real
World Scenarios): if field NAMES themselves are unpredictable (webhook
payloads, arbitrary user metadata), dynamic mapping creates a NEW
mapped field per unique key seen — mappings don't shrink back down,
and this can hit the field-count limit and break indexing entirely.
Fix: dynamic:false/strict for unpredictable nested objects, or the
flattened field type for genuinely arbitrary key-value data.
```

## Aggregations

```
size: 0 — suppress returning matched documents, only want agg results
terms: group by (like GROUP BY)
date_histogram: time-bucketed grouping
avg/sum/min/max/cardinality: standard aggregate functions
percentiles: distribution stats (p50/p75/p95/p99)
Nested aggs: sub-agg inside parent = multi-dimensional breakdown
  (e.g. avg price WITHIN each category bucket)
```

## Cluster Health & Diagnostics

```
GREEN:  all shards (primary + replica) assigned
YELLOW: replicas unassigned — NORMAL/EXPECTED on single-node clusters,
        but can ALSO mean a real problem on a multi-node cluster —
        the color alone can't distinguish these (see this course's
        Real World Scenarios for the full failure mode this causes)
RED:    primary shard missing — SERIOUS, but not automatically
        "permanent data loss" if a replica exists elsewhere to promote;
        genuine data loss requires NO reachable replica existing at all

GET _cluster/allocation/explain — the actual diagnostic command to run
  BEFORE assuming what a yellow/red status means; don't act on color alone.
```

## Performance

```
Shard sizing: target ~20-50GB per shard. TOO MANY SMALL SHARDS is a
  real, common mistake — each shard has real fixed overhead regardless
  of how little data it holds; 200 shards at 500MB each is a severe
  over-sharding problem even though total data volume looks modest.

JVM heap: ~50% of available RAM, HARD CAP around 31GB regardless of
  total server RAM — due to compressed oops (32-bit object pointers)
  becoming unavailable above that threshold, making a LARGER heap
  potentially LESS memory-efficient past that point. On a 128GB server,
  the right heap is still ~30GB, not 64GB — remaining RAM feeds the OS
  page cache Lucene relies on heavily.

Segment fragmentation: frequent updates/deletes accumulate many small
  Lucene segments + "deleted" doc markers that still get scanned during
  search — a real cause of slowdown even when LOGICAL document count
  hasn't grown. Check via GET /index/_stats (segment count, docs.deleted).
  Fix: _forcemerge?max_num_segments=1 — but this is RESOURCE-INTENSIVE,
  run during low-traffic windows, ideally on indices no longer being
  actively written to (e.g. as part of an ILM warm-phase transition).

Bulk API for indexing, not one-by-one. Avoid leading wildcards in
  queries (*term — forces full scan). Use filter context (cached) for
  exact-match conditions, not must.
```

## Index Lifecycle Management (ILM)

```
hot (actively written) → warm (read-only, shrink+forcemerge) →
  cold (freeze, minimal resources) → delete
Time-based index pattern (logs-2026-07-19) + ILM rollover: makes
  bulk deletion of old data INSTANT (drop whole index) vs. slow
  document-by-document deletion from one giant continuously-growing index.
```

## Relevance Tuning — measure, don't just react

```
BM25 (default scoring): accounts for term frequency, inverse document
  frequency (rare terms score higher), field length normalization —
  two documents both "containing the term" can legitimately score very
  differently; this is usually correct, not a bug.

REAL RISK: iterative, complaint-driven relevance tuning WITHOUT
  measuring aggregate quality can make AVERAGE search quality worse
  even while every individually-reported bad result gets "fixed" — see
  this course's Real World Scenarios for the full failure mode.
Use _explain and profile:true to understand WHY a specific document
  scored the way it did, rather than broadly increasing a boost and
  hoping it generalizes correctly to every other affected query.
```

## Python Client — current syntax

```
elasticsearch-py client v8.0+ deprecated the body= parameter for ALL
APIs in favor of top-level keyword parameters:
  es.search(index="products", body={"query": {...}})   ← deprecated
  es.search(index="products", query={"match": {"name": "iphone"}})  ← current
Also note: "from" is a reserved Python keyword — use from_= as the
  parameter name when pagination requires it (from_=10, size=20).
```

## Certifications — verify pricing before relying on it

```
Elastic Certified Engineer / Analyst / Observability Engineer: all
performance-based, hands-on, live-cluster exams (no MCQ at all).
Observability Engineer is listed at $500 here; pricing has shifted at
  least once already, so verify Engineer/Analyst/Observability Engineer
  pricing directly at elastic.co/training before relying on any of
  these figures.
```
