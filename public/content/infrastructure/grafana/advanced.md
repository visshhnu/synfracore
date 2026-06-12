# Grafana — Advanced

## Grafana OnCall (Incident Management)

```yaml
# Grafana OnCall — integrated on-call scheduling and escalations
# Part of Grafana Cloud or self-hosted

# Escalation chain:
# 1. Notify on-call engineer via mobile push
# 2. If no ack in 5min → SMS
# 3. If no ack in 10min → call backup engineer
# 4. If no ack in 15min → page entire team
# 5. Create incident in Incident.io/PagerDuty

# Integration with AlertManager
alertmanager-config:
  receivers:
  - name: grafana-oncall
    webhook_configs:
    - url: https://oncall.example.com/integrations/v1/alertmanager/TOKEN/
      send_resolved: true

# Schedule types:
# - Rolling schedule (weekly rotation)
# - Custom schedule (holiday coverage)
# - Override (temporary coverage swap)
```

## Grafana Plugins

```bash
# Install plugins
grafana-cli plugins install grafana-piechart-panel
grafana-cli plugins install vertamedia-clickhouse-datasource
grafana-cli plugins install grafana-clock-panel

# Via Docker environment variable
docker run -e "GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-clock-panel" \
           grafana/grafana

# Via provisioning (recommended for production)
# /etc/grafana/grafana.ini
[plugins]
allow_loading_unsigned_plugins = grafana-piechart-panel

# Popular plugins:
# worldmap-panel:       Geographic heatmaps
# grafana-flowcharting: Network topology diagrams
# natel-plotly-panel:   3D plots
# grafana-stateTimeline: State transitions over time
```

## High Availability Grafana

```yaml
# HA Grafana — multiple instances sharing a database
# Requires PostgreSQL or MySQL (not SQLite)

services:
  grafana:
    image: grafana/grafana:latest
    environment:
      GF_DATABASE_TYPE: postgres
      GF_DATABASE_HOST: postgres:5432
      GF_DATABASE_NAME: grafana
      GF_DATABASE_USER: grafana
      GF_DATABASE_PASSWORD: ${DB_PASS}
      GF_SESSION_PROVIDER: postgres
      GF_SESSION_PROVIDER_CONFIG: "user=grafana password=${DB_PASS} host=postgres dbname=grafana_sessions sslmode=disable"
      # Remote cache for dashboard data
      GF_REMOTE_CACHE_TYPE: redis
      GF_REMOTE_CACHE_CONNSTR: addr=redis:6379

    deploy:
      replicas: 3                # Multiple Grafana instances

  # Load balancer in front
  nginx:
    image: nginx:alpine
    # Session affinity NOT needed — Grafana HA handles it
```

## Grafana Tempo (Distributed Tracing)

```yaml
# Tempo — distributed tracing backend (like Jaeger/Zipkin but Grafana native)
# Traces connect: user request → microservice A → microservice B → database

# OpenTelemetry instrumentation (Python example)
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter

provider = TracerProvider()
provider.add_span_processor(
    BatchSpanProcessor(OTLPSpanExporter(endpoint="http://tempo:4317"))
)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)

@app.route('/api/orders')
def get_orders():
    with tracer.start_as_current_span("get-orders") as span:
        span.set_attribute("user.id", current_user.id)
        orders = db.query(Order).all()
        span.set_attribute("orders.count", len(orders))
        return jsonify(orders)
```

```
# In Grafana: Connect logs → traces → metrics (Grafana's "big tent")
# Click a log line → see the trace for that request
# Click a trace span → see the metrics for that service at that time
# This is the power of unified observability with Grafana stack
```
