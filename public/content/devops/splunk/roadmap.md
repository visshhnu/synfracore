# Splunk Learning Roadmap

**Goal**: From zero Splunk experience to production-capable SPL and administration skills

## Learning Phases

### Phase 1: Splunk Fundamentals (2-3 days)

- Architecture — forwarders, indexers, search heads
- SPL as a pipeline — `search | eval | rex | stats | sort`, the Unix-pipeline mental model
- Basic searches, field extraction, and time-range filtering
- Splunk vs. ELK vs. Datadog — where each fits

### Phase 2: Intermediate SPL and Data Management (3-4 days)

- Saved searches and alerts
- Lookups — CSV-based and KV Store
- Field extractions — `props.conf`/`transforms.conf` vs. ad hoc `rex`
- Data models and Pivot
- Macros and subsearches

### Phase 3: Advanced Architecture and Enterprise Security (1-2 weeks)

- Indexer clustering — replication factor (RF) and search factor (SF)
- `tstats` vs. `stats` — when and why to use the accelerated path
- Summary indexing and data model acceleration
- Splunk Enterprise Security — correlation searches, Notable Events, CIM, Risk-Based Alerting
- License enforcement mechanics

### Phase 4: Operations and Troubleshooting (1 week)

- Diagnosing silent indexing gaps and skipped/restricted searches
- Search-performance troubleshooting (`tstats` fixes)
- Forwarder file-permission and path-pattern failures
- Correlation-search scheduling-gap detection

### Phase 5: Certification Track (ongoing)

- See `certification.md` for the current Splunk certification path (Core Certified User → Power User → Advanced Power User → Admin tracks) — treat exam-specific details as `(needs verification — recheck against current source)`

## Job Roles This Enables

- Splunk Administrator / Engineer
- SOC Analyst / Security Engineer (SIEM-focused)
- Observability/Monitoring Engineer
- Data Analyst working with machine data

## Target Certifications

See `certification.md` in this guide for the current track.

## How to Use This Roadmap

1. Work through phases in order — Phase 3's Enterprise Security concepts assume the data-modeling and search-optimization fundamentals from Phase 2 and Phase 1's SPL pipeline mental model are already solid
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and the Installation section's single-instance setup are the hands-on material; a real local install is worth doing before relying on reading alone
3. Practice SPL as a pipeline, one stage at a time — Fundamentals' own "Try it yourself" exercise (naming each pipeline station before writing real SPL) is a technique worth reapplying at every phase, not just the first
4. Use the Troubleshooting section's real scenarios as active study material — working through "why is this search silently returning nothing" builds the same diagnostic instinct tested in interviews and real SOC/admin work
5. If your interest is security/SIEM specifically, don't skip ahead past Phase 2's data modeling — Enterprise Security's correlation searches and CIM in Phase 3 depend directly on data models being understood first

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 4-6 weeks (part-time)
SPL is a genuinely separate language from SQL or PromQL — budget real
time for it rather than assuming prior query-language experience
transfers directly, the way it does between Prometheus and Datadog
The forwarder -> indexer -> search head architecture is worth being able
to draw from memory before moving into Advanced's clustering material
```
