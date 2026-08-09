# Prometheus + Grafana — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Prometheus usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The label addition that took down every dashboard, not just one

**The pattern:** A team adds a `session_id` label to an existing, widely-queried metric, intending to enable a specific new debugging dashboard for session-level analysis. Within a day, Prometheus's memory usage climbs dramatically and query latency degrades severely — not just for the new debugging dashboard, but across every existing dashboard that queries the same underlying metric, several of which are used for unrelated, business-critical monitoring.

**Why this surprised the team who made the change:** the change was scoped, in their mental model, to "add a label useful for one specific new dashboard" — nothing about the change felt like it should affect other, unrelated dashboards querying the same metric name. The actual mechanism (each unique label-value combination creating an entirely new stored time series, with storage and query cost scaling globally with total series count) means the blast radius of a high-cardinality label addition is structurally global to the metric, not scoped to whichever dashboard motivated the change — a mismatch between the change's intended scope and its actual scope.

**What actually prevents this:**
- **Evaluate realistic cardinality before adding any new label to an existing, widely-used metric** — asking "how many distinct values could this label realistically have" as a mandatory design question, not an afterthought, especially for a metric already queried by multiple unrelated dashboards.
- **Route genuinely per-session or per-request debugging detail to logs (Loki) or traces, correlated via exemplars**, rather than metric labels — this is the direct, recommended alternative for exactly this use case, preserving the debugging capability without the global cardinality cost.
- **Monitor Prometheus's own total series count/cardinality as a first-class operational metric**, so a cardinality-driven degradation is caught immediately after the causing change, rather than discovered only once multiple unrelated dashboards have already been affected.

---

## Scenario 2 (illustrative/composite): The alert that should have fired but had nothing to evaluate

**The pattern:** A team relies on a threshold-based alert monitoring error rate for a critical service — "alert if error rate exceeds 5% over 5 minutes." During a real incident, the service's metrics endpoint becomes entirely unreachable (the process itself crashed, taking the `/metrics` endpoint down with it) — but the alert never fires, because there's no error-rate value at all to evaluate against a threshold once the metric stops being scraped entirely. The team discovers the outage through a separate, unrelated customer complaint rather than through their own alerting.

**Why a threshold-based alert alone couldn't catch this failure mode:** the alert rule was correctly written and had worked reliably for every previous incident where the service degraded *while still reporting metrics* — this specific failure (the metrics pipeline itself going silent, not just the underlying service degrading) is a structurally different case the threshold alert was never designed to catch, since evaluating a threshold against a metric that doesn't exist simply produces no result, not a triggered alert.

**What actually addresses this:**
- **Add an explicit `absent()`-based alert for every critical service's key metrics**, specifically catching the "this metric has stopped reporting entirely" case that threshold-based alerts structurally can't — this is the direct, purpose-built mechanism for exactly this failure mode.
- **Treat "the alerting system itself went silent" as a distinct, first-class failure category worth explicit monitoring**, the same discipline recommended for meta-monitoring in other observability tools — a critical service's monitoring shouldn't have a blind spot exactly where it matters most (a full outage).
- **Periodically test alert rules against a simulated "target goes fully unreachable" scenario**, not just against degraded-but-still-reporting scenarios, as part of validating alerting coverage genuinely matches the range of real failure modes a service can experience.

---

## Scenario 3 (illustrative/composite): The recording rule that was computing the wrong thing for months

**The pattern:** A team creates a recording rule to pre-compute an expensive P99 latency aggregation, improving dashboard load time significantly. The recording rule is written once, deployed, and left alone as a reliable, fast-loading dashboard component for months. A later, unrelated investigation into a real performance issue reveals the recording rule's underlying query had a subtle bug — an incorrect `by()` clause grouping — that had been silently producing a technically-valid-looking but conceptually wrong P99 figure since the rule was first created, with nobody noticing because the dashboard never errored, it just quietly showed a plausible-looking but inaccurate number the entire time.

**Why a recording-rule bug like this is uniquely hard to catch:** a recording rule that's syntactically valid and produces a result with no error gives no natural signal that its logic is wrong — dashboards built from it render normally, showing what looks like a real, sensible latency figure. Unlike a raw ad hoc query someone might periodically scrutinize, a recording rule set up once and left running tends to be trusted implicitly precisely because it's "already been working" for a long time, with nobody re-examining the underlying query logic once it's established as a reliable-seeming dashboard source.

**What actually addresses this:**
- **Periodically re-review recording rule definitions against their intended purpose**, not just trust that a long-running, error-free rule is necessarily correct — the same discipline this guide recommends for validating alerting rules against known historical incidents applies equally to recording rules feeding trusted dashboards.
- **Cross-validate a recording rule's output against the equivalent raw, ad hoc query on a sample time window periodically** — if the two don't match, the recording rule's logic has a real, undetected bug, exactly the kind this scenario describes.
- **Treat any change to an underlying metric's label schema as requiring an explicit audit of every recording rule referencing that metric**, since this is exactly the kind of change likely to silently break a recording rule's grouping logic without producing any visible error.
