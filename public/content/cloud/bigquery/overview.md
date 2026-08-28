# BigQuery — Serverless Data Warehouse

**Before you start:** basic SQL familiarity (`SELECT`/`WHERE`/`GROUP BY`) is assumed — if you know standard SQL from Postgres, MySQL, or similar, that knowledge transfers directly. No prior data warehouse or big-data experience is required; BigQuery's own tuning concepts (partitioning, clustering) are explained from scratch below.

BigQuery is Google's serverless, petabyte-scale data warehouse. You write SQL queries; Google handles all infrastructure, scaling, and optimisation. No clusters to manage, no capacity planning.

## Why this exists (the hook)

Imagine you have a 500GB CSV of user events and you want to know "how many purchases happened per day last month, broken down by country." On a laptop or a single database server, that query might take minutes or fail outright if the data doesn't fit in memory. On a traditional data warehouse (Redshift, on-prem Teradata, a big Postgres box), you'd first have to provision and pay for a cluster sized for your *peak* query load, 24/7, whether you're querying or not. BigQuery's pitch is different: you never provision anything. You run `bq load`, then `SELECT`, and Google spins up however much compute your specific query needs behind the scenes, in parallel, across thousands of machines, then tears it down when the query finishes. You pay per query (or a flat monthly rate if you query heavily and predictably), not for idle capacity.

## Analogy

A traditional data warehouse cluster is like owning a fleet of delivery trucks sized for your busiest possible day — most days, most of the fleet sits idle in the lot, but you still pay for fuel, insurance, and parking on all of them. BigQuery is like calling a delivery service that has effectively unlimited trucks on demand: you pay per delivery (per query), the service instantly allocates however many trucks that specific job needs, and when it's done, those trucks go back into a shared pool for the next customer. You never see or manage a single truck — you just describe what needs delivering (a SQL query) and pay for what actually moved.

## How a query executes (diagram)

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Your SQL query", "sublabel": "Submitted to BigQuery", "color": "slate" },
    { "label": "Dremel Engine", "sublabel": "Google's query planner picks the columns/partitions/blocks actually needed", "color": "blue" },
    { "label": "Temporary Worker Pool", "sublabel": "Thousands of machines read in parallel, aggregate, shuffle results", "color": "purple" },
    { "label": "Result Set", "sublabel": "Workers torn down after -- billed only for bytes scanned", "color": "green" }
  ]
}
```

## Annotated example

```sql
-- A partitioned, clustered table: BigQuery only reads the slice of data
-- your WHERE clause actually needs, instead of the whole table.
CREATE TABLE my_dataset.events
PARTITION BY DATE(event_timestamp)   -- one physical partition per day
CLUSTER BY user_id, event_type       -- data within each partition is
                                      -- sorted/grouped by these columns
OPTIONS (
  require_partition_filter = true    -- refuses to run a query that
                                      -- forgot a date filter, so nobody
                                      -- accidentally scans (and pays for)
                                      -- the entire table's history
)
AS SELECT * FROM raw_events;

-- This query only touches ONE day's partition, not the whole table:
SELECT user_id, COUNT(*) AS events
FROM my_dataset.events
WHERE DATE(event_timestamp) = '2024-01-15'   -- partition pruning
  AND event_type = 'purchase'                -- clustering narrows further
