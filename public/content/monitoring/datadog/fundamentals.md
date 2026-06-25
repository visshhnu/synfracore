# Datadog Fundamentals

## What is Datadog?
Datadog is a cloud-scale monitoring and observability platform used by thousands of companies. It unifies metrics, traces, and logs in a single pane of glass, enabling teams to detect, debug, and resolve issues faster.

## Core Components

### 1. Metrics Collection
Datadog Agent collects system and application metrics every 15 seconds by default.

```bash
# Install Datadog Agent on Linux
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=your_api_key DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

# Check agent status
sudo datadog-agent status

# Configure agent
sudo vi /etc/datadog-agent/datadog.yaml
# Set: api_key, site, hostname, tags
```

### 2. Log Management
Ship logs from any source to Datadog for indexing, search, and analysis.

```yaml
# /etc/datadog-agent/conf.d/python.d/conf.yaml
logs:
  - type: file
    path: /var/log/myapp/*.log
    service: myapp
    source: python
    tags:
      - env:production
```

### 3. APM (Application Performance Monitoring)
Distributed tracing across microservices.

```python
# Python APM setup
from ddtrace import patch_all
patch_all()

# Or selectively
from ddtrace import patch
patch(requests=True, sqlalchemy=True, redis=True)
```

### 4. Dashboards
Create visualizations using metrics from any source.

- **Timeseries**: Track values over time
- **Heatmaps**: Spot distribution patterns
- **Toplists**: Rank entities by metric value
- **SLO widgets**: Monitor service level objectives

## Key Metrics Taxonomy

```
system.cpu.user          # CPU user time
system.mem.used          # Memory used bytes
system.disk.in_use       # Disk utilization ratio
system.net.bytes_sent    # Network egress
kubernetes.cpu.usage     # K8s pod CPU
docker.cpu.system        # Container CPU
```

## Tags Architecture
Tags are key:value pairs that allow filtering and grouping.

```bash
# Agent-level tags in datadog.yaml
tags:
  - env:prod
  - region:us-east-1
  - team:platform

# Dynamic tags via DogStatsD
statsd.gauge("web.requests", 1, tags=["endpoint:/api/v1", "status:200"])
```

## Alert Basics
Monitors watch metrics and notify when thresholds are breached.

```
Monitor types:
- Metric monitor: threshold on any metric
- Log monitor: pattern match in logs
- APM monitor: latency/error rate on traces
- Composite: combine multiple monitors
- Anomaly: ML-based unusual behavior
```

## DogStatsD Custom Metrics

```python
from datadog import statsd

# Gauge (current value)
statsd.gauge("myapp.queue.depth", 42)

# Counter (increment)
statsd.increment("myapp.requests.total", tags=["method:POST"])

# Histogram (distribution)
statsd.histogram("myapp.response.time_ms", 230)

# Set (unique count)
statsd.set("myapp.users.active", user_id)
```

## Getting Started Checklist
- [ ] Install Agent on all hosts
- [ ] Set API key and site in datadog.yaml
- [ ] Enable integrations (nginx, postgres, redis)
- [ ] Create team dashboard
- [ ] Set up first monitor with notification
- [ ] Configure log pipeline
- [ ] Enable APM on one service
