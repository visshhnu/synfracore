# ELK Stack Interview Questions

## Core Concepts

**Q: What is the ELK Stack? What is each component?**

ELK = Elasticsearch + Logstash + Kibana. Now often called Elastic Stack (adds Beats).

**Elasticsearch**: Distributed search and analytics engine. Stores and indexes data. Query with REST API.

**Logstash**: Data processing pipeline. Ingests data from multiple sources, transforms it, sends to Elasticsearch (or other outputs). Heavy — uses JVM.

**Kibana**: Visualisation layer. Dashboards, search UI, Discover (log exploration), Lens (analytics).

**Beats**: Lightweight data shippers (Filebeat for logs, Metricbeat for metrics, Packetbeat for network). Alternative to Logstash for simple use cases.

**Common modern architecture:**
```
[Apps/Hosts] → Filebeat/Metricbeat (lightweight) → Logstash (transform) → Elasticsearch → Kibana
                                          OR
[Apps/Hosts] → Beats → Elasticsearch (with ingest pipelines) → Kibana
```

---

**Q: Elasticsearch concepts — index, document, shard, replica.**

**Document**: JSON record. The basic unit of data.
**Index**: Collection of related documents (like a database table, but schema-flexible).
**Shard**: Horizontal partition of an index. Allows parallel processing and scaling.
**Replica**: Copy of a shard. Provides redundancy and increased read throughput.

```
Index: "logs-2024-01"
  Primary Shard 0 ──→ Replica Shard 0 (on different node)
  Primary Shard 1 ──→ Replica Shard 1
  Primary Shard 2 ──→ Replica Shard 2
```

**Choosing shard count**: Rule of thumb: 20-40GB per shard. Too many shards = overhead.

**Index templates**: Define settings/mappings for indices matching a pattern (e.g., `logs-*`).
**ILM (Index Lifecycle Management)**: Auto-rotate indices. Hot → Warm → Cold → Delete.

---

**Q: Elasticsearch queries — DSL basics.**

```json
// Full-text search
{
  "query": {
    "match": { "message": "error database connection" }
  }
}

// Exact match (keyword field)
{
  "query": {
    "term": { "status.keyword": "failed" }
  }
}

// Range query
{
  "query": {
    "range": {
      "timestamp": {
        "gte": "2024-01-01",
        "lte": "2024-01-31"
      }
    }
  }
}

// Boolean query (combine)
{
  "query": {
    "bool": {
      "must": [{ "match": { "level": "ERROR" } }],
      "filter": [{ "term": { "service": "payment" } }],
      "must_not": [{ "match": { "message": "health check" } }]
    }
  }
}

// Aggregation (COUNT GROUP BY)
{
  "aggs": {
    "by_service": {
      "terms": { "field": "service.keyword" },
      "aggs": {
        "error_count": { "value_count": { "field": "_id" } }
      }
    }
  }
}
```

---

**Q: Logstash pipeline configuration.**

```ruby
# logstash.conf
input {
  beats { port => 5044 }  # Receive from Filebeat
  # OR
  kafka { topics => ["app-logs"] bootstrap_servers => "kafka:9092" }
}

filter {
  # Parse Apache log format
  grok {
    match => { "message" => "%{COMBINEDAPACHELOG}" }
  }

  # Parse JSON logs
  json { source => "message" }

  # Add timestamp
  date { match => ["timestamp", "ISO8601"] }

  # Enrich with GeoIP
  geoip { source => "client_ip" }

  # Drop health check logs
  if [path] =~ "/health" { drop {} }

  # Mask sensitive data
  mutate {
    gsub => ["message", "password=\S+", "password=REDACTED"]
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "app-logs-%{+YYYY.MM.dd}"
  }
  # Dead letter queue for failed events
  # stdout { codec => rubydebug }  # Debug only
}
```

---

**Q: Scaling and production concerns.**

**Elasticsearch scaling:**
- Add more data nodes for storage and throughput
- Dedicated master nodes (3+) — don't mix master+data for large clusters
- Coordinating nodes — handle search routing, reduce load on data nodes

**Memory**: Allocate 50% of RAM to JVM heap (max 31GB — beyond that, JVM loses compressed OOPs).
`ES_JAVA_OPTS="-Xms16g -Xmx16g"`

**Index performance:**
- Bulk API for indexing (not one-by-one)
- Disable `_source` if not needed (saves space)
- Use appropriate refresh interval (default 1s — increase for bulk loads)

**Production concerns:**
- Cluster health: GREEN (all shards), YELLOW (replicas unassigned), RED (primary shard missing)
- Monitor JVM heap % (above 75% = GC pressure)
- Slow log threshold for queries

## Revision Notes
```
ELK STACK:
Elasticsearch: distributed search + storage
Logstash: ingest + transform + route (heavy, JVM)
Kibana: visualisation + dashboards
Beats: lightweight shippers (Filebeat, Metricbeat)

ELASTICSEARCH CONCEPTS:
Document → Index → Shards (primary + replica)
~20-40GB per shard | ILM: hot→warm→cold→delete

QUERY DSL:
match: full-text | term: exact | range: date/number
bool: must/filter/should/must_not (combine queries)
aggs: group-by and compute metrics

LOGSTASH PIPELINE:
input → filter (grok/json/date/geoip/mutate) → output
grok: parse unstructured text | json: parse JSON logs
Drop: filter noisy logs | Mutate: transform fields

SCALING:
Dedicated master nodes (3+) for large clusters
50% RAM to JVM heap (max 31GB) | Bulk API for fast indexing
Cluster health: GREEN=good, YELLOW=replica missing, RED=primary missing
```
