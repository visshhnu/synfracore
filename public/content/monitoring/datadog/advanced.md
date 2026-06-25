# Datadog Advanced

## Custom Agent Checks

Write Python checks that run on every agent collection interval.

```python
# /etc/datadog-agent/checks.d/myapp_check.py
from datadog_checks.base import AgentCheck
import requests

class MyAppCheck(AgentCheck):
    def check(self, instance):
        url = instance.get("url", "http://localhost:8080/metrics")
        tags = instance.get("tags", [])

        try:
            response = requests.get(url, timeout=5)
            data = response.json()

            self.gauge("myapp.active_sessions", data["active_sessions"], tags=tags)
            self.gauge("myapp.queue_depth", data["queue_depth"], tags=tags)
            self.monotonic_count("myapp.processed_jobs", data["processed_jobs"], tags=tags)
            self.service_check("myapp.can_connect", AgentCheck.OK, tags=tags)

        except Exception as e:
            self.service_check("myapp.can_connect", AgentCheck.CRITICAL, tags=tags,
                               message=str(e))
```

```yaml
# /etc/datadog-agent/conf.d/myapp_check.yaml
init_config:

instances:
  - url: http://localhost:8080/metrics
    tags:
      - env:prod
      - app:myapp
```

## Log-Based Metrics

Convert high-volume logs into low-cost metrics.

```
# Example: count 5xx errors from logs
Metric name: myapp.http.errors
Filter query: service:myapp @http.status_code:[500 TO 599]
Aggregate by: @http.path (group into paths)
Metric type: COUNT
```

Cost impact: log-based metrics cost ~1% of log indexing cost.

## Private Locations for Synthetics

Run synthetic tests inside your VPC.

```bash
# Deploy private location worker
docker run -d   --name datadog-private-location   -e DATADOG_ACCESS_KEY=<access_key>   -e DATADOG_SITE="datadoghq.com"   datadog/synthetics-private-location-worker
```

## Datadog Operator on Kubernetes

```yaml
apiVersion: datadoghq.com/v2alpha1
kind: DatadogAgent
metadata:
  name: datadog
spec:
  global:
    site: datadoghq.com
    credentials:
      apiSecret:
        secretName: datadog-secret
        keyName: api-key
  features:
    apm:
      enabled: true
    logCollection:
      enabled: true
      containerCollectAll: true
    liveProcessCollection:
      enabled: true
    orchestratorExplorer:
      enabled: true
    npm:
      enabled: true
```

## Watchdog — Automatic Anomaly Detection

Watchdog automatically surfaces anomalies across all services without manual configuration. It runs ML models on:
- Error rate spikes
- Latency degradation
- Log pattern changes
- Infrastructure anomalies

## Cost Optimization

```
Strategies:
1. Exclusion filters — drop noisy, low-value logs before indexing
   Filter: service:debug-service status:info → exclude
   
2. Log archives — S3/GCS cold storage for compliance logs
   Keep 7 days indexed, archive 1 year to S3
   
3. Metric without limits™ — control cardinality at query time
   Tag allowlist: env, service, region (drop pod, container)
   
4. Custom metrics budget — monitor usage/month dashboard
   Alert when approaching plan limit
```

## Multi-org Architecture

```
Parent org (billing/admin)
├── Org: team-platform
│   └── API key, dashboards, monitors, policies
├── Org: team-payments  
│   └── Isolated metrics, logs, traces
└── Org: team-data
    └── Separate RBAC, separate retention
```

Cross-org metric sharing via metric forwarding (beta).

## RBAC and Permissions

```python
# Restrict monitor creation to specific teams
# Using Datadog API
import datadog

datadog.initialize(api_key=API_KEY, app_key=APP_KEY)

# Create role
role = datadog.api.Roles.create(
    data={
        "type": "roles",
        "attributes": {"name": "Platform Engineers"},
        "relationships": {
            "permissions": {
                "data": [
                    {"type": "permissions", "id": "monitor_write"},
                    {"type": "permissions", "id": "dashboard_write"}
                ]
            }
        }
    }
)
```

## Incident Management Automation

```python
# Auto-create incident on P1 monitor alert
# Datadog webhook → Lambda → Incident API

import boto3, json, requests

def lambda_handler(event, context):
    alert = json.loads(event["body"])
    if alert["alert_cycle_key"] == "triggered":
        requests.post(
            "https://api.datadoghq.com/api/v2/incidents",
            headers={"DD-API-KEY": DD_API_KEY, "DD-APPLICATION-KEY": DD_APP_KEY},
            json={
                "data": {
                    "type": "incidents",
                    "attributes": {
                        "title": alert["event_title"],
                        "customer_impact_scope": "Production API degraded",
                        "customer_impacted": True,
                        "severity": "SEV-1"
                    }
                }
            }
        )
