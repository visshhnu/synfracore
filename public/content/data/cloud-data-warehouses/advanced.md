# Cloud Data Warehouses — Advanced

## Workload management: isolating compute so one heavy query doesn't degrade everything

Storage-compute separation (covered on Intermediate) enables a specific advanced pattern worth deliberately designing for: dedicating separate compute pools to different workload types, so a data science team's ad-hoc heavy analytical query never competes for the same resources as a production BI dashboard's routine queries:

```sql
-- Snowflake — separate virtual warehouses (compute clusters) per workload
CREATE WAREHOUSE bi_dashboard_wh WITH WAREHOUSE_SIZE = 'SMALL' AUTO_SUSPEND = 60;
CREATE WAREHOUSE data_science_wh WITH WAREHOUSE_SIZE = 'LARGE' AUTO_SUSPEND = 300;
-- BI queries always run against bi_dashboard_wh, exploratory
-- data-science queries always run against data_science_wh —
-- they share the same underlying data, but never contend for the same compute
```
Without this deliberate separation, a single shared compute cluster serving both a routine dashboard-refresh workload and an occasional genuinely heavy ad-hoc query means the heavy query can degrade dashboard response time for everyone else during the time it runs — a real, common production issue in warehouses without workload isolation. `AUTO_SUSPEND` (spinning compute down when idle) matters specifically for cost — a data science warehouse used occasionally for heavy queries shouldn't run (and bill) continuously between uses, while a BI warehouse serving frequent dashboard traffic might reasonably have a longer suspend threshold to avoid cold-start latency on every first query after a gap.

## Zero-copy cloning: instant, storage-efficient environment copies

```sql
-- Snowflake — clone an entire database instantly, without duplicating storage
CREATE DATABASE prod_clone CLONE production_db;
```
A zero-copy clone creates a new, fully independent logical copy of a database/table/schema without physically duplicating the underlying data — the clone shares the same physical storage blocks as the source initially, and only diverges (consuming additional storage) as changes are actually made to either the original or the clone afterward. This is genuinely valuable for testing a risky schema migration or transformation change against a full, realistic copy of production data without either the storage cost or the time cost of a full physical data copy — a multi-terabyte production database can be cloned in seconds, not hours, specifically because no actual data movement happens at clone time.

## Data sharing across organizational boundaries, without ETL

```sql
-- Snowflake — sharing a dataset directly with another Snowflake account,
-- no data copy, no separate export/import pipeline
CREATE SHARE sales_data_share;
GRANT USAGE ON DATABASE sales_db TO SHARE sales_data_share;
GRANT SELECT ON TABLE sales_db.public.orders TO SHARE sales_data_share;
ALTER SHARE sales_data_share ADD ACCOUNTS = partner_account_id;
```
Modern warehouses increasingly support direct, live data sharing between separate accounts/organizations — a partner or customer queries your live data directly (subject to the exact grants given) without a separate export, file transfer, or ETL pipeline moving a copy of the data anywhere. This is a meaningfully different architecture from the traditional pattern of exporting a CSV/Parquet extract and delivering it via a file transfer or a separate pipeline — the shared data stays live and current automatically (no separate refresh/sync process to maintain), and access can be revoked instantly by revoking the grant, rather than needing to track down and invalidate every copy of a previously-exported file.

## Row-level and column-level security for regulated/sensitive data

```sql
-- Snowflake — dynamic data masking, applied at query time based on the querying role
CREATE MASKING POLICY ssn_mask AS (val STRING) RETURNS STRING ->
  CASE
    WHEN CURRENT_ROLE() IN ('COMPLIANCE_ADMIN') THEN val
    ELSE 'XXX-XX-' || RIGHT(val, 4)
  END;

ALTER TABLE customers MODIFY COLUMN ssn SET MASKING POLICY ssn_mask;
```
Column-level masking and row-level security policies enforce data access rules directly in the warehouse, based on the querying user's role — the same underlying table serves fully unmasked data to an authorized compliance role and masked data to everyone else, with zero application-layer logic required to enforce that distinction. This matters specifically for regulated data (PII, financial records, healthcare data under HIPAA) where access needs to be genuinely enforced at the data layer itself, auditable and consistent regardless of which tool or application is querying the warehouse — relying on every downstream BI tool or application to correctly implement its own access filtering is a real, common gap that data-layer masking closes by making the enforcement impossible to bypass from any querying surface.

## Cost governance at organizational scale

At real organizational scale, uncontrolled query cost (particularly on pay-per-bytes-scanned pricing) is a genuine, recurring risk — a single poorly-written query or an unbounded scheduled job can produce a surprisingly large bill before anyone notices. Mature cost governance combines several layers: **query cost quotas/limits** per user or team (BigQuery's custom cost controls, for instance, can hard-cap bytes billed per query or per day), **mandatory partition filters** on large tables (forcing every query against a large table to include a partition-column filter, preventing an accidental full-table scan entirely at the platform level rather than relying on every analyst remembering to filter correctly), and **routine cost/usage review** (identifying the actual most expensive recurring queries and specifically optimizing those, rather than uniformly auditing everything). The general principle: cost governance in a pay-per-query warehouse needs to be a deliberate, designed control layer, not an assumption that individual query authors will naturally write efficient SQL without any structural guardrail in place.
