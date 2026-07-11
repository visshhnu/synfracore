# Cloud Data Warehouses — Notes

## Core mental model

- Columnar storage reads only the columns a query needs — the single biggest reason warehouses are fast for aggregate queries across wide tables, versus row-based OLTP storage.
- Cost is driven by bytes scanned (on pay-per-query pricing), not query complexity — a simple `SELECT *` on an unpartitioned huge table can cost more than a complex, well-filtered join. This is a real mental-model shift from OLTP habits.
- The warehouse is almost always the ELT pipeline's *destination* — raw data lands first, transformation (dbt) runs against already-loaded data using the warehouse's own compute, rather than a separate pre-load transform step (the older ETL pattern).

## Partitioning and clustering

- Partitioning (usually by date) is the single biggest lever for both cost and speed — design it at table-creation time, not retrofitted later.
- Clustering handles finer-grained ordering within a partition for a second, high-cardinality filter column — partition on the column most queries filter broadly on, cluster on the next most common filter.
- A query that "looks" correctly filtered but applies the filter after a join/subquery/view can silently defeat partition pruning — always verify via the actual execution plan, not by reading the SQL and assuming.

## Storage-compute separation

- Lets independent compute pools query the same underlying data simultaneously without contention — a heavy ad-hoc analytical query doesn't have to compete with routine BI dashboard queries the way it would on a traditional fixed cluster.
- `AUTO_SUSPEND` trades cost against cold-start latency — a suspended compute pool's first query after a gap is genuinely slower; adjust the threshold based on whether a given workload is latency-sensitive or cost-sensitive.

## Semi-structured data

- Querying JSON/VARIANT directly is flexible for evolving/varying source schemas but slower than a flattened typed column at query time.
- The sound pattern: land raw semi-structured data as-is, flatten frequently-queried fields into typed columns during transformation (dbt staging) — flexibility at ingestion, performance where it's actually needed.
- Semi-structured ingestion is resilient to additive schema changes (new fields) but not breaking ones (renamed/removed fields existing logic depends on) — build explicit schema-drift detection rather than discovering breakage via a wrong dashboard number.

## Advanced operational patterns

- Zero-copy cloning creates an instant, full logical copy without physically duplicating data until changes diverge — valuable for testing risky migrations against realistic production-scale data cheaply.
- Native data sharing (Snowflake Shares, BigQuery dataset sharing) replaces the traditional export/file-transfer pattern — data stays live, and access is revocable instantly via a grant, unlike tracking down every copy of a previously-exported file.
- Row/column-level security (dynamic masking) enforces access at the data layer itself, auditable regardless of which tool queries the warehouse — closes the real gap where every downstream BI tool would otherwise need to correctly implement its own access filtering.

## Cost governance and fit

- At organizational scale, cost governance needs deliberate structural controls (query cost quotas, mandatory partition filters, routine review of the actual most expensive queries) — not an assumption that individual analysts will naturally write efficient SQL unaided.
- A data warehouse is a poor fit for frequent single-row application lookups/updates — that's an OLTP database's job; using a warehouse as a live application's primary transactional store is a common, real architectural mismatch.
