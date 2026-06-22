# BigQuery Interview Questions

## Core Concepts

**Q: What is BigQuery? What makes it different from traditional data warehouses?**

BigQuery is Google Cloud's fully managed, serverless, petabyte-scale data warehouse. Separates compute from storage — you query data in Google Cloud Storage format without managing servers.

**Key differentiators:**
- **Serverless**: No clusters to provision or tune — just write SQL and pay per query
- **Columnar storage**: Compressed, columnar Capacitor format — fast analytical queries
- **Massively parallel**: Queries can use thousands of cores simultaneously
- **Real-time ingestion**: Streaming inserts for real-time analytics
- **ML built-in**: BigQuery ML — train models directly with SQL (no data export needed)
- **Separation of storage/compute**: Storage is cheap, compute billed per TB scanned

**Pricing:**
- Storage: $0.02/GB/month (active), $0.01/GB (long-term after 90 days)
- Queries: $5/TB scanned (on-demand) or flat-rate slots

---

**Q: BigQuery architecture and key concepts.**

**Dataset**: Container for tables (like a database/schema). Has location (region).
**Table**: Structured data. Native (BQ managed) or External (query files in GCS/Drive).
**Partitioned table**: Divided by date, integer, or ingestion time — reduces scan cost.
**Clustered table**: Data sorted by specified columns — further reduces scan within partitions.

```sql
-- Create partitioned + clustered table (most important optimisation)
CREATE TABLE my_dataset.events
PARTITION BY DATE(event_timestamp)
CLUSTER BY user_id, event_type
AS SELECT * FROM source_table;

-- Query benefits from partition pruning + clustering
SELECT * FROM my_dataset.events
WHERE DATE(event_timestamp) = '2024-01-15'  -- Scans only one partition
  AND user_id = 'user_123';                 -- Clustering further reduces scan
```

---

**Q: BigQuery SQL features.**

```sql
-- ARRAY and STRUCT (nested/repeated fields)
SELECT 
  user_id,
  ARRAY_LENGTH(purchases) as purchase_count,
  (SELECT SUM(p.amount) FROM UNNEST(purchases) as p) as total_spend
FROM users;

-- Window functions (same as PostgreSQL)
SELECT 
  user_id, revenue,
  SUM(revenue) OVER (PARTITION BY region ORDER BY date) as running_total,
  RANK() OVER (PARTITION BY region ORDER BY revenue DESC) as revenue_rank
FROM sales;

-- Wildcard tables (query multiple tables with same prefix)
SELECT * FROM `project.dataset.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20240101' AND '20240131';

-- BigQuery ML — train a model with SQL
CREATE OR REPLACE MODEL my_dataset.churn_model
OPTIONS(model_type='logistic_reg', input_label_cols=['churned'])
AS SELECT age, total_purchases, days_since_last_purchase, churned FROM training_data;

-- Predict
SELECT predicted_churned, * FROM ML.PREDICT(
  MODEL my_dataset.churn_model,
  (SELECT * FROM new_customers)
);
```

---

**Q: BigQuery performance and cost optimisation.**

```sql
-- 1. Always SELECT only needed columns (columnar = you only scan what you select)
-- Bad:  SELECT * FROM events  (scans all columns)
-- Good: SELECT user_id, event_type FROM events

-- 2. Partition pruning (filter on partition column)
WHERE DATE(timestamp) = '2024-01-15'  -- Scans 1/365 of table

-- 3. Cluster-aware queries (filter on cluster columns after partition)
WHERE user_id = 'xyz' AND event_type = 'purchase'

-- 4. LIMIT doesn't reduce scanned bytes (scan happens first)
-- Use WHERE to filter, then LIMIT for output

-- 5. Approximate aggregations (faster/cheaper for big data)
SELECT APPROX_COUNT_DISTINCT(user_id) FROM events  -- Much faster than COUNT(DISTINCT)

-- 6. Materialised views (pre-compute expensive aggregations)
CREATE MATERIALIZED VIEW my_dataset.daily_summary AS
SELECT DATE(timestamp) as day, COUNT(*) as events FROM events GROUP BY 1;

-- 7. Reservations (flat-rate) for predictable workloads
```

---

**Q: BigQuery vs other data warehouses.**

| Feature | BigQuery | Snowflake | Redshift |
|---|---|---|---|
| Serverless | Yes (true) | Compute clusters | Requires node management |
| Pricing model | Per TB scanned | Compute time (credits) | Per node/hour |
| Storage format | Capacitor (columnar) | Micro-partitions | Columnar |
| ML built-in | Yes (BQML) | Snowpark ML | Redshift ML (SageMaker) |
| Best for | GCP-native, ad-hoc queries | Multi-cloud, data sharing | AWS-native workloads |

## Revision Notes
```
BIGQUERY: Serverless data warehouse. Pay per query (TB scanned) or flat-rate slots.
Columnar storage = scan only needed columns. Massively parallel.

KEY CONCEPTS:
Dataset: container | Table: structured data
Partitioned table: by date/int — reduces scan cost (partition pruning)
Clustered table: sorted within partition — further reduces scan
Always filter on partition column + cluster columns

SQL FEATURES:
ARRAY/STRUCT: nested data | UNNEST: flatten arrays
Wildcard tables: events_* for date-sharded tables | ML.PREDICT: built-in model inference

OPTIMISATION:
SELECT only needed cols (columnar matters) | Partition pruning (scan 1/365 of table)
Cluster filters | APPROX_COUNT_DISTINCT (faster than exact) | Materialised views

vs SNOWFLAKE: BQ=per query, serverless | SF=credits-based, compute clusters
vs REDSHIFT: BQ=GCP-native | Redshift=AWS-native, per-node pricing
```
