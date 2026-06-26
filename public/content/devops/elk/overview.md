# ELK Stack

> **Elasticsearch, Logstash, Kibana — centralized log management**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is ELK Stack?

ELK = Elasticsearch (storage+search) + Logstash (collection+parsing) + Kibana (UI). Beats are lightweight log shippers (Filebeat for logs, Metricbeat for metrics) — installed on every server. Logstash processes and enriches logs before sending to Elasticsearch. Index Lifecycle Management (ILM) automatically moves old indices to cheaper tiers and deletes them — critical for controlling storage costs.

## Why ELK Stack?

Logstash pipeline: Input (where logs come from) → Filter (parse and enrich) → Output (where to send). Grok uses regex patterns to parse unstructured log lines into structured fields. Always test grok patterns at grokdebug.herokuapp.com before deploying. Use conditional logic (if/else) to handle different log formats in one pipeline.

---

## Learning Modules

### Module 01 — ELK Architecture
*Elasticsearch, Logstash, Kibana, Beats*

ELK = Elasticsearch (storage+search) + Logstash (collection+parsing) + Kibana (UI). Beats are lightweight log shippers (Filebeat for logs, Metricbeat for metrics) — installed on every server. Logstash processes and enriches logs before sending to Elasticsearch. Index Lifecycle Management (ILM) automatically moves old indices to cheaper tiers and deletes them — critical for controlling storage costs.

**Topics covered:**

- Elasticsearch — index and search — 🟢 Beginner
- Logstash — collect, parse, transform — 🟡 Intermediate
- Kibana — visualize and explore — 🟢 Beginner
- Beats — lightweight shippers — 🟡 Intermediate
- Index lifecycle management (ILM) — 🔴 Advanced

```bash
# ELK Stack deployment with Docker Compose
version: "3.8"
services:
  elasticsearch:
    image: elasticsearch:8.11.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=true
      - ELASTIC_PASSWORD=changeme
      - "ES_JAVA_OPTS=-Xms2g -Xmx2g"
    volumes:
      - es-data:/usr/share/elasticsearch/data
    ports: ["9200:9200"]

  logstash:
    image: logstash:8.11.0
    volumes:
      - ./logstash/pipeline:/usr/share/logstash/pipeline

  kibana:
    image: kibana:8.11.0
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    ports: ["5601:5601"]

  filebeat:
    image: elastic/filebeat:8.11.0
    user: root
    volumes:
      - /var/log:/var/log:ro
      - /var/lib/docker/containers:/var/lib/docker/containers:ro
      - ./filebeat.yml:/usr/share/filebeat/filebeat.yml:ro
```

### Module 02 — Logstash Pipelines
*Input, filter, output with grok*

Logstash pipeline: Input (where logs come from) → Filter (parse and enrich) → Output (where to send). Grok uses regex patterns to parse unstructured log lines into structured fields. Always test grok patterns at grokdebug.herokuapp.com before deploying. Use conditional logic (if/else) to handle different log formats in one pipeline.

**Topics covered:**

- Input plugins (Kafka, Filebeat, syslog) — 🟢 Beginner
- Grok filter for log parsing — 🟡 Intermediate
- Mutate, geoip, date filters — 🟡 Intermediate
- Conditional logic in pipelines — 🟡 Intermediate
- Output to Elasticsearch — 🟢 Beginner

```bash
# logstash.conf — production pipeline
input {
  kafka {
    bootstrap_servers => "kafka:9092"
    topics => ["app-logs", "nginx-logs"]
    group_id => "logstash-prod"
    codec => json
  }
  beats {
    port => 5044
  }
}

filter {
  # Parse Nginx access log
  if [fields][log_type] == "nginx" {
    grok {
      match => { "message" => '%{IPORHOST:client_ip} - - \\\\[%{HTTPDATE:timestamp}\\\\] "%{WORD:method} %{URIPATH:request} HTTP/%{NUMBER}" %{NUMBER:status} %{NUMBER:bytes} "%{DATA:referrer}" "%{DATA:user_agent}" %{NUMBER:response_time}' }
    }
    mutate {
      convert => {
        "status"        => "integer"
        "bytes"         => "integer"
        "response_time" => "float"
      }
    }
    # Tag slow requests
    if [response_time] > 1.0 {
      mutate { add_tag => ["slow_request"] }
    }
    # Drop health check noise
    if [request] =~ "/health" {
      drop {}
    }
  }

  # Add environment
  mutate {
    add_field => { "environment" => "production" }
  }
  date {
    match => ["timestamp", "dd/MMM/yyyy:HH:mm:ss Z"]
    target => "@timestamp"
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "%{[fields][log_type]}-%{+YYYY.MM.dd}"
    user => "logstash_writer"
    password => "${LOGSTASH_PASSWORD}"
  }
}
```

### Module 03 — Elasticsearch Operations
*Cluster health, shards, ILM*

Elasticsearch cluster health: Green (all shards assigned), Yellow (replicas not assigned — common in single-node), Red (primary shards missing — data loss risk, immediate action). Shards are the unit of distribution — each index is split into primary shards. ILM policy automatically manages index lifecycle: hot (active writes) → warm (searchable, no writes) → cold (rare access) → delete.

