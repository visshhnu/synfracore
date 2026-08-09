# Splunk — Cheatsheet

```spl
# ── SEARCH BASICS ──────────────────────────────────────────
index=web_logs sourcetype=access_combined status>=500
index=web_logs earliest=-24h latest=now
index=web_logs (status=404 OR status=500) host="web-01"

# ── STATS — AGGREGATION ────────────────────────────────────
| stats count by host
| stats count, avg(response_time) as avg_rt, max(response_time) as max_rt by host
| stats dc(user) as unique_users by host          # distinct count

# ── EVAL — COMPUTED FIELDS ─────────────────────────────────
| eval status_category=if(status>=500, "error", "ok")
| eval response_time_ms=response_time*1000
| eval status_category=case(status>=500,"Server Error", status>=400,"Client Error", 1==1,"Other")

# ── REX — REGEX FIELD EXTRACTION ───────────────────────────
| rex field=_raw "OrderID=(?<order_id>\d+)"
| rex field=card_number mode=sed "s/\d{12}(\d{4})/XXXXXXXXXXXX\1/g"   # sed-mode masking

# ── TIMECHART — TIME SERIES ────────────────────────────────
| timechart span=5m count
| timechart span=5m count by host

# ── LOOKUPS ─────────────────────────────────────────────────
| lookup status_codes.csv status OUTPUT description

# ── SUBSEARCH ───────────────────────────────────────────────
index=web_logs [ search index=auth_logs action=failure earliest=-1h | stats count by host | fields host ]

# ── TRANSACTION — GROUP RELATED EVENTS ─────────────────────
index=auth "203.0.113.45" | transaction user maxspan=30m | table user, duration, eventcount

# ── PERFORMANCE — tstats (indexed fields only, skips raw events) ──
| tstats count where index=web_logs status>=500 by host

# ── SUMMARY INDEXING ────────────────────────────────────────
index=web_logs | stats count by host, status | collect index=summary_web_stats
```

```bash
# ── FORWARDER (Universal Forwarder) ────────────────────────
/opt/splunkforwarder/bin/splunk add monitor /var/log/myapp/app.log
/opt/splunkforwarder/bin/splunk add forward-server indexer.company.com:9997
/opt/splunkforwarder/bin/splunk start --accept-license

# ── INDEXER / CLUSTER ───────────────────────────────────────
/opt/splunk/bin/splunk show cluster-status

# ── INTERNAL DIAGNOSTICS ────────────────────────────────────
# License usage by index/sourcetype (find what's driving volume)
index=_internal source=*license_usage.log* type=Usage | stats sum(b) as bytes by idx, st

# Skipped-search history (scheduler didn't run a search on schedule)
index=_internal source=*scheduler.log* status=skipped | stats count by savedsearch_name
```

```ini
# ── props.conf — persistent field extraction (vs. rex at search time) ──
[my_app_logs]
EXTRACT-order_id = OrderID=(?<order_id>\d+)
```

| Concept | Quick reference |
|---|---|
| Architecture | Forwarder (collects) → Indexer (parses, stores) → Search Head (runs SPL) |
| Replication factor (RF) | Total copies of each data bucket — durability |
| Search factor (SF) | How many copies are immediately searchable — availability, always ≤ RF |
| `stats` vs `tstats` | `stats` scans raw events (slow, any field); `tstats` reads tsidx directly (fast, indexed fields only) |
| Splunk Enterprise | Self-hosted — full control, ingest or workload-based licensing |
| Splunk Cloud Platform | Splunk-managed SaaS — subscription-based |
| Splunk Free | Capacity-limited free tier — evaluation only, not production |
| CIM | Common Information Model — standardized field names so ES correlation searches work across sources |
| Notable Event | A triaged, assignable SIEM record created by a firing correlation search in Enterprise Security |
| Risk-Based Alerting (RBA) | Accumulates risk scores per entity across many low-confidence signals, instead of one-search-one-alert |
