# ELK Stack Fundamentals

## What is the ELK Stack?
ELK = Elasticsearch + Logstash + Kibana. Together they form a powerful open-source platform for log management, search, and visualization. Elasticsearch stores and indexes data, Logstash ingests and transforms it, and Kibana provides the UI. Beats (Filebeat, Metricbeat) are lightweight shippers that complete the "Elastic Stack."

## Architecture

```
Application Logs
       │
       ▼
  Filebeat (agent on host)
       │
       ▼
  Logstash (transform/enrich)
       │
       ▼
  Elasticsearch (index + store)
       │
       ▼
    Kibana (visualize + search)
```

## Elasticsearch Basics

```bash
# Start with Docker Compose
version: "3"
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.12.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ports:
      - "9200:9200"

  kibana:
    image: docker.elastic.co/kibana/kibana:8.12.0
    ports:
      - "5601:5601"
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
```

```bash
# Test Elasticsearch
curl -X GET "localhost:9200/_cluster/health?pretty"
curl -X GET "localhost:9200/_cat/indices?v"

# Index a document
curl -X POST "localhost:9200/logs/_doc" -H "Content-Type: application/json" -d '
{
  "@timestamp": "2024-01-15T10:30:00Z",
  "level": "ERROR",
  "service": "api",
  "message": "Connection timeout to database"
}'
```

## Filebeat Configuration

```yaml
# /etc/filebeat/filebeat.yml
filebeat.inputs:
  - type: log
    enabled: true
    paths:
      - /var/log/nginx/access.log
      - /var/log/nginx/error.log
    fields:
      service: nginx
      env: prod

output.elasticsearch:
  hosts: ["elasticsearch:9200"]
  index: "nginx-logs-%{+yyyy.MM.dd}"

setup.kibana:
  host: "kibana:5601"
```

## Logstash Pipeline

```
# /etc/logstash/conf.d/nginx.conf
input {
  beats {
    port => 5044
  }
}

filter {
  if [fields][service] == "nginx" {
    grok {
      match => { "message" => "%{COMBINEDAPACHELOG}" }
    }
    date {
      match => ["timestamp", "dd/MMM/yyyy:HH:mm:ss Z"]
      target => "@timestamp"
    }
    mutate {
      convert => { "bytes" => "integer" }
      convert => { "response" => "integer" }
    }
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "nginx-%{+YYYY.MM.dd}"
  }
}
```

## Kibana Discover
Navigate to http://localhost:5601 → Discover → Create index pattern `nginx-*`.
Use KQL (Kibana Query Language):
```
response:500 AND service:"api"
NOT status:200 AND @timestamp > now-1h
message:*timeout* AND level:ERROR
```

## Index Management
```bash
# Create index with mapping
curl -X PUT "localhost:9200/app-logs" -H "Content-Type: application/json" -d '
{
  "mappings": {
    "properties": {
      "@timestamp": {"type": "date"},
      "level": {"type": "keyword"},
      "message": {"type": "text"},
      "user_id": {"type": "long"},
      "latency_ms": {"type": "integer"}
    }
  }
}'

# Delete old indices
curl -X DELETE "localhost:9200/nginx-2024.01.*"
```

## Getting Started Checklist
- [ ] Deploy Elasticsearch and Kibana (Docker or Elastic Cloud)
- [ ] Install Filebeat on application hosts
- [ ] Configure Filebeat to point to Elasticsearch
- [ ] Import Filebeat dashboards (`filebeat setup --dashboards`)
- [ ] Create index lifecycle policy for log rotation
- [ ] Build first Kibana dashboard
- [ ] Set up alerting on error rate
