# Apache Spark — Quick Reference

## Reading and writing data

```python
# Reading
df = spark.read.parquet("path/")
df = spark.read.csv("path/", header=True, inferSchema=True)
df = spark.read.json("path/")

# Writing
df.write.mode("overwrite").parquet("path/")
df.write.mode("append").partitionBy("date").parquet("path/")
```

## Core DataFrame operations

```python
from pyspark.sql import functions as F

df.select("col1", "col2")
df.filter(F.col("amount") > 100)
df.withColumn("new_col", F.col("amount") * 2)
df.groupBy("category").agg(F.sum("amount").alias("total"))
df.orderBy(F.col("amount").desc())
df.dropDuplicates(["id"])
df.na.drop()                          # drop rows with nulls
df.na.fill(0, subset=["amount"])      # fill nulls
```

## Joins

```python
df1.join(df2, on="id", how="inner")   # inner, left, right, outer, semi, anti
F.broadcast(small_df)                 # force a broadcast join
```

## Window functions

```python
from pyspark.sql import Window

w = Window.partitionBy("customer_id").orderBy("order_date")
df.withColumn("running_total", F.sum("amount").over(w))
df.withColumn("rank", F.row_number().over(w))
```

## Caching and partitioning

```python
df.cache()              # or .persist(StorageLevel.MEMORY_AND_DISK)
df.unpersist()

df.repartition(200)             # increase partitions
df.repartition("customer_id")   # partition by column, aligns with subsequent joins/groupBy
df.coalesce(10)                 # reduce partitions, no full shuffle (unlike repartition)
df.rdd.getNumPartitions()       # check current partition count
```

## Debugging

```python
df.explain()             # execution plan — confirm broadcast joins, pushed-down filters
df.show(truncate=False)  # full column values, no truncation
df.printSchema()         # inferred/actual schema
```

## Structured Streaming output modes, quick reference

| Mode | Use case |
|---|---|
| `complete` | Full re-output every trigger — bounded aggregation result sets only |
| `append` | Only new rows since last trigger — non-aggregated or finalized windowed data |
| `update` | Only rows that changed since last trigger |

## Common config keys worth knowing

| Config | Purpose |
|---|---|
| `spark.sql.shuffle.partitions` | Number of partitions for shuffles (joins, groupBy) |
| `spark.sql.autoBroadcastJoinThreshold` | Size below which a table auto-broadcasts |
| `spark.sql.adaptive.enabled` | Enables Adaptive Query Execution (AQE) |
