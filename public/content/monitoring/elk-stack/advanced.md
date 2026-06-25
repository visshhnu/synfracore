# ELK Stack Advanced

## Elasticsearch Performance Tuning

```yaml
# elasticsearch.yml — production settings
indices.memory.index_buffer_size: 30%
indices.queries.cache.size: 15%
thread_pool.write.queue_size: 1000
bootstrap.memory_lock: true   # prevent swapping

# JVM heap — set to 50% RAM, max 32GB
# jvm.options
-Xms16g
-Xmx16g
-XX:+UseG1GC
-XX:G1ReservePercent=25
```

```bash
# Bulk indexing optimization
curl -X PUT "localhost:9200/logs/_settings" -d '
{
  "index": {
    "refresh_interval": "30s",
    "number_of_replicas": 0
  }
}'
# After bulk load, restore:
# refresh_interval: "1s", replicas: 1
```

## Cross-Cluster Search (CCS)

```yaml
# Configure remote clusters
PUT _cluster/settings
{
  "persistent": {
    "cluster.remote.cluster_eu": {
      "seeds": ["eu-es-node1:9300", "eu-es-node2:9300"]
    }
  }
}

# Search across clusters
GET /cluster_eu:logs-*,logs-*/_search
{
  "query": {"match": {"level": "ERROR"}}
}
```

## Machine Learning Anomaly Detection

```json
// Create ML job for anomalous log count
PUT _ml/anomaly_detectors/log-volume-anomaly
{
  "analysis_config": {
    "bucket_span": "15m",
    "detectors": [{
      "function": "high_count",
      "partition_field_name": "service.keyword"
    }]
  },
  "data_description": {
    "time_field": "@timestamp"
  }
}

// Start datafeed
POST _ml/datafeeds/datafeed-log-volume-anomaly/_start
```

## Snapshot and Restore

```bash
# Register S3 repository
PUT _snapshot/my_s3_repo
{
  "type": "s3",
  "settings": {
    "bucket": "my-es-snapshots",
    "region": "us-east-1"
  }
}

# Create snapshot
PUT _snapshot/my_s3_repo/snapshot-2024-01-15
{
  "indices": "logs-*",
  "ignore_unavailable": true,
  "include_global_state": false
}

# Restore
POST _snapshot/my_s3_repo/snapshot-2024-01-15/_restore
{
  "indices": "logs-2024.01.15",
  "rename_pattern": "(.+)",
  "rename_replacement": "restored-$1"
}
```

## Logstash at Scale

```
# Multiple pipelines — pipelines.yml
- pipeline.id: nginx-logs
  path.config: "/etc/logstash/conf.d/nginx.conf"
  pipeline.workers: 4
  pipeline.batch.size: 500

- pipeline.id: app-logs
  path.config: "/etc/logstash/conf.d/app.conf"
  pipeline.workers: 8
  queue.type: persisted
  queue.max_bytes: 2gb
```

## Elasticsearch Data Streams

Modern replacement for time-based index patterns.

```bash
# Create index template for data stream
PUT _index_template/logs-template
{
  "index_patterns": ["logs-*"],
  "data_stream": {},
  "template": {
    "settings": {
      "number_of_shards": 1,
      "lifecycle.name": "logs-policy"
    }
  }
}

# Create data stream
PUT _data_stream/logs-nginx

# Index into data stream
POST logs-nginx/_doc
{
  "@timestamp": "2024-01-15T10:30:00Z",
  "message": "GET /api/v1 200"
}
```

## Fleet and Elastic Agent

Modern unified agent replacing Filebeat/Metricbeat/etc.

```bash
# Install Elastic Agent
curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.12.0-linux-x86_64.tar.gz
tar xzf elastic-agent-8.12.0-linux-x86_64.tar.gz
cd elastic-agent-8.12.0-linux-x86_64
sudo ./elastic-agent install   --fleet-server-es=https://elasticsearch:9200   --fleet-server-es-ca=/etc/elasticsearch/certs/ca.crt   --enrollment-token=YOUR_ENROLLMENT_TOKEN
```

## Production Architecture

```
                 [Kafka]
                    │
            ┌───────┴────────┐
      [Logstash]        [Logstash]
            └───────┬────────┘
                    │
         [Elasticsearch Cluster]
         ├── 3 Master nodes (m6g.large)
         ├── 5 Hot data nodes (r6g.2xlarge, NVMe SSD)
         └── 3 Warm data nodes (r6g.xlarge, gp3)
                    │
                 [Kibana]
              (2 nodes, NLB)
```

Key decisions: Kafka as buffer prevents data loss during ES maintenance; dedicated master nodes for cluster stability; tiered storage cuts costs 60%.
