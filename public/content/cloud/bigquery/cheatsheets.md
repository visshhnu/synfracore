# BigQuery — Cheatsheet

```bash
# ── CLI OPERATIONS ────────────────────────────────────────
bq ls                                              # List datasets
bq ls project:dataset                             # List tables
bq show project:dataset.table                     # Table info + schema
bq query --use_legacy_sql=false 'SELECT COUNT(*) FROM project.dataset.table'
bq query --dry_run --use_legacy_sql=false 'SELECT * FROM big_table'  # Cost estimate
bq mk --dataset project:new_dataset
bq mk --table project:dataset.table name:STRING,age:INT64
bq rm -r project:old_dataset
bq extract project:dataset.table gs://bucket/export-*.csv
bq load --source_format=CSV project:dataset.table gs://bucket/data.csv schema.json
bq load --source_format=PARQUET --autodetect project:dataset.table gs://bucket/*.parquet

# ── KEY SQL PATTERNS ──────────────────────────────────────
-- Date manipulation
DATE_TRUNC(date_col, MONTH)
DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY)
DATE_DIFF(end_date, start_date, DAY)
FORMAT_DATE('%Y-%m', date_col)

-- Array and struct
ARRAY_LENGTH(arr_col)
UNNEST(arr_col) AS item                           -- Flatten arrays
arr_col[ORDINAL(1)]                               -- 1-indexed array access
STRUCT('Alice' AS name, 30 AS age)

-- Approximate aggregates (faster for large data)
APPROX_COUNT_DISTINCT(user_id)                    -- Faster than COUNT(DISTINCT)
APPROX_TOP_COUNT(product_id, 10)                  -- Top 10 most frequent
APPROX_QUANTILES(price, 100)[OFFSET(50)]          -- Median

-- Window functions
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at DESC)
SUM(revenue) OVER (PARTITION BY user_id ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
LAG(value, 1) OVER (PARTITION BY id ORDER BY date)

-- ── INFORMATION_SCHEMA (metadata queries) ────────────────
SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'my_table'
SELECT * FROM region-us.INFORMATION_SCHEMA.JOBS_BY_PROJECT WHERE DATE(creation_time) = CURRENT_DATE()
SELECT * FROM region-us.INFORMATION_SCHEMA.TABLE_STORAGE WHERE table_name = 'events'
```
