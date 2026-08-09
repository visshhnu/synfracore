# Splunk — Fundamentals

## Why this exists (the hook)

The first time most people see a real SPL search, it looks like a wall of pipe characters and unfamiliar commands — `index=web sourcetype=access status>=500 | stats count by host | sort -count`. It looks intimidating exactly because it's dense, but the underlying idea is one most people already know from a completely different context: a Unix shell pipeline, where the output of one command becomes the input to the next. Once that click happens — "this is just `grep | sort | uniq -c`, for log data instead of files" — SPL stops looking like a new language to memorize and starts looking like a familiar pattern applied to a new kind of data.

## Analogy

Think of an SPL search as an assembly line, not a single instruction. The `search` at the start is the intake station — it pulls in only the raw materials (events) that match a basic filter, the way a factory intake only accepts parts matching a spec. Each `|` (pipe) afterward is another station on the line, and each one does exactly one job to whatever comes down the belt from the station before it: `stats` is the counting station (tally up what came through, grouped however you specify), `eval` is the labeling station (stick a new label — a computed field — onto each item based on what's already on it), `sort` is the ordering station (arrange the output belt by whatever field you choose). Nothing upstream of a station knows or cares what happens downstream — which is exactly why SPL pipelines are readable left to right, one transformation at a time, instead of one dense, all-at-once instruction.

## How it fits together (diagram)

```
search (intake — filter raw events)
   │
   ▼
| eval    (labeling station — compute a new field per event)
   │
   ▼
| rex     (extraction station — pull a field out of unstructured text)
   │
   ▼
| stats   (counting station — aggregate events into summary rows)
   │
   ▼
| sort    (ordering station — arrange the final output)

Each stage only sees what the previous stage handed it — this is why a
long SPL pipeline reads top-to-bottom as a sequence of small, individually
understandable transformations, not one large expression.
```

## Try it yourself (2 minutes)

Take this plain-English request: "Show me the 5 hosts that produced the most error-level events in the last hour, worst first." Without writing any real SPL yet, try breaking that sentence into pipeline stations the way the diagram above does: what's the intake filter (which events even qualify — "error-level," "last hour")? What's the counting station (group by what, count what)? What's the ordering station (worst first means sorted by what, in which direction)? What's the limiting station (top 5 only)? If you can name those four stations in order, you've already designed the shape of the real query below — `search errorlevel=error earliest=-1h | stats count by host | sort -count | head 5` — before ever seeing the syntax.

## What is Splunk, concretely?

|  | Splunk | ELK / Elasticsearch | Datadog Logs |
|---|---|---|---|
| Query language | SPL (Search Processing Language) | KQL / Lucene / DSL | Datadog log search syntax |
| Deployment | Self-hosted (Enterprise) or SaaS (Cloud) | Self-hosted or Elastic Cloud | SaaS only |
| Best known for | Security/SIEM depth, heterogeneous data | Full-text search, open-source flexibility | Unified metrics+logs+traces |
| Licensing | Ingest-based (GB/day) or workload-based `(needs verification — recheck against current source)` | Free core, paid tiers for advanced features | Per-GB, usage-based |

```bash
# Minimal single-instance install for evaluation (Linux)
wget -O splunk.tgz "https://download.splunk.com/products/splunk/releases/latest/linux/splunk.tgz"
tar xvzf splunk.tgz -C /opt
/opt/splunk/bin/splunk start --accept-license

# Web UI available at http://<host>:8000 after start
```

## SPL Building Blocks

Every real SPL query starts with a `search` (often implicit — typing directly into the search bar begins one) and narrows through piped commands:

```spl
` The most basic form — filter by index and a field match `
index=web_logs status=200

` Boolean logic works as you'd expect `
index=web_logs (status=404 OR status=500) host="web-01"

` Time range is usually set via the UI's time picker, but can be
  specified directly in the search itself `
index=web_logs earliest=-24h latest=now status>=500
```

## `stats` — Aggregation

```spl
` Count events, grouped by a field `
index=web_logs
| stats count by status

` Multiple aggregation functions in one stats call `
index=web_logs
| stats count, avg(response_time) as avg_rt, max(response_time) as max_rt by host

` dc() — distinct count, useful for "how many unique X" questions `
index=auth_logs
| stats dc(user) as unique_users by host
```

## `eval` — Computed Fields

```spl
` Create a new field from a conditional expression `
index=web_logs
| eval status_category=case(
    status>=500, "Server Error",
    status>=400, "Client Error",
    status>=200, "Success",
    1==1, "Other"
  )
| stats count by status_category

` Arithmetic and string operations work inline `
index=web_logs
| eval response_time_ms=response_time*1000
| eval is_slow=if(response_time_ms>1000, "slow", "fast")
```

## `rex` — Regex Field Extraction

```spl
` Extract a named field from unstructured raw text `
index=app_logs "user_id"
| rex field=_raw "user_id=(?<user_id>\d+)"
| stats count by user_id

` sed-mode rex — substitute/mask part of a field, e.g. redacting
  a partial credit card number for compliance `
index=payment_logs
| rex field=card_number mode=sed "s/\d{12}(\d{4})/XXXXXXXXXXXX\1/g"
```

## `timechart` — Time-Series Output

```spl
` Error count per 5-minute bucket — the standard shape for a
  dashboard panel showing a trend over time `
index=web_logs status>=500
| timechart span=5m count

` Split by an additional field — one line per host `
index=web_logs status>=500
| timechart span=5m count by host
```

## Interview Questions

**What is the difference between `stats` and `eval` in SPL, and why does the order they're used in a pipeline matter?**
`eval` operates per-event — it computes or transforms one field on each individual event as it passes through that stage of the pipeline, without reducing the number of events. `stats` operates across events — it collapses many events into summary rows grouped by whatever fields are specified, and after a `stats` command, the individual raw events are gone; only the aggregated result remains. Order matters because `eval` needs to run *before* `stats` if the aggregation should be grouped by a field `eval` just computed — `stats` can only group by fields that already exist on the events reaching it, so a pipeline that tries to `eval` a field after `stats` has already collapsed the data either fails to find the source fields it needs or computes something meaningless from the aggregated rows instead of the original events.

**Why does Splunk remain widely used in security operations specifically, when open-source alternatives like the ELK stack are meaningfully cheaper?**
Security teams typically can't dictate log format to the vendor appliances, network devices, and legacy systems already deployed across their environment — a firewall, a Windows domain controller, and a custom internal application will never agree on a common log schema, and requiring one before the data is searchable isn't realistic in most real enterprise environments. Splunk's core design — index heterogeneous data as-is, do field extraction and correlation at search time via SPL rather than requiring structure at write time — is specifically suited to that constraint, and its Enterprise Security product adds purpose-built SIEM capabilities (Notable Events, risk-based alerting, correlation searches) on top. ELK is a strong, often cheaper choice when an organization has more control over its log formats or is optimizing for full-text search at lower cost — the tradeoff is real, not one tool being unconditionally better than the other.
