# Splunk — Intermediate

## Saved Searches and Alerts

A search that's useful once is usually useful repeatedly — Splunk lets you save any search and either re-run it on demand or schedule it to run automatically, with an **alert** triggering when the results meet a defined condition. This is the mechanism underneath most operational and security monitoring built on Splunk — a correlation search isn't manually re-run during an incident, it's already running on a schedule, watching.

```spl
` A saved search, scheduled to run every 5 minutes, alerting if the
  error count for any host exceeds a threshold in that window `
index=web_logs status>=500 earliest=-5m
| stats count by host
| where count > 50
```

Alert actions determine what happens when the condition is met — send an email, post to a webhook (Slack, PagerDuty), run a script, or (in Splunk Enterprise Security specifically) create a **Notable Event** for a SOC analyst to triage. The scheduling itself has real operational cost — a search scheduled too frequently against a large index consumes search-head resources continuously, which is a common, easy-to-overlook cause of general search performance degradation across a shared Splunk instance as the number of scheduled searches grows over time.

## Lookups — Enriching Events with External Data

A lookup joins external reference data (a CSV file, a database table, a KV store collection) against search results by a matching field — the classic use case is turning a raw code or ID in your logs into something human-readable, without needing that mapping baked into the log line itself.

```spl
` A CSV lookup file (status_codes.csv) maps status codes to descriptions:
  status,description
  200,OK
  404,Not Found
  500,Internal Server Error `

index=web_logs
| lookup status_codes.csv status OUTPUT description
| stats count by status, description
```

```bash
# Register a lookup file via the CLI (or Settings > Lookups in the UI)
/opt/splunk/bin/splunk add lookup-table-file status_codes.csv
```

A **KV Store lookup** is the same concept backed by Splunk's built-in MongoDB-based key-value store instead of a static CSV — useful when the reference data changes frequently and needs to be updated programmatically (via the REST API) rather than by re-uploading a file.

## Field Extractions Beyond `rex`

`rex` extracts fields at search time, recomputed on every search that uses it — fine for occasional use, but expensive if the same extraction runs across every search against a high-volume index. For extractions that should apply automatically to every event of a given source type, Splunk supports configuring them once via `props.conf`/`transforms.conf`, so the field exists without needing `rex` in every query that wants it.

```ini
# props.conf — apply to every event of this sourcetype automatically
[my_app_logs]
EXTRACT-order_id = OrderID=(?<order_id>\d+)
```

The practical guidance: `rex` is right for ad hoc, exploratory extraction during an investigation; a `props.conf` extraction is right once you know a field is used often enough across many searches that recomputing it every time is wasteful — this is a genuine performance decision, not just a stylistic one.

## Data Models and Pivot

A **data model** defines a structured, hierarchical view over raw data — mapping specific fields and constraints once, so that both technical SPL users and non-technical users (via the drag-and-drop **Pivot** interface) can build reports against consistent, pre-defined fields rather than everyone independently reinventing the same `eval`/`rex` extractions.

```spl
` Querying a data model directly with the datamodel or tstats command
  (tstats, covered in Advanced, requires an *accelerated* data model
  specifically — this is the non-accelerated form) `
| datamodel Web All_Traffic search
| stats count by status
```

Pivot is aimed at users who need to build a dashboard or report without writing SPL directly — the data model is the contract that makes that possible, since Pivot itself doesn't understand raw, unstructured events, only the structured fields a data model exposes.

## Macros — Reusable SPL Fragments

A **macro** is a named, reusable piece of SPL — useful for a filter or transformation repeated across many searches, where hardcoding it everywhere means a future change (a new host to exclude, an updated threshold) has to be found and edited in every search individually.

```spl
` Define a macro (via Settings > Advanced Search > Search Macros):
  name: exclude_test_hosts
  definition: NOT host IN ("test-*", "staging-*")
`

` Used in a search with backtick syntax `
index=web_logs `exclude_test_hosts`
| stats count by host
```

Macros can also accept arguments, making them closer to a real function — `` `my_macro(arg1, arg2)` `` — which is the right tool once a piece of reusable logic needs to vary slightly between call sites rather than being identical every time.

## Subsearches

A subsearch runs a nested search first, and its results (typically a list of values) feed into the outer search as a filter — conceptually similar to a SQL subquery, with an important operational caveat: subsearches have a default result limit and time budget, and a subsearch that returns too many results or runs too long gets silently truncated rather than erroring loudly.

```spl
` Find all web requests from hosts that had a failed login in the
  last hour — the subsearch (in square brackets) runs first and
  produces a list of hosts, which becomes a filter on the outer search `
index=web_logs
[ search index=auth_logs action=failure earliest=-1h
  | stats count by host
  | fields host ]
```

For anything beyond a small, bounded result set, `stats`-based joins (computing both sides separately and combining on a shared field) are generally more reliable and performant than a subsearch — subsearches are convenient for quick, small-scale correlation, but their default limits are a real, specific thing to be aware of before relying on one for a search expected to return a large result set.
