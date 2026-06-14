# BigQuery — Intermediate

## Partitioning and Clustering

```sql
-- Partition by date (critical for cost control — query only scans relevant partitions)
CREATE TABLE events PARTITION BY DATE(event_timestamp)
OPTIONS(partition_expiration_days=365, require_partition_filter=true)
AS SELECT * FROM source_events;

-- Query using partition filter (only scans 1 day, not entire table!)
SELECT user_id, event_type, COUNT(*) as events
FROM events
WHERE DATE(event_timestamp) = '2024-01-15'   -- Partition pruning!
  AND event_type = 'purchase'
GROUP BY 1, 2;

-- Cluster by frequently filtered columns (reduces bytes scanned further)
CREATE TABLE orders PARTITION BY DATE(created_at)
CLUSTER BY customer_id, status
AS SELECT * FROM source_orders;

-- Benefits: clustering reduces scanned data by 50-90% for selective queries
-- Best columns for clustering: high cardinality, frequently filtered
-- Partitioning: date/int range fields
-- Clustering: up to 4 columns, order matters (put most selective first)
```

## BigQuery ML

```sql
-- Train a model directly in SQL — no data movement needed
CREATE MODEL IF NOT EXISTS mydataset.churn_model
OPTIONS(
  model_type='logistic_reg',
  input_label_cols=['churned'],
  max_iterations=20,
  data_split_method='AUTO_SPLIT'
)
AS
SELECT
  days_since_last_purchase,
  total_purchases,
  total_spend,
  avg_order_value,
  support_tickets,
  churned
FROM mydataset.customer_features
WHERE created_at < '2024-01-01';

-- Evaluate the model
SELECT * FROM ML.EVALUATE(MODEL mydataset.churn_model);

-- Predict on new data
SELECT customer_id, predicted_churned, predicted_churned_probs
FROM ML.PREDICT(
  MODEL mydataset.churn_model,
  (SELECT * FROM mydataset.customer_features WHERE created_at >= '2024-01-01')
);
```

## Authorized Views for Row-Level Security

```sql
-- Authorized view: share only specific rows with specific users
-- View for India sales team — only see India data
CREATE VIEW sales_india.orders_view AS
SELECT * FROM sales.orders WHERE region = 'INDIA';

-- Grant view access (not raw table)
-- In GCP Console: sales_india dataset → Authorized views → Add sales.orders

-- Row-level security with data policies (BigQuery data masking)
CREATE ROW ACCESS POLICY india_only
ON sales.orders
GRANT TO ("group:india-team@company.com")
FILTER USING (region = 'INDIA');
```
