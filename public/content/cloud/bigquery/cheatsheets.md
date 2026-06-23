# BigQuery Quick Reference

## bq CLI Commands
```bash
bq ls                                          # List datasets
bq ls myproject:mydataset                      # List tables
bq show mydataset.mytable                      # Table schema
bq head -n 5 mydataset.mytable                 # First 5 rows
bq query --use_legacy_sql=false 'SELECT COUNT(*) FROM mydataset.mytable'

# Load data
bq load --autodetect --source_format=CSV mydataset.mytable gs://bucket/file.csv
bq load --source_format=NEWLINE_DELIMITED_JSON mydataset.mytable gs://bucket/*.json schema.json

# Create table
bq mk --table mydataset.mytable name:STRING,age:INTEGER,created:TIMESTAMP
bq mk --table --time_partitioning_field=created_at \
  --clustering_fields=region,product mydataset.events schema.json

# Copy and export
bq cp mydataset.source mydataset.destination
bq extract mydataset.mytable gs://bucket/export-*.csv
bq rm -f mydataset.mytable
```

## SQL Patterns
```sql
-- Partition pruning (key for cost control!)
SELECT * FROM `project.dataset.events`
WHERE DATE(created_at) = '2024-01-15'  -- Scans only that partition

-- Wildcard tables
SELECT * FROM `project.dataset.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20240101' AND '20240131'

-- Approximate count (much faster/cheaper)
SELECT APPROX_COUNT_DISTINCT(user_id) FROM events

-- Struct and array
SELECT name, ARRAY_LENGTH(items) as item_count FROM orders
SELECT o.name, item FROM orders o, UNNEST(o.items) AS item
```

## Cost Control Reference
```
ALWAYS SELECT only needed columns (columnar = you pay per column scanned)
Use WHERE on partition column (DATE/TIMESTAMP) to prune partitions
Clustering: filter on cluster columns after partition → less scan
Materialised views: pre-compute expensive aggregations
APPROX_COUNT_DISTINCT: much faster than COUNT(DISTINCT)
Dry run: bq query --dry_run → shows bytes to be scanned before running
```
