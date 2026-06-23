# Elasticsearch Interview Questions

## Core Concepts

**Q: What is Elasticsearch? Architecture overview.**

Elasticsearch is a distributed search and analytics engine built on Apache Lucene. Stores JSON documents, indexes them for fast full-text search and aggregations.

**Use cases**: Log analytics (ELK Stack), product search, application search, security analytics (SIEM), observability.

**Architecture:**
```
Cluster → multiple nodes
Node types:
  Master: cluster management, index creation, node assignment
  Data: stores shards, executes queries
  Coordinating: routes requests to data nodes, aggregates results
  Ingest: pre-processing pipeline (parse, enrich, transform)

Index → distributed across shards
  Primary shard: read + write
  Replica shard: read-only + HA (copy of primary, different node)

Recommended: 3 dedicated master nodes (quorum = 2)
```

---

**Q: Elasticsearch CRUD and query DSL.**

```json
// Index a document
PUT /products/_doc/1
{
  "name": "Kubernetes in Action",
  "category": "DevOps",
  "price": 49.99,
  "tags": ["kubernetes", "containers", "cloud-native"],
  "published": "2024-01-15"
}

// Search: match query (full-text)
GET /products/_search
{
  "query": {
    "match": { "name": "kubernetes containers" }
  }
}

// Bool query: combine conditions
GET /products/_search
{
  "query": {
    "bool": {
      "must": [{ "match": { "category": "DevOps" } }],
      "filter": [
        { "range": { "price": { "gte": 20, "lte": 100 } } },
        { "term": { "tags": "kubernetes" } }
      ],
      "must_not": [{ "term": { "status": "out_of_stock" } }]
    }
  },
  "sort": [{ "price": "asc" }],
  "size": 10,
  "from": 0
}

// Aggregation (like GROUP BY + COUNT)
GET /logs/_search
{
  "size": 0,
  "aggs": {
    "by_status": {
      "terms": { "field": "status.keyword", "size": 10 },
      "aggs": {
        "avg_response": { "avg": { "field": "response_time_ms" } }
      }
    }
  }
}
```

---

**Q: Elasticsearch mappings and data types.**

```json
// Explicit mapping (recommended for production)
PUT /products/_mapping
{
  "properties": {
    "name": { "type": "text", "analyzer": "english" },
    "name_keyword": { "type": "keyword" },  // For exact match + aggregations
    "price": { "type": "float" },
    "published": { "type": "date", "format": "yyyy-MM-dd" },
    "tags": { "type": "keyword" },
    "description": { "type": "text" }
  }
}
```

**text vs keyword:**
- `text`: full-text search (tokenised, analysed). Can't aggregate or sort on.
- `keyword`: exact match, aggregations, sorting. Not tokenised.

**Multi-field**: Map same field as both text and keyword (most common pattern).

---

**Q: Elasticsearch performance and best practices.**

```
1. Index design:
   - One index per time period (logs-2024-01) with ILM rotation
   - Avoid too many shards (~20-40GB per shard is ideal)
   - Use aliases, not direct index names in queries

2. Bulk API for indexing (not one-by-one):
   POST /_bulk
   { "index": { "_index": "products" } }
   { "name": "...", "price": 49.99 }
   { "index": { "_index": "products" } }
   ...

3. Query optimisation:
   - Use filter context (not query) for exact matches (filter is cached)
   - Avoid wildcards at start of pattern (slow: *kubernetes)
   - Use keyword field for aggregations

4. JVM heap: 50% of RAM, max 31GB (compressed OOPs limit)

5. Cluster health: GREEN = all shards assigned
   YELLOW = replicas unassigned (OK for single node)
   RED = primary shard missing (data loss risk)
```

---

**Q: ELK Stack integration.**

ELK = Elasticsearch + Logstash + Kibana.
Modern: Elastic Stack adds Beats (Filebeat, Metricbeat).

```
Apps/Servers → Filebeat (lightweight) → Logstash (transform) → Elasticsearch → Kibana
                                    OR
Apps/Servers → Filebeat → Elasticsearch (with ingest pipelines) → Kibana
```

See the ELK Stack interview section for detailed Logstash and Kibana coverage.

## Revision Notes
```
ELASTICSEARCH: Distributed search + analytics. JSON documents. Lucene under the hood.
Use for: full-text search, log analytics, SIEM, product search

ARCHITECTURE:
Cluster → Nodes (master/data/coordinating) → Index → Shards (primary + replica)
3 dedicated master nodes recommended (quorum = 2)

QUERY DSL:
match: full-text | term: exact | range: numeric/date
bool: must(AND) + filter(cached AND) + should(OR) + must_not
aggs: terms(group by) + avg/sum/max/min

MAPPING:
text: full-text, tokenised, cannot aggregate
keyword: exact match, aggregations, sorting
Multi-field: both text AND keyword (most common)

PERFORMANCE:
Bulk API for indexing | 20-40GB per shard | filter context cached (use for exact)
JVM heap = 50% RAM, max 31GB | GREEN/YELLOW/RED cluster health

ILM: Index Lifecycle Management — hot→warm→cold→delete
```
