# Grafana Interview Questions

**Q: How would you implement a RED metrics dashboard in Grafana?**
A: RED = Rate, Errors, Duration. Create 3 stat panels at top: Rate = `sum(rate(http_requests_total[5m]))`, Errors = `sum(rate(http_requests_total{status=~"5.."}[5m]))`, Duration = `histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))`. Add time series panels below each for trend. Use template variable `$service` to make it reusable. Add threshold coloring — green below SLO, red above. Link to runbook in panel description.

**Q: What are Grafana provisioning files and why use them?**
A: Provisioning files (YAML) configure data sources, dashboards, and alert contact points as code at startup. Benefits: version-controlled, reproducible, no manual UI clicks, works in CI/CD pipelines. Dashboards stored as JSON files in Git — reviewed via PRs, deployed automatically. When Grafana restarts, it reads provisioning files and applies configuration. Alternative to provisioning: Terraform grafana provider or Grafonnet for programmatic generation.

**Q: How does Grafana Unified Alerting differ from legacy alerting?**
A: Unified Alerting (Grafana 8+): alert rules evaluated in Grafana (not per-panel), supports multi-dimensional alerts (one rule generates N alerts for N label sets), notification policies route alerts based on labels, support for Alertmanager-compatible routing, silence/inhibition support. Legacy alerting: per-panel, single-dimensional, limited routing. Unified Alerting enables multi-tenancy and handles alert grouping, deduplication, and silence better at scale.

**Q: Explain how Grafana template variables work and common use cases.**
A: Template variables are dashboard-level dropdowns/inputs that parameterize queries. Types: Query (fetch values from data source), Custom (hardcoded list), Interval, Text box, Data source (switch between sources). Common uses: env:prod/staging/dev selector; namespace selector from `label_values(kube_pod_info, namespace)`; instance selector chained from previous variable. Variables referenced as `$varname` or `${varname:csv}` in queries, titles, links. Multi-value support with `$varname:regex` for PromQL regex matching.

**Q: How would you set up Grafana for high availability?**
A: Multiple Grafana instances behind a load balancer. Shared PostgreSQL for dashboard storage, user sessions, alert state — replaces default SQLite. Redis for session caching and live queries. Shared storage for plugins. Key configs: `database.type=postgres`, `session.provider=redis`. Alert evaluation: in HA mode, use Grafana's built-in HA alert execution (each instance evaluates rules, deduplication via database). All instances must share the same secret key for cookie encryption.

**Q: What is the Grafana Observability Stack?**
A: LGTM — Loki (logs), Grafana (visualization), Tempo (traces), Mimir/Prometheus (metrics). Grafana correlates all four: click a metric spike in Grafana → jump to logs from that time window (Loki) → click a trace ID in the log → view distributed trace flame graph (Tempo) → view CPU/memory for that pod (Prometheus). ExemplarLinks connect metrics histograms to specific trace IDs. All open-source and available as Grafana Cloud managed service.

**Q: How would you build a Grafana dashboard for an SLO?**
A: Create an SLO dashboard with: Stat panel for current availability % (`1 - error_rate`), Stat panel for error budget remaining, Time series for availability trend over 30 days, Table of top error-contributing endpoints. Set panel thresholds: green > 99.9%, yellow > 99.5%, red < 99.5%. Add an SLO summary row showing burn rate (current consumption vs sustainable rate). Link to runbook and incident history. Use template variable for service so one dashboard serves all services.

**Q: What is Grafana Explore and when do you use it?**
A: Explore is Grafana's ad-hoc query interface — no dashboard needed. Use it during incident investigation: query Prometheus for metrics, switch to Loki for logs from the same time window, jump to Tempo for trace details. Explore supports split view (two queries side by side), log context (see lines before/after an error), and exemplar links (click a metric point → see the trace ID). It's designed for debugging workflows, not pre-built monitoring.

**Q: How do you manage Grafana dashboards across multiple environments?**
A: Store dashboards as JSON in Git. Use Grafana provisioning to auto-load from mounted files. Parameterize with template variables (`$env`, `$cluster`) so one dashboard serves all environments. For CD: on merge to main, run `grafana-dashboard-validator` then push JSON to S3 or ConfigMap, triggering Grafana reload. Use folder-based RBAC — devs see only their team's dashboards. Tag dashboards with version (e.g., `v2.3`) for rollback. Terraform grafana provider manages dashboards as infrastructure.

**Q: Explain Grafana's alerting notification policy routing.**
A: Notification policies form a tree. Root policy catches all alerts. Child policies match on alert labels (severity, team, env). Most-specific match wins. Example: label `severity=critical, team=platform` → policy matches `team=platform` → routes to PagerDuty with 5m grouping. Labels `severity=warning` → root policy → routes to Slack. Silences suppress matching alerts. Inhibition rules silence lower-severity alerts when higher-severity fires for the same service (suppress warning when critical is active).

**Q: How do you use Grafana for capacity planning?**
A: Use forecast functions in PromQL: `predict_linear(disk_used_bytes[7d], 86400 * 30)` predicts disk usage in 30 days. Build a capacity dashboard with: current utilization (Gauge), linear forecast to exhaustion date (Stat), trend chart with forecast overlay (Time series). Set alert when predicted exhaustion < 60 days. For memory and CPU: use regression on week-over-week growth. Track resource per service to identify which teams are driving growth. Review monthly with engineering leads for infrastructure provisioning decisions.

