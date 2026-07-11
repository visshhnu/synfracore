# Apache Spark — Troubleshooting

## Job hangs or is much slower than expected, with no obvious error

Check the Spark UI first, not the code — look at the stage-level view for where time is actually being spent, and task-level timing within the slowest stage specifically for skew (a handful of tasks taking dramatically longer than the rest). A job that "hangs" is very often just one or two extremely skewed tasks still running while everything else finished long ago, which looks like a hang from the outside but is visible immediately as an obvious pattern in the UI's task timeline.

## `OutOfMemoryError` on the driver or executors

Distinguish which one, since the fixes differ. **Driver OOM** is commonly caused by `collect()` on a large DataFrame — pulling all distributed data back to the single driver process, which defeats the purpose of distributed processing and can easily exceed driver memory; use `show()` or write results to storage instead of `collect()` for large results. **Executor OOM** is commonly caused by a skewed partition being too large for a single executor's memory (see Intermediate's skew discussion), or too few, overly large partitions in general — repartitioning to more, smaller partitions is a common fix.

## A join is much slower than expected, with a large shuffle visible in the Spark UI

Check whether a broadcast join should have applied but didn't — verify the smaller side's actual size (sometimes larger than assumed after upstream transformations) and check `df.explain()` to confirm whether Spark chose a broadcast or shuffle join for the query. If the smaller table genuinely should be broadcastable but wasn't automatically, an explicit `F.broadcast()` hint (see Intermediate) forces it rather than relying on the optimizer's automatic threshold-based detection.

## Results from a cached DataFrame seem stale after the source data changed

Spark's cache reflects the DataFrame's state at the time it was cached — if the underlying source data changes and you need fresh results, the cached DataFrame needs to be explicitly unpersisted (`df.unpersist()`) and recomputed, since Spark has no mechanism to detect that underlying source data changed and automatically invalidate a cache built from it.

## Structured Streaming query produces unexpected or incomplete output

Almost always an output-mode mismatch for the specific query type (see Advanced/Interview Q&A) — confirm the output mode you chose is actually valid and semantically correct for your specific aggregation/windowing pattern, since Spark will sometimes run without erroring even when the chosen mode doesn't produce the output you actually intended. Second common cause: watermarking not configured (or configured with too short a threshold) for windowed aggregations on event-time data, causing late-arriving data to be dropped rather than included in its correct window.

## `pyspark` import errors or the driver/worker Python version mismatch

Check `PYSPARK_PYTHON` (see Installation) — if the driver and worker processes are using different Python installations (common on a machine with multiple Python versions installed), you can get confusing errors that look like a library problem but are actually a version-mismatch problem. Setting `PYSPARK_PYTHON` explicitly to your intended Python (ideally your venv's) resolves this class of issue directly.

## `df.show()` output looks truncated or columns are cut off

This is expected, default display behavior, not a bug — `show()` truncates long string values and wide DataFrames by default for readable console output. Use `df.show(truncate=False)` to see full values, and `df.show(n, vertical=True)` for wide DataFrames where horizontal display is hard to read regardless of truncation settings.
