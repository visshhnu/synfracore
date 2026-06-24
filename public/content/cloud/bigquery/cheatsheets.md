# BigQuery Cheatsheet

## Core SQL Patterns
```sql
-- Standard SQL (default)
SELECT column1, COUNT(*) as cnt
FROM `project.dataset.table`
WHERE DATE(created_at) = CURRENT_DATE()
  AND status = 'active'
GROUP BY column1
ORDER BY cnt DESC
LIMIT 100;

-- Partitioned table query (specify partition = cheaper)
SELECT *
FROM `project.dataset.events`
WHERE _PARTITIONDATE = '2025-06-01'  -- partition pruning
  AND event_type = 'click';

-- Time-travel (query historical data)
SELECT * FROM `project.dataset.table`
FOR SYSTEM_TIME AS OF TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 HOUR);

-- Approximate distinct count (faster for large datasets)
SELECT APPROX_COUNT_DISTINCT(user_id) as approx_users FROM `project.dataset.events`;

-- Wildcard tables (query multiple date-sharded tables)
SELECT * FROM `project.dataset.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20250601' AND '20250630';

-- ARRAY and STRUCT (nested data)
SELECT user_id, item.name, item.price
FROM `project.dataset.orders`, UNNEST(items) AS item
WHERE item.price > 100;

-- Window functions
SELECT user_id, event_type,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_time) as rn,
  LAG(event_type) OVER (PARTITION BY user_id ORDER BY event_time) as prev_event
FROM `project.dataset.events`;
```

## bq CLI Commands
```bash
# Datasets
bq mk --dataset --location=US myproject:mydataset
bq ls myproject:
bq rm -r myproject:mydataset

# Tables
bq show myproject:mydataset.mytable
bq mk --table mydataset.mytable schema.json
bq load --source_format=CSV mydataset.mytable gs://bucket/file.csv schema.json
bq load --source_format=NEWLINE_DELIMITED_JSON mydataset.mytable gs://bucket/*.json

# Query
bq query --use_legacy_sql=false 'SELECT COUNT(*) FROM `myproject.mydataset.mytable`'
bq query --destination_table myproject:mydataset.results --use_legacy_sql=false 'SELECT ...'
bq extract --destination_format=CSV mydataset.mytable gs://bucket/output-*.csv

# Jobs
bq ls -j -n 20  # list recent jobs
bq show -j <job-id>  # job details
bq cancel <job-id>
```

## Optimization Quick Reference
```
PARTITIONING:
  Ingestion-time: _PARTITIONDATE auto-assigned
  Column: DATE/TIMESTAMP/INTEGER column
  Always filter on partition column → partition pruning

CLUSTERING:
  Up to 4 columns per table
  Applied after partitioning
  Eliminates blocks containing non-matching values

SLOT OPTIMIZATION:
  On-demand: $5/TB processed (query cost = data scanned × rate)
  Reservations: dedicated slots for predictable workloads
  Flex Slots: short-term commitment (60s minimum)
  Best practice: SELECT only columns needed (avoid SELECT *)

MATERIALIZED VIEWS:
  Pre-computed aggregations; auto-refresh; serve from cache
  Good for: repeated aggregation queries on large tables
```
