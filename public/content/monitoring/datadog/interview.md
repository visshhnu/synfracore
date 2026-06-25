# Datadog Interview Questions

## Fundamentals

**Q: What is the Datadog Agent and what does it do?**
A: The Datadog Agent is a lightweight process that runs on hosts to collect metrics, logs, and traces. It ships data to Datadog's SaaS platform every 15 seconds. It consists of a main Agent process, DogStatsD server (for custom metrics), Trace Agent (APM), and Process Agent. It auto-discovers running containers and services.

**Q: Explain the difference between metrics, logs, and traces in Datadog.**
A: Metrics are numerical time-series data (CPU, memory, request count). They're low-cost and good for alerting on known patterns. Logs are free-form text events with timestamps — high detail but higher cost. Traces are end-to-end records of distributed request execution, showing latency across services. Together they form the observability "three pillars." Datadog's strength is correlating all three: click a metric spike → see correlated logs → view the trace for the slow request.

**Q: What is DogStatsD and when would you use it?**
A: DogStatsD is the Agent's built-in StatsD server. Applications send UDP packets to localhost:8125. Use it for custom business metrics that don't exist as system metrics — active users, queue depth, business transactions, feature flag exposures. It supports gauges, counters, histograms, timers, sets, and distributions.

**Q: How does Datadog APM work?**
A: APM instruments application code (via language-specific libraries) to capture trace data. Each request generates a trace with spans — one per operation (HTTP call, DB query, cache lookup). Spans carry service, resource, duration, and status. Datadog Agent's Trace Agent receives spans, samples them, and sends to Datadog. You get a flame graph view of request execution, P50/P95/P99 latency, error rate, and Apdex per service.

## Intermediate

**Q: Describe how you'd set up alerting for a microservices architecture.**
A: Start with RED metrics (Rate, Errors, Duration) per service. Create metric monitors for: request rate drop (traffic anomaly), error rate >1% (threshold alert), P99 latency >500ms. Use composite monitors to reduce noise — only alert when both error rate AND latency are elevated. Set up APM monitors on service error rate. Use notification routing — P1 to PagerDuty, P2 to Slack. Tag monitors by team for ownership routing.

**Q: How do log pipelines work and why are they important?**
A: Raw logs are unstructured text. Pipelines apply processors sequentially to parse and enrich logs: Grok parser extracts fields from raw text; Date Remapper sets the canonical timestamp; Status Remapper maps levels to Datadog statuses; Geo-IP adds location from IP; Lookup enricher adds business context from reference tables. Parsed logs enable faceted search, metric extraction, and accurate alerting. Without pipelines, logs are unsearchable text blobs.

**Q: What's the difference between a metric monitor and an anomaly monitor?**
A: Metric monitors fire when a value crosses a static threshold (CPU > 85%). Simple and predictable. Anomaly monitors use ML to learn the baseline pattern (including seasonality) and alert when behavior deviates significantly from the expected range. Better for metrics with day/week patterns (web traffic, API calls) where a threshold would false-alarm on nights/weekends. Tradeoff: anomaly monitors have a learning period and can miss sudden new baselines.

**Q: How would you implement SLOs in Datadog?**
A: Define SLI (what you measure — e.g., successful requests / total requests). Create an SLO object in Datadog with target (99.9%) and window (30 days). Datadog tracks error budget remaining. Set SLO alerts at 2 thresholds: burn rate alert (consuming budget 14x faster than sustainable → 1h window) for fast burns; 1x burn rate over 1 day for slow burns. Display on exec dashboard with SLO widget.

## Advanced

**Q: How do you manage Datadog configuration at scale across hundreds of hosts?**
A: Use configuration management: Terraform for monitors, dashboards, and SLOs (version-controlled, reviewed). Ansible/Puppet/Chef for Agent installation and configuration. Autodiscovery for Kubernetes — annotate pods with `ad.datadoghq.com/<container>.check_names` and Agent discovers and configures integrations dynamically. Use Datadog's Fleet Automation for remote Agent management.

**Q: Explain Datadog's approach to cardinality and how to manage it.**
A: Cardinality = number of unique time series (metric + tag combination). High-cardinality tags (pod name, request ID, user ID) create millions of series, hitting plan limits and causing cost spikes. Manage via: Metric without Limits — configure allowed tag set at ingestion, drop high-cardinality tags; Tag allowlists in Agent — filter tags before sending; Log-based metrics instead of metrics for high-cardinality aggregations; Monitor custom metric usage via Datadog's own dashboards. Alert when approaching 80% of plan limit.

**Q: How would you architect observability for a multi-region, multi-cloud deployment?**
A: Single Datadog org with regional tags (region:us-east-1, region:eu-west-1, cloud:aws, cloud:gcp). Install Agent on all hosts. For Kubernetes, use Datadog Operator. Use private locations for synthetic tests inside each VPC. Aggregate dashboards show global view; filtered views per region. Alerts include region tag for routing to regional oncall. For data residency requirements, use Datadog EU site for European data.

