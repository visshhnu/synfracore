# Cloud Data Warehouses — Quick Reference

## Vendor landscape

| Warehouse | Provider | Architecture | Standout feature |
|---|---|---|---|
| BigQuery | Google Cloud | Serverless | No cluster management, pay per query/storage |
| Redshift | AWS | Cluster-based or Serverless | Deep AWS ecosystem integration |
| Synapse | Azure | Cluster + serverless SQL pools | Warehousing + big data in one service |
| Snowflake | Multi-cloud | Storage/compute fully separated | True multi-cloud portability, instant compute scaling |

## Core concepts

```
Columnar storage        — reads only needed columns, not full rows
Storage-compute split    — scale query power independently of stored data volume
Partitioning             — split table by (usually) date; prune irrelevant partitions
Clustering / sort keys   — finer ordering within a partition for a 2nd filter column
Materialized views       — pre-computed, incrementally-refreshed aggregations
```

## Partitioning + clustering pattern (BigQuery)

```sql
CREATE TABLE orders (
  order_id INT64, order_date DATE, customer_id INT64, revenue FLOAT64
)
PARTITION BY order_date
CLUSTER BY customer_id;
```

## Cost model

```
On-demand / serverless (BigQuery, Snowflake, Redshift Serverless):
  billed per bytes scanned / compute-seconds — cheap at low/spiky usage

Provisioned (Redshift clusters, Synapse dedicated pools):
  billed for reserved capacity, running whether queried or not —
  cheaper at high, constant utilization
```

## Semi-structured data querying

```sql
-- Snowflake
SELECT raw_data:customer:name::STRING FROM raw_orders;

-- BigQuery
SELECT JSON_VALUE(raw_data, '$.customer.name') FROM raw_orders;
```

## Zero-copy clone (Snowflake)

```sql
CREATE DATABASE prod_clone CLONE production_db;
-- Instant, no physical data duplication until changes diverge
```

## Data sharing (Snowflake)

```sql
CREATE SHARE sales_data_share;
GRANT SELECT ON TABLE sales_db.public.orders TO SHARE sales_data_share;
ALTER SHARE sales_data_share ADD ACCOUNTS = partner_account_id;
```

## Column masking (Snowflake)

```sql
CREATE MASKING POLICY ssn_mask AS (val STRING) RETURNS STRING ->
  CASE WHEN CURRENT_ROLE() = 'COMPLIANCE_ADMIN' THEN val ELSE 'XXX-XX-' || RIGHT(val, 4) END;
ALTER TABLE customers MODIFY COLUMN ssn SET MASKING POLICY ssn_mask;
```

## Query cost checklist

```
[ ] Checked dry-run / execution plan bytes estimate BEFORE running
[ ] Only selecting needed columns (never SELECT * on a wide table)
[ ] Filter actually hits the partition column (check the plan, don't assume)
[ ] Filter applied directly, not defeated by an intervening view/subquery
[ ] Frequently-queried nested JSON fields flattened into typed columns
[ ] Mandatory partition filters enforced on large tables org-wide
```

## When NOT to use a data warehouse

```
Frequent single-row lookups/updates (live application data) → use OLTP
  (Postgres/MySQL), not a warehouse — warehouse query latency is
  seconds, not milliseconds, and per-query billing doesn't fit
  live request-serving patterns.
```
