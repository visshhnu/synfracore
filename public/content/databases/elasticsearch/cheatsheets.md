# Elasticsearch — Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
curl -s localhost:9200/_cluster/health?pretty
curl -s localhost:9200/_cat/nodes?v&h=name,ip,heap.percent,cpu,master
curl -s localhost:9200/_cat/indices?v&s=store.size:desc
curl -s localhost:9200/_cat/shards?v | grep UNASSIGNED  # Problem shards
curl -s localhost:9200/_cluster/pending_tasks?pretty

# ── INDEXES ────────────────────────────────────────────────
# Create with settings
curl -X PUT localhost:9200/my-index \
    -H 'Content-Type: application/json' \
    -d '{"settings":{"number_of_shards":3,"number_of_replicas":1}}'

# Get mapping
curl localhost:9200/my-index/_mapping?pretty

# Update settings (while index is open)
curl -X PUT localhost:9200/my-index/_settings \
    -d '{"index":{"number_of_replicas":2}}'

# Change refresh interval (set to -1 for bulk indexing, then restore)
curl -X PUT localhost:9200/my-index/_settings \
    -d '{"index":{"refresh_interval":"30s"}}'

# Delete
curl -X DELETE localhost:9200/my-index
curl -X DELETE "localhost:9200/logs-2023-*"  # Pattern delete

# Force merge (reduce segment count, improves search perf)
curl -X POST "localhost:9200/my-index/_forcemerge?max_num_segments=1"

# ── DOCUMENTS ─────────────────────────────────────────────
# Index document
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
    -d '{"name":"MacBook","price":199999,"brand":"Apple"}'

# Get document
curl localhost:9200/products/_doc/doc-id

# Update document (partial)
curl -X POST localhost:9200/products/_update/doc-id \
    -d '{"doc":{"price":189999}}'

# Delete document
curl -X DELETE localhost:9200/products/_doc/doc-id

# Bulk operations
curl -X POST localhost:9200/_bulk -H 'Content-Type: application/json' -d '
{"index":{"_index":"products","_id":"1"}}
{"name":"MacBook","price":199999}
{"index":{"_index":"products","_id":"2"}}
{"name":"iPhone","price":79999}
'

# ── SEARCH ────────────────────────────────────────────────
# Simple query string
curl "localhost:9200/products/_search?q=name:macbook&size=5&pretty"

# Match query
curl -X GET localhost:9200/products/_search \
    -d '{"query":{"match":{"name":"macbook laptop"}},"size":5}'

# Bool query
curl -X GET localhost:9200/products/_search -d '{
    "query":{"bool":{
        "must":[{"match":{"name":"laptop"}}],
        "filter":[{"term":{"brand":"Apple"}},{"range":{"price":{"lte":200000}}}]
    }},
    "sort":[{"price":"asc"}],"size":10
}'

# Aggregations
curl -X GET localhost:9200/products/_search -d '{
    "size":0,
    "aggs":{"by_brand":{"terms":{"field":"brand.keyword","size":10},
        "aggs":{"avg_price":{"avg":{"field":"price"}}}}}
}'

# ── ALIASES ───────────────────────────────────────────────
# Zero-downtime index swap
curl -X POST localhost:9200/_aliases -d '{
    "actions":[
        {"remove":{"index":"products-v1","alias":"products"}},
        {"add":   {"index":"products-v2","alias":"products"}}
    ]
}'
```
