# ELK Stack Certification Guide

## Certifications Available

| Cert | Full Name | Format | Cost |
|------|-----------|--------|------|
| **Elastic Certified Engineer** | ECE | Hands-on lab, 3 hours | $400 |
| **Elastic Certified Analyst** | ECA | Hands-on lab, 3 hours | $400 |
| **Elastic Certified Observability Engineer** | ECOE | Hands-on lab, 3 hours | $400 |

All Elastic certifications are **performance-based** on a live Elasticsearch cluster.

---

## Elastic Certified Engineer — Exam Topics

```
CLUSTER MANAGEMENT:
  ✓ Configure nodes for different roles (master, data, ingest, coordinating)
  ✓ Create and manage index templates and component templates
  ✓ Configure ILM (Index Lifecycle Management) policies
  ✓ Set up cross-cluster replication (CCR)
  ✓ Diagnose and repair cluster health issues (RED/YELLOW)
  ✓ Back up and restore using snapshots

INDEXING & MAPPING:
  ✓ Create explicit mappings (avoid mapping explosions)
  ✓ Text vs keyword vs nested vs object fields
  ✓ Multi-field mappings
  ✓ Dynamic templates and index templates

QUERYING:
  ✓ Write complex Query DSL (bool, must, filter, should, must_not)
  ✓ Aggregations (terms, date_histogram, avg, cardinality, nested)
  ✓ Search templates and async search
  ✓ Score tuning with boost, function_score

PERFORMANCE:
  ✓ Optimize shard sizing and count
  ✓ Optimize index for write vs read
  ✓ Identify slow queries with slow logs
```

---

## Must-Know API Patterns

```bash
# Cluster health and diagnostics
GET _cluster/health?pretty
GET _cluster/stats
GET _cat/indices?v&s=index
GET _cat/shards?v&h=index,shard,prirep,state,node&s=state
GET _cat/nodes?v&h=name,heap.percent,cpu,load_1m

# ILM — Index Lifecycle Management
PUT _ilm/policy/logs-policy
{
  "policy": {
    "phases": {
      "hot":    { "min_age": "0ms", "actions": { "rollover": { "max_age": "1d", "max_primary_shard_size": "50gb" } } },
      "warm":   { "min_age": "3d",  "actions": { "shrink": { "number_of_shards": 1 }, "forcemerge": { "max_num_segments": 1 } } },
      "cold":   { "min_age": "30d", "actions": { "freeze": {} } },
      "delete": { "min_age": "90d", "actions": { "delete": {} } }
    }
  }
}

# Index template
PUT _index_template/logs-template
{
  "index_patterns": ["logs-*"],
  "template": {
    "settings": { "number_of_shards": 1, "number_of_replicas": 1 },
    "mappings": {
      "properties": {
        "@timestamp": { "type": "date" },
        "message":    { "type": "text" },
        "level":      { "type": "keyword" },
        "service":    { "type": "keyword" }
      }
    }
  }
}

# Snapshot backup
PUT _snapshot/my_repository
{ "type": "s3", "settings": { "bucket": "my-es-snapshots", "region": "us-east-1" } }

PUT _snapshot/my_repository/snapshot_2024-01
{ "indices": "logs-*", "include_global_state": false }

POST _snapshot/my_repository/snapshot_2024-01/_restore
{ "indices": "logs-2024.01.*" }
```

---

## Logstash Pipeline Configuration

```ruby
# /etc/logstash/conf.d/pipeline.conf
input {
  beats { port => 5044 }
  kafka {
    bootstrap_servers => "kafka:9092"
    topics => ["app-logs"]
    codec => json
  }
}

filter {
  grok {
    match => { "message" => "%{TIMESTAMP_ISO8601:timestamp} %{LOGLEVEL:level} %{GREEDYDATA:msg}" }
  }
  date {
    match => [ "timestamp", "ISO8601" ]
    target => "@timestamp"
  }
  if [level] == "ERROR" {
    mutate { add_tag => ["error"] }
  }
  geoip { source => "client_ip" }
}

output {
  elasticsearch {
    hosts => ["https://es:9200"]
    user => "elastic"
    password => "${ES_PASSWORD}"
    index => "logs-%{+YYYY.MM.dd}"
    ilm_enabled => true
    ilm_rollover_alias => "logs"
    ilm_policy => "logs-policy"
  }
}
```

## Revision Notes
```
ELASTIC CERTS: hands-on, 3 hours, live cluster, expensive ($400)
Study from elastic.co/training — official learning paths

CLUSTER HEALTH:
  GREEN: all shards assigned | YELLOW: replicas unassigned | RED: primary missing
  Fix YELLOW single-node: set replicas=0 or add a node

SHARD SIZING: target 20-50GB per shard | avoid too-many-small-shards
Index per day/week/month depending on volume

QUERY DSL:
  must: AND (affects score) | filter: AND (cached, no score)
  should: OR (boosts score) | must_not: NOT (no score)
  Use filter context for exact matches (faster, cached)

ILM: hot (active write) → warm (query only) → cold (frozen) → delete
Rollover: max_age or max_size triggers new index

MAPPINGS: text (full-text, tokenised) vs keyword (exact, aggregate, sort)
Multi-field: map as BOTH text and keyword
```
