# Apache Spark — Fundamentals

## The core idea: transformations are lazy, actions trigger execution

This is the single most important mechanical concept in Spark, and it trips up almost everyone initially. Operations like `filter`, `select`, and `groupBy` are **transformations** — they don't actually process any data when called; they build up a logical execution plan. Only an **action** (`show()`, `collect()`, `count()`, `write()`) actually triggers computation, at which point Spark's optimizer (Catalyst) looks at the *entire* chain of transformations you built and figures out the most efficient way to execute all of it together.

```python
# Nothing has actually run yet after these three lines — just building a plan
df2 = df.filter(df.amount > 100)
df3 = df2.select("customer_id", "amount")
df4 = df3.groupBy("customer_id").sum("amount")

df4.show()   # THIS line triggers actual execution, of the whole chain at once
```

Why this matters practically: Spark can optimize the *entire* chain together (pushing the filter earlier, combining operations) rather than executing each line eagerly and separately — this is fundamentally why Spark can be fast at scale, and also why a `print()` statement placed between transformations won't show intermediate data the way it would in normal, eager Python code.

## DataFrames vs. RDDs — know the distinction, use DataFrames by default

RDDs (Resilient Distributed Datasets) are Spark's original, lower-level distributed data abstraction — a distributed collection of arbitrary Python/Scala objects, with no schema. DataFrames are built on top of RDDs, add a schema (column names and types, like a database table), and let Spark's Catalyst optimizer reason about and optimize your operations far more effectively than it can with opaque, unstructured RDD operations. For nearly all modern Spark work, use DataFrames (or the closely related Dataset API in Scala) — RDDs are still there for genuinely low-level cases, but they're the exception, not the default starting point.

## Partitions: how Spark actually distributes data

A DataFrame is split into partitions — chunks of data distributed across the cluster's worker nodes, each processed independently and in parallel. Partition count and size matter directly for performance: too few partitions means you're not using all available parallelism (some workers sit idle); too many small partitions means overhead from managing many tiny tasks outweighs the parallelism benefit. `df.rdd.getNumPartitions()` shows the current count, and `repartition()`/`coalesce()` let you explicitly control it — this is a real, frequently-relevant tuning lever, not an internal detail you can ignore.

## Reading and writing data — the actual day-to-day operations

```python
# Reading — Spark supports many formats natively
df = spark.read.parquet("s3://bucket/path/")
df = spark.read.csv("path/to/file.csv", header=True, inferSchema=True)
df = spark.read.json("path/to/file.json")

# Writing — partitioned output is common for large datasets
df.write.mode("overwrite").partitionBy("date").parquet("s3://bucket/output/")
```

**Parquet, specifically, is the standard format for Spark work, for concrete reasons**: it's columnar (reading only the columns a query actually needs is far cheaper than reading every column, unlike row-based formats like CSV), it stores schema information alongside the data (no separate schema definition needed on read), and it supports predicate pushdown (Spark can skip entire file blocks that can't match a filter, without reading them at all) — CSV/JSON lack all three of these properties.

## Basic transformations, concretely

```python
from pyspark.sql import functions as F

df.select("name", "amount").show()
df.filter(F.col("amount") > 100).show()
df.groupBy("category").agg(F.sum("amount").alias("total"), F.count("*").alias("count")).show()
df.withColumn("amount_doubled", F.col("amount") * 2).show()
df.orderBy(F.col("amount").desc()).show()
```

Using `F.col()` explicitly (rather than bare string column names in every context) becomes important once expressions get more complex — it's the standard, more robust way to reference columns in real Spark code, not just a stylistic preference.