**Q: How do you handle alert fatigue in Datadog?**
A: Use composite monitors to require multiple conditions before firing. Set evaluation windows longer than metric noise (5m minimum). Configure recovery thresholds to avoid flapping. Use scheduled downtime for planned maintenance. Mute non-actionable monitors during known degradation. Implement priority (P1-P4) routing — P1 pages immediately, P3 sends Slack. Review and prune monitors quarterly. Track MTTA/MTTR per team and use that data to tune thresholds. Alert on symptoms (user-visible), not causes (internal metrics) where possible.

**Q: What is Datadog's Watchdog and how does it complement manual alerting?**
A: Watchdog is Datadog's ML-powered anomaly detection that continuously scans all services without configuration. It detects unusual error rate spikes, latency changes, and infrastructure anomalies automatically. It complements threshold alerts (which require knowing the right threshold in advance) by catching unknown unknowns — novel failure modes you didn't anticipate. Watchdog surfaces findings in the Watchdog feed, linked to APM services and infrastructure. It reduces mean time to detection for anomalies that have no pre-written alert.

**Q: How do you implement distributed tracing in a polyglot microservices environment?**
A: Use OpenTelemetry (OTel) as the vendor-neutral instrumentation layer. Each service uses its language SDK (Python, Go, Java, Node) to generate OTel traces. Configure the OTel collector to export to Datadog via OTLP. This avoids vendor lock-in at the instrumentation level. Datadog receives traces and correlates with infrastructure metrics and logs via the unified service tag (env, service, version). Set sampling rate in the OTel collector — e.g., head-based sampling at 10% for high-volume services, always-sample for errors.

**Q: Explain Datadog's pricing model and how to control costs.**
A: Datadog charges per host (infrastructure), per indexed log GB, per APM host, per synthetic test run, and per custom metric count. Cost controls: use metric without limits to reduce custom metric cardinality; exclude noisy logs before indexing (keep in archive); use log-based metrics for aggregated data instead of indexing all raw logs; consolidate test hosts; review custom metric usage dashboard monthly. For large orgs, negotiate commitment discounts. Alert when custom metric count approaches plan limit.

**Q: How do you implement Datadog dashboards for executive reporting?**
A: Executive dashboards need business metrics, not technical metrics. Use PostgreSQL or custom metric data sources. Show: revenue per minute, order success rate, active users, p99 checkout latency, and on-call incidents per week. Use Stat panels with delta (vs. same time last week). Limit to 5-8 metrics. Schedule PDF snapshots via Datadog API to email weekly. Use separate org or restricted folder for exec access. Annotate charts with deployment events so business spikes/drops correlate to releases.

**Q: What is Datadog's Network Performance Monitoring?**
A: NPM captures flow-level telemetry between services using eBPF — no code changes. Shows: bytes/packets/connections between source and dest IPs, latency between services, retransmit rates. Useful for: debugging unexpected network calls, detecting service mesh misconfigurations, finding TCP retransmit causing latency, mapping actual network topology vs. intended architecture. Requires Agent with system-probe enabled. Works in Kubernetes (uses pod/service metadata to map IPs to services).

**Q: What metrics should you always monitor in production?**
A: The four golden signals: Latency (P50, P95, P99 request duration), Traffic (requests per second), Errors (error rate as % of total requests), Saturation (CPU, memory, disk, connection pool utilization). Add: availability/uptime, queue depth and consumer lag, external dependency health (DB connections, third-party API latency). For infrastructure: disk I/O wait, network drops/retransmits, OOM kills, pod restarts. Key principle: alert on user-visible symptoms (latency, errors) not internal causes (CPU, memory) — unless saturation directly causes symptoms.

**Q: How do you implement effective on-call alerting practices?**
A: Every alert must be actionable — if no action needed, it's not an alert. Set thresholds that reflect real user impact. Use multi-window burn rate alerts for SLO-based oncall. Route by severity: P1 (production down) → immediate page; P2 (degraded) → page within 30m; P3 (warning) → Slack. Each alert must have a runbook link. Maintain an alert inventory — review quarterly, delete stale alerts. Track alert quality metrics: false positive rate, MTTA, alert volume per team. Postmortems should include "were alerts useful?" review.

**Q: Explain the difference between observability and monitoring.**
A: Monitoring = watching known, predefined metrics and alerting on thresholds you define in advance. It answers "is this thing I know about working?" Observability = ability to understand arbitrary internal state of a system from its external outputs (metrics, logs, traces). It answers "what is wrong and why?" — including for failure modes you didn't anticipate. Observable systems emit rich telemetry; monitoring consumes it. You can have monitoring without observability (dashboards but no drill-down) but not the reverse. Modern SRE practice aims for observable systems, not just monitored ones.
