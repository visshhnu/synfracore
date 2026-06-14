# Prometheus — Prerequisites

## What to Know Before Starting Prometheus

Prometheus collects metrics from your infrastructure and applications. These foundations help.

## Required

### 1. Basic Linux
Prometheus runs on Linux servers (or in Docker/Kubernetes). You should know:
```bash
systemctl start/stop/status prometheus   # Service management
curl http://localhost:9090               # Test HTTP endpoints
tail -f /var/log/prometheus/prometheus.log  # Read logs
```

### 2. Understanding of What Metrics Are
A metric is a number measured over time. Examples:
- CPU usage: 45% (a gauge — can go up or down)
- HTTP requests processed: 10,423 (a counter — only goes up)
- Request duration: 95th percentile = 250ms (a histogram)

Before diving into Prometheus, make sure you understand WHY you'd monitor these numbers and what you'd do when they spike.

### 3. Basic Networking
Prometheus uses HTTP to scrape metrics from targets. You should understand:
- What a port is (Prometheus runs on port 9090)
- What an HTTP endpoint is (`http://localhost:9100/metrics`)
- Basic curl usage to test endpoints

### 4. YAML Syntax
Prometheus configuration is YAML:
```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['localhost:9100']
```

## Nice to Have

### Docker Basics
The fastest way to run Prometheus is with Docker Compose. Understanding `docker-compose.yml` helps tremendously.

### Kubernetes (for Production Prometheus)
Most production Prometheus deployments run in Kubernetes using the Prometheus Operator. Kubernetes knowledge is needed for the Advanced section.

### SQL or Any Query Language
PromQL (Prometheus Query Language) has similar concepts to SQL — filtering, aggregation, grouping. If you've written SQL queries, PromQL will feel familiar.

## Learning Order

```
Linux basics (if needed)
      ↓
Docker basics (for quick local setup)
      ↓
Prometheus Installation (Docker Compose)
      ↓
Prometheus Fundamentals (scraping, PromQL basics)
      ↓
Intermediate (alerting, AlertManager, recording rules)
      ↓
Advanced (Kubernetes integration, Thanos, production patterns)
```

## Time Estimate

- Basic setup and first dashboard: 2-3 days
- Writing meaningful alert rules: 1 week
- Production-grade monitoring stack: 3-4 weeks
