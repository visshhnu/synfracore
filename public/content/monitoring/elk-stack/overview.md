# ELK Stack — Log Management & Analytics

ELK Stack (Elasticsearch + Logstash + Kibana) is the most widely deployed open-source log management platform. It ingests logs from thousands of sources, stores them searchably, and provides powerful analytics and visualization.

## What is ELK?

**E — Elasticsearch** — Distributed search and analytics engine. Stores all logs. Provides near-real-time full-text search using inverted indexes. The database layer.

**L — Logstash** — Data processing pipeline. Ingests from multiple sources, transforms/parses data, sends to Elasticsearch. The ETL layer.

**K — Kibana** — Visualization and UI. Query Elasticsearch, build dashboards, set alerts. The presentation layer.

**Beats** — Lightweight data shippers that run on servers/containers and send directly to Elasticsearch or Logstash. Filebeat (logs), Metricbeat (metrics), Packetbeat (network).

## Modern ELK Architecture (Production)

```
Application Pods / Servers
         │
    [Filebeat DaemonSet]   ← Runs on every K8s node
         │
         ▼
      [Kafka]             ← Buffer (absorbs spikes, prevents data loss)
         │
         ▼
    [Logstash]            ← Parse, filter, enrich
         │
         ▼
  [Elasticsearch]         ← Hot → Warm → Cold tiers
         │
         ▼
      [Kibana]            ← Dashboards, search, alerts
```

> **Why Kafka in the middle?** At high volume (1M+ logs/minute), if Elasticsearch is slow, Logstash backs up and eventually drops logs. Kafka acts as a durable buffer — data is safe even if Elasticsearch is down for hours.

## Elasticsearch Fundamentals

```
Index      = Database table (e.g., logs-nginx-2024.01.15)
Document   = A single log entry (JSON)
Field      = A key in the JSON document
Shard      = A piece of an index (horizontal scaling)
Replica    = Copy of a shard (high availability)
```

```bash
# Elasticsearch API examples
BASE="http://localhost:9200"

# Check cluster health
curl "$BASE/_cluster/health?pretty"

# List all indices
curl "$BASE/_cat/indices?v"

# Create index with mapping
curl -X PUT "$BASE/logs-app-2024" -H "Content-Type: application/json" -d '{
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 1
  },
  "mappings": {
    "properties": {
      "@timestamp": { "type": "date" },
      "level":      { "type": "keyword" },
      "message":    { "type": "text" },
      "service":    { "type": "keyword" },
      "duration_ms":{ "type": "float" }
    }
  }
}'

# Search — full text
curl "$BASE/logs-app-2024/_search?pretty" -H "Content-Type: application/json" -d '{
  "query": {
    "bool": {
      "must": [
        { "match": { "message": "error connecting to database" } },
        { "term":  { "level": "ERROR" } }
      ],
      "filter": [
        { "range": { "@timestamp": { "gte": "now-1h" } } }
      ]
    }
  },
  "sort": [{ "@timestamp": "desc" }],
  "size": 50
}'

# Aggregation — count errors by service
curl "$BASE/logs-*/_search?pretty" -H "Content-Type: application/json" -d '{
  "query": { "term": { "level": "ERROR" } },
  "aggs": {
    "errors_by_service": {
      "terms": { "field": "service", "size": 20 }
    }
  },
  "size": 0
}'
```

## Filebeat Configuration (Kubernetes)

```yaml
# filebeat-daemonset.yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: filebeat
  namespace: logging
spec:
  selector:
    matchLabels:
      app: filebeat
  template:
    metadata:
      labels:
        app: filebeat
    spec:
      serviceAccountName: filebeat
      containers:
      - name: filebeat
        image: docker.elastic.co/beats/filebeat:8.12.0
        args: ["-c", "/etc/filebeat.yml", "-e"]
        env:
        - name: NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        securityContext:
          runAsUser: 0
        volumeMounts:
        - name: config
          mountPath: /etc/filebeat.yml
          subPath: filebeat.yml
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
      volumes:
      - name: config
        configMap:
          name: filebeat-config
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: filebeat-config
  namespace: logging
data:
  filebeat.yml: |
    filebeat.autodiscover:
      providers:
        - type: kubernetes
          node: ${NODE_NAME}
          hints.enabled: true
          hints.default_config:
            type: container
            paths:
              - /var/log/containers/*${data.kubernetes.container.id}.log

    processors:
      - add_cloud_metadata:
      - add_kubernetes_metadata:
          host: ${NODE_NAME}
          matchers:
            - logs_path:
                logs_path: "/var/log/containers/"

    output.elasticsearch:
      hosts: ["elasticsearch:9200"]
      index: "k8s-logs-%{+yyyy.MM.dd}"
```

