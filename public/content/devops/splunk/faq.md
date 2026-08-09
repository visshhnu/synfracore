# Splunk — FAQ

## Do I need to know SQL to learn SPL?

No — SPL is a genuinely separate query language, not SQL-derived, despite both being used for querying structured-ish data. This guide's Prerequisites section is explicit about this: SPL's pipeline structure (search, then pipe through transformations) is closer to a Unix shell pipeline (`grep | sort | uniq -c`) than to SQL's declarative `SELECT`-based structure. Prior SQL knowledge doesn't transfer syntax directly, though general query-thinking experience still helps.

## Why does my SPL search run without error but return zero or wrong-looking results?

This is one of the more common early-stage frustrations, and it's rarely a syntax error — SPL will happily run a syntactically valid search that's logically wrong (a field name that doesn't exist for this sourcetype, an unintended time-range default, a filter condition that matches nothing). Build the pipeline incrementally, verifying output stage by stage (per this guide's own Fundamentals teaching pattern), rather than writing the full pipeline at once and debugging it as a whole when it doesn't produce the expected result.

## What's the actual difference between a forwarder and an indexer, in practical terms?

A forwarder is a lightweight process running on or near the data source, whose entire job is collecting and shipping data — it doesn't parse, index, or make data searchable itself. An indexer receives that shipped data, parses it, extracts fields, and stores it in Splunk's own searchable format. In a small evaluation setup, both roles can run on the same single instance; in a production deployment, they're typically separate, with forwarders distributed across many source hosts and indexers consolidated (and clustered) separately.

## Should I use `rex` or `transforms.conf` for field extraction?

It depends on how frequently the field will be queried. `rex` is fast to set up and fine for exploratory, one-off extraction. For a field queried constantly across many searches, `transforms.conf`-based extraction pays its setup cost once and performs meaningfully better at scale than repeatedly extracting the same field via `rex` on every search execution — this becomes a real performance decision, not just a stylistic one, once query frequency and data volume are both high.

## Why would I use `tstats` instead of `stats` if they can compute the same aggregation?

`tstats` queries a data model's pre-computed, accelerated summary rather than scanning raw events — dramatically faster at scale, but only usable once a data model exists and is accelerated for the relevant data. `stats` works against raw events directly with no such prerequisite, making it the right default until query performance against a specific dataset genuinely justifies the data model maintenance overhead that `tstats` requires.

## What does CIM actually do, in plain terms?

It's a shared field-naming schema that normalizes different data sources (a firewall's proprietary log format, Windows Event Logs, a cloud audit trail) so they can be queried and correlated using the same field names, rather than each source needing separate, source-specific query logic. Without CIM, a correlation search spanning multiple sources would need to handle each source's own field naming individually — CIM is what makes cross-source correlation searches scale to many integrated sources without that per-source overhead.

## Is the Splunk Enterprise Security Certified Admin (SPLK-3001) certification worth pursuing?

Based on current information, no — this is confirmed as a legacy certification that Splunk no longer actively maintains, not just a guideline flagged as possibly outdated. Anyone planning a Splunk security-focused certification path should verify the current actively-maintained options directly against Splunk's own certification documentation before committing study time to a specific exam.

## What's the real difference between Splunk Free, Splunk Enterprise, and Splunk Cloud Platform?

Splunk Free is a genuinely limited, non-production tier for small-scale evaluation. Splunk Enterprise is the full self-hosted product — you run and manage the indexers/search heads yourself. Splunk Cloud Platform is the same core capability delivered as Splunk-managed SaaS — no infrastructure to run yourself, at the tradeoff of less direct infrastructure control. Licensing specifics for each `(needs verification — recheck against current source, since licensing terms and tier boundaries are genuinely volatile over time)`.
