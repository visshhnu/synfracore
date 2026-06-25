# Loki Advanced

## Loki Distributed Mode

For production at scale, run Loki components separately.

```yaml
# Components
distributor:    receives push requests, validates, fans out to ingesters
ingester:       accepts writes, buffers in memory, flushes to object store
querier:        executes LogQL queries against ingesters + store
query-frontend: request splitting, caching, parallelism
compactor:      index compaction, retention enforcement
ruler:          alert evaluation

# Minimal HA config
2+ distributors (stateless, behind LB)
3+ ingesters (ring-based, replication=3)
2+ queriers
1  query-frontend
1  compactor
```

```yaml
# loki-distributed values.yaml (Helm)
loki:
  auth_enabled: false
  commonConfig:
    replication_factor: 3
  storage:
    type: s3
    s3:
      bucketnames: loki-chunks
      region: us-east-1

ingester:
  replicas: 3
querier:
  replicas: 2
distributor:
  replicas: 2
```

## Object Storage Backend

```yaml
schema_config:
  configs:
    - from: 2024-01-01
      store: tsdb
      object_store: s3
      schema: v13
      index:
        prefix: index_
        period: 24h

storage_config:
  tsdb_shipper:
    active_index_directory: /loki/tsdb-index
    cache_location: /loki/tsdb-cache
  aws:
    s3: s3://us-east-1/loki-chunks
    s3forcepathstyle: false
```

## Chunk and Index Optimization

```yaml
chunk_store_config:
  chunk_cache_config:
    redis:
      endpoint: redis:6379
      expiration: 1h

query_range:
  results_cache:
    cache:
      redis:
        endpoint: redis:6379

limits_config:
  # Ingestion limits
  ingestion_rate_mb: 16
  ingestion_burst_size_mb: 32
  max_streams_per_user: 100000
  max_entries_limit_per_query: 50000

  # Query limits
  max_query_length: 721h      # 30 days
  max_query_parallelism: 32
  split_queries_by_interval: 24h
```

## Bloom Filters (Loki 3.0+)

Bloom filters enable fast substring search across compressed log chunks without full scan.

```yaml
bloom_build:
  enabled: true
  builder:
    planner_interval: 1h

bloom_gateway:
  enabled: true
  client:
    addresses: dnssrv+_bloom-gateway-grpc._tcp.loki-bloom-gateway.monitoring.svc.cluster.local
```

## Kafka Integration (Kafka Logs → Loki)

```yaml
# Vector as log shipper from Kafka
[sources.kafka_logs]
type = "kafka"
bootstrap_servers = "kafka:9092"
topics = ["application-logs"]
group_id = "vector-loki"

[transforms.parse]
type = "remap"
inputs = ["kafka_logs"]
source = """
.parsed = parse_json!(.message)
.level = .parsed.level
.service = .parsed.service
"""

[sinks.loki]
type = "loki"
inputs = ["parse"]
endpoint = "http://loki:3100"
labels.service = "{{ service }}"
labels.level = "{{ level }}"
labels.env = "prod"
```

## Cost Optimization

```
Strategies:
1. Label cardinality control — fewer streams = less index cost
2. Compression — snappy (fast) vs gzip (better ratio) for chunks
3. Retention tiers — 7d hot, 30d warm, 1y cold (S3 Glacier)
4. Drop noisy logs at pipeline — health checks, debug lines
5. Log sampling — drop 90% of info logs in high-volume services
6. Structured metadata for high-cardinality fields (trace_id) instead of labels
7. Volume-based deduplication with distributor
```

## Loki Query Acceleration

```logql
# Use index-based label filters FIRST
{namespace="prod", service="api"}  # ← indexed, fast

# Then pipeline filters (not indexed, full scan)
|= "ERROR"
| json
| duration > 500

# Avoid
{namespace="prod"} | json | service="api"  # json parse of all prod logs first
```

## Multi-Tenancy

```yaml
# Enable multi-tenancy
auth_enabled: true

# Push with tenant header
curl -X POST http://loki:3100/loki/api/v1/push   -H "X-Scope-OrgID: team-platform"   -d '...'

# Query with tenant header
curl http://loki:3100/loki/api/v1/query   -H "X-Scope-OrgID: team-platform"   --data-urlencode 'query={service="api"}'
```
