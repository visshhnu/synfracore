# Google BigQuery — Serverless Data Warehouse

## The hook: SQL you already know, at a scale you've probably never used

If you've written a `SELECT ... WHERE ... GROUP BY` query against Postgres or MySQL, you already know most of BigQuery's syntax — it's ANSI-standard SQL with some genuinely useful extensions (`UNNEST` for nested/repeated fields, approximate aggregation functions, built-in ML). The part that's unfamiliar isn't the SQL, it's the absence of anything to tune: no indexes to create, no `EXPLAIN ANALYZE` to chase down a missing index, no connection pool to size. The main levers you actually control are how the table is *partitioned* and *clustered* — which change how much data a query has to read, which is also the main thing you're billed for.

## Analogy

Querying an un-partitioned BigQuery table is like searching for a name in a phone book with the pages ripped out and shuffled — you have to read every single page (every partition) to be sure you found every match. A partitioned table is the same phone book with the pages back in date order (say, partitioned by day) — if you're looking for something from January 15th, you flip straight to that section and ignore the other 364 days. Clustering goes one step further: within each day's pages, entries are also grouped by, say, last name, so once you're on the right page you don't have to scan it top to bottom either.

## Diagram: partition pruning + clustering

```
 Table PARTITIONed BY DATE(event_timestamp), CLUSTERed BY user_id, event_type

 ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐
 │ 2024-01-13│ │ 2024-01-14│ │ 2024-01-15│ │ 2024-01-16│  ← partitions (days)
 └───────────┘ └───────────┘ └─────┬─────┘ └───────────┘
                                    │  WHERE DATE(event_timestamp)='2024-01-15'
                                    │  → only THIS partition is read at all
                                    ▼
                         ┌──────────────────────┐
                         │ user_id=1..100, purch │  ← within the partition,
                         │ user_id=1..100, view  │    clustering groups rows
                         │ user_id=101.., purch  │    by (user_id, event_type)
                         │ ...                    │    so a filter on either
                         └──────────────────────┘    narrows the scan further
```

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
-- On-demand pricing is charged per TB scanned *(exact current $/TB rate needs verification against official BigQuery pricing)*
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

## Try it yourself (2 minutes)

Run this against BigQuery's public Shakespeare sample table (no data loading required, and it's small enough that it's effectively free to query) and use `UNNEST`-style thinking on the result: find which single word appears most often across all of Shakespeare's works.

```sql
SELECT word, SUM(word_count) AS total
FROM `bigquery-public-data.samples.shakespeare`
GROUP BY word
ORDER BY total DESC
LIMIT 10;
```
Then add `WHERE corpus = 'hamlet'` and re-run — notice the result changes without you touching any index, connection, or schema. That's the whole point: the only things you're controlling are what you ask for and (once tables get large) how much of the table your `WHERE` clause lets BigQuery skip.
