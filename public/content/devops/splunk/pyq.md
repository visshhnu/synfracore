# Splunk — PYQ (Previously Asked / Practice Questions)

**Framing note:** Splunk's certification exams are proctored and confidential — no public past-paper archive exists. What follows is built from this guide's own certification-track material and the SPL/architecture concepts covered in Fundamentals/Intermediate/Advanced/Troubleshooting, framed as practice questions rather than invented "leaked" exam content.

---

### 1. (Domain: SPL Fundamentals) Write an SPL query showing the top 5 hosts by error-level event count in the last hour, worst first.

```spl
search errorlevel=error earliest=-1h | stats count by host | sort -count | head 5
```
**What's being tested:** the pipeline-construction mental model this guide teaches from Fundamentals onward — filter (intake), aggregate (stats), order (sort), limit (head), in that specific sequence.

---

### 2. (Domain: Architecture) What's the specific difference between what a Splunk Indexer does and what a Search Head does, and why does a large deployment cluster each separately?

**Answer:** Indexers receive raw data, parse it, extract fields, and store it in Splunk's own indexed format organized into time-based buckets. Search Heads are where SPL actually executes — they distribute a search across the relevant indexers and collect/render results, but don't themselves store the primary indexed data. They're clustered separately (indexer clustering for data scale/replication, search head clustering for search-capacity/HA) because they scale along genuinely different dimensions — more data volume drives indexer scaling; more concurrent searches/users drives search head scaling.

---

### 3. (Domain: Field Extraction) A field is queried in nearly every search against a specific sourcetype. Why might a `transforms.conf`-based extraction be preferred over ad hoc `rex` for this field specifically?

**Answer:** `rex` extraction cost is paid every single time a search using it runs. A `transforms.conf`-based extraction (whether index-time or search-time) pays that extraction cost in a more durable, optimized way — for a field genuinely queried constantly, this is a real, measurable performance difference at scale, not just a stylistic preference. `rex` remains the right tool for one-off, exploratory extraction where the field isn't going to be queried repeatedly.

---

### 4. (Domain: Performance) Explain why `tstats` can be dramatically faster than `stats` for the same logical aggregation, and what has to exist first for `tstats` to be usable at all.

**Answer:** `tstats` runs against a data model's accelerated summary — a pre-computed, indexed structure — rather than scanning raw events directly the way `stats` does. This makes it dramatically faster at scale, but it requires a data model to already exist and be accelerated before `tstats` can be used against it; there's real maintenance overhead (acceleration processing, storage) that has to be weighed against the query-time speedup for a specific use case.

---

### 5. (Domain: Indexer Clustering) A cluster has Replication Factor (RF) = 3 and Search Factor (SF) = 2. What does this mean concretely, and what real operational scenario does the RF > SF gap protect against?

**Answer:** Every bucket exists as 3 copies across the indexer cluster (RF=3) for data durability, but only 2 of those copies are immediately searchable (SF=2) at any given time. The gap between RF and SF is a deliberate tradeoff — maintaining full searchability on every replica costs more resources than maintaining durability alone; SF < RF means the cluster can tolerate losing an indexer without losing data (RF covers this) while not paying the full search-readiness cost on every single copy.

---

### 6. (Domain: Lookups) What's the difference between a lookup and a data model, and can a lookup-enriched field be used in a data model?

**Answer:** A lookup enriches raw indexed events with external reference data Splunk never itself ingested as events (a CSV of employee names keyed by badge ID, for instance) — it's a join-at-search-time mechanism. A data model is a structural definition over a dataset (which may include lookup-enriched fields) that enables Pivot-based reporting and is the prerequisite for `tstats` acceleration. Yes, a data model can be built over a dataset that includes lookup-enriched fields — the lookup enrichment and the data model structure are complementary, not competing mechanisms.

---

### 7. (Domain: Enterprise Security) What does CIM (Common Information Model) actually solve, and why does it matter specifically for correlation searches spanning multiple data sources?

**Answer:** CIM normalizes disparate data sources — a firewall's proprietary format, Windows Event Logs, a cloud audit trail — into a consistent field-naming schema, so a correlation search can reference a normalized field name (like `src_ip` or `user`) that means the same thing regardless of which underlying source produced it. Without CIM normalization, a correlation search spanning multiple sources would need source-specific field-name handling for every source involved, which doesn't scale as the number of integrated data sources grows.

---

### 8. (Domain: Enterprise Security) What is a Notable Event, and how does it differ from a correlation search's raw output?

**Answer:** A correlation search's raw output is just search results — rows of data matching a query. A Notable Event is that output specifically packaged and surfaced for an analyst triage workflow within Splunk Enterprise Security — it carries additional context (urgency, associated risk objects, workflow status) meant to support a security analyst's investigation process, not just present matching data. The distinction matters because "the search found something" and "the finding is properly surfaced for a human to act on" are genuinely different problems.

---

### 9. (Domain: Certification) Is the Splunk Enterprise Security Certified Admin (SPLK-3001) certification still actively maintained, and how should this affect a candidate's certification planning?

**Answer:** No — this is confirmed (not just tagged as volatile) as a legacy certification, no longer actively maintained. A candidate planning a certification path focused on Splunk security work should verify the current active Enterprise Security-relevant certification options directly against Splunk's current documentation rather than targeting SPLK-3001, since pursuing a legacy, unmaintained certification has materially less value than an actively maintained equivalent.

---

### 10. (Domain: Risk-Based Alerting) What problem does Risk-Based Alerting (RBA) solve that a traditional single-search correlation alert doesn't?

**Answer:** A traditional correlation search alerts on one specific pattern crossing a threshold, which can miss a genuine threat that consists of several individually low-confidence signals that only become concerning in combination. RBA instead accumulates a risk score across multiple lower-confidence signals over time, alerting once the aggregate score crosses a threshold — this catches slow-building, multi-signal threats that no single correlation search alone would have flagged, at the cost of needing more careful risk-score tuning to avoid both false positives and alert fatigue.
