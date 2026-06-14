# Loki — Advanced

## Multi-Tenancy

```yaml
# Enable multi-tenancy (each team gets isolated logs)
auth_enabled: true

# Each request needs X-Scope-OrgID header
# Promtail config per tenant:
clients:
  - url: http://loki:3100/loki/api/v1/push
    tenant_id: team-platform
```

## Loki Distributed Mode

```
Single binary (dev): all components in one process
Scalable monolith:   still single binary but horizontally scalable
Microservices:       each component runs separately

Components:
  Distributor:    Receives incoming log streams, validates, fans out
  Ingester:       Builds chunks in memory, flushes to storage
  Querier:        Executes LogQL queries
  Query Frontend: Splits large queries, caches results
  Compactor:      Merges and deduplicates chunks in object storage
  Ruler:          Evaluates alerting and recording rules
```

## Object Storage Backend

```yaml
# Production: use S3/GCS instead of local filesystem
schema_config:
  configs:
    - from: 2024-01-01
      store: tsdb
      object_store: s3
      schema: v12

storage_config:
  aws:
    s3: s3://my-loki-bucket/
    region: ap-south-1
  tsdb_shipper:
    active_index_directory: /data/tsdb-index
    cache_location: /data/tsdb-cache
```

## Performance Tuning

```logql
# Bad: scans ALL logs then filters
{job="nginx"} |= "user_id=12345"

# Better: use more specific label selectors to reduce scanned streams
{job="nginx", method="POST", path="/api/users"} |= "user_id=12345"

# Best: if you know the approximate time, always narrow the time range
# In Grafana: set dashboard time range to minimum needed

# Recording rules: pre-compute expensive queries
groups:
  - name: loki-recording
    interval: 5m
    rules:
      - record: job:loki_log_lines:rate5m
        expr: sum by (job) (rate({job=~".+"}[5m]))
```
