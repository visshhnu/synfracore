# Loki + OpenTelemetry — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Loki usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The retention config that silently kept everything forever

**The pattern:** A team configures Loki with `retention_period: 30d`, confirms it deployed successfully, and moves on — assuming logs older than 30 days are being cleaned up automatically. Months later, a storage-cost review reveals Loki's storage volume has grown far beyond what 30 days of retention should account for. Investigation reveals `compactor.retention_enabled` was never set to `true` — the retention period was configured but never actually enforced, and every log ever ingested has been silently retained the entire time.

**Why this is a genuinely easy trap, not a one-off mistake:** `retention_period` reads like a complete, self-sufficient setting — nothing about the config syntax signals that a second, separate flag is required for it to have any effect at all. A team can deploy this configuration, see no errors, and reasonably assume retention is working, since nothing about the deployment process surfaces the gap.

**What actually prevents this:**
- **Verify retention is actually deleting data, not just configured to** — check actual storage volume trends over time against the expected retention window, rather than trusting the config alone.
- **Treat `retention_period` and `compactor.retention_enabled` as a single logical setting in documentation and runbooks**, explicitly naming both together, so the two-piece requirement isn't rediscovered independently by every team that configures Loki.
- **Alert on storage growth trending inconsistently with configured retention** — a genuine early-warning signal that retention isn't behaving as configured, well before a cost review forces the discovery.

---

## Scenario 2 (illustrative/composite): The high-cardinality label that triggered the cardinality safety net — and why that was the good outcome

**The pattern:** A team adds a `request_id` label to their application's log stream, intending to make individual request debugging easier. Within hours, new log streams start being rejected with cardinality-limit errors, and the team initially treats this as a bug in Loki. Investigation reveals `max_streams_per_user` did exactly what it was designed to do — reject new streams once the tenant's cardinality cap was hit, protecting the Ingester from what would otherwise have been a slow-building memory crisis from an effectively unbounded label.

**Why the "failure" here was actually the safety net working correctly:** a `request_id` (or any similarly unbounded value) as a label, rather than log content, creates a new distinct stream per unique value — with real production traffic, this can generate an enormous and ever-growing number of streams. Without the cardinality cap, this would have degraded Ingester performance and memory usage gradually and confusingly; with the cap, it failed loudly and immediately, in a way that pointed directly at the actual misconfiguration.

**What actually addresses this:**
- **Recognize a cardinality-limit rejection as a design signal, not a bug to route around** — the fix is removing the unbounded label from the log stream's label set, not raising the cap to accommodate it.
- **Move genuinely per-request detail (`request_id`, specific user identifiers) into the log line content itself, filterable via `|=`/`| json`, rather than as a label** — this preserves the ability to search for a specific request without paying the cardinality cost of making it part of the stream identity.
- **Treat this as a direct parallel to the same cardinality lesson in metrics systems (Prometheus)** — the underlying principle (unbounded label values are a structural cost, not just a stylistic choice) applies identically across both metrics and logs.

---

## Scenario 3 (illustrative/composite): The `loki-stack` deployment that hit a wall at real production scale

**The pattern:** A team adopts Loki using the bundled `loki-stack` Helm chart for initial evaluation, finds it works well, and continues running it as their production logging backend without revisiting the deployment mode as traffic grows. Eventually, during a high-traffic period, dashboard queries begin timing out — not because of a query-language mistake, but because ingestion load and query load are contending for the same, non-independently-scaled component resources within the bundled chart.

**Why this is an easy transition to miss, not an obvious mistake:** `loki-stack` genuinely works well during evaluation and even moderate production use — nothing about its early behavior signals an approaching architectural limit, since the failure mode (ingestion and query load contending for shared resources) only manifests once both are simultaneously high. The chart's own name and documentation don't loudly flag "not intended for this scale," making the transition point easy to miss until performance degradation forces the issue.

**What actually addresses this:**
- **Treat the move from `loki-stack` to the distributed/microservices installation mode as an expected, planned milestone**, not a reactive fix — tied to a concrete metric (sustained ingestion rate, query latency under load) rather than waiting for a production incident to trigger it.
- **Monitor ingestion rate and query latency as separate, explicit signals** — since the distributed mode's entire value proposition is scaling these independently, having them visible separately (rather than one aggregate "Loki health" signal) is what actually informs the right time to migrate.
- **Plan the migration path in advance, before it's urgent** — moving from a bundled chart to distributed components involves real operational changes (separate ingester/querier/distributor scaling), and doing this calmly ahead of a capacity wall is meaningfully easier than doing it reactively during a live performance incident.
