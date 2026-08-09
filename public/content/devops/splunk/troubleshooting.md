# Splunk — Troubleshooting

## Data stops appearing in search results, with no obvious error

**Symptom:** a source that was reliably indexing data suddenly shows a gap — new events aren't searchable, but nothing in the UI presents an obvious failure.

**Root cause:** the most common cause is a break somewhere in the forwarder-to-indexer pipeline — the forwarder itself stopped running, lost network connectivity to its indexer, or (less obviously) the indexer's ingestion queue backed up because of a downstream bottleneck (disk I/O contention, a full or nearly-full indexer volume) and started silently dropping or delaying data rather than erroring loudly.

**Fix:** check the pipeline in order, starting closest to the data source:

```bash
# On the forwarder host — confirm the process is actually running and check its own logs
ps aux | grep splunkd
tail -f /opt/splunkforwarder/var/log/splunk/splunkd.log

# On the indexer — check queue status; a consistently full queue means
# data is backing up somewhere downstream of ingestion
| rest /services/server/introspection/queues

# Confirm disk space isn't the underlying cause
df -h /opt/splunk/var/lib/splunk
```

A forwarder that shows as running but hasn't sent data recently is often a connectivity problem specifically — confirm the indexer's receiving port (commonly 9997) is actually reachable from the forwarder host, not just that both processes are up.

## Search returns fewer results than expected, or seems to "skip" data

**Symptom:** a search that should clearly match more events returns a suspiciously low count, without an explicit error.

**Root cause:** two common, distinct causes. First, a **skipped search** — a scheduled search that Splunk deliberately didn't run at its scheduled time because a previous run of the same search was still in progress, or because the search head was under enough load that Splunk's scheduler deprioritized it — silently produces no new results for that interval rather than an error. Second, license-related **search restriction**: if the deployment has exceeded its license limit enough times within the enforcement window, ad hoc searches can be blocked or restricted even while indexing continues normally, which looks like "my search returns nothing" rather than an obvious licensing error.

**Fix:** check the Job Inspector or the scheduler's own history for the specific search to see whether it actually ran, versus being silently skipped:

```spl
` Check the internal scheduler log for skipped search history `
index=_internal source=*scheduler.log* status=skipped
| stats count by savedsearch_name
```

Separately, check license status directly rather than assuming the search itself is the problem:

```spl
index=_internal source=*license_usage.log* type=Usage
| stats sum(b) as total_bytes by pool
```

If searches are being skipped specifically due to concurrency limits (too many scheduled searches competing for the same search head resources), the fix is usually staggering schedules rather than assuming the search itself needs to be rewritten — the search logic can be perfectly correct and still get skipped purely due to scheduling contention.

## A specific search is dramatically slower than it used to be

**Symptom:** a search or dashboard panel that used to return in seconds now takes minutes, without any obvious change to the search itself.

**Root cause:** most commonly, the underlying data volume for the searched index/time range grew substantially since the search was first written, and a search that scans raw events (rather than using `tstats` against indexed fields) scales close to linearly with that volume — a search that was fast against a smaller dataset months ago can become genuinely slow purely from data growth, with no change to the query needed to explain the regression.

**Fix:** check whether the search is doing more raw-event scanning than necessary before assuming infrastructure capacity is the issue — the Job Inspector's search job properties show exactly how many events were scanned versus how many were actually returned, which is the direct signal for this:

```spl
` If this is scanning far more raw events than it needs to, tightening
  the search (narrower time range, more selective index/sourcetype
  filters before any commands) is the first lever, before considering
  tstats or acceleration `
index=web_logs earliest=-30d status>=500
| stats count by host
```

If the search is genuinely well-scoped and still slow purely due to data volume, this is exactly the case Advanced's `tstats`/data-model-acceleration content addresses — converting a raw-event `stats` search into a `tstats` search (or an accelerated data model query) is often the single highest-leverage fix available, frequently an order of magnitude improvement for the same logical result.

