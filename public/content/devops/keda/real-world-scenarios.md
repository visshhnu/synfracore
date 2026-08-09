# KEDA — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production KEDA usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The consumer that HPA swore was healthy while lag climbed into the millions

**The pattern:** A team runs a Kafka consumer service scaled by plain Kubernetes HPA on CPU utilization, which stays comfortably under 20% even during periods of significant message backlog. During a traffic surge, consumer lag climbs into the millions of messages, and downstream systems relying on timely processing start experiencing real, user-facing delays — while HPA's own dashboard shows the workload as healthy and stable the entire time, since CPU never crossed the scaling threshold.

**Why this is a genuinely easy trap, not an obvious monitoring gap:** HPA's CPU-based scaling isn't malfunctioning — it's doing exactly what it's designed to do, correctly reporting that CPU utilization is within normal bounds. The gap is conceptual: CPU utilization and actual application-level backlog are simply different signals, and a workload can be I/O-bound (waiting on messages, not burning CPU) while genuinely falling behind. Nothing about a "healthy" HPA dashboard signals that a completely different, unmonitored dimension of health is deteriorating.

**What actually prevents this:**
- **Migrate the consumer's scaling trigger to KEDA's Kafka lag trigger**, scaling directly on the metric that actually reflects the real problem (backlog), rather than a proxy metric (CPU) that happens to correlate poorly for this specific workload shape.
- **Alert on consumer lag as its own explicit, first-class metric**, independent of whatever scaling mechanism is in place — this would have surfaced the growing backlog directly, rather than relying on HPA's CPU-based health signal as an (in this case, misleading) proxy for actual system health.
- **Audit other queue/stream-consuming workloads for the same CPU-vs-actual-backlog gap** — this is a structural pattern, not a one-off misconfiguration, likely to recur for any I/O-bound consumer still scaled on CPU alone.

---

## Scenario 2 (illustrative/composite): The scale-to-zero config that never actually reached zero

**The pattern:** A platform team configures a batch-processing workload with `minReplicaCount: 0`, expecting it to scale down to zero replicas during idle periods to save cost. Months later, a cost review reveals the workload has never actually scaled below 1 replica the entire time — a smaller but real, ongoing cost that was assumed to be zero. Investigation reveals `idleReplicaCount` was never explicitly set, so despite `minReplicaCount: 0` appearing to configure scale-to-zero, the actual scale-to-zero mechanism (a separate field) was simply never enabled.

**Why this is a genuinely easy trap, not an obvious misconfiguration:** `minReplicaCount: 0` reads as if it should be sufficient on its own to allow scaling to zero — the field name itself suggests "the minimum is zero, so it can go to zero." The distinct, separate role of `idleReplicaCount` isn't obvious from `minReplicaCount`'s name or from a quick glance at the ScaledObject spec, making this a genuinely non-intuitive configuration requirement rather than a careless mistake.

**What actually prevents this:**
- **Explicitly set `idleReplicaCount: 0` for any workload genuinely intended to scale to zero**, treating `minReplicaCount` and `idleReplicaCount` as two distinct, both-required settings rather than assuming one implies the other.
- **Verify scale-to-zero is actually happening by observing real replica count over a genuinely idle period**, rather than trusting the configuration alone — the same verification discipline this guide recommends for other easy-to-misconfigure two-field settings.
- **Include a cost/replica-count dashboard specifically for workloads configured for scale-to-zero**, so a configuration that isn't actually achieving its intended cost savings is visible as an ongoing discrepancy, not discovered only during a periodic cost review.

---

## Scenario 3 (illustrative/composite): The custom scaler that quietly stopped reporting metrics

**The pattern:** A team builds a custom External Scaler for an internal job-tracking system with no built-in KEDA scaler, and it works reliably for a long period. During an unrelated internal-system migration, the job-tracking database's schema changes in a way that breaks the custom scaler's underlying query — but the scaler's gRPC service itself keeps running without crashing, simply returning a stale or default metric value instead of erroring out. The affected workload silently stops scaling correctly, staying at its last-known replica count regardless of actual load, for an extended period before anyone notices the mismatch.

**Why this is a genuinely easy trap, not an obvious integration bug:** a custom scaler is, by definition, bespoke code with no built-in validation or health-checking beyond what the team itself builds — unlike a well-tested built-in scaler (Kafka, RabbitMQ), a custom scaler's failure modes are entirely the team's own responsibility to anticipate. A query that fails gracefully (returning a default value instead of an error) is a particularly dangerous failure mode, since nothing in the KEDA reconciliation loop flags it as wrong — from KEDA's perspective, the scaler answered the question, just with an unintentionally wrong answer.

**What actually addresses this:**
- **Build explicit health/staleness checks into any custom External Scaler**, having `GetMetrics` fail loudly (return an error) rather than silently returning a default or stale value when its underlying data source query fails — this is the direct fix for exactly this failure mode.
- **Treat a custom scaler with the same monitoring rigor as any other production service** — logging, alerting on query failures, and dashboards showing the actual metric values it's reporting over time, rather than assuming "the pods are running" is sufficient evidence it's working correctly.
- **Coordinate schema/system changes with an explicit check of any dependent custom scalers**, since a custom scaler is, by nature, an integration point the broader team maintaining the underlying system may not know exists or depends on their schema staying stable.
