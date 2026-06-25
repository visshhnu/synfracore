# Grafana Advanced

## Grafana Terraform Provider

```hcl
terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 2.0"
    }
  }
}

provider "grafana" {
  url  = "https://grafana.example.com"
  auth = var.grafana_api_token
}

resource "grafana_dashboard" "platform_overview" {
  folder      = grafana_folder.platform.id
  config_json = file("${path.module}/dashboards/platform-overview.json")
}

resource "grafana_alert_rule" "cpu_high" {
  name           = "High CPU"
  folder_uid     = grafana_folder.platform.uid
  condition      = "C"
  for            = "5m"

  data {
    ref_id = "A"
    relative_time_range {
      from = 300
      to   = 0
    }
    datasource_uid = var.prometheus_uid
    model = jsonencode({
      expr = "avg(rate(node_cpu_seconds_total{mode!='idle'}[5m])) * 100 > 80"
    })
  }
  # ... condition block
}
```

## Mimir — Long-Term Metrics Storage

Grafana Mimir extends Prometheus with multi-tenancy, long-term storage, and horizontal scalability.

```yaml
# mimir.yaml — single-binary mode
target: all
multitenancy_enabled: false

blocks_storage:
  backend: s3
  s3:
    bucket_name: mimir-blocks
    endpoint: s3.us-east-1.amazonaws.com

store_gateway:
  sharding_enabled: false

compactor:
  data_dir: /tmp/mimir/compactor

ingester:
  ring:
    replication_factor: 1
```

Remote write from Prometheus to Mimir:
```yaml
remote_write:
  - url: http://mimir:9009/api/v1/push
    queue_config:
      max_samples_per_send: 10000
      capacity: 20000
```

## Plugin Development

```typescript
// src/module.ts — Custom panel plugin
import { PanelPlugin } from "@grafana/data";
import { MyPanel } from "./components/MyPanel";
import { MyOptions } from "./types";

export const plugin = new PanelPlugin<MyOptions>(MyPanel).setPanelOptions(
  (builder) => {
    builder
      .addColorPicker({
        path: "thresholdColor",
        name: "Threshold Color",
        defaultValue: "red",
      })
      .addNumberInput({
        path: "threshold",
        name: "Alert Threshold",
        defaultValue: 80,
      });
  }
);
```

## High Availability Setup

```
[Nginx LB]
    │
 ┌──┴──┐
[Grafana] [Grafana]  (multiple replicas)
    │
[PostgreSQL]  (shared session/alert state)
    │
[Redis]  (caching, live queries)
```

```ini
# grafana.ini for HA
[database]
type = postgres
host = postgres:5432
name = grafana
user = grafana
password = grafana_password

[session]
provider = redis
provider_config = addr=redis:6379,pool_size=100
```

## Loki Integration — Advanced LogQL in Grafana

```logql
# Error rate from logs (metric from logs)
sum(rate({service="api"} |= "ERROR" [5m])) by (pod)

# Parse JSON and filter
{service="payments"} | json | amount > 10000 | line_format "{{.user_id}} paid {{.amount}}"

# Log volume heatmap
sum by (level) (count_over_time({namespace="prod"}[1m]))
```

## Synthetic Monitoring with Grafana Cloud k6

```javascript
// k6 synthetic script
import http from "k6/http";
import { check } from "k6";

export const options = {
  scenarios: {
    constant: {
      executor: "constant-arrival-rate",
      rate: 1,
      timeUnit: "30s",
      duration: "24h",
      preAllocatedVUs: 2,
    },
  },
};

export default function () {
  const res = http.post(
    "https://api.example.com/health",
    null,
    { tags: { name: "health_check" } }
  );
  check(res, {
    "status 200": (r) => r.status === 200,
    "latency < 500ms": (r) => r.timings.duration < 500,
  });
}
```

## Business Metrics Dashboards

Connect directly to databases for business KPIs:

```sql
-- PostgreSQL data source query in Grafana
SELECT
  date_trunc('hour', created_at) AS time,
  COUNT(*) AS orders,
  SUM(amount) AS revenue
FROM orders
WHERE created_at BETWEEN $__timeFrom() AND $__timeTo()
  AND status = 'completed'
GROUP BY 1
ORDER BY 1
```
