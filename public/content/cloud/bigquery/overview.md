# BigQuery — Serverless Data Warehouse

BigQuery is Google's serverless, petabyte-scale data warehouse. You write SQL queries; Google handles all infrastructure, scaling, and optimisation. No clusters to manage, no capacity planning.

## Why BigQuery

```
Traditional data warehouse: Provision cluster, pay for cluster 24/7
BigQuery: Pay only for queries run (or flat-rate if predictable)

Key capabilities:
  Petabyte-scale queries in seconds
  Standard SQL
  Built-in ML (BigQuery ML — train models with SQL)
  Streaming ingestion (millions of rows/second)
  Federated queries (query Cloud Storage, Sheets without loading)
  BI Engine (in-memory caching for sub-second dashboard queries)
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
Query pricing: $5 per TB scanned (on-demand)
  Use partitioning and clustering to reduce bytes scanned
  
Storage pricing: $0.02/GB/month active, $0.01/GB/month long-term (90+ days unchanged)

Cost controls:
  Custom quotas: Limit bytes per user/project per day
  BigQuery reservations: Flat-rate pricing for predictable workloads
  Dry run: Estimate bytes before running query

-- Check query cost before running (Python client)
job_config = bigquery.QueryJobConfig(dry_run=True, use_query_cache=False)
query_job = client.query(sql, job_config=job_config)
print(f"Will scan {query_job.total_bytes_processed / 1e9:.2f} GB")
```
