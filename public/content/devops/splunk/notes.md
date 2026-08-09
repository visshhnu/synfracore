# Splunk — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Fundamentals, Intermediate, Advanced, Troubleshooting, and Certification material.

---

## Core Architecture

```
FORWARDERS  — run on/near the data source, collect and ship data,
              lightweight (Universal Forwarder is a distinct, smaller
              package from full Splunk Enterprise)
INDEXERS    — receive data, parse it, extract fields, store in
              time-based buckets. Cluster for scale + replication (RF/SF)
SEARCH HEADS — where SPL actually runs; distributes search across
              relevant indexers, collects results

Deployment forms: Splunk Enterprise (self-hosted) | Splunk Cloud
  Platform (managed SaaS) | Splunk Free (small-scale, non-production)
```

## SPL as a Pipeline (the core mental model)

```
search (intake — filter raw events)
  | eval    (compute a new field per event)
  | rex     (extract a field from unstructured text via regex)
  | stats   (aggregate into summary rows)
  | sort    (arrange output)
  | head N  (limit)

Each stage only sees what the previous stage handed it — same mental
model as a Unix pipeline (grep | sort | uniq -c), applied to log data.
```

## Field Extraction — Two Approaches, Real Tradeoff

```
rex (search-time, ad hoc)         — flexible, but extraction cost paid
                                     EVERY search that uses it
transforms.conf (index/search-time,
  durable)                         — extraction cost paid ONCE,
                                     better performance for fields
                                     queried constantly
```

## `tstats` vs `stats` — the Performance Distinction

```
stats  — runs against raw events directly
tstats — runs against a data model's ACCELERATED SUMMARY, not raw
         events — dramatically faster at scale, requires a data model
         to already exist and be accelerated. Tradeoff: data model
         maintenance overhead.
```

## Indexer Clustering — RF/SF

```
RF (Replication Factor)  — how many COPIES of each bucket exist
                            across indexers (data durability)
SF (Search Factor)        — how many of those copies are SEARCHABLE
                            immediately (search availability)
SF <= RF always. Multi-site clustering extends this across
  geographically separate sites for DR.
```

## Lookups and Data Models

```
Lookup — enriches raw events with EXTERNAL reference data Splunk
  never ingested as events (a CSV, a KV Store) — e.g., badge_id -> 
  employee_name via inputlookup/lookup command
Data Model — structural layer over a dataset, enables Pivot (no-SPL
  reporting) AND is the prerequisite for tstats acceleration
```

## Enterprise Security Concepts

```
CIM (Common Information Model) — normalizes disparate data sources
  into a consistent schema so correlation searches work across them
Correlation Search — a scheduled search across (often) multiple
  sources, looking for a specific pattern
Notable Event — a correlation search's output, meant for analyst
  triage workflow, not just a raw search result
Risk-Based Alerting (RBA) — accumulates risk score across multiple
  lower-confidence signals rather than alerting on any single one
```

## Certification Track (verified — see certification.md for full detail)

```
Core Certified User -> Power User -> Advanced Power User ->
  Enterprise Certified Admin (SPLK-1003) / Cloud Certified Admin ->
  Core Certified Consultant
SEPARATE: Enterprise Security Certified Admin (SPLK-3001) — CONFIRMED
  legacy cert, no longer actively maintained (real finding, not tagged
  volatile — verified via search)
```

## Licensing (tagged volatile — verify before citing specifics)

```
Ingest-based (GB/day) or workload-based licensing model
(needs verification — recheck against current source for exact
current terms/caps)
```
