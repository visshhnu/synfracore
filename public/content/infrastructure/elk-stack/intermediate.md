# ELK Stack — Intermediate

## Elasticsearch Cluster Operations

```bash
# Cluster health
curl -s localhost:9200/_cluster/health?pretty
# green = all shards assigned, yellow = replicas not assigned, red = data loss

# Node stats
curl -s localhost:9200/_nodes/stats?pretty | jq '.nodes | to_entries[] | {
  name: .value.name,
  heap_percent: .value.jvm.mem.heap_used_percent,
  cpu: .value.process.cpu.percent,
  docs: .value.indices.docs.count
}'

# Index stats
curl -s localhost:9200/_cat/indices?v&s=store.size:desc&h=index,docs.count,store.size,pri,rep

# Shard allocation
curl -s localhost:9200/_cat/shards?v&s=state | head -30

# Pending tasks (cluster not healthy if many pending)
curl -s localhost:9200/_cluster/pending_tasks?pretty

# Force shard reallocation (when stuck)
curl -X POST localhost:9200/_cluster/reroute?retry_failed=true

# Increase replica count (for a hot index)
curl -X PUT localhost:9200/logs-2024-01/_settings -d '{
  "index": {"number_of_replicas": 2}
}'
```

## Elasticsearch Performance Tuning

```json
// Index settings for high-throughput ingestion
PUT /logs-write
{
  "settings": {
    "refresh_interval": "30s",        // Default 1s — set higher for bulk indexing
    "number_of_replicas": 0,          // Temporarily 0 during bulk load
    "index.translog.durability": "async",  // Faster at risk of small data loss on crash
    "index.translog.sync_interval": "30s",
    "index.merge.scheduler.max_thread_count": 1  // Reduce merge pressure
  }
}

// After bulk load — restore for production
PUT /logs-write/_settings
{
  "index": {
    "refresh_interval": "5s",
    "number_of_replicas": 1,
    "translog.durability": "request"
  }
}

// JVM heap settings (/etc/elasticsearch/jvm.options)
// -Xms16g
// -Xmx16g
// Rule: 50% of RAM, max 32GB (above 32GB JVM pointer compression disabled)
```

## Logstash Performance

```ruby
# Multiple pipelines (logstash.yml)
pipeline.workers: 4         # Match CPU cores
pipeline.batch.size: 500    # Documents per batch
pipeline.batch.delay: 50    # ms to wait before sending partial batch

# Persistent queues — don't lose events on Logstash crash
queue.type: persisted
queue.max_bytes: 4gb
path.queue: /var/lib/logstash/queue

# Dead letter queue — store failed events for investigation
dead_letter_queue.enable: true
path.dead_letter_queue: /var/lib/logstash/dlq

# Multiple pipelines config
# /etc/logstash/pipelines.yml
- pipeline.id: nginx
  path.config: /etc/logstash/conf.d/nginx.conf
  pipeline.workers: 2

- pipeline.id: application
  path.config: /etc/logstash/conf.d/app.conf
  pipeline.workers: 4
  queue.type: persisted
```

## Elasticsearch Ingest Pipelines

```json
// Modern approach: skip Logstash, parse in Elasticsearch directly
PUT /_ingest/pipeline/parse-nginx-logs
{
  "description": "Parse nginx access logs",
  "processors": [
    {
      "grok": {
        "field": "message",
        "patterns": ["%{COMBINEDAPACHELOG}"],
        "ignore_failure": true
      }
    },
    {
      "date": {
        "field": "timestamp",
        "formats": ["dd/MMM/yyyy:HH:mm:ss Z"],
        "target_field": "@timestamp"
      }
    },
    {
      "convert": {
        "field": "bytes",
        "type": "integer"
      }
    },
    {
      "geoip": {
        "field": "clientip",
        "target_field": "geoip",
        "ignore_failure": true
      }
    },
    {
      "remove": {
        "field": ["message", "timestamp"],
        "ignore_failure": true
      }
    }
  ]
}

// Use pipeline when indexing
PUT /logs/_doc/1?pipeline=parse-nginx-logs
{"message": "192.168.1.1 - - [15/Jan/2024:10:30:00 +0000] \"GET /api/health HTTP/1.1\" 200 256"}

// Filebeat: set pipeline in output.elasticsearch
output.elasticsearch:
  pipeline: parse-nginx-logs
```
