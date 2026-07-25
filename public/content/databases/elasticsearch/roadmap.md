# Elasticsearch — Learning Roadmap

## Estimated Time to Job-Ready
**6-9 weeks** of consistent learning (2-3 hours/day) — Elasticsearch's REST/JSON API is approachable quickly, but real proficiency (mapping design judgment, relevance tuning, cluster operations) takes genuine hands-on practice, not just reading Query DSL syntax.

## Phase 1: Foundation (Week 1-2)

- Core concepts: cluster, node, index, shard, document, and how a shard is itself a self-contained Lucene index
- Basic CRUD via the REST API: indexing a document, `match`/`term`/`range` queries, and the critical `text` vs. `keyword` distinction — this is one of the first concepts that trips up almost everyone coming from a relational background
- Install Elasticsearch via Docker and get comfortable with either raw `curl` or Kibana's Dev Tools console

**Checkpoint:** given a requirement to both full-text search a field AND exactly filter/sort on it, can you explain why that needs the multi-field pattern (mapping the same field as both `text` and `keyword`) rather than picking just one type?

## Phase 2: Query DSL and Mapping Design (Week 2-4)

- The `bool` query: `must` (AND, affects score), `filter` (AND, cached, no score), `should` (OR, boosts), `must_not` (NOT) — and specifically why exact-match/range conditions belong in `filter`, not `must`
- Explicit vs. dynamic mapping, and the real risk dynamic mapping carries when field *names* (not just values) are unpredictable
- Aggregations: `terms`, `date_histogram`, `avg`/`sum`/`percentiles`, and `"size": 0` for aggregation-only queries
- Complete Portfolio Project 1 (product search with explicit mappings)

**Checkpoint:** can you explain, using a real example, why `match` on a `text` field doesn't behave like a SQL `LIKE '%...%'` substring search? If this distinction isn't clear yet, spend more time here — it's one of the most common sources of "why isn't this matching" confusion.

## Phase 3: Performance and Index Lifecycle (Week 4-6)

- Shard sizing (target ~20-50GB per shard) and why too many small shards is a real, common over-sharding mistake with fixed per-shard overhead
- JVM heap sizing: ~50% of RAM, capped around 30-31GB regardless of total server RAM, due to compressed oops
- Segment fragmentation from update/delete churn, and `_forcemerge` as the (resource-intensive, low-traffic-window) fix
- Index Lifecycle Management (ILM): hot → warm → cold → delete, and time-based index patterns for efficient bulk deletion
- Complete Portfolio Project 2 (log analytics pipeline with ILM)

**Checkpoint:** given a cluster with 200 indices at ~500MB each, can you explain what's actually wrong with that setup, even though total data volume isn't large? This exact scenario is a common practical/hands-on interview question.

## Phase 4: Cluster Operations and Interview Readiness (Week 6-9)

- Cluster health: what GREEN/YELLOW/RED actually mean, and why `GET _cluster/allocation/explain` — not the color alone — is the real diagnostic tool
- Why 3 dedicated master-eligible nodes (not 2 or 4) is the standard recommendation, and the quorum reasoning behind it
- Relevance scoring (BM25) fundamentals, and why measuring aggregate search quality (not just fixing individual complaints) matters for relevance tuning
- Complete Portfolio Project 3 (cluster health diagnostics and failure drill) — this is the highest-value exercise for demonstrating genuine operational understanding, not just query-writing skill
- Review this course's Interview Q&A material, particularly the architecture and mapping-design questions

## Common Pitfalls Specific to Elasticsearch (Not Generic Study Advice)

- **Treating Elasticsearch as a primary transactional database** — it's built for search/analytics, typically sitting alongside a primary database (PostgreSQL, MySQL, MongoDB) holding the authoritative data, not replacing one
- **Letting dynamic mapping run unchecked on data with unpredictable field names** — this is a real, reproducible failure mode (mapping explosion), not a theoretical edge case, covered in this course's Real World Scenarios
- **Iterative, complaint-driven relevance tuning without measurement** — a change that fixes one reported bad result can degrade many unreported ones; measure aggregate quality, don't just chase individual complaints
- **Using outdated Python client syntax** — `elasticsearch-py` v8+ deprecated the `body=` parameter for all APIs in favor of top-level keyword arguments; a lot of older tutorials still show the deprecated pattern
- **Assuming "yellow" always means the same thing** — yellow is normal and expected on a single-node cluster, but can indicate a real, actionable problem on a multi-node cluster; the color alone can't distinguish these, only `_cluster/allocation/explain` can

## Getting Your First Elasticsearch-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (deliberate mapping/relevance design, ILM-managed log analytics, real cluster diagnostics)
2. **Resume:** be specific — "diagnosed a mapping explosion via GET /index/_mapping field-count monitoring and fixed it with dynamic:false" is far stronger than "experience with Elasticsearch"
3. **Know the ecosystem context:** Elasticsearch is central to log analytics/observability (the ELK/Elastic Stack), search, and increasingly vector/semantic search for AI applications — familiarity with which of these your target role actually needs is worth clarifying early
4. **Certifications, if pursuing one:** Elastic's certifications are hands-on, performance-based exams on a live cluster (no MCQ) — see this course's own Certification Guide for current format and pricing caveats
