# Datadog — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Datadog usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The healthy Agent that hid a silent APM outage

**The pattern:** A team deploys a new microservice and confirms it's "monitored" — it appears in the Infrastructure List, host CPU/memory metrics look normal, and the deploy is marked successful. Weeks later, during an incident investigation, someone discovers APM has never shown a single trace for this service since launch. The root cause: a Dockerfile refactor during the deploy pipeline's hardening pass accidentally dropped the `ddtrace-run` wrapper from the container's start command, and nobody noticed because the Agent itself — a completely separate mechanism from instrumentation — stayed healthy the entire time.

**Why this is a genuinely easy trap, not a one-off mistake:** "the service is monitored" is often treated as a single binary state, but Datadog's Agent health and APM instrumentation are structurally independent failure domains — one can be perfectly healthy while the other is silently absent, with nothing in the Infrastructure List surfacing this gap. A service showing green in one dashboard gives false confidence about a completely different, unrelated pipeline.

**What actually prevents this:**
- **Treat "zero traces for N days" as its own explicit alert condition**, not something discovered only when someone happens to look at APM during an unrelated investigation — a Monitor on trace volume per service, not just Agent uptime, closes this specific gap.
- **Add an instrumentation-verification step to the deploy pipeline itself** — confirming the `ddtrace-run`/`dd-trace` wrapper is actually present in the built image, rather than relying on it surviving future refactors unnoticed.
- **Periodically audit newly-launched services specifically** — this class of gap is most likely to appear at launch time, when instrumentation is new and less battle-tested than a service that's been running (and being watched) for months.

---

## Scenario 2 (illustrative/composite): The cost spike traced to one mistagged custom metric

**The pattern:** A team's Datadog bill grows by a meaningful percentage month over month, with infrastructure size staying roughly flat. Initial investigation focuses on host count and log volume — both look normal. The actual cause, found weeks later: a custom metric intended to track "requests per customer tier" was accidentally tagged with the raw `customer_id` instead of the intended `tier` field, multiplying the number of distinct time series for that one metric by the total customer count.

**Why one mistagged metric affects the entire bill, not just one dashboard:** Datadog's custom metric pricing scales with the number of distinct tag-value combinations (cardinality), not just the number of metric names — a single high-cardinality tag on one metric can dominate total custom-metric cost even while every other metric stays well-behaved. This mirrors the same cardinality-cost mechanism that affects Prometheus storage, but manifests as a billing line item rather than a storage/performance problem.

**What actually prevents this:**
- **Treat custom metric tag design as a cost decision at creation time**, not something to audit only after a bill spike — ask what the realistic number of distinct values for a tag is before adding it, the same discipline this guide's cost-control material recommends applying to sampling and log exclusion.
- **Run periodic cardinality audits on custom metrics specifically** — host and container metrics don't have this failure mode the same way, since Datadog controls their tagging; custom metrics are entirely the submitting team's own tag design, and mistakes there are structurally invisible until the bill reflects them.
- **Alert on custom metric ingestion volume trending upward**, the same way this guide recommends meta-monitoring the Agent's own health — a cost anomaly is a real production signal worth alerting on, not just something reviewed manually at the end of a billing cycle.

---

## Scenario 3 (illustrative/composite): The meta-monitor that caught what nobody was watching for

**The pattern:** During a routine node maintenance rollout, the Datadog Agent DaemonSet pods on a subset of nodes enter `CrashLoopBackOff` due to a resource-limit misconfiguration introduced in the same change. Because the affected nodes still serve production traffic normally — the Agent failure has no effect on the actual application — nobody notices for several hours, until an unrelated latency investigation reveals a gap in the metrics for exactly those nodes during exactly that window.

**Why this specific failure mode is easy to miss:** an Agent failure is silent from the application's perspective by design — the whole point of the Agent's architecture is that it observes without being in the request path, which also means its own failure has zero user-facing symptom. The team's dashboards, built to show application health, have no reason to flag "the thing collecting this data stopped collecting it" as distinct from "everything is fine."

**What actually addresses this:**
- **A meta-monitor on `datadog.agent.up`**, alerting specifically on Agent health gaps rather than only on the services the Agent watches — this is the direct, deliberate fix this guide's own Troubleshooting material describes, closing exactly this blind spot.
- **Track Infrastructure List host count as a canary signal** — an unexpected drop in reporting hosts means Agents stopped reporting, not that hosts vanished; this is a lightweight secondary signal alongside the explicit meta-monitor.
- **Treat monitoring infrastructure with the same operational seriousness as production infrastructure** — an Agent rollout or config change deserves the same review rigor as an application deploy, precisely because its failure mode is invisible until something else forces the gap into view.
