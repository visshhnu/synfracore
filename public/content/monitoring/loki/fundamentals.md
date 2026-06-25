# Loki Fundamentals

## What is Loki?
Loki is Grafana's log aggregation system, designed to be cost-effective and easy to operate. Unlike Elasticsearch which indexes all log content, Loki only indexes log labels (metadata) and compresses raw log content. This makes it much cheaper at scale — typically 10–60x less storage than ELK for the same data.

## Core Concepts

### Labels
Labels are the index in Loki. They identify log streams.

```
{job="nginx", env="prod", pod="nginx-abc123"}
```

Labels must be low-cardinality — never use request ID or user ID as labels (creates millions of streams, kills performance).

### Log Streams
A stream = unique combination of labels. Loki stores chunks of logs per stream.

### LogQL
Loki's query language, inspired by PromQL.

## Deploy with Docker Compose

```yaml
version: "3"
services:
  loki:
    image: grafana/loki:2.9.3
    ports:
      - "3100:3100"
    command: -config.file=/etc/loki/local-config.yaml
    volumes:
      - loki-data:/loki

  promtail:
    image: grafana/promtail:2.9.3
    volumes:
      - /var/log:/var/log
      - ./promtail-config.yaml:/etc/promtail/config.yaml
    command: -config.file=/etc/promtail/config.yaml

volumes:
  loki-data:
```

## Promtail Configuration

```yaml
# promtail-config.yaml
server:
  http_listen_port: 9080

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
      - targets: [localhost]
        labels:
          job: varlogs
          env: prod
          __path__: /var/log/*.log

  - job_name: app_logs
    static_configs:
      - targets: [localhost]
        labels:
          job: myapp
          service: api
          __path__: /var/log/myapp/*.log
    pipeline_stages:
      - json:
          expressions:
            level: level
            ts: timestamp
            msg: message
      - labels:
          level:
      - timestamp:
          source: ts
          format: RFC3339
```

## Basic LogQL Queries

```logql
# Select all logs from nginx
{job="nginx"}

# Filter by text
{job="nginx"} |= "error"

# Regex filter
{job="nginx"} |~ "5[0-9]{2}"

# Exclude pattern
{job="nginx"} != "GET /health"

# Multiple labels
{job="api", env="prod"} |= "timeout"

# Count log rate
rate({job="api"} |= "error" [5m])

# Count over time
count_over_time({job="api"}[1h])
```

## Viewing Logs in Grafana

1. Add Loki as data source (URL: http://loki:3100)
2. Explore → Select Loki → Enter LogQL query
3. Switch between Logs view and Metrics view
4. Use label browser to discover available labels

## Push Logs Directly via API

```bash
curl -X POST http://localhost:3100/loki/api/v1/push   -H "Content-Type: application/json"   -d '{"streams": [{"stream": {"job": "test", "level": "info"},
       "values": [["'$(date +%s%N)'", "Hello from curl"]]}]}'
```

## Label Best Practices
- Low cardinality: env, service, region, cluster, namespace
- Never: request_id, user_id, session_token, trace_id
- Target: < 10,000 unique streams per Loki instance
