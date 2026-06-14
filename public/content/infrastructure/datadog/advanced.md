# Datadog — Advanced

## SLOs (Service Level Objectives)

```
Define your reliability targets:
  SLI (Indicator): What you measure (e.g., % of requests < 500ms)
  SLO (Objective): Target level (e.g., 99.9% of requests < 500ms over 30 days)
  Error Budget:    How much you can fail (0.1% = 43 min/month)

In Datadog UI: Service Management → SLOs → New SLO

Metric-based SLO:
  Good events:  trace.express.request.hits{!status:error}
  Total events: trace.express.request.hits{}
  Target: 99.5% over 30 days

Monitor-based SLO:
  Uses existing monitors as SLI
  Tracks time the monitor was in OK state vs Alert
```

## Custom Metrics

```python
from datadog import initialize, statsd

initialize(api_key='YOUR_KEY', app_key='YOUR_APP_KEY')

# Counter: increment-only (requests, errors)
statsd.increment('orders.placed', tags=['env:prod', 'payment:stripe'])

# Gauge: current value (queue size, active users)
statsd.gauge('queue.depth', 42, tags=['queue:orders'])

# Histogram: distribution of values (request duration)
statsd.histogram('request.duration', 0.234, tags=['endpoint:/api/users'])

# Timing shortcut
@statsd.timed('db.query.time', tags=['query:get_user'])
def get_user(user_id):
    return db.query(user_id)
```

## Datadog + Kubernetes Best Practices

```yaml
# Autodiscovery annotations — instrument pods automatically
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        ad.datadoghq.com/myapp.logs: '[{"source":"python","service":"myapp"}]'
        ad.datadoghq.com/myapp.check_names: '["openmetrics"]'
        ad.datadoghq.com/myapp.init_configs: '[{}]'
        ad.datadoghq.com/myapp.instances: |
          [{
            "openmetrics_endpoint": "http://%%host%%:8080/metrics",
            "namespace": "myapp",
            "metrics": ["http_requests_total", "http_duration_seconds"]
          }]
```

## Incident Management

```
Datadog Incident Management workflow:
  1. Monitor fires → creates incident automatically
  2. On-call notified via PagerDuty/Slack integration
  3. Incident timeline tracks all actions taken
  4. Postmortem generated from timeline

Key integrations:
  PagerDuty → escalation policies
  Slack → #incidents channel with runbook links
  JIRA → auto-create tickets for incidents
  OpsGenie → on-call scheduling
```
