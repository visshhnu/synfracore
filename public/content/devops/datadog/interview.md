# Datadog Interview Q&A

**Q: How is Datadog different from Prometheus+Grafana?**
Datadog is a fully managed SaaS — no infrastructure to run. Prometheus is self-hosted (you manage storage, Alertmanager, Grafana). Datadog has better APM (distributed tracing, service maps), built-in log management, and SLO tracking. Cost trade-off: Prometheus is free, Datadog is expensive at scale.

**Q: What is the Datadog Agent?**
Lightweight process running on every host. Collects: system metrics (CPU, memory, disk, network), process metrics, logs (tail -f), traces (APM), custom metrics via StatsD. Sends data to Datadog SaaS platform.

**Q: How do you write a Datadog monitor?**
Threshold alert (metric > value), anomaly detection (based on historical pattern), forecast (predict future breach), composite (combine multiple monitors), log-based. Define: query, conditions, message (with @mentions for Slack/PagerDuty), evaluation window.

**Q: What is Datadog APM vs Infrastructure monitoring?**
APM: distributed tracing across microservices — track a request from frontend through backend services to database. Shows service dependency maps, error rates, latency by endpoint. Infrastructure: host-level metrics, container metrics, cloud service metrics. Both use the same Agent.

**Q: How do you instrument an application for Datadog APM?**
Add Datadog tracing library (ddtrace for Python, dd-trace-js for Node, etc.). Set DD_SERVICE, DD_ENV, DD_VERSION environment variables. Agent runs alongside (sidecar or DaemonSet in K8s). Auto-instrumentation available for common frameworks (Flask, Express, Django, Spring).
