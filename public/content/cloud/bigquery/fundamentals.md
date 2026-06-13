# Google BigQuery — Serverless Data Warehouse

## What is BigQuery

BigQuery is Google's fully managed, petabyte-scale data warehouse. Query terabytes in seconds with standard SQL, pay only for the data you scan (on-demand) or reserve slots (flat-rate). No servers to manage, no indexes to create.

## Querying BigQuery

```sql
-- BigQuery SQL (mostly standard SQL with extensions)

-- Basic query
SELECT name, salary, department
FROM `project.dataset.employees`
WHERE hire_date >= '2024-01-01'
ORDER BY salary DESC
LIMIT 100;

-- Partitioned table query (only scan the partition you need)
SELECT user_id, event_type, timestamp
FROM `project.dataset.events`
WHERE DATE(timestamp) = '2024-01-15'   -- Only scans one day's partition!
  AND event_type = 'purchase';

-- Nested and repeated fields (BigQuery-specific)
SELECT
    order_id,
    customer.name,
    customer.email,
    item.product_name,
    item.quantity
FROM `project.dataset.orders`,
UNNEST(items) AS item   -- Flatten repeated nested field
WHERE customer.country = 'IN';

-- Array and struct operations
SELECT
    user_id,
    ARRAY_LENGTH(purchases) AS purchase_count,
    (SELECT SUM(p.amount) FROM UNNEST(purchases) p) AS total_spent
FROM `project.dataset.users`;

-- Cost estimation (before running)
-- Check "Bytes processed" in query preview
-- 1TB = ~$5 on on-demand pricing
-- Set maximum bytes billed to protect against expensive queries
```

## Loading Data

```bash
# Load from GCS
bq load \
    --source_format=CSV \
    --autodetect \
    project:dataset.tablename \
    gs://my-bucket/data/*.csv

# Load with schema
bq load \
    --source_format=PARQUET \
    project:dataset.tablename \
    gs://my-bucket/data/*.parquet

# Stream data (real-time inserts)
from google.cloud import bigquery
client = bigquery.Client()

rows = [
    {"user_id": "123", "event": "purchase", "amount": 99.99, "ts": "2024-01-15T10:30:00Z"}
]
errors = client.insert_rows_json("project.dataset.events", rows)
```

## BigQuery Cheatsheet

```sql
-- ── BIGQUERY-SPECIFIC FEATURES ────────────────────────────
-- Approximate aggregations (much faster for analytics)
SELECT APPROX_COUNT_DISTINCT(user_id) AS unique_users
FROM events;

SELECT APPROX_TOP_COUNT(product_id, 10) AS top_products
FROM orders;

-- ML in BigQuery (no data movement!)
CREATE MODEL `project.dataset.churn_model`
OPTIONS(model_type='logistic_reg', input_label_cols=['churned'])
AS SELECT * FROM training_data;

-- Predictions
SELECT predicted_churned, user_id
FROM ML.PREDICT(MODEL `project.dataset.churn_model`,
    (SELECT * FROM users WHERE last_login < '2024-01-01'));

-- ── PERFORMANCE ───────────────────────────────────────────
-- Partition by date (critical for time-series)
CREATE TABLE events PARTITION BY DATE(timestamp)
OPTIONS(partition_expiration_days=365);

-- Cluster by frequently filtered columns
CREATE TABLE orders PARTITION BY DATE(created_at)
CLUSTER BY customer_id, status;

-- ── CLI ───────────────────────────────────────────────────
bq ls project:dataset
bq show project:dataset.table
bq query --use_legacy_sql=false 'SELECT COUNT(*) FROM project.dataset.table'
bq mk --dataset project:new_dataset
bq rm -r project:old_dataset
bq extract project:dataset.table gs://bucket/export-*.csv
```
