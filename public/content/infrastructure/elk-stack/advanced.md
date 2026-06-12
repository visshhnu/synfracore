# ELK Stack — Advanced

## Cross-Cluster Replication (CCR)

```json
// Replicate indices from one cluster to another
// Use cases: disaster recovery, geo-distribution, dev mirrors prod

// On follower cluster — follow an index from leader
PUT /logs-replicated/_ccr/follow
{
  "remote_cluster": "leader-cluster",
  "leader_index": "logs-2024-01",
  "settings": {
    "index.number_of_replicas": 0
  },
  "max_read_request_operation_count": 5120,
  "max_outstanding_read_requests": 12,
  "max_read_request_size": "32mb",
  "max_write_request_operation_count": 5120,
  "max_write_request_size": "9223372036854775807b",
  "max_outstanding_write_requests": 9
}

// Auto-follow pattern (replicate all indices matching a pattern)
PUT /_ccr/auto_follow/logs-pattern
{
  "remote_cluster": "leader",
  "leader_index_patterns": ["logs-*"],
  "follow_index_pattern": "{{leader_index}}-replicated"
}
```

## Elasticsearch Security

```yaml
# elasticsearch.yml — enable security
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: elastic-certificates.p12

# Create TLS certs
bin/elasticsearch-certutil ca
bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
```

```bash
# Set built-in user passwords
bin/elasticsearch-setup-passwords auto

# Create custom role
curl -X PUT localhost:9200/_security/role/logs-reader \
  -u elastic:password \
  -H 'Content-Type: application/json' \
  -d '{
    "indices": [{
      "names": ["logs-*"],
      "privileges": ["read", "view_index_metadata"],
      "field_security": {
        "grant": ["*"],
        "except": ["sensitive_field"]  # Hide sensitive fields
      },
      "query": "{\"term\": {\"environment\": \"production\"}}"  # Document-level security
    }]
  }'

# Create user
curl -X POST localhost:9200/_security/user/john \
  -d '{
    "password": "secure123",
    "roles": ["logs-reader"],
    "full_name": "John Smith"
  }'
```

## Kibana Dev Tools and Diagnostics

```bash
# Kibana Dev Tools (GET, POST, PUT, DELETE to Elasticsearch)
# Available at: http://kibana:5601/app/dev_tools

# Profile a slow query
POST /logs-*/_search?request_cache=false
{
  "profile": true,
  "query": {
    "bool": {
      "must": [{"match": {"message": "error"}}],
      "filter": [{"range": {"@timestamp": {"gte": "now-1h"}}}]
    }
  }
}
# Look at: profile.shards[0].searches[0].query[0].time_in_nanos

# Explain why a document matches (or doesn't match)
GET /logs/_explain/doc-id
{
  "query": {"match": {"message": "error"}}
}

# Hot threads (find what's slowing Elasticsearch)
GET /_nodes/hot_threads

# Field data usage (expensive!)
GET /_nodes/stats/indices/fielddata?human&fields=*
# High fielddata = you're doing aggregations on analyzed text fields
# Fix: use .keyword sub-field for aggregations
```

## ELK Stack Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
curl -s localhost:9200/_cluster/health?pretty
curl -s localhost:9200/_cat/nodes?v
curl -s localhost:9200/_cat/indices?v&s=store.size:desc

# ── SEARCH ────────────────────────────────────────────────
# Quick search
curl -s "localhost:9200/logs-*/_search?q=status:500&size=5&pretty"

# With query DSL
curl -X GET localhost:9200/logs-*/_search -d '{
  "query": {
    "bool": {
      "must": [{"match": {"level": "ERROR"}}],
      "filter": [{"range": {"@timestamp": {"gte": "now-1h"}}}]
    }
  },
  "sort": [{"@timestamp": "desc"}],
  "size": 20
}'

# ── INDEX MANAGEMENT ──────────────────────────────────────
curl -X PUT localhost:9200/my-index/_settings -d '{"index":{"number_of_replicas":1}}'
curl -X POST localhost:9200/my-index/_forcemerge?max_num_segments=1  # Reduce segments
curl -X POST localhost:9200/my-index/_flush                           # Flush to disk
curl -X DELETE localhost:9200/old-index-2023-01
curl -X POST localhost:9200/my-index/_refresh                         # Force refresh

# ── KIBANA ────────────────────────────────────────────────
# Import saved objects
curl -X POST "kibana:5601/api/saved_objects/_import" \
  -H "kbn-xsrf: true" \
  --form file=@export.ndjson

# List index patterns
curl kibana:5601/api/index_patterns/_find

# ── LOGSTASH ──────────────────────────────────────────────
systemctl status logstash
logstash --config.test_and_exit -f /etc/logstash/conf.d/  # Test config
curl localhost:9600/_node/stats | jq '.pipelines'          # Pipeline stats
```
