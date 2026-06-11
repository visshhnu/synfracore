# ELK Stack — Fundamentals

## Architecture

```
Applications
    │
    ▼ (send logs)
Filebeat/Logstash  ──── parse, enrich, filter
    │
    ▼ (index)
Elasticsearch  ──── store, index, search
    │
    ▼ (query)
Kibana  ──── visualize, dashboard, alert
```

## Elasticsearch Core Concepts

```
Index:    Collection of documents (like a database table)
Document: JSON object stored in Elasticsearch (like a row)
Shard:    Index split into pieces for horizontal scaling
Replica:  Copy of a shard for fault tolerance and read scaling

Mapping:  Schema definition (field types, analyzers)
Analyzer: How text is processed for search (tokenize, lowercase, stem)
```

## Index Operations

```bash
# Create index with mapping
PUT /logs-2024-01
{
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 1
  },
  "mappings": {
    "properties": {
      "@timestamp": { "type": "date" },
      "level":      { "type": "keyword" },   # Exact match, not analyzed
      "message":    { "type": "text" },       # Full-text search, analyzed
      "service":    { "type": "keyword" },
      "duration_ms":{ "type": "long" },
      "trace_id":   { "type": "keyword" }
    }
  }
}

# Index a document
POST /logs-2024-01/_doc
{
  "@timestamp": "2024-01-15T10:23:45Z",
  "level": "ERROR",
  "message": "Database connection timeout after 5000ms",
  "service": "user-api",
  "duration_ms": 5001
}

# Bulk indexing (much faster than individual requests)
POST /_bulk
{"index": {"_index": "logs-2024-01"}}
{"@timestamp": "2024-01-15T10:23:45Z", "level": "INFO", "message": "User logged in"}
{"index": {"_index": "logs-2024-01"}}
{"@timestamp": "2024-01-15T10:23:46Z", "level": "ERROR", "message": "DB timeout"}
```

## Query DSL

```json
// Search for errors in the last hour
GET /logs-*/_search
{
  "query": {
    "bool": {
      "must": [
        { "term": { "level": "ERROR" } }
      ],
      "filter": [
        { "range": {
            "@timestamp": {
              "gte": "now-1h",
              "lte": "now"
            }
        }},
        { "term": { "service": "user-api" }}
      ]
    }
  },
  "sort": [{ "@timestamp": "desc" }],
  "size": 100,
  "aggs": {
    "errors_over_time": {
      "date_histogram": {
        "field": "@timestamp",
        "fixed_interval": "5m"
      }
    },
    "top_error_messages": {
      "terms": {
        "field": "message.keyword",
        "size": 10
      }
    }
  }
}
```

## Logstash Pipeline

```ruby
# /etc/logstash/conf.d/app-logs.conf

input {
  beats {
    port => 5044  # Receive from Filebeat
  }
}

filter {
  # Parse JSON logs
  if [message] =~ /^\{/ {
    json { source => "message" }
  }

  # Parse NGINX access logs
  if [fields][type] == "nginx" {
    grok {
      match => {
        "message" => '%{IPORHOST:client_ip} - %{DATA:user} \[%{HTTPDATE:timestamp}\] "%{WORD:method} %{DATA:request} HTTP/%{NUMBER:http_version}" %{NUMBER:status_code:int} %{NUMBER:bytes:int}'
      }
    }
    date { match => ["timestamp", "dd/MMM/yyyy:HH:mm:ss Z"] }
  }

  # Add geo info from IP
  geoip { source => "client_ip" }

  # Remove unneeded fields
  mutate {
    remove_field => ["message", "beat", "input", "prospector"]
  }
}

output {
  elasticsearch {
    hosts => ["http://elasticsearch:9200"]
    index => "logs-%{[fields][service]}-%{+YYYY.MM.dd}"
  }
}
```

## Filebeat Configuration

```yaml
# /etc/filebeat/filebeat.yml
filebeat.inputs:
  - type: log
    paths:
      - /var/log/nginx/access.log
    fields:
      type: nginx
      service: web

  - type: log
    paths:
      - /var/log/app/*.log
    fields:
      service: myapp
    multiline:            # Handle stack traces
      pattern: '^\d{4}-\d{2}-\d{2}'
      negate: true
      match: after

output.logstash:
  hosts: ["logstash:5044"]
```

## ILM — Index Lifecycle Management

```json
PUT /_ilm/policy/logs-policy
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "1d"
          }
        }
      },
      "warm": {
        "min_age": "7d",
        "actions": {
          "readonly": {},
          "shrink": { "number_of_shards": 1 }
        }
      },
      "cold": {
        "min_age": "30d",
        "actions": {
          "freeze": {}
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