**Q: What is the difference between Grafana OSS, Enterprise, and Cloud?**
A: OSS: free, self-hosted, core features including dashboards, alerting, and most plugins. Enterprise: adds SAML/LDAP SSO, fine-grained RBAC, data source permissions, report scheduling, audit logs, enhanced support — requires license, self-hosted. Cloud: managed SaaS — includes Prometheus (Mimir), Loki, Tempo, k6 in one platform, auto-scaling, no ops burden. Pricing: OSS free; Cloud has free tier (3 users, 10k metrics); Enterprise negotiated. Most teams start with OSS, move to Cloud when ops overhead becomes a cost.

**Q: How do you implement Grafana alerting with PagerDuty and Slack simultaneously?**
A: Create two contact points: PagerDuty (with routing key) and Slack (webhook URL). Set up notification policy tree: root policy uses default receiver (Slack). Add child policy: `severity=critical` → PagerDuty with 0s group wait (immediate). Add another child: `severity=warning` → Slack only, 5m group wait. Both fire on critical: set PagerDuty as primary receiver, Slack as additional contact point in same policy. Use alert labels `severity: critical/warning/info` to route appropriately. Test with `grafana-oncall` integration for escalation chains.

**Q: How do Grafana panels handle multiple queries and data transformation?**
A: A single panel can have multiple queries (A, B, C...) from the same or different data sources. Transformations chain operations on the combined result set: Merge joins results from multiple queries; Join by field correlates on a common column; Filter by value removes rows; Organize fields reorders/renames columns; Calculate field adds computed columns (e.g., A/B for ratio). This allows building panels like: query A = total requests, query B = errors, transformation calculates error rate = B/A — without writing the division in every query language.

**Q: What is Grafana's role in OpenTelemetry observability?**
A: Grafana is a primary visualization layer for the CNCF OpenTelemetry ecosystem. Grafana's Tempo backend natively accepts OTLP trace data. Grafana Alloy (formerly Agent) is a full OpenTelemetry Collector distribution. Grafana Cloud provides managed OTLP endpoints for metrics, logs, traces. In Grafana dashboards: Tempo data source for traces, Prometheus/Mimir for metrics, Loki for logs — all linked via exemplars and trace-to-logs correlation. Grafana doesn't replace OTel instrumentation; it provides the UI layer on top.

**Q: What metrics should you always monitor in production?**
A: The four golden signals: Latency (P50, P95, P99 request duration), Traffic (requests per second), Errors (error rate as % of total requests), Saturation (CPU, memory, disk, connection pool utilization). Add: availability/uptime, queue depth and consumer lag, external dependency health (DB connections, third-party API latency). For infrastructure: disk I/O wait, network drops/retransmits, OOM kills, pod restarts. Key principle: alert on user-visible symptoms (latency, errors) not internal causes (CPU, memory) — unless saturation directly causes symptoms.

**Q: How do you implement effective on-call alerting practices?**
A: Every alert must be actionable — if no action needed, it's not an alert. Set thresholds that reflect real user impact. Use multi-window burn rate alerts for SLO-based oncall. Route by severity: P1 (production down) → immediate page; P2 (degraded) → page within 30m; P3 (warning) → Slack. Each alert must have a runbook link. Maintain an alert inventory — review quarterly, delete stale alerts. Track alert quality metrics: false positive rate, MTTA, alert volume per team. Postmortems should include "were alerts useful?" review.

**Q: Explain the difference between observability and monitoring.**
A: Monitoring = watching known, predefined metrics and alerting on thresholds you define in advance. It answers "is this thing I know about working?" Observability = ability to understand arbitrary internal state of a system from its external outputs (metrics, logs, traces). It answers "what is wrong and why?" — including for failure modes you didn't anticipate. Observable systems emit rich telemetry; monitoring consumes it. You can have monitoring without observability (dashboards but no drill-down) but not the reverse. Modern SRE practice aims for observable systems, not just monitored ones.

**Q: How do you implement role-based access control in Grafana for a large organization?**
A: Use Organizations for full tenant isolation (separate dashboards, data sources, users). Within an org, use Folders + Teams for access control: create a folder per team, assign Edit/View permissions to the corresponding team. Service accounts (not personal accounts) for CI/CD provisioning. LDAP/SAML sync assigns users to teams automatically based on group membership. For sensitive data sources (prod DB, secrets): assign data source permissions to specific teams only. Audit log (Enterprise) tracks all read/write actions. Viewers see dashboards only; Editors build dashboards; Admins manage data sources and users.

**Q: What is Grafana Tempo and how does it integrate with Grafana?**
A: Tempo is Grafana's distributed tracing backend — stores traces in object storage (S3/GCS) indexed only by trace ID. It's designed for 100% trace sampling at low cost (no ElasticSearch required). Add Tempo as a Grafana data source. In Explore: paste a trace ID to view the full flame graph. Integration: Loki derived fields parse trace IDs from logs and link to Tempo; Prometheus exemplars embed trace IDs in metric samples and link to Tempo. This creates end-to-end correlation: metric spike → correlated logs → specific trace → root cause. Tempo supports OTLP, Jaeger, Zipkin, and Zipkin-compatible protocols.