## License violation warnings appear, but ingest volume doesn't look unusually high

**Symptom:** license violation warnings show up even though daily data volume looks roughly normal compared to previous days.

**Root cause:** license usage is measured on indexed volume specifically — a source that changed format (verbose debug logging accidentally left enabled, a new log field added that significantly increases per-event size) can push daily indexed GB up meaningfully without an obvious change in event *count*, which is what makes this confusing when checking only "did event volume spike."

**Fix:** check license usage broken down by index and source, not just the aggregate daily total, to find which specific source is actually driving the increase:

```spl
index=_internal source=*license_usage.log* type=Usage
| stats sum(b) as bytes by idx, st
| sort -bytes
```

Once the specific over-volume source is identified, the fix is usually either reducing that source's verbosity at the point of origin (disabling accidentally-enabled debug logging is a common real cause) or, if the increased volume is genuinely needed, adjusting the license allocation — not treating the violation as something to just acknowledge and ignore, since repeated violations within Splunk's enforcement window are what trigger search restriction.

## Forwarder shows connected, but a specific monitored file isn't being read

**Symptom:** the Universal Forwarder is confirmed running and connected to its indexer, but one specific log file it's supposed to be monitoring never shows up in search results, while other monitored files on the same host work fine.

**Root cause:** commonly a file-permission problem (the Splunk forwarder process's user doesn't have read access to the specific file, often because it was created with different ownership than other logs on the host), or the monitor stanza's path pattern in `inputs.conf` doesn't actually match the file's real location/naming pattern precisely.

**Fix:** verify both independently — permission and the actual configured path — since either one alone being wrong produces the identical symptom:

```bash
# Confirm the forwarder's running user can actually read the file
sudo -u splunkfwd cat /var/log/myapp/app.log | head -1

# Check the actual configured monitor stanza
cat /opt/splunkforwarder/etc/apps/*/local/inputs.conf
```

```ini
# inputs.conf — confirm the path pattern actually matches the real file,
# including any rotation suffix pattern if the app rotates logs
[monitor:///var/log/myapp/*.log]
disabled = false
```

A log rotation scheme that renames files in a way the monitor stanza's glob pattern doesn't anticipate (a numeric suffix that changes format, for instance) is a specific, easy-to-miss variant — the forwarder was reading the file fine until a rotation silently moved data outside what the configured pattern actually matches.

## A correlation search / alert that should have fired never did

**Symptom:** a scheduled correlation search or alert's condition was clearly met (confirmed by manually running the same search), but no Notable Event or notification was generated.

**Root cause:** beyond the general "search was skipped" cause covered above, this specific symptom for a *scheduled* search commonly traces to the search's own scheduling window not actually covering the event — a search scheduled to run every 15 minutes checking `earliest=-15m` has an implicit assumption that the previous run completed on time; if a prior run was delayed or skipped, there's a real gap in coverage between what the last successful run checked and what the current one checks, and an event landing exactly in that gap is never evaluated by any run.

**Fix:** check the scheduler history for the specific search around the time in question to confirm whether every expected run actually executed, and whether their time windows had any gap between them:

```spl
index=_internal source=*scheduler.log* savedsearch_name="my_correlation_search"
| table _time, status, run_time
| sort _time
```

If gaps are confirmed, widening the search's time window slightly beyond its exact scheduled interval (checking `earliest=-20m` on a 15-minute schedule, for a small overlap) is a common, deliberate mitigation — trading a small amount of duplicate evaluation for eliminating the coverage-gap risk from an occasionally-delayed run.

---

## Official Resources

- [Splunk Troubleshooting Manual](https://docs.splunk.com/Documentation/Splunk/latest/Troubleshooting/)
- [Splunk Licensing Documentation](https://docs.splunk.com/Documentation/Splunk/latest/Admin/AboutSplunklicensing)
- [Splunk Forwarder Troubleshooting](https://docs.splunk.com/Documentation/Forwarder/latest/Forwarder/Troubleshoottheuniversalforwarder)

---
