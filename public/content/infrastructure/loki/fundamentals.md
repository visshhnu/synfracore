# Loki — Fundamentals

## What is Loki?

Grafana Loki is a horizontally scalable, highly available log aggregation system inspired by Prometheus. Unlike Elasticsearch, Loki does NOT index log content — it only indexes metadata (labels), making it much cheaper to operate.

**Key difference from ELK/Splunk:**
- ELK: Full text indexing — expensive but fast full-text search
- Loki: Label indexing only — cheap storage, query time full-text search

## The PLG Stack (Promtail + Loki + Grafana)

```
Applications → Promtail (agent, runs on each host) → Loki (aggregator) → Grafana (query & visualize)
```

## Install with Docker Compose

```yaml
version: "3"
services:
  loki:
    image: grafana/loki:2.9.0
    ports: ["3100:3100"]
    command: -config.file=/etc/loki/local-config.yaml
    volumes:
      - loki-data:/loki

  promtail:
    image: grafana/promtail:2.9.0
    volumes:
      - /var/log:/var/log:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./promtail-config.yaml:/etc/promtail/config.yml
    command: -config.file=/etc/promtail/config.yml

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin

volumes:
  loki-data:
```

## Promtail Configuration

```yaml
# promtail-config.yaml
server:
  http_listen_port: 9080

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
      - targets: [localhost]
        labels:
          job: varlogs
          __path__: /var/log/*.log

  - job_name: docker
    docker_sd_configs:
      - host: unix:///var/run/docker.sock
    relabel_configs:
      - source_labels: [__meta_docker_container_name]
        target_label: container
      - source_labels: [__meta_docker_container_label_com_docker_compose_service]
        target_label: service
```

## LogQL Basics

```logql
# Select logs by label
{job="nginx"}
{service="api", env="prod"}

# Filter by content
{service="api"} |= "error"              # Contains "error"
{service="api"} != "healthcheck"        # Does NOT contain
{service="api"} |~ "user.*login"        # Regex match

# Parse and extract fields
{service="api"} | json                  # Parse JSON logs
{service="api"} | logfmt                # Parse logfmt
{service="api"} | json | status >= 500  # Filter parsed field

# Metric queries
rate({service="api"} |= "error" [5m])  # Error rate per second
count_over_time({service="api"}[1h])    # Log volume per hour
```
