# Datadog — Advanced

## SLOs and error budgets: tracking reliability as a target, not a monitor

An SLO formalizes a reliability target so "is this service healthy enough" stops being a judgment call and becomes a number everyone agrees on ahead of time. Three pieces make up the model: the **SLI** (Service Level Indicator) is what you actually measure — e.g. the percentage of requests completing in under 500ms; the **SLO** (Service Level Objective) is the target for that indicator — e.g. 99.9% of requests under 500ms over a rolling 30 days; the **error budget** is the inverse of the target — 0.1% of a 30-day window works out to about 43 minutes of allowed "bad" time per month, and that budget is what actually gets spent during incidents, not an abstract percentage.

Datadog supports two SLO types. A **metric-based SLO** compares a "good events" query against a "total events" query directly:

```
Good events:  trace.express.request.hits{!status:error}
Total events: trace.express.request.hits{}
Target: 99.5% over 30 days
```

A **monitor-based SLO** instead uses an existing Monitor as the signal, tracking how much of the evaluation window the monitor spent in OK state versus Alert — useful when the reliability question is already expressed as a monitor and doesn't need a separate query defined from scratch.

The real value of formalizing this isn't the dashboard — it's the error budget policy it enables: once a service has burned through, say, 80% of its monthly error budget, that's the trigger to stop shipping new features and prioritize reliability work instead, a decision made in advance rather than argued about mid-incident.

## Custom metrics via DogStatsD

Not every signal worth tracking comes from an out-of-the-box integration — business metrics (orders placed, queue depth, cache hit rate) need explicit instrumentation. DogStatsD is Datadog's StatsD-compatible protocol for exactly this, and the client library exposes four metric types:

```python
from datadog import initialize, statsd

initialize(api_key='YOUR_KEY', app_key='YOUR_APP_KEY')

# Counter — increment-only, for discrete events (requests, errors, orders)
statsd.increment('orders.placed', tags=['env:prod', 'payment:stripe'])

# Gauge — current value at a point in time (queue size, active connections)
statsd.gauge('queue.depth', 42, tags=['queue:orders'])

# Histogram — distribution of values; Datadog auto-computes p50/p75/p95/p99 (request duration)
statsd.histogram('request.duration', 0.234, tags=['endpoint:/api/users'])

# Timing shortcut — wraps a function, emits a histogram of its execution time
@statsd.timed('db.query.time', tags=['query:get_user'])
def get_user(user_id):
    return db.query(user_id)
```

Choosing the wrong type is a common mistake worth calling out explicitly: using a Counter for something that should be a Gauge (queue depth) produces a monotonically increasing chart that's meaningless; using a Gauge for a discrete event (order placed) loses the ability to compute a real rate. The type determines what aggregations are even valid downstream.

## Kubernetes Autodiscovery

Manually configuring the Agent for every pod in a dynamic Kubernetes environment doesn't scale — pods come and go, and static integration config would be stale within minutes. Autodiscovery solves this with pod annotations that tell the Agent how to instrument a workload the moment it appears, without any manual step:

```yaml
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

The `%%host%%` template variable resolves to the pod's actual IP at runtime — the same annotation block works unchanged across every replica and every redeploy, because the Agent (via the Cluster Agent's Autodiscovery mechanism) watches the Kubernetes API for pods matching these annotations and configures the relevant check automatically as they appear and disappear.

## Incident management workflow

Datadog's Incident Management ties monitoring directly into the response process, rather than treating "we got paged" and "we're now coordinating a response" as two disconnected systems:

1. A Monitor fires and automatically creates an incident (rather than just a page)
2. The on-call responder is notified through the existing PagerDuty/Slack integration
3. Every action taken during the incident — status updates, commands run, links shared — is captured on the incident timeline as it happens, not reconstructed afterward from memory
4. A postmortem draft is generated directly from that timeline once the incident is resolved

The integrations that make this useful in practice: PagerDuty drives escalation policies so an unacknowledged page actually escalates; Slack posts to a dedicated `#incidents` channel with runbook links attached automatically; JIRA can auto-create a tracking ticket so incident follow-up work doesn't get lost after the adrenaline wears off; OpsGenie handles on-call scheduling for teams using it instead of PagerDuty. The mechanism that matters most operationally is the auto-generated timeline — postmortems written from memory days later are reliably worse than ones assembled from a timestamped log of what was actually done, in what order.
