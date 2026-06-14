# Datadog — Interview Questions

**What is Datadog and how does it differ from the open-source Prometheus + Grafana stack?**
Datadog is a commercial SaaS observability platform. It requires no infrastructure to run — you just install an agent. Datadog unifies metrics, logs, APM traces, RUM, and synthetics in one product with built-in correlation. Prometheus + Grafana is open-source: free but you manage the infrastructure, storage, and HA yourself. You need separate tools for logs (Loki/ELK) and APM (Jaeger/Tempo). Prometheus pull model vs Datadog push model (agent sends data). Choose Datadog when budget allows and you want less operational overhead. Choose Prometheus/Grafana for cost control, full data ownership, or vendor independence.

**What is APM and why is distributed tracing important?**
APM (Application Performance Monitoring) measures the performance of your applications — response time, error rate, throughput, and which code paths are slowest. Distributed tracing follows a single request across all microservices it touches. Without tracing: "the API is slow" — but which service? Database? External call? Network? With distributed tracing: you see the exact path, duration of each hop, and which service is the bottleneck. Datadog APM auto-instruments many frameworks (Flask, Express, Spring Boot) with minimal code changes.

**What is a Datadog monitor and what are the different types?**
A monitor watches a metric or condition and alerts when it crosses a threshold. Types: Metric (alert on metric value), Log (alert on log query), APM (alert on trace metrics like P99 latency), Synthetics (alert when test fails), Composite (combine multiple monitors with AND/OR logic), Anomaly (ML-based — alert when metric deviates from historical baseline), Forecast (alert before you run out of disk space). Alerts can notify via: Slack, PagerDuty, email, webhook, OpsGenie.

**How do you use tags effectively in Datadog?**
Tags are key:value pairs attached to everything (metrics, logs, traces, hosts). Standard tags to always set: `env:prod/staging/dev`, `service:api/worker/frontend`, `version:1.2.3`, `team:platform`. Tags enable: filtering dashboards to one service, creating alerts per environment, comparing performance between versions (after deploy: was P99 better or worse?), cost attribution (which team is generating the most data?). Set tags in the agent config or annotate Kubernetes pods — Datadog inherits tags from pod labels automatically.
