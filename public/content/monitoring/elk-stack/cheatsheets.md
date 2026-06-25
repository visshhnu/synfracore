# ELK Stack Cheatsheet

## Elasticsearch API Quick Reference
```bash
# Cluster
GET /_cluster/health
GET /_cat/nodes?v
GET /_cat/indices?v&s=index
GET /_cat/shards?v

# Index operations
PUT /my-index
DELETE /my-index
GET /my-index/_mapping
GET /my-index/_settings

# Documents
POST /my-index/_doc        # auto-ID
PUT /my-index/_doc/1       # specific ID
GET /my-index/_doc/1
DELETE /my-index/_doc/1

# Search
GET /my-index/_search
GET /logs-*/_search        # wildcard
GET /_all/_search          # all indices
```

## Common Queries
```json
// Match query
{"query": {"match": {"message": "error timeout"}}}

// Term (exact)
{"query": {"term": {"level.keyword": "ERROR"}}}

// Range
{"query": {"range": {"@timestamp": {"gte": "now-1h", "lt": "now"}}}}

// Bool compound
{"query": {"bool": {
  "must": [{"match": {"level": "ERROR"}}],
  "filter": [{"term": {"service.keyword": "api"}}],
  "must_not": [{"term": {"endpoint": "/health"}}]
}}}

// Exists
{"query": {"exists": {"field": "error.stack_trace"}}}
```

## Kibana KQL
```
level: ERROR
service: api AND level: (ERROR OR WARN)
NOT source: healthcheck
latency_ms > 500
message: *timeout*
@timestamp > now-24h
```

## Logstash Filter Cheatsheet
```
grok      — regex pattern extraction
mutate    — field rename/remove/convert/replace
date      — parse timestamp strings
json      — parse JSON fields
split     — split field into array
aggregate — correlate events across time
drop      — discard events matching condition
throttle  — rate-limit matching events
```

## Filebeat Modules
```bash
filebeat modules enable nginx
filebeat modules enable postgresql
filebeat modules enable system
filebeat modules enable kafka
filebeat setup --dashboards    # load Kibana dashboards
filebeat -e -d "*"             # run with debug logging
```

## Index Patterns
```
logs-nginx-2024.01.*    # daily
logs-app-000001         # ILM with data streams
metricbeat-8.12.0-*    # Metricbeat default
filebeat-8.12.0-*      # Filebeat default
```

## Shard Sizing Rules
- Target 10–50 GB per shard
- Max 20 shards per GB heap
- 1 primary shard per index for time-series
- Replicas = 1 for HA (0 during bulk load)

## JVM Heap Rules
- Set Xms = Xmx (no resizing)
- Max 50% of RAM
- Hard max: 32 GB (above this, compressed OOPs disabled)
- Monitor: `GET /_nodes/stats/jvm`
