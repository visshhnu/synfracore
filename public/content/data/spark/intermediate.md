# Apache Spark — Intermediate

## Joins at scale: the shuffle problem

A join between two DataFrames requires rows with matching keys to end up on the same worker node — if they started on different nodes (which they usually did, given how data is distributed), Spark has to move data across the network to bring matching keys together. This data movement is called a **shuffle**, and it's typically the single most expensive operation in a Spark job — far more expensive than the actual join computation itself once the data is co-located.

```python
# A standard join — Spark will shuffle both DataFrames by the join key
result = orders.join(customers, on="customer_id", how="inner")
```

**Broadcast joins avoid the shuffle entirely, when one side is small enough:**

```python
from pyspark.sql import functions as F
result = orders.join(F.broadcast(small_lookup_table), on="customer_id", how="inner")
```

If one DataFrame is small enough to fit comfortably in memory on every worker (a lookup/dimension table, commonly), broadcasting it — sending a full copy to every worker instead of shuffling the large DataFrame — avoids the expensive shuffle entirely. Spark's optimizer auto-broadcasts small tables below a configurable size threshold by default, but explicitly broadcasting when you know a table is small (and the optimizer's automatic detection might not trigger, e.g., after certain transformations obscure the size estimate) is a real, common manual optimization.

## Partitioning strategy for join and aggregation performance

Data that's already partitioned by the column you're about to join or group on avoids a shuffle at that step — `df.repartition("customer_id")` before a join or groupBy on `customer_id`, if you're going to do several operations on that key, can be worth the upfront repartition cost by avoiding repeated shuffles later. This is a real tuning decision requiring you to reason about your actual pipeline's access pattern, not something to apply reflexively before every operation.

## Caching: when it helps, and when it's wasted

```python
df_filtered = df.filter(F.col("amount") > 1000)
df_filtered.cache()   # or .persist() with an explicit storage level

# Now use df_filtered multiple times — cache avoids recomputing the filter chain each time
count = df_filtered.count()
total = df_filtered.agg(F.sum("amount")).collect()
```

Caching is valuable specifically when you're going to use the *same* DataFrame multiple times in different downstream operations — without caching, Spark's lazy evaluation (Fundamentals) means each action re-executes the entire transformation chain from scratch, including re-reading the source data. Caching a DataFrame you only use once is pure overhead with no benefit — a common beginner mistake is caching reflexively rather than based on actual reuse.

## Window functions — operations that need context beyond a single row

```python
from pyspark.sql import Window
from pyspark.sql import functions as F

window_spec = Window.partitionBy("customer_id").orderBy("order_date")

df.withColumn("running_total", F.sum("amount").over(window_spec)) \
  .withColumn("order_rank", F.row_number().over(window_spec)) \
  .show()
```

Window functions compute a value using a "window" of related rows (all of a customer's orders, ordered by date, in this example) without collapsing them into a single aggregated row the way `groupBy` does — this is the correct tool specifically for running totals, rankings, and row-to-row comparisons within a group, which `groupBy`'s aggregation model can't directly express.

## Handling skewed data — when one partition is much larger than the rest

Data skew (a small number of keys with disproportionately many rows — a "celebrity user" pattern, common in real datasets) means the partition(s) containing those keys take much longer to process than others, and the whole job waits on the slowest partition. A common intermediate mitigation: **salting** — adding a random suffix to a skewed key to artificially split its rows across multiple partitions for the expensive operation, then aggregating the salted results back together afterward. This adds real complexity and should be reached for specifically when skew is confirmed (via Spark's UI, showing one task taking dramatically longer than others), not applied preemptively without evidence of actual skew.