GROUP BY user_id;
```

## Try it yourself (2 minutes)

BigQuery gives every project a free tier and Google publishes several fully public datasets you can query without loading anything yourself. In the BigQuery console (or `bq query`), run a dry run first to see cost *before* committing to a real scan:

```sql
-- Dry run: estimates bytes scanned without actually running the query
-- (in the console, this happens automatically as you type — watch the
-- "This query will process X MB/GB" indicator before clicking Run)
SELECT corpus, SUM(word_count) AS total_words
FROM `bigquery-public-data.samples.shakespeare`
GROUP BY corpus
ORDER BY total_words DESC;
```
Compare the bytes-scanned estimate for `SELECT *` versus selecting only the two or three columns you actually need — this is the single fastest lesson in why BigQuery's columnar storage rewards narrow `SELECT` lists.

## Why BigQuery

Traditional data warehouse: provision a cluster, pay for it 24/7. BigQuery: pay only for queries run (or flat-rate if predictable).

```conceptgrid
{
  "boxes": [
    { "title": "BigQuery ML", "description": "Train models with SQL -- no separate ML pipeline needed", "color": "blue" },
    { "title": "Streaming Ingestion", "description": "Millions of rows per second", "color": "purple" },
    { "title": "Federated Queries", "description": "Query Cloud Storage, Sheets without loading data in first", "color": "amber" },
    { "title": "BI Engine", "description": "In-memory caching for sub-second dashboard queries", "color": "green" }
  ]
}
```

## Query Optimisation

```sql
-- Partitioned tables: Dramatically reduce bytes scanned
CREATE TABLE my_dataset.events
PARTITION BY DATE(event_timestamp)
CLUSTER BY user_id, event_type  -- Further reduce scan within partition
OPTIONS (
  require_partition_filter = true  -- Prevent expensive full-table scans
)
AS SELECT * FROM raw_events;

-- Query only the partition you need
SELECT user_id, COUNT(*) as events
FROM my_dataset.events
WHERE DATE(event_timestamp) = '2024-01-15'  -- Uses partition pruning
  AND event_type = 'purchase'  -- Uses clustering
GROUP BY user_id;

-- Avoid SELECT * (scans all columns — BigQuery is columnar)
-- Only select columns you need

-- Use APPROX_COUNT_DISTINCT instead of COUNT(DISTINCT x) for large tables
-- Much faster, 1% error rate acceptable for analytics
SELECT APPROX_COUNT_DISTINCT(user_id) as unique_users
FROM my_dataset.events
WHERE DATE(event_timestamp) = '2024-01-15';

-- Window functions for analytics
SELECT 
  user_id,
  event_timestamp,
  SUM(revenue) OVER (PARTITION BY user_id ORDER BY event_timestamp 
                     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as lifetime_revenue,
  RANK() OVER (PARTITION BY DATE(event_timestamp) ORDER BY revenue DESC) as daily_rank
FROM my_dataset.purchases;
```

## BigQuery ML

```sql
-- Train a logistic regression model in SQL
CREATE OR REPLACE MODEL my_dataset.churn_model
OPTIONS (
  model_type = 'LOGISTIC_REG',
  input_label_cols = ['churned']
) AS
SELECT
  user_age,
  days_since_last_purchase,
  total_purchases,
  avg_order_value,
  churned
FROM my_dataset.user_features
WHERE split = 'TRAIN';

-- Make predictions
SELECT user_id, predicted_churned, predicted_churned_probs
FROM ML.PREDICT(MODEL my_dataset.churn_model,
  SELECT * FROM my_dataset.user_features WHERE split = 'TEST'
);
```

## Cost Management

```
Query pricing: on-demand pricing is per TB of bytes scanned *(the commonly-cited $5/TB figure needs verification against current official BigQuery pricing — it varies by region and Google has changed pricing tiers before)*
  Use partitioning and clustering to reduce bytes scanned
  
Storage pricing: active vs long-term (90+ days unmodified) storage are priced differently, with long-term being cheaper *(exact current $/GB/month figures need verification against the official pricing page)*

Cost controls:
  Custom quotas: Limit bytes per user/project per day
  BigQuery reservations: Flat-rate pricing for predictable workloads
  Dry run: Estimate bytes before running query

-- Check query cost before running (Python client)
job_config = bigquery.QueryJobConfig(dry_run=True, use_query_cache=False)
query_job = client.query(sql, job_config=job_config)
print(f"Will scan {query_job.total_bytes_processed / 1e9:.2f} GB")
```
