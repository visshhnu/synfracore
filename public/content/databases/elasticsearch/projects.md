# Elasticsearch — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Product Search with Explicit Mappings and Relevance Tuning

**Level:** Beginner-Intermediate | **Time:** 2 days

Build a realistic product search feature that demonstrates deliberate mapping decisions and measured relevance tuning, not just "it returns results."

### Steps

1. Design an explicit mapping (not dynamic) for a realistic product catalog, using the multi-field pattern (`text` + `.keyword`) wherever a field needs both full-text search and exact-match/aggregation support
2. Load a realistic volume of sample data (thousands of products, not a handful) and build a `bool` query combining `must` (relevance-affecting) and `filter` (cached, non-scoring) clauses correctly
3. Add field boosts (`multi_match` with `name^3`, etc.) to tune relevance, but measure the effect with a small fixed set of test queries before/after each change — don't tune purely by eyeballing one result
4. Use `_explain` on at least one query to understand exactly why a specific document scored the way it did
5. Write a README documenting each mapping decision (why this field is `text`, why that one is `keyword`, why some are both) and each relevance-tuning change with its measured before/after effect

### Skills Demonstrated

- Deliberate, explicit mapping design (not relying on dynamic mapping in a demo meant to show real understanding)
- Evidence-based relevance tuning using `_explain`, not guesswork
- The `must`/`filter` distinction applied correctly in a real bool query

### GitHub Repo Name

`elasticsearch-product-search`

---

## Project 2: Log Analytics Pipeline with ILM

**Level:** Intermediate | **Time:** 2-3 days

Build a realistic log ingestion and analytics setup that manages its own data lifecycle, not just an index that grows forever.

### Steps

1. Design a time-based index pattern (e.g. `logs-2026.07.19`) and set up an ILM policy with real hot → warm → cold → delete phases and sensible age/size thresholds
2. Ingest a realistic volume of structured log data (via the Bulk API, not one-by-one indexing) and confirm rollover actually triggers as configured
3. Build aggregation-based dashboards-style queries: error rate by service over time (`date_histogram` + `terms`), p50/p95/p99 latency (`percentiles`), all using `"size": 0` to avoid fetching raw documents unnecessarily
4. Deliberately let one index accumulate update/delete churn and observe segment fragmentation via `GET /index/_stats` (`docs.deleted`), then run a `_forcemerge` and document the before/after
5. Write a README explaining the ILM policy's phase thresholds and why they were chosen for this specific data's actual access pattern (recent logs queried often, old logs rarely)

### Skills Demonstrated

- Real ILM policy design tied to an actual data lifecycle, not just copying a default policy
- Aggregation-based analytics query patterns used for dashboards
- Diagnosing and fixing segment fragmentation with real evidence

### GitHub Repo Name

`elasticsearch-log-analytics-ilm`

---

## Project 3: Cluster Health Diagnostics and a Deliberate Failure Drill

**Level:** Advanced | **Time:** 3-4 days

Stand up a real multi-node cluster and practice genuine failure diagnosis, not just reading about cluster health colors.

### Steps

1. Run a 3-node cluster (Docker Compose is fine) with dedicated master-eligible nodes, and confirm quorum behavior — document what actually happens if you take down one node versus two
2. Deliberately create a yellow-status situation (e.g. an index with more replicas configured than available nodes) and use `GET _cluster/allocation/explain` to identify the specific, actual reason — not just observe the color
3. Simulate a mapping-explosion scenario in a throwaway index (index many documents with unpredictable, varying top-level field names) and observe the mapping field count grow — then fix it going forward with `dynamic: false` or the `flattened` type, and document the difference
4. Take a data node down entirely and confirm what happens to shards that had no replica versus shards that did — this should make the real, concrete difference between "replicas exist" and "replicas don't exist" visible, not theoretical
5. Write up the whole exercise as an incident-style report: what you did, what you observed at each step, and what would have actually happened in production if replicas hadn't existed

### Skills Demonstrated

- Real, hands-on cluster health diagnosis using `_cluster/allocation/explain`, not just color-watching
- Understanding mapping explosion as a genuine, reproducible failure mode
- Demonstrating the real consequence of missing replicas through actual failure injection

### GitHub Repo Name

`elasticsearch-cluster-diagnostics-lab`

---

## Tips for Great Elasticsearch Projects

**Show that you understand text vs. keyword as a deliberate choice, not default behavior.** Every mapping decision in a strong project should be explainable — "this field is keyword because I need to aggregate on it, and text because I also need to search it" is a real answer; "I just used the default" is not.

**Measure relevance changes, don't just eyeball one query.** A project that shows "before/after with a fixed test query set" is far more convincing than "I added a boost and it looked better."

**Elasticsearch is not a relational database.** If a project's design implies `FOREIGN KEY` constraints, `JOIN`s, or full ACID transactions across documents, that's a sign the project is being designed for the wrong tool — Elasticsearch is a search/analytics engine that typically sits alongside a primary database, not a replacement for one.

## Portfolio Checklist

- [ ] At least one project demonstrates explicit, deliberate mapping design (not relying on dynamic mapping)
- [ ] At least one project includes measured relevance tuning with real before/after evidence
- [ ] At least one project involves genuine multi-node cluster diagnostics, not a single-node demo
- [ ] Each README explains the reasoning, not just the final configuration
- [ ] You can walk through any of these projects for 5+ minutes without notes
