# BigQuery — Advanced

## Scheduled Queries and Data Pipelines

```sql
-- Scheduled query: run SQL on a schedule (replaces cron + ETL scripts)
-- In BigQuery console: More → Create scheduled query

-- Example: daily summary table (append mode)
SELECT
  DATE(event_timestamp) as date,
  user_id,
  COUNT(*) as events,
  COUNT(DISTINCT session_id) as sessions,
  SUM(revenue) as revenue
FROM events
WHERE DATE(event_timestamp) = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
GROUP BY 1, 2;

-- BigQuery Data Transfer Service
-- Schedule data from: Google Ads, Campaign Manager, YouTube, Google Play
-- Also: S3, Teradata, Redshift migration
```

## BigQuery Omni (Multi-Cloud)

```sql
-- Query data in AWS S3 or Azure Blob without moving it
-- Requires BigQuery Omni setup in AWS/Azure region

-- Create external connection
-- bq mk --connection --connection_type=AWS_S3 --region=us-east-1 my-aws-conn

-- Create external table pointing to S3
CREATE EXTERNAL TABLE aws_data.orders
WITH PARTITION COLUMNS (date DATE)
OPTIONS(
  format='PARQUET',
  uris=['s3://my-bucket/orders/date=*/*.parquet'],
  hive_partition_uri_prefix='s3://my-bucket/orders'
);

-- Query S3 data as if it were in BigQuery
SELECT date, SUM(total) FROM aws_data.orders WHERE date = '2024-01-15' GROUP BY 1;
```

## Cost Control

```sql
-- Check bytes processed BEFORE running expensive query
-- Add --dry_run flag or use Query Validator

-- Custom cost controls
-- 1. Column-level security: use policy tags, mask PII
-- 2. Project-level quotas: limit bytes processed per day
-- 3. Reservations: buy flat-rate slots instead of on-demand
-- 4. BI Engine: reserve memory for fast dashboard queries
-- 5. Materialized views: pre-aggregate expensive queries

-- Analyze your BigQuery costs
SELECT
  job_id,
  user_email,
  query,
  total_bytes_processed / POW(10,12) AS tb_processed,
  total_bytes_processed / POW(10,12) * 5 AS cost_usd,
  creation_time
FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE DATE(creation_time) = CURRENT_DATE()
  AND total_bytes_processed > 10000000000  -- > 10GB
ORDER BY total_bytes_processed DESC
LIMIT 20;
```
