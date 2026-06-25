# Datadog Intermediate

## Infrastructure as Code — Monitors via Terraform

```hcl
resource "datadog_monitor" "cpu_high" {
  name    = "High CPU on {{host.name}}"
  type    = "metric alert"
  message = "CPU usage above 85% on {{host.name}}. Notify: @pagerduty-platform"

  query = "avg(last_5m):avg:system.cpu.user{env:prod} by {host} > 85"

  monitor_thresholds {
    critical          = 85
    critical_recovery = 70
    warning           = 75
    warning_recovery  = 60
  }

  notify_no_data    = true
  no_data_timeframe = 10
  evaluation_delay  = 60
  renotify_interval = 60

  tags = ["env:prod", "team:platform", "managed:terraform"]
}
```

## Log Processing Pipelines

Pipelines parse raw logs into structured attributes.

```json
// Grok parser for custom app log format
// Input: [2024-01-15 14:23:45] INFO user_id=12345 action=login latency=45ms
// Grok pattern:
"\[%{date("yyyy-MM-dd HH:mm:ss"):timestamp}\] %{word:level} user_id=%{integer:user_id} action=%{word:action} latency=%{integer:latency}ms"
```

Pipeline stages:
1. **Grok Parser** — extract fields from raw text
2. **Date Remapper** — set official timestamp
3. **Status Remapper** — map level → log status
4. **URL Parser** — decompose URL attributes
5. **User-Agent Parser** — browser/OS from UA string

## Service Map and APM Traces

```python
# Manual span creation
from ddtrace import tracer

with tracer.trace("database.query", service="user-service", resource="SELECT users") as span:
    span.set_tag("db.type", "postgresql")
    span.set_tag("rows.returned", 42)
    result = db.execute(query)
```

## Synthetic Monitoring

```python
# API test via Datadog API
import requests

test_config = {
  "name": "Checkout API Health",
  "type": "api",
  "request": {
    "method": "POST",
    "url": "https://api.example.com/checkout",
    "body": '{"cart_id": "test-123"}',
    "headers": {"Content-Type": "application/json"}
  },
  "assertions": [
    {"type": "statusCode", "operator": "is", "target": 200},
    {"type": "responseTime", "operator": "lessThan", "target": 2000},
    {"type": "body", "operator": "contains", "target": "order_id"}
  ],
  "locations": ["aws:us-east-1", "aws:eu-west-1"],
  "options": {"tick_every": 60}
}
```

## Metric Aggregation and Rollups

```
# Rollup function — control time bucket
avg:system.cpu.user{host:web-01}.rollup(avg, 300)

# As-count vs as-rate
sum:http.requests{*}.as_count()   # total requests in window
sum:http.requests{*}.as_rate()    # requests per second

# Fill for sparse metrics
avg:custom.metric{*}.fill(zero, 300)
```

## Anomaly Detection

```
# Seasonal algorithm — good for daily/weekly patterns
anomalies(avg:web.requests{env:prod}, "agile", 3)
# 3 = number of standard deviations

# Basic algorithm — for stationary metrics
anomalies(avg:db.connections{*}, "basic", 2)

# Robust — outlier-resistant
anomalies(avg:system.mem.used{*}, "robust", 3)
```

## SLO Configuration

```yaml
SLO Type: Metric-based
Numerator:   sum:requests.success{env:prod}.as_count()
Denominator: sum:requests.total{env:prod}.as_count()
Target:      99.9%  # over 30 days
Warning:     99.95% # alert before breaching target
```

## Notebook Automations
Use Notebooks for incident runbooks and post-mortems with live metric embeds.

## Key Integrations
| Service | What it provides |
|---------|-----------------|
| AWS | EC2, RDS, Lambda, ELB metrics from CloudWatch |
| Kubernetes | Pod, node, namespace metrics; autodiscovery |
| PostgreSQL | Query performance, lock waits, connections |
| Redis | Hit rate, memory, evictions, latency |
| NGINX | Requests/s, active connections, error rate |
| Kafka | Consumer lag, throughput, broker metrics |
