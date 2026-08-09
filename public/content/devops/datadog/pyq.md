# Datadog — PYQ (Previously Asked / Practice Questions)

**Framing note:** Datadog doesn't administer a proctored public certification with a leaked-question archive the way some vendor exams do. What follows is built from this guide's own certification-track material and real interview-style scenarios grounded in Overview/Intermediate/Advanced/Troubleshooting content, framed as practice questions rather than invented "leaked" exam content.

---

### 1. (Domain: Agent Architecture) A newly deployed Kubernetes service appears in the Infrastructure List with healthy host metrics, but shows zero traces in APM. What's the most likely cause, and what's the fastest way to confirm it?

**Answer:** Host metrics and APM instrumentation are two entirely separate mechanisms — a healthy Agent guarantees the former, not the latter. The most likely cause is a missing or dropped auto-instrumentation wrapper (`ddtrace-run` for Python, or `require('dd-trace').init()` not being the literal first line for Node) — a common real cause is this getting silently dropped during a Dockerfile refactor. Confirm by checking the running process's actual startup command inside the container, not just the Agent's own status.

---

### 2. (Domain: Query Syntax) Translate this PromQL query into Datadog's query syntax: `sum(rate(http_requests_total{status=~"5.."}[5m]))`.

```
sum:trace.http.request.errors{*}.as_rate()
```
**What's being tested:** the mapping mindset this guide's own Module 04 teaches — the same observability concept (error rate as a rate over a time window), different syntax. `.as_rate()` is Datadog's equivalent of PromQL's `rate()` function applied to a counter.

---

### 3. (Domain: SLOs) Why would a team define an SLO via Terraform's `datadog_service_level_objective` resource instead of configuring it directly in the Datadog UI?

**Answer:** Terraform-managed SLOs are reviewable in a pull request before being applied — the same "everything as code" philosophy this guide applies throughout (Monitors, dashboards, SLOs). A UI-configured SLO has no change history, no review step, and can be silently modified by anyone with access; a Terraform-managed one has an auditable diff for every change to the error-budget target.

---

### 4. (Domain: Cost Control) A team's Datadog bill grows faster than their infrastructure does. Name the three most likely drivers and the specific lever for each.

**Answer:** (1) APM trace volume — captured at 100% by default; the lever is `DD_TRACE_SAMPLE_RATE`. (2) High-volume, low-value logs (health checks, static asset requests) being ingested; the lever is a log exclusion filter applied before ingestion. (3) Custom metric cardinality explosion — a single mistagged custom metric (a tag like `request_id` applied to a metric) can multiply the number of distinct time series dramatically; the lever is a cardinality audit of custom metrics specifically, since host/container metrics don't have this failure mode the same way.

---

### 5. (Domain: Architecture) What's the specific difference between what the Datadog Agent does and what the Cluster Agent does in a Kubernetes deployment?

**Answer:** The Agent (DaemonSet, one per node) collects host/container-level metrics, tails logs, and receives traces from instrumented apps on that specific node. The Cluster Agent handles cluster-level concerns that don't make sense per-node — cluster metadata aggregation, and (if `clusterAgent.metricsProvider.enabled=true` is set, a separate flag from basic Cluster Agent enablement) exposing the external metrics API that Kubernetes HPA can query.

---

### 6. (Domain: Monitors/Alerting) A Monitor is configured correctly and the underlying condition is genuinely true, but the alert never fires. Besides the query itself being wrong, what's a common structural cause?

**Answer:** The evaluation window and threshold combination — a Monitor querying `avg(last_5m)` requires the condition to hold true across that entire averaging window, not just at a single instant; a brief spike that doesn't sustain across the full window won't cross the threshold on average even though it was real. This is analogous to the `for:` duration concept in other alerting systems — deliberately preventing brief noise from firing an alert, at the cost of a genuinely short-lived issue potentially not triggering one.

---

### 7. (Domain: Security) Where should PII be scrubbed from log data before it reaches the Datadog backend, and why does that location matter?

**Answer:** At the Agent level, using log processing rules, before the data ever leaves the host. Scrubbing downstream (after ingestion) means the sensitive data has already left the network and been stored, however briefly, in Datadog's infrastructure — Agent-level scrubbing prevents that exposure entirely rather than cleaning up after the fact, and has the added benefit of reducing ingested (and billed) volume for excluded content.

---

### 8. (Domain: Meta-Monitoring) Why does this guide recommend a Monitor on `datadog.agent.up` specifically, when Datadog is itself the monitoring system?

**Answer:** Because the Agent itself can fail silently — this guide's own Troubleshooting scenario describes an Agent going into `CrashLoopBackOff` on a subset of nodes with metrics silently stopping for those nodes, undiscovered until an unrelated incident review. A meta-monitor on the Agent's own health closes that gap: the monitoring system alerts on itself, not just on the services it watches, catching Agent failures within minutes instead of incidentally.

---

### 9. (Domain: Cost/Architecture Tradeoffs) A team is deciding between self-hosted Prometheus+Grafana+ELK and Datadog. What's the honest framing of this tradeoff, per this guide's own Interview Prep material?

**Answer:** Prometheus+Grafana+ELK is free in licensing terms but the team owns storage sizing, HA, and Alertmanager routing operationally; Datadog costs real per-host/per-GB money but collapses all three into one managed platform with built-in cross-signal correlation. For a small platform team without dedicated SRE headcount, the operational-overhead savings can outweigh the license cost; for a team with existing Prometheus expertise and real cost sensitivity, self-hosted can remain the better call. The decision should be made on total cost of ownership, not sticker price alone.

---

### 10. (Domain: APM) What specifically does injecting `dd.trace_id`/`dd.span_id` into application logs enable, and why doesn't APM instrumentation provide this automatically?

**Answer:** It enables the "Related Logs" tab on a trace view in the Datadog UI — without this injection, traces and logs are two entirely separate data streams with no structural link between them, even though both originate from the same request. APM auto-instrumentation patches libraries to generate trace/span data automatically, but it has no way to know your application's specific logging format or library — the log-formatter-level injection has to be added explicitly as a separate integration step.