**Topics covered:**

- Cluster health: green/yellow/red — 🟢 Beginner
- Index and shard management — 🟡 Intermediate
- ILM policy for log retention — 🔴 Advanced
- Mapping and field types — 🔴 Advanced
- Common errors and fixes — 🟡 Intermediate

```bash
# Cluster health and diagnostics
# Check cluster health
curl -u elastic:password http://localhost:9200/_cluster/health?pretty

# Check why shards are unassigned (RED cluster)
curl http://localhost:9200/_cluster/allocation/explain?pretty

# Fix: retry failed allocation
curl -X POST http://localhost:9200/_cluster/reroute?retry_failed=true

# ILM policy — 7 days hot, 30 days warm, delete after 90 days
curl -X PUT "localhost:9200/_ilm/policy/logs-policy" -H 'Content-Type: application/json' -d '{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {"max_size": "50gb", "max_age": "1d"}
        }
      },
      "warm": {
        "min_age": "7d",
        "actions": {"shrink": {"number_of_shards": 1}}
      },
      "delete": {
        "min_age": "90d",
        "actions": {"delete": {}}
      }
    }
  }
}'

# Disk full — delete old indices (emergency)
curl -X DELETE "localhost:9200/logs-2024-01-*"

# Check index sizes
curl http://localhost:9200/_cat/indices?v&s=store.size:desc | head -20
```

### Module 04 — Kibana — Search & Visualization
*KQL, Discover, dashboards, alerts*

Kibana is the ELK UI. KQL (Kibana Query Language) is simpler than Elasticsearch JSON query DSL. Discover lets you search logs in real-time. Lens creates visualizations with a drag-and-drop interface. Always create saved searches and dashboards — do not search manually in production incidents. Pre-built dashboards for Nginx, Kubernetes, system metrics come with Kibana.

**Topics covered:**

- KQL (Kibana Query Language) — 🟢 Beginner
- Discover for log exploration — 🟢 Beginner
- Lens for visualizations — 🟡 Intermediate
- Alerts and connectors — 🟡 Intermediate

```bash
# KQL — Kibana Query Language examples
# These go in the Kibana search bar

# Find all errors
level: ERROR

# Errors from specific service
level: ERROR AND service: "payment-api"

# HTTP 500 errors in nginx logs
status: 500

# Last 500 slow requests
response_time > 1.0

# Multiple conditions
level: (ERROR OR CRITICAL) AND environment: production

# Wildcard search
message: "OutOfMemory*"

# Date range (use Kibana time picker instead)
@timestamp >= "2024-01-15T14:00:00" AND @timestamp < "2024-01-15T15:00:00"

# Kibana Discover — save common searches
# Name: "Production Errors Last Hour"
# Query: level: ERROR AND environment: production
# Filter: @timestamp: last 1 hour

# Create alert in Kibana (Stack Management > Rules)
# Rule type: Elasticsearch query
# Query: level: ERROR
# Condition: count > 100 in 5 minutes
# Action: Send Slack notification
```

---

## Production Example

```bash
# ELK Troubleshooting Cheatsheet

# ── LOGSTASH DEBUGGING ─────────────────────────────────────
# Test pipeline config before applying
/usr/share/logstash/bin/logstash --config.test_and_exit \\\\
  -f /etc/logstash/conf.d/

# Run Logstash with debug output
/usr/share/logstash/bin/logstash -f pipeline.conf \\\\
  --log.level=debug

# Test grok patterns (online): grokdebug.herokuapp.com
# Or use Kibana Dev Tools → Grok Debugger

# ── ELASTICSEARCH COMMON FIXES ────────────────────────────
# Disk watermark hit (80%) — Elasticsearch goes read-only
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d '{
  "transient": {
    "cluster.routing.allocation.disk.watermark.low": "90%",
    "cluster.routing.allocation.disk.watermark.high": "95%"
  }
}'

# Re-enable writes after clearing disk
curl -X PUT "localhost:9200/<index>/_settings" -H 'Content-Type: application/json' -d '{
  "index.blocks.read_only_allow_delete": null
}'

# ── PERFORMANCE TUNING ─────────────────────────────────────
# Increase refresh interval for high-ingestion indices
curl -X PUT "localhost:9200/logs-*/_settings" -H 'Content-Type: application/json' -d '{
  "index": {"refresh_interval": "30s"}
}'

# Bulk indexing — tune for throughput
# logstash output:
output {
  elasticsearch {
    hosts => ["es:9200"]
    index => "logs-%{+YYYY.MM.dd}"
    pipeline => "logs-enrichment"
    bulk_path => "/_bulk"
  }
}
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is ELK Stack and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does ELK Stack work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of ELK Stack?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in ELK Stack?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with ELK Stack?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe ELK Stack in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for ELK Stack?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does ELK Stack compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain ELK Architecture in ELK Stack."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Logstash Pipelines in ELK Stack."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Elasticsearch Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/)
- [Logstash Documentation](https://www.elastic.co/guide/en/logstash/current/)
- [Kibana Documentation](https://www.elastic.co/guide/en/kibana/current/)
- [Grok Debugger](https://grokdebug.herokuapp.com/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*