# Splunk — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Splunk usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The correlation search that missed a real threat because CIM normalization was incomplete

**The pattern:** A security team builds a correlation search intended to detect a specific attack pattern spanning firewall logs and Windows Event Logs — traffic from the same source IP touching both systems within a short window. The search runs cleanly with no errors, but during a real incident, it fails to fire even though the actual attack pattern occurred. Investigation reveals the firewall data source's `src_ip` field had never been properly mapped to CIM's normalized field naming — the correlation search's logic was querying the CIM-normalized field name, but the firewall data was sitting under a differently-named raw field, so the join across sources silently matched nothing.

**Why this is a genuinely easy trap, not an obvious misconfiguration:** the correlation search itself is syntactically correct and runs without error — there's no failure signal at the SPL level, since querying a field that happens to be empty for one data source doesn't produce an error, it just produces incomplete (and silently wrong) results. CIM compliance for a data source is a one-time setup step that's easy to assume is "done" once a data source is technically ingesting, without verifying every relevant field actually mapped correctly.

**What actually prevents this:**
- **Explicitly validate CIM field mapping for every new data source added to a correlation search**, using Splunk's own CIM compliance-checking tooling rather than assuming ingestion success implies correct normalization.
- **Test correlation searches against known historical incidents**, the same discipline recommended for alerting systems generally — replaying a known past attack pattern's time window and confirming the search *would have* fired is a much stronger validation than trusting the search logic looks correct.
- **Treat adding a new data source to an existing correlation search as requiring an explicit field-mapping audit**, not just confirming the data is flowing into Splunk at all.

---

## Scenario 2 (illustrative/composite): The dashboard that silently missed a license violation

**The pattern:** A team's Splunk deployment starts rejecting new data ingestion during a traffic spike, but their operational dashboards — built around search performance and data freshness — show no obvious anomaly, since the rejected data simply never arrives rather than arriving late or erroring visibly. The root cause, found only after a support escalation: the deployment's daily ingestion volume crossed the licensed cap during the spike, and license enforcement silently stopped accepting new data for the remainder of the licensing window.

**Why this is a common, easy-to-miss failure mode:** license-cap enforcement doesn't manifest as a dramatic, obvious error in most dashboards built around "is data flowing and is it fresh" — data that's rejected at ingestion simply isn't present to query, which can look identical to "there was genuinely nothing to log during this period" rather than "we hit a licensing wall." Without a dashboard specifically watching daily ingestion volume against the licensed cap, this failure mode has no natural visibility.

**What actually addresses this:**
- **Build an explicit dashboard/alert on daily ingestion volume relative to the licensed cap**, not just data freshness or search performance — this is the specific, direct signal that catches an approaching or already-crossed license boundary.
- **Understand the actual licensing model in use (ingest-based GB/day vs. workload-based) and its specific enforcement behavior** — this is genuinely worth verifying against current Splunk documentation rather than assuming based on how a previous deployment's licensing behaved, since terms and enforcement details change.
- **Treat a traffic spike as a licensing-risk event, not just a performance-risk event** — the operational review after a spike should explicitly check ingestion-volume-vs-license, not only search latency and indexer health.

---

## Scenario 3 (illustrative/composite): The `rex`-heavy search that degraded as data volume grew

**The pattern:** A team builds a dashboard with several panels relying on ad hoc `rex` field extraction against a high-volume sourcetype, since it was the fastest way to get a working search at the time. The dashboard performs acceptably during initial rollout. Months later, as data volume for that sourcetype grows substantially, the same dashboard becomes noticeably slow, with search performance complaints escalating during business hours specifically.

**Why this degrades gradually rather than failing outright:** `rex` extraction cost is paid on every search execution, scaling with the volume of events the search actually scans — at low data volume, this cost is negligible and invisible; as volume grows, the same search does proportionally more extraction work every single time it runs, with no single moment where it "breaks," just a steadily worsening performance curve that's easy to attribute to vague "the system is getting slower" complaints rather than the specific root cause.

**What actually addresses this:**
- **Migrate frequently-queried fields from ad hoc `rex` to `transforms.conf`-based extraction** once a field's query frequency and the underlying data volume justify the fixed setup cost — this pays the extraction cost once (at index or parse time) rather than on every search execution.
- **For dashboards specifically, evaluate whether the underlying searches would benefit from a data model plus `tstats`** — the same accelerated-summary approach this guide's Advanced material covers, trading data model maintenance overhead for genuinely faster dashboard load times at scale.
- **Treat "dashboard performance degrading as data volume grows" as an expected, plannable trajectory rather than a surprise** — the fields and searches likely to hit this wall are usually identifiable in advance (high query frequency, high data volume sourcetype), and migrating them proactively is meaningfully cheaper than reacting to user complaints after the fact.
