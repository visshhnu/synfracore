# Apache Spark Overview (Data Engineering)

**Before you start:** working Python knowledge is assumed. No prior distributed-systems or big-data experience is needed.

## Spark in the Data Engineering Context

Some datasets are too large for one machine to process in reasonable time, no matter how much RAM or CPU that one machine has — a 10TB dataset simply doesn't fit in memory on a single laptop or even most single servers. Apache Spark is a **distributed data processing framework**: it splits a dataset across many machines (a cluster), processes each piece in parallel, and combines the results — the same transformation logic you'd write for a small dataset works unchanged at far larger scale, because Spark handles the distribution.

**Analogy** — Imagine sorting a warehouse full of boxes by hand. One person doing it alone might take a month. A hundred people, each sorting a different aisle simultaneously, finish the same job in a fraction of the time — as long as someone coordinates who sorts which aisle and combines everyone's results at the end into one final report. Spark is that coordinator: your code describes *what* to do (filter these boxes, group those by category), and Spark figures out how to split the work across the cluster's workers and combine their results, without you having to manually manage which worker does what.

```
1 machine,  1TB dataset  -->  processes sequentially, slow
N machines, 1TB dataset  -->  Spark splits it into partitions,
                               each machine processes its slice
                               in parallel, results combined
```

## The Core Mechanic: Lazy Transformations, Eager Actions

This is the single most important concept in Spark, and it trips up nearly everyone at first. Operations like `filter`, `select`, `groupBy` are **transformations** — calling them doesn't process any data, it just builds a plan. Only an **action** (`show()`, `collect()`, `count()`, `write()`) actually triggers computation — and at that point, Spark's optimizer looks at the *entire* chain of transformations together and figures out the most efficient way to run all of it at once.

```python
# Nothing has actually run yet after these three lines -- just building a plan
df2 = df.filter(df.amount > 100)
df3 = df2.select("customer_id", "amount")
df4 = df3.groupBy("customer_id").sum("amount")

df4.show()   # THIS line triggers actual execution, of the whole chain at once
```

Because Spark sees the whole chain before running anything, it can reorder and combine steps for efficiency (e.g. applying the filter before moving data across the network) — this is fundamentally why Spark performs well at scale, and it's also why a `print()` between transformation lines won't show intermediate data the way ordinary, eager Python code would.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Transformations", "sublabel": "filter, select, groupBy -- build a plan, run nothing yet", "color": "blue" },
    { "label": "Action triggers execution", "sublabel": "show(), collect(), write() -- Spark optimizes the whole chain", "color": "purple" },
    { "label": "Distributed execution", "sublabel": "Work is split across cluster workers, results combined", "color": "green" }
  ]
}
```

## Why Spark Over Alternatives

```conceptgrid
{
  "boxes": [
    { "title": "Pandas (single-machine)", "description": "Familiar API, but limited to what fits in one machine's memory -- Spark exists for the scale beyond that", "color": "amber" },
    { "title": "Hadoop MapReduce", "description": "Spark's predecessor -- Spark keeps data in memory between steps instead of writing to disk each time, typically far faster for the same job", "color": "purple" },
    { "title": "Dask", "description": "Python-native distributed computing, lighter-weight -- Spark has broader adoption and a larger production ecosystem", "color": "blue" },
    { "title": "Cloud data warehouses (Snowflake, BigQuery)", "description": "SQL-first, fully managed -- Spark is used when transformation logic is too complex for SQL alone, or data lives outside a warehouse", "color": "green" }
  ]
}
```

## Try It (2 Minutes)

PySpark runs locally with zero cluster setup — a "local" Spark session simulates a cluster on your own machine:

```bash
pip install pyspark
python3
```

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("try-it").getOrCreate()
df = spark.createDataFrame(
    [("alice", 120), ("bob", 45), ("carol", 300)],
    ["name", "amount"]
)

# Transformations -- nothing runs yet
big_spenders = df.filter(df.amount > 100)

# Action -- THIS triggers execution
big_spenders.show()
```

1. Run the snippet above — notice the DataFrame is created and filtered (transformations) before anything actually executes, exactly like the lazy-execution example further up this page.
2. Change `.show()` to `.count()` and re-run — same underlying execution, different action, different result shape (a number instead of a printed table).
3. Run `df.rdd.getNumPartitions()` — even on a single local machine, Spark still partitions the data internally, the same mechanism that scales to hundreds of real cluster nodes without any code change.

## Study Resources
- **Learning Spark, 2nd Edition** (O'Reilly) — the standard reference book
- **Apache Spark official docs** (spark.apache.org/docs/latest) — authoritative, actively maintained
- **Databricks Academy** — free courses from Spark's original creators
- **Spark Summit / Data + AI Summit talks** (YouTube) — real production patterns at scale
