# Grafana — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from observability practice industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The dashboard that looked fine while the alert never fired

**The pattern:** A team builds a beautiful, comprehensive Grafana dashboard covering the four golden signals for a critical service — latency, traffic, errors, saturation, all with sensible-looking thresholds. During a real incident, the error rate climbs well past what should have triggered an alert, but no page ever goes out. Investigation reveals the *dashboard panel* and the *alert rule* were built from two subtly different PromQL queries — the dashboard panel used `rate(http_requests_total{status=~"5.."}[5m])` while the alert rule (written separately, weeks later, by a different engineer) used `rate(http_errors_total[5m])` — a different, older metric name that a previous refactor had stopped incrementing correctly.

**Why this is a genuinely easy trap, not a one-off mistake:** a dashboard panel and an alert rule serving the same conceptual purpose ("tell us about high error rates") are often built at different times, by different people, and there's no structural mechanism forcing them to stay in sync with the same underlying query. A dashboard panel showing correct, red-colored error data gives real visual confirmation that something is wrong — but that's a completely separate code path from whether the *alert rule* is evaluating the same thing correctly, and nothing about Grafana's UI makes this divergence obvious until it's tested.

**What actually prevents this:**
- **Define the query once and reference it from both the dashboard panel and the alert rule**, rather than writing the same logical query twice by hand in two different places — Grafana's alerting can query the same data source directly, and keeping the exact expression in one place (a shared recording rule in Prometheus, for instance) removes the chance of silent drift between "what the dashboard shows" and "what the alert actually checks."
- **Periodically test alerts against real historical incidents** — replaying a known past incident's time window through an alert rule and confirming it *would have* fired is a much stronger validation than assuming a rule is correct because it looks reasonable.
- **Treat a metric rename or refactor as requiring an explicit audit of every alert rule and dashboard panel referencing the old name** — this is exactly the kind of change that silently breaks monitoring without breaking anything else visibly.

---

## Scenario 2 (illustrative/composite): The high-cardinality label that took down the whole dashboard

**The pattern:** A team adds a `user_id` label to a metric, thinking it'll be useful for per-user debugging in a specific dashboard panel. Within days, Prometheus's memory usage climbs dramatically and query performance across *every* Grafana dashboard querying that metric — not just the one panel that added the label — degrades severely, to the point where dashboards time out during business hours.

**Why one seemingly small addition affects everything, not just the panel that added it:** each unique combination of label values creates a new time series in Prometheus's storage — adding a label with thousands or millions of possible values (a user ID, a request ID, a raw IP address) multiplies the number of stored time series by that same factor, and Prometheus's query performance and memory usage both scale with total series count, not per-dashboard. A single high-cardinality label addition is a genuinely global, not local, change to the monitoring system's health, even though it was made with one specific dashboard panel in mind.

**What actually prevents this:**
- **Treat cardinality as a design constraint from the start, not something to fix after the fact** — before adding any new label to an existing metric, ask what the realistic number of distinct values is; anything with unbounded or very large cardinality (user IDs, request IDs, raw IPs, full URLs with query strings) is a red flag that belongs in logs (Loki), not metric labels.
- **Use exemplars or trace correlation instead of high-cardinality metric labels for per-request debugging** — this is exactly the problem exemplars and Tempo/Loki correlation exist to solve: you don't need `user_id` as a Prometheus label if you can jump from an aggregate metric spike to the specific logs/traces for that time window instead.
- **Monitor Prometheus's own series count/cardinality as a first-class metric**, so a cardinality explosion is caught immediately after a bad label is added, rather than being diagnosed after several days of degraded dashboard performance across the whole organization.

---

## Scenario 3 (illustrative/composite): The Grafana instance that became a single point of failure for incident response

**The pattern:** An organization's entire incident-response workflow depends on Grafana dashboards to understand what's happening during an outage. During a particularly severe infrastructure incident — the kind that takes down a broad swath of shared infrastructure — the self-hosted Grafana instance itself becomes unreachable, because it happened to be running on the same underlying infrastructure that was failing. The team responding to the outage has no dashboards, no Explore view, no way to query current metrics, at exactly the moment they need it most.

**Why this is a common, easy-to-overlook single point of failure:** it's natural to build observability tooling on the same infrastructure as everything else, and Grafana (along with Prometheus, Loki, and whatever it's querying) often ends up sharing failure domains with the systems it's meant to help debug — a genuinely reasonable-seeming default that quietly creates real risk. The failure mode isn't hypothetical: monitoring/observability infrastructure going down *along with* the thing it monitors, at precisely the worst possible moment, is a well-documented pattern in real incident postmortems industry-wide.

**What actually addresses this:**
- **Run observability infrastructure (Grafana, Prometheus, Alertmanager) in a genuinely separate failure domain from what it monitors** — a different region, a different cloud account, or (for smaller setups) a managed Grafana Cloud instance specifically so an outage affecting your own infrastructure doesn't also take down your ability to see and respond to that outage.
- **Have a documented fallback for "Grafana itself is down during an incident"** — even something as basic as direct `curl` access to Prometheus's own expression browser, or CLI-based log queries against Loki directly, as a degraded-but-functional fallback path when the visualization layer itself isn't available.
- **This is a direct instance of the HA/DR principle "don't assume your monitoring shares fate with what it monitors"** — worth treating observability infrastructure's own resilience with the same seriousness applied to production services generally, rather than assuming it's exempt because it's "just" a monitoring tool.
