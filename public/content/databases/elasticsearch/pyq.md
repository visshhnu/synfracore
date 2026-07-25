# Elasticsearch — PYQ (Previously Asked / Practice Questions)

**Framing note:** Elastic's certifications (Elastic Certified Engineer, Analyst, Observability Engineer) are hands-on, performance-based exams on a live cluster, proctored and confidential — no public past-paper archive exists, and there's no MCQ question bank to leak in the first place. Pricing is listed elsewhere in this course as Observability Engineer $500 and Engineer/Analyst $400 *(needs verification — pricing has already shifted at least once; confirm all three current prices directly at elastic.co/training before relying on any of these figures)*. What follows is built from realistic, task-based scenarios matching the exam's actual hands-on format rather than invented MCQ content.

---

### 1. (Cluster health diagnostics) `GET _cluster/health` returns `"status": "yellow"`. What's the correct next command to determine the *specific reason*, and why isn't the color alone enough information to act on?

**Answer:** `GET _cluster/allocation/explain` — this returns the specific reason a particular shard isn't allocated (e.g., "no nodes with the required attribute," "same-node restriction preventing a replica from sitting on the same node as its primary," or, on a genuine single-node cluster, simply "no other nodes exist to place a replica on"). The color alone doesn't distinguish an expected, benign cause (a single-node cluster where yellow is the normal, permanent state) from a genuinely actionable problem (a node that should be available for allocation but isn't, for a real infrastructure reason) — this is exactly the distinction covered in this course's own Real World Scenarios material.

---

### 2. (Query DSL) Write a query that must match documents where `category` is exactly "electronics" AND `price` is between 100 and 500, but should NOT affect the relevance score — the goal is just to include qualifying documents, ranked purely by how well they match a separate text search.

```json
GET /products/_search
{
  "query": {
    "bool": {
      "must": [{ "match": { "description": "wireless headphones" } }],
      "filter": [
        { "term": { "category": "electronics" } },
        { "range": { "price": { "gte": 100, "lte": 500 } } }
      ]
    }
  }
}
```
**What's being tested:** the `must` vs. `filter` distinction — placing the exact-match/range conditions in `filter` means they narrow the result set without contributing to the relevance score at all, and `filter` clauses are cached, making repeated identical filters cheaper on subsequent queries. Placing these same conditions in `must` instead would still work correctly for filtering, but would also affect the final relevance score in ways that usually aren't intended for structured, exact-match conditions like category or price range.

---

### 3. (Mapping) A `status` field needs to support both fast, exact-match filtering (`status = "shipped"`) and full-text search (matching partial words within longer status descriptions). Design the mapping.

```json
PUT /orders
{
  "mappings": {
    "properties": {
      "status": {
        "type": "text",
        "fields": {
          "keyword": { "type": "keyword" }
        }
      }
    }
  }
}
```
**What's being tested:** the multi-field pattern — mapping the same underlying data as both `text` (the default `status` field, tokenized/analyzed, supports full-text search) and `keyword` (accessed as `status.keyword`, exact match, sortable, aggregatable) simultaneously. Using `status` for a `term` query (which expects exact matching) would fail to match as expected against the analyzed `text` version — you'd need to query `status.keyword` for that, and `status` for a `match` full-text query.

---

### 4. (Performance) A cluster has 200 indices, each with the default 1 shard, holding roughly 500MB of data each. What's the actual problem with this setup, even though total data volume isn't especially large?

**Answer:** Too many small shards — each shard, regardless of how small its actual data is, carries real fixed overhead (cluster state metadata, memory for shard-level data structures, file handles). This course's own material recommends targeting roughly 20-50GB per shard — 200 shards holding only ~500MB each is a severe over-sharding situation relative to that guideline, and the fixed per-shard overhead ends up dominating cluster resource usage disproportionate to the actual data volume being stored. The fix generally involves consolidating smaller indices (via aliases and reindexing, or adjusting how indices are split going forward, such as switching from daily to weekly index rollover for time-series data) rather than accepting many small shards as harmless just because total data size is modest.

---

### 5. (Aggregations) Write an aggregation that returns the average response time per HTTP status code, but only for requests in the last 24 hours, without returning any of the actual matching documents in the response.

```json
GET /logs/_search
{
  "size": 0,
  "query": {
    "range": { "@timestamp": { "gte": "now-24h" } }
  },
  "aggs": {
    "by_status": {
      "terms": { "field": "status_code" },
      "aggs": {
        "avg_response_time": { "avg": { "field": "response_time_ms" } }
      }
    }
  }
}
```
**What's being tested:** `"size": 0` to suppress returning the actual matched documents (only the aggregation results are needed), combined with a `range` query to scope the aggregation to a specific time window before it runs — a common real pattern for building dashboard-style summary statistics without the overhead of also fetching and transferring individual matching documents.

---

### 6. (Index management) An index needs to add a new field to its mapping, but that field should use a different analyzer than any existing field. Can this be done with a simple `PUT /_mapping` update, or does it require reindexing?

**Answer:** Adding a genuinely *new* field with its own analyzer to an existing mapping can be done with a simple `PUT /index/_mapping` update — Elasticsearch allows adding new fields to an existing mapping without reindexing. What *cannot* be done without reindexing is changing the analyzer (or most other core settings) of an *existing* field that already has indexed data — since changing how a field is analyzed would make previously-indexed data inconsistent with the new analysis rules, Elasticsearch requires creating a new index with the updated mapping and reindexing existing data into it (often via the `_reindex` API) rather than allowing an in-place change to an existing field's core type/analyzer settings.

---

### 7. (Query DSL / relevance) Why does a `match` query on a `text` field sometimes return unexpected results if you're expecting exact substring matching, and what should you use instead for genuine "contains this exact substring" needs?

**Answer:** A `match` query on a `text` field is analyzed — it tokenizes both the query and the indexed text according to the field's analyzer (typically lowercasing, splitting on word boundaries, removing stop words, and possibly stemming), meaning it matches based on the resulting tokens, not the literal original substring. This produces "unexpected" results specifically when someone assumes `match` behaves like a SQL `LIKE '%...%'` substring search — it doesn't. For genuine exact substring matching, options include a `wildcard` query (works but doesn't scale well for large text, especially with leading wildcards), an `ngram` analyzer configured specifically to support substring matching efficiently, or reconsidering whether a `keyword` field with a `wildcard`/`regexp` query fits the actual need better if the field's content is closer to a structured value than free text.

---

### 8. (Cluster architecture) Why does Elastic recommend 3 dedicated master-eligible nodes rather than 2 or 4 for a production cluster?

**Answer:** Master elections require a majority (quorum) vote to avoid split-brain scenarios (two separate groups of nodes each believing they're the legitimate cluster and both accepting writes independently). With 3 master-eligible nodes, quorum is 2 — the cluster can survive losing any single master-eligible node and still have enough remaining nodes to elect a new master safely. With only 2, quorum would require both to agree, meaning losing either one entirely halts the ability to elect a master at all. An even number like 4 doesn't actually improve resilience over 3 in the same way it might seem to — it still only tolerates losing one node before majority becomes impossible with certain node-loss combinations, while adding cost and complexity without a proportional resilience gain; odd numbers are the standard recommendation for exactly this reason across quorum-based systems generally, not just Elasticsearch specifically.

---

### 9. (Data lifecycle) A time-series logging use case indexes into a new daily index (`logs-2026-07-19`, etc.). What's the actual reason for this pattern instead of one continuously-growing index, and what does ILM add on top of it?

**Answer:** Time-based index partitioning makes it trivial to delete old data efficiently (`DELETE /logs-2026-01-*` drops an entire index instantly, versus needing to delete individual documents matching a date range from one giant index, which is far slower and leaves deleted-document overhead behind). It also lets each day's data be independently sized, sharded, and eventually moved to cheaper storage tiers. ILM (Index Lifecycle Management) automates the actual policy behind this pattern — automatically rolling over to a new index once a size/age/document-count threshold is hit, then automatically transitioning older indices through hot → warm → cold → delete phases (adjusting shard count, compressing/force-merging, and eventually deleting) without requiring a human to manually run each of these steps on a schedule.

---

### 10. (Real-world debugging) A search query that used to return results instantly now takes several seconds, and `_cat/indices` shows the index's document count hasn't grown significantly. What's a likely cause unrelated to raw data volume, and how would you investigate it?

**Answer:** A likely cause is segment fragmentation — Lucene (which Elasticsearch is built on) stores data in immutable segments, and frequent updates/deletes accumulate many small segments over time along with "deleted" document markers that still occupy space and get scanned during search, even though document *count* (the logical, current count) hasn't grown. Investigate via `GET /index/_stats` checking segment count and `docs.deleted`, and if fragmentation is confirmed as the cause, `POST /index/_forcemerge?max_num_segments=1` (best run during low-traffic periods, since it's resource-intensive) consolidates segments and purges deleted-document overhead, typically restoring query performance without needing to reindex from scratch or add new hardware.
