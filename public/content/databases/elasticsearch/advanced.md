# Elasticsearch — Advanced

## Index Lifecycle Management (ILM)

```json
// Automate index rollover and deletion for time-series data

PUT /_ilm/policy/logs-policy
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "1d",
            "max_docs": 100000000
          },
          "set_priority": { "priority": 100 }
        }
      },
      "warm": {
        "min_age": "7d",
        "actions": {
          "readonly": {},
          "shrink": { "number_of_shards": 1 },
          "forcemerge": { "max_num_segments": 1 },
          "set_priority": { "priority": 50 }
        }
      },
      "cold": {
        "min_age": "30d",
        "actions": {
          "freeze": {},
          "set_priority": { "priority": 0 }
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": { "delete": {} }
      }
    }
  }
}

// Data stream with ILM
PUT /_index_template/logs-template
{
  "index_patterns": ["logs-*"],
  "data_stream": {},
  "template": {
    "settings": {
      "index.lifecycle.name": "logs-policy",
      "index.number_of_shards": 3,
      "index.number_of_replicas": 1
    }
  }
}
```

## Elasticsearch Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
curl -s localhost:9200/_cluster/health?pretty
curl -s localhost:9200/_cat/nodes?v
curl -s localhost:9200/_cat/indices?v&s=store.size:desc&h=index,docs.count,store.size,health

# ── INDEX MANAGEMENT ──────────────────────────────────────
curl -X PUT localhost:9200/my-index -H 'Content-Type: application/json' \
    -d '{"settings": {"number_of_shards": 3, "number_of_replicas": 1}}'
curl -X DELETE localhost:9200/my-index
curl -X POST localhost:9200/my-index/_forcemerge?max_num_segments=1
curl -X POST localhost:9200/my-index/_refresh

# ── SEARCH ────────────────────────────────────────────────
# Quick search
curl "localhost:9200/my-index/_search?q=field:value&size=10&pretty"

# Count
curl localhost:9200/my-index/_count -d '{"query": {"match": {"status": "error"}}}'

# Explain scoring
curl -X GET localhost:9200/my-index/_explain/doc-id \
    -d '{"query": {"match": {"title": "elasticsearch"}}}'

# Profile query performance
curl -X GET localhost:9200/my-index/_search \
    -d '{"profile": true, "query": {"match": {"title": "test"}}}'

# ── ALIASES ───────────────────────────────────────────────
# Zero-downtime index swaps
curl -X POST localhost:9200/_aliases -d '{
    "actions": [
        {"remove": {"index": "products-v1", "alias": "products"}},
        {"add":    {"index": "products-v2", "alias": "products"}}
    ]
}'
```
