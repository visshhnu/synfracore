# Datadog — Cheatsheet

```bash
# ── AGENT ─────────────────────────────────────────────────
sudo datadog-agent status           # Full agent status
sudo datadog-agent check nginx      # Test integration
sudo datadog-agent flare            # Send diagnostics to Datadog support
sudo datadog-agent configcheck      # Validate config files
sudo systemctl restart datadog-agent

# Agent config: /etc/datadog-agent/datadog.yaml
# Integration configs: /etc/datadog-agent/conf.d/

# ── KEY METRIC QUERIES (in Datadog UI) ───────────────────
# CPU usage by host
avg:system.cpu.user{*} by {host}

# Error rate (APM)
sum:trace.web.request.errors{env:prod}.as_rate()

# Request rate
sum:trace.web.request.hits{service:my-api}.as_rate()

# P99 latency
p99:trace.web.request{service:my-api,env:prod}

# Kubernetes pod restarts
sum:kubernetes.containers.restarts{*} by {pod_name}

# Disk usage %
100 * (1 - avg:system.disk.free{*} / avg:system.disk.total{*})

# ── LOG SEARCH SYNTAX ─────────────────────────────────────
service:api status:error                    # Errors from api service
@http.status_code:500                       # Specific HTTP status
"NullPointerException"                      # Text search
service:api -status:error                   # Exclude errors
@duration:>1000                             # Duration > 1000ms
env:prod @user.id:12345                     # User-specific logs

# ── MONITOR ALERT TEMPLATE VARIABLES ─────────────────────
{{host.name}}           # Host that triggered
{{value}}               # Current metric value
{{threshold}}           # Alert threshold
{{comparator}}          # above/below
{{#is_alert}}...{{/is_alert}}  # Content only in alert state
{{#is_recovery}}...{{/is_recovery}}

# ── ENVIRONMENT VARIABLES FOR APM ─────────────────────────
DD_API_KEY=xxx
DD_ENV=prod
DD_SERVICE=my-api
DD_VERSION=1.2.3
DD_TRACE_AGENT_URL=http://localhost:8126
DD_LOGS_INJECTION=true    # Correlate logs with traces
DD_RUNTIME_METRICS_ENABLED=true

# ── TERRAFORM ─────────────────────────────────────────────
# provider "datadog" { api_key = var.dd_api_key; app_key = var.dd_app_key }
# Resources: datadog_monitor, datadog_dashboard, datadog_slo, datadog_service_level_objective
```
