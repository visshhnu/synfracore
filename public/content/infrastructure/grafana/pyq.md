# Grafana — PYQ (Previously Asked / Practice Questions)

**Framing note:** Grafana's own certification (Grafana Certified Associate, administered via grafana.com/training/certification) is proctored and confidential — no public past-paper archive exists. What follows is built from the certification's own published domains (data sources & connection, PromQL/LogQL queries, dashboard creation, alerting, administration — as listed in this course's own certification material) framed as practice/task questions rather than invented "leaked" content.

---

### 1. (Domain: Data Sources & Connection) You connect Grafana to a Prometheus instance and a panel shows "No data" even though the connection test succeeded. What are the two most likely causes, in order of how you'd check them?

**Answer:** First, check whether the PromQL query itself is actually correct and matches a metric that exists — run it directly in Grafana's Explore view against the same data source before assuming anything is wrong with the connection. Second, check the selected time range — a query that's correct but scoped to a time window with no actual data (too far in the past, or before the metric started being scraped) will also show "No data" despite a perfectly working connection. The connection test succeeding only confirms Grafana can reach the data source at all, not that any specific query against it will return results.

---

### 2. (Domain: PromQL/LogQL Queries) Write a PromQL query for "the 95th percentile request latency, per service, over the last 5 minutes," assuming a histogram metric `http_request_duration_seconds_bucket`.

```promql
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service))
```
**What's being tested:** correct use of `histogram_quantile` requiring the `le` (less-than-or-equal) label to remain in the `by` clause — a common mistake is aggregating it away entirely (`by (service)` alone), which breaks the quantile calculation since `histogram_quantile` needs the full set of bucket boundaries preserved per series.

---

### 3. (Domain: Dashboard Creation) A dashboard needs to work identically across `dev`, `staging`, and `prod` without maintaining three separate copies. What Grafana feature solves this, and what's the actual query change required?

**Answer:** Template variables. Create a variable (e.g., `$environment`, type Custom with values `dev,staging,prod`, or type Query if the environment is derivable from a label), then reference it in every panel query instead of hardcoding the environment: `http_requests_total{environment="$environment"}`. Selecting a different value from the dropdown at the top of the dashboard then updates every panel simultaneously, without needing separate dashboard copies to maintain.

---

### 4. (Domain: Dashboard Creation) What's the difference between a dashboard "Variable" of type Query versus type Custom, and when would you use each?

**Answer:** A Query variable populates its dropdown dynamically from the data source itself (e.g., `label_values(kube_pod_info, namespace)` — automatically reflects whatever namespaces actually exist right now). A Custom variable is a static, hardcoded list you define once (e.g., `dev,staging,prod`). Use Query when the valid options genuinely change over time and should stay in sync with reality (namespaces, hostnames, dynamically-created services); use Custom when the list is fixed and unlikely to change (a small, known set of environments or fixed categories).

---

### 5. (Domain: Alerting) An alert rule's query returns true for a single, brief 10-second spike, then returns to normal. The alert never actually fires. Why, and what setting controls this?

**Answer:** The `for` duration setting requires the condition to be continuously true for that entire duration before the alert transitions from "Pending" to actually "Firing" — a `for: 5m` setting means a condition that's only true for 10 seconds never accumulates enough sustained time to fire at all. This is a deliberate design, not a bug: it exists specifically to prevent brief, noisy spikes from generating alert fatigue, at the cost of a genuinely real but very short-lived issue potentially not triggering an alert.

---

### 6. (Domain: Alerting) What's the correct way to route P1-severity alerts to PagerDuty and P3-severity alerts to Slack only, using Grafana's notification policy system?

**Answer:** Build a notification policy tree: the root/default policy handles the fallback case (e.g., routes to Slack), then add a child policy matching on the label `severity=critical` (or however P1 is labeled) that routes specifically to a PagerDuty contact point, with notification policies evaluated most-specific-match-first. This requires the alert rules themselves to actually carry a `severity` label reflecting their real priority — the routing logic is only as good as the labels the alert rules are configured to set.

---

### 7. (Domain: Administration) An organization wants developers to view dashboards for their own team's services but not edit them, while the platform team can edit everything. What Grafana feature combination achieves this?

**Answer:** Folders + Teams + Roles. Organize dashboards into folders (e.g., one folder per team/service group), create Teams matching the org's actual team structure, and assign folder-level permissions: the platform team gets Editor (or Admin) access to all folders, while each team gets Viewer access to their own folder specifically. This is a folder-and-team-level access control pattern, not something achieved through dashboard-level settings alone.

---

### 8. (Domain: Data Sources & Connection) A Grafana instance needs to query a data source that requires a username and password. Where should the password actually be stored — in the visible `jsonData` provisioning block, or elsewhere?

**Answer:** In `secureJsonData`, not `jsonData` — `secureJsonData` fields are encrypted at rest in Grafana's database and are never returned in plaintext via the API or UI after being set, whereas `jsonData` is stored and displayed as plain configuration. Putting a password in `jsonData` by mistake is a real, avoidable secrets-exposure risk in provisioning files, especially if those files are checked into a shared Git repository.

---

### 9. (Domain: Dashboard Creation) A team wants a single panel showing "error rate as a percentage of total requests," computed from two separate underlying PromQL queries rather than one complex combined expression. What Grafana feature enables this without writing the division into the query language directly?

**Answer:** A Transformation — specifically "Add field from calculation" (or "Calculate field," depending on Grafana version), applied after two separate queries (A = error count, B = total count) are both returned to the same panel. The transformation computes A/B as a new field in the visualization layer, which can be simpler to build and reason about than embedding the full division expression directly in a single PromQL query, especially when the two source metrics come from different underlying series or even different data sources.

---

### 10. (Domain: Alerting) Why might identical alert rule configurations behave differently on Grafana OSS versus Grafana Cloud, specifically regarding notification delivery reliability?

**Answer:** Grafana OSS (self-hosted) alert evaluation and notification delivery depend entirely on that single Grafana instance's own uptime and network access to external contact points (Slack, PagerDuty) — if the Grafana instance itself is degraded or network-isolated, alerts silently stop firing with no external fallback. Grafana Cloud's managed alerting infrastructure is designed with its own redundancy independent of any single customer's setup. This is directly related to the broader "your monitoring shouldn't share a failure domain with what it monitors" principle — a self-hosted Grafana instance that goes down during the same incident it's supposed to be alerting on is a real, documented risk pattern, not a theoretical one.
