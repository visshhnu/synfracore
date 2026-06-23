# Elasticsearch Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Elastic Certified Engineer** | Elastic | $400 | Hands-on lab, 3 hrs |
| **Elastic Certified Analyst** | Elastic | $400 | Hands-on lab, 3 hrs |
| **Elastic Certified Observability Engineer** | Elastic | $400 | Hands-on lab |

All Elastic exams are performance-based on a live cluster — no MCQ questions.

---

## Core Topics

```bash
# CLUSTER HEALTH AND STATUS
GET _cluster/health?pretty
GET _cat/indices?v&s=index
GET _cat/nodes?v&h=name,heap.percent,cpu,load_1m
GET _cat/shards?v&h=index,shard,prirep,state,node
```

```json
// INDEX CREATION WITH EXPLICIT MAPPING
{
  "settings": { "number_of_shards": 1, "number_of_replicas": 1 },
  "mappings": {
    "properties": {
      "name":  { "type": "text", "fields": { "kw": { "type": "keyword" } } },
      "price": { "type": "float" },
      "tags":  { "type": "keyword" },
      "date":  { "type": "date", "format": "yyyy-MM-dd" }
    }
  }
}

// BOOL QUERY
{
  "query": {
    "bool": {
      "must":     [{ "match": { "name": "gaming laptop" } }],
      "filter":   [{ "range": { "price": { "gte": 500, "lte": 2000 } } },
                   { "term":  { "tags": "electronics" } }],
      "must_not": [{ "term": { "available": false } }]
    }
  },
  "sort": [{ "price": "asc" }],
  "size": 10
}

// AGGREGATIONS
{
  "size": 0,
  "aggs": {
    "by_status": {
      "terms": { "field": "status.keyword", "size": 10 },
      "aggs": { "avg_response": { "avg": { "field": "response_ms" } } }
    },
    "per_hour": {
      "date_histogram": { "field": "@timestamp", "calendar_interval": "1h" }
    }
  }
}

// ILM POLICY
{
  "policy": { "phases": {
    "hot":    { "actions": { "rollover": { "max_age": "1d", "max_primary_shard_size": "50gb" } } },
    "warm":   { "min_age": "3d",  "actions": { "shrink": { "number_of_shards": 1 } } },
    "delete": { "min_age": "30d", "actions": { "delete": {} } }
  }}
}

// SNAPSHOT (backup to filesystem or S3)
// PUT _snapshot/my_repo  { "type": "fs", "settings": { "location": "/mnt/backups" } }
// PUT _snapshot/my_repo/snap1  { "indices": "logs-*", "include_global_state": false }
// POST _snapshot/my_repo/snap1/_restore
```

---

## Study Resources

- **Elastic Training** (elastic.co/training) — official learning paths
- **Elastic Docs** (elastic.co/guide) — authoritative reference
- **Elastic Community** (discuss.elastic.co) — active support forums
- **Local ELK Docker Compose** — run practice environment on your machine

## Revision Notes
```
MAPPING: text (full-text, tokenized, analyzed) | keyword (exact, aggregations, sort)
Multi-field: map as BOTH text AND keyword.kw — most common production pattern
Dynamic mapping: auto-created on first insert — define explicit in production

BOOL QUERY: must (AND + relevance score) | filter (AND + cached, no score)
            should (OR, boosts score)    | must_not (NOT)
Use filter context for exact matches — no scoring overhead, results are cached

SHARDS: target 20-50 GB per shard | too many small shards = overhead
HEALTH: GREEN = all shards OK | YELLOW = replicas missing | RED = primary missing

ILM: hot (write) -> warm (read-only) -> cold (minimal resources) -> delete
SNAPSHOT: register repo -> take snapshot -> restore (works for backup and migration)

AGGREGATIONS: terms (group by) | date_histogram (time buckets) | avg/sum/cardinality
Nested aggs: place sub-agg inside parent for multi-dimensional breakdowns
```