## Logstash Pipeline

```ruby
# /etc/logstash/conf.d/pipeline.conf

input {
  kafka {
    bootstrap_servers => "kafka:9092"
    topics => ["app-logs", "nginx-logs", "k8s-logs"]
    codec => json
    consumer_threads => 4
    group_id => "logstash-consumer"
  }
}

filter {
  # Parse timestamp
  date {
    match => ["timestamp", "ISO8601", "UNIX_MS"]
    target => "@timestamp"
  }

  # Parse nginx access logs
  if [log_type] == "nginx" {
    grok {
      match => {
        "message" => '%{IPORHOST:client_ip} - %{DATA:user} \[%{HTTPDATE:time}\] "%{WORD:method} %{DATA:uri} HTTP/%{NUMBER:http_version}" %{NUMBER:status:int} %{NUMBER:bytes:int} "%{DATA:referrer}" "%{DATA:user_agent}" %{NUMBER:duration:float}'
      }
      tag_on_failure => ["_grokparsefailure_nginx"]
    }
  }

  # Parse JSON application logs
  if [log_type] == "application" {
    json {
      source => "message"
      target => "app"
    }
  }

  # Enrich with GeoIP
  if [client_ip] {
    geoip {
      source => "client_ip"
      target => "geoip"
    }
  }

  # Remove sensitive fields
  mutate {
    remove_field => ["password", "token", "secret"]
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "logs-%{log_type}-%{+YYYY.MM.dd}"
    template_name => "logs"
    template_overwrite => true
  }

  # Dead letter queue for failed events
  if "_grokparsefailure" in [tags] {
    elasticsearch {
      hosts => ["elasticsearch:9200"]
      index => "logs-parse-failures-%{+YYYY.MM.dd}"
    }
  }
}
```

## Index Lifecycle Management (ILM)

```json
PUT _ilm/policy/logs-policy
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_primary_shard_size": "50gb",
            "max_age": "1d"
          },
          "set_priority": { "priority": 100 }
        }
      },
      "warm": {
        "min_age": "7d",
        "actions": {
          "shrink": { "number_of_shards": 1 },
          "forcemerge": { "max_num_segments": 1 },
          "set_priority": { "priority": 50 }
        }
      },
      "cold": {
        "min_age": "30d",
        "actions": {
          "freeze": {},
          "set_priority": { "priority": 0 }
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```

## Kibana KQL Queries

```kql
# Basic field search
level: "ERROR"

# Wildcard
message: "connection*"

# Range
duration_ms > 500

# Boolean
level: "ERROR" AND service: "payment-api"

# OR with parentheses
level: ("ERROR" OR "CRITICAL") AND NOT service: "batch-worker"

# Nested field
kubernetes.namespace: "production" AND kubernetes.pod.name: myapp-*

# Time range (use UI time picker)
@timestamp >= "2024-01-15T10:00:00" AND @timestamp <= "2024-01-15T11:00:00"
```

## Interview Questions

**How do you design ELK for high volume — 1 million logs per minute?**
Use Kafka as a buffer between Filebeat/Logstash and Elasticsearch. Kafka absorbs bursts and prevents log loss during Elasticsearch slowdowns. Multiple Logstash consumers read from Kafka in parallel. Elasticsearch cluster: dedicated hot nodes (SSD, high CPU) for current data, warm nodes (HDD) for older data, cold nodes (frozen) for archives. ILM policy automatically moves data through tiers. At 1M logs/minute: 16 Filebeat pods, 8 Logstash consumers, 6-node Elasticsearch cluster comfortably handles the load. Monitor: JVM heap, indexing rate, search latency, disk watermarks.

**ELK vs Loki — when to use each?**
ELK indexes every word in every log (inverted index) — enables powerful full-text search and complex aggregations but uses 10x more storage. Best for: security/SIEM use cases, complex log analytics, structured log search. Loki only indexes labels (namespace, pod, service) — much cheaper storage, simpler operation. Best for: Kubernetes-native teams already using Prometheus/Grafana, simple log streaming and filtering, cost-sensitive environments. Typical choice: Loki for K8s observability, ELK when you need enterprise log analytics or compliance.
