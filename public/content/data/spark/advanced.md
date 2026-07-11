# Apache Spark — Advanced

## Structured Streaming: applying batch concepts to unbounded data

Spark's Structured Streaming treats a stream as an unbounded, continuously-appending table — the same DataFrame API from batch processing applies almost directly, which is a deliberate design choice reducing the mental overhead of learning a separate streaming programming model:

```python
stream_df = spark.readStream.format("kafka") \
    .option("kafka.bootstrap.servers", "broker:9092") \
    .option("subscribe", "events") \
    .load()

query = stream_df.groupBy("event_type").count() \
    .writeStream.outputMode("complete").format("console") \
    .trigger(processingTime="10 seconds") \
    .start()
```

**Output modes matter and are a common source of confusion**: `complete` re-outputs the full aggregated result table every trigger (only viable for aggregations with a bounded result set), `append` outputs only new rows since the last trigger (works for non-aggregated or windowed-and-finalized data), and `update` outputs only rows that changed. Choosing the wrong mode for your specific query type produces either an error or, worse, semantically incorrect output that doesn't error but doesn't mean what you think it does.

## Adaptive Query Execution (AQE) — letting Spark re-optimize mid-execution

Modern Spark versions include AQE, which re-optimizes a query plan *during* execution based on actual runtime statistics, rather than relying solely on estimates made before execution starts. Concretely: AQE can dynamically switch a planned shuffle join to a broadcast join if runtime stats reveal one side is smaller than initially estimated, and can dynamically coalesce small shuffle partitions into fewer, larger ones to reduce task overhead. This meaningfully reduces the need for some manual tuning (explicit broadcast hints, manual partition tuning) that was previously necessary — worth confirming it's enabled (`spark.sql.adaptive.enabled`) in your specific environment, since it's not universally on by default across every Spark version/deployment.

## Reading and reasoning about Spark's execution plan and UI

`df.explain()` shows the logical and physical execution plan Catalyst produced — reading this to confirm your query is actually being optimized the way you expect (a broadcast join actually happening, a filter actually being pushed down before an expensive operation) is an advanced but genuinely necessary debugging skill once queries get complex. The Spark UI (accessible during and after a job run) shows the actual execution DAG, per-stage timing, and shuffle read/write volumes — this is where you diagnose *why* a job is slow with real data, rather than guessing from the code alone; task-level timing skew visible here is the concrete evidence for data skew (see Intermediate), not just a suspicion.

## Delta Lake / Lakehouse patterns — ACID transactions on top of object storage

Plain Parquet files on object storage (S3, etc.) don't support ACID transactions — concurrent writes can corrupt data, and there's no built-in way to safely update/delete specific rows within existing files. Delta Lake (and similar formats — Apache Iceberg, Apache Hudi) add a transaction log on top of Parquet files, enabling ACID guarantees, safe concurrent writes, time travel (querying data as it existed at a previous point), and efficient upserts/deletes — capabilities plain Parquet-on-object-storage fundamentally lacks. This is now a standard, common part of production Spark data lake architectures, not a niche add-on.

## Cluster resource tuning: executors, cores, and memory

At production scale, tuning executor count, cores per executor, and memory per executor meaningfully affects both performance and cost — too few, large executors underutilizes parallelism opportunities; too many, small executors adds per-task overhead and risks memory pressure from JVM overhead per executor. There's no single universally-correct configuration — it depends on cluster size, data volume, and workload shape (CPU-bound vs. shuffle-heavy vs. memory-intensive), and real tuning requires iterating against the Spark UI's actual observed resource utilization for your specific workload, not applying a generic formula from documentation without validating it against your real job's behavior.
