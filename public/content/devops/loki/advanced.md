# Loki — Advanced

## Multi-tenancy: isolating logs between teams on one Loki install

Running one Loki cluster for multiple teams — rather than a separate cluster per team — is far cheaper operationally, but requires actual isolation between tenants so one team can't see or query another's logs. Loki supports this natively via the `X-Scope-OrgID` header on every request:

```yaml
# Enable multi-tenancy — every request must now carry X-Scope-OrgID
auth_enabled: true
```

```yaml
# Promtail config — tag this agent's logs with a specific tenant
clients:
  - url: http://loki:3100/loki/api/v1/push
    tenant_id: team-platform
```

With `auth_enabled: true`, Loki rejects any request missing the header, and the write and read paths both scope strictly to the tenant ID present — a query from `team-platform` physically cannot return `team-payments`' log streams, because the tenant ID is part of how chunks are indexed and retrieved, not an application-level filter that could be bypassed.

## Distributed mode: the components behind "just run Loki"

The single-binary deployment used in development runs every Loki component in one process — fine for a small footprint, but it doesn't scale independently and a bug or resource spike in one function (say, query load) affects the whole process, including ingestion. Production deployments at real log volume typically run in **microservices mode**, where each component is its own independently-scaled service:

```
Distributor      Receives incoming log streams, validates them, fans out to Ingesters
Ingester         Builds compressed chunks in memory, periodically flushes to object storage
Querier          Executes LogQL queries against both recent (Ingester) and historical (storage) data
Query Frontend   Splits large queries into smaller shards, caches results
Compactor        Merges and deduplicates chunks in object storage over time, manages retention
Ruler            Evaluates alerting and recording rules on a schedule
```

There's also a middle option — **scalable monolith** — which keeps the single-binary deployment model but runs multiple replicas of it behind a load balancer, horizontally scaling without the full operational complexity of running six separately-managed microservices. The right choice depends on scale: single-binary for dev/small deployments, scalable monolith as a reasonable production default, full microservices mode once ingestion or query load is high enough that independently scaling Ingesters versus Queriers actually matters.

## Object storage backend: what production storage config looks like

Local filesystem storage works for development but isn't viable in production — no durability guarantees, no horizontal scaling of the read path. Production Loki points at S3 (or GCS/Azure Blob) instead:

```yaml
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

The `tsdb_shipper` config matters here — TSDB is the current recommended index format (superseding the older BoltDB-shipper), and it needs a local directory for actively-written index files plus a cache location, even though the durable copy lives in S3. Getting this pairing wrong (durable chunks in S3, but no working local index cache) is a common source of degraded query performance in an otherwise-correct S3 setup.

## Performance tuning: why the same query can be fast or slow

The single biggest lever on Loki query performance is how selective the label selector is — because the label selector determines how many chunks get fetched from storage before any text filtering happens at all:

```logql
# Bad — vague label selector, scans every nginx stream regardless of content
{job="nginx"} |= "user_id=12345"

# Better — a tighter label selector reduces the chunk set before the text scan even starts
{job="nginx", method="POST", path="/api/users"} |= "user_id=12345"

# Best — combine tight labels with a narrow time range
# (in Grafana: set the dashboard's time range to the minimum actually needed,
# rather than defaulting to a broad "last 7 days")
```

For queries that get run repeatedly on a schedule — a dashboard panel refreshed every 30 seconds, for instance — pre-computing the result via a **recording rule** avoids re-running the expensive raw query on every refresh:

```yaml
groups:
  - name: loki-recording
    interval: 5m
    rules:
      - record: job:loki_log_lines:rate5m
        expr: sum by (job) (rate({job=~".+"}[5m]))
```

The general principle worth internalizing: a LogQL query without a tight label selector is functionally a full scan of every stream matching the loose part of the selector, and no amount of query-side cleverness in the text filter compensates for that — the label selector is the expensive/cheap decision point, everything after it is comparatively minor.
