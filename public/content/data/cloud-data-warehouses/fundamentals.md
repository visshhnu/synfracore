# Cloud Data Warehouses — Fundamentals

## Columnar storage: why it makes aggregate queries so much faster

A traditional row-based database (Postgres, MySQL) stores each row's full set of columns together on disk — great for fetching one complete record, genuinely inefficient for an aggregate query that only needs a few columns across millions of rows:

```sql
SELECT region, SUM(revenue) FROM sales GROUP BY region;
```
In a row-based store, answering this requires reading every column of every row from disk, even though the query only needs `region` and `revenue` — a large fraction of the actual disk I/O is wasted reading columns the query never uses. A columnar warehouse stores each column separately and contiguously, so this same query reads only the `region` and `revenue` columns directly, skipping every other column entirely — for a wide table with dozens of columns, this alone can be an order-of-magnitude reduction in actual data read, which is the single biggest reason data warehouses use columnar storage specifically for analytical (OLAP) workloads rather than the row-based model relational OLTP databases use.

## Understanding query cost: bytes scanned, not query complexity

```sql
-- Both queries can cost wildly different amounts, independent of complexity
SELECT customer_id FROM orders WHERE order_date = '2026-07-01';  -- cheap if partitioned
SELECT * FROM orders;                                             -- expensive — scans everything
```
For BigQuery, Snowflake, and Redshift Serverless, cost is driven primarily by **bytes scanned**, not query complexity in the way a traditional database's cost is driven by CPU/IO time — a simple `SELECT *` against an unpartitioned multi-terabyte table can cost far more than a genuinely complex join against a well-partitioned, well-filtered dataset. This is a real mental model shift worth internalizing early: writing efficient warehouse SQL means thinking about how much data a query will actually scan, not just whether the query logic is "correct" — `SELECT *` habits carried over from working with small OLTP tables become a genuine, recurring cost problem at warehouse scale.

## Partitioning: the single biggest lever for both cost and speed

```sql
-- BigQuery — a table partitioned by date
CREATE TABLE sales (
  order_id INT64,
  order_date DATE,
  revenue FLOAT64
)
PARTITION BY order_date;

-- A query filtering on the partition column only scans matching partitions
SELECT SUM(revenue) FROM sales WHERE order_date = '2026-07-01';
```
Partitioning splits a table into physically separate segments (commonly by date) — a query filtering on the partition column only reads the specific partitions matching that filter, not the entire table. For a multi-year sales table, a query for one day's data reads roughly `1/(number of days in the table)` of the total data if the table is date-partitioned correctly — versus scanning the entire multi-year history if it isn't. This is worth designing correctly from the first table creation, not retrofitted later, since a table without a sensible partitioning scheme from the start means every historical query has been needlessly expensive the entire time it existed unpartitioned.

## Materialized views: pre-computing what dashboards ask for repeatedly

```sql
-- A materialized view — pre-computed and incrementally refreshed
CREATE MATERIALIZED VIEW daily_revenue_summary AS
SELECT order_date, region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY order_date, region;
```
A dashboard querying the same aggregation repeatedly (every page load re-running `SUM(revenue) GROUP BY region`) re-scans and recomputes that aggregation every single time, at real, repeated cost. A materialized view computes the aggregation once and refreshes incrementally as new data arrives — dashboard queries against the materialized view read the small, pre-computed result instead of re-scanning and re-aggregating the full underlying table on every load. This is the warehouse-scale equivalent of application-level query caching, and is worth reaching for specifically for genuinely repeated, expensive aggregation patterns — not applied to every query, since materialized views themselves have real storage and maintenance cost.

## Where a warehouse actually sits in a real data pipeline

```
Raw data sources → ingestion (Airflow/Kafka/Fivetran)
                  → lands in the warehouse (raw layer)
                  → transformed with dbt (staging → marts)
                  → BI tools query the warehouse directly (Power BI, Tableau, Looker)
```
The warehouse is almost always the **destination**, not the transformation engine itself in a modern ELT (Extract-Load-Transform) pipeline — raw data is loaded first, largely unchanged, and transformation logic (dbt models, covered elsewhere in this academy) runs *inside* the warehouse using its own compute, rather than in a separate transformation step before loading (the older ETL pattern). This ELT-over-ETL shift is directly enabled by modern warehouses' cheap, elastic compute — transforming data with SQL running directly against already-loaded raw data in the warehouse is both simpler to build and easier to iterate on than a separate pre-load transformation pipeline that has to be rerun entirely to fix a transformation bug.
