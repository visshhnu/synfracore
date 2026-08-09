# Splunk — Portfolio Projects

Build these 3 projects to prove Splunk mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Single-Instance Search and Dashboard Baseline

**Level:** Beginner | **Time:** 1 day | **GitHub:** `splunk-search-dashboard-baseline`

**What you build:** A single-instance Splunk install ingesting a sample application's logs, with SPL searches built up as a pipeline, and a dashboard summarizing error activity.

### Core SPL pipeline (built incrementally, per Fundamentals' own teaching pattern)
```spl
index=web sourcetype=access status>=500
| stats count by host
| sort -count
| head 5
```

### Interview points
- Building the query one pipe stage at a time (filter, then aggregate, then sort, then limit) mirrors how you'd actually debug a slow or wrong SPL query in production — isolate which stage is misbehaving by running the pipeline up to that point
- The `_internal` index as a reliable sanity check that search itself is functioning, independent of any real data source being configured correctly
- Field extraction at search time (`rex`) vs. index time (`props.conf`) — a genuine architectural tradeoff between query flexibility and search performance, not just two ways to do the same thing

### Steps
1. Install Splunk single-instance and generate or ingest a sample web-server access log
2. Build the SPL pipeline above incrementally, verifying output at each stage
3. Create a dashboard with a top-hosts-by-error-count panel and a time-chart of error volume
4. Add one saved search that runs the error query on a schedule
5. Document each SPL command's specific job in the README, in your own words

---

## Project 2: Field Extraction and Data Model with Lookups

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `splunk-data-model-lookups`

**What you build:** A properly structured data model over a multi-source dataset, with a CSV lookup enriching raw events with reference data, and Pivot-built reports on top of it.

### Lookup definition
```spl
| inputlookup employee_directory.csv
```
```spl
index=badge_access
| lookup employee_directory.csv badge_id OUTPUT employee_name, department
| stats count by department
```

### Field extraction via `transforms.conf`
```ini
# transforms.conf — index-time or search-time field extraction,
# more durable and performant than ad hoc rex for a field used constantly
[extract_order_id]
REGEX = order_id=(?<order_id>\d+)
```

### Interview points
- Lookups are the mechanism for enriching raw machine data (a badge ID, an IP address) with reference data Splunk itself never ingested as events — a common real pattern in security and operations use cases
- Choosing `transforms.conf`-based extraction over ad hoc `rex` for a field queried constantly is a genuine performance decision, not a stylistic one — being able to explain *why* (extraction cost paid once vs. every search) demonstrates real operational understanding
- Data models are what make Pivot (and later, `tstats`-accelerated searches in Project 3) possible — they're a structural investment, not just an alternative UI

### Steps
1. Ingest a dataset with a natural join key to an external reference table (badge access logs + an employee directory CSV is a realistic pattern)
2. Build and upload the lookup, then use it to enrich a real search
3. Define a data model over the enriched dataset
4. Build at least one Pivot report from the data model without hand-writing SPL for it
5. Document the specific decision to use `transforms.conf` vs. `rex` for at least one field, with your reasoning

---

## Project 3: Correlation Search and Notable Event (SIEM Pattern)

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `splunk-correlation-search-siem`

**What you build:** An Enterprise-Security-style correlation search across two different data sources, generating a Notable Event when a suspicious pattern is detected — the concrete SIEM pattern referenced throughout Advanced.

### Correlation search concept
```spl
index=vpn_logs action=login_success
| join user [ search index=badge_access action=denied earliest=-1h ]
| eval risk_note="VPN login without matching badge access in the last hour"
| table _time, user, src_ip, risk_note
```

### `tstats`-accelerated version (once a data model exists over both sources)
```spl
| tstats count from datamodel=Authentication where Authentication.action=success
  by Authentication.user, _time span=1h
```

### Interview points
- The core SIEM value proposition, concretely: correlating two data sources that were never designed to be read together (VPN logs and physical badge access) to surface a pattern neither source alone would flag — this is Overview's "universal translator" analogy made literal
- `tstats` vs. `stats` — being able to explain why the accelerated version is dramatically faster at scale (querying the data model's summary, not raw events) and when the tradeoff (data model maintenance overhead) is worth it
- Explaining what makes an event "Notable" in Enterprise Security terms — a correlation search's output isn't just a search result, it's meant to feed an analyst triage workflow

### Steps
1. Ingest two genuinely different log sources with a shared join key (user, IP, or similar)
2. Write the raw `join`-based correlation search first, and confirm it produces real matches
3. Build a data model over both sources and rewrite the search using `tstats` for comparison
4. Document the actual performance difference observed between the two approaches
5. Write up, in the README, what a Notable Event and analyst triage workflow would look like built on top of this search — even without a full Enterprise Security license to demonstrate it live

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README documents every SPL command used, in plain language, not just the query itself
- [ ] Can explain the forwarder → indexer → search head data path end-to-end in an interview
- [ ] Project 2's lookup-enrichment is demonstrated with a before/after search result comparison
- [ ] Project 3 includes both the `join`-based and `tstats`-accelerated versions of the same search, with observed performance notes
