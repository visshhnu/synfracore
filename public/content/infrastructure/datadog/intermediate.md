# Datadog — Intermediate

## APM — Application Performance Monitoring

```python
# Python (Flask/Django/FastAPI)
# pip install ddtrace

# Instrument automatically:
# DD_SERVICE=my-api DD_ENV=prod DD_VERSION=1.0 ddtrace-run python app.py

# Manual instrumentation:
from ddtrace import tracer

@tracer.wrap(service="payment-service", resource="process_payment")
def process_payment(order_id, amount):
    with tracer.trace("validate.card") as span:
        span.set_tag("card.type", "visa")
        validate_card()
    charge_card(amount)
```

```go
// Go
import "gopkg.in/DataDog/dd-trace-go.v1/ddtrace/tracer"

func main() {
    tracer.Start(tracer.WithService("my-service"), tracer.WithEnv("prod"))
    defer tracer.Stop()
}
```

## Log Management

```yaml
# /etc/datadog-agent/conf.d/custom_logs.yaml
logs:
  - type: file
    path: /var/log/myapp/*.log
    service: myapp
    source: python
    env: prod
    log_processing_rules:
      - type: multi_line
        pattern: \d{4}-\d{2}-\d{2}  # New log starts with date
        name: new_log_start_with_date
```

```python
# Send logs with proper structure
import logging
from ddtrace.contrib.logging import patch; patch()

logger = logging.getLogger(__name__)
logger.info("Order processed", extra={
    "order_id": "12345",
    "user_id": "789",
    "amount": 99.99,
})
# Datadog auto-correlates this log with the active trace
```

## Monitors and Alerts

```
Types of monitors:
  Metric monitor:  Alert when metric crosses threshold
    e.g., CPU > 90% for 5 min on avg of last 15 min
  
  Log monitor:    Alert on log query results
    e.g., "ERROR" logs > 100 in last 5 min
  
  APM monitor:    Alert on trace metrics
    e.g., P99 latency > 1s for service:api
  
  Composite:      Combine multiple monitors
    e.g., Alert ONLY IF (high error rate AND high latency)

Monitor states: OK → Warning → Alert → No Data
```

## Dashboards as Code

```python
# Use Datadog Terraform provider
resource "datadog_dashboard" "api_overview" {
  title = "API Service Overview"
  layout_type = "ordered"

  widget {
    timeseries_definition {
      title = "Request Rate"
      request {
        q = "sum:trace.flask.request.hits{service:my-api}.as_rate()"
        display_type = "line"
      }
    }
  }
}
```
