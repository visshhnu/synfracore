# Apache Spark — Learning Roadmap

## Stage 1 — Python/SQL fluency, if not already solid (1-2 weeks)

Don't start Spark-specific learning without genuine comfort in both (see Prerequisites) — Spark's DataFrame API assumes you can already think in terms of filters, joins, and aggregations; it doesn't teach these from zero.

## Stage 2 — Lazy evaluation and the DataFrame API, hands-on (1 week)

Work through Fundamentals in local mode (see Installation). The single most important thing to internalize early: build a chain of transformations, and deliberately observe that nothing happens until an action triggers it — this mental model is foundational to everything else and worth spending real time making intuitive rather than just conceptually understood.

## Stage 3 — Reading/writing real data, and understanding Parquet (3-5 days)

Practice reading and writing Parquet, CSV, and JSON, and deliberately compare query performance reading the same dataset in CSV vs. Parquet format (Fundamentals explains why Parquet wins; seeing the actual timing difference makes it concrete).

## Stage 4 — Joins, shuffles, and caching (1-2 weeks)

This is where most of Spark's genuinely non-obvious performance behavior lives (Intermediate) — practice a standard join, then a broadcast join on the same data, and compare execution time and the Spark UI's shuffle statistics between them. Practice caching deliberately on a DataFrame you reuse multiple times, and confirm via timing that it actually helped.

## Stage 5 — Window functions and skew handling (1 week)

Window functions (Intermediate) are a distinct, non-obvious API from `groupBy` — practice running totals and rankings specifically, since these are common real interview and production patterns. If you can construct or find a genuinely skewed dataset, practice recognizing skew in the Spark UI and applying a salting mitigation.

## Stage 6 — Structured Streaming (1-2 weeks)

Build a simple streaming pipeline (Advanced) against a source you can control (a simple file-based stream is easier to start with than setting up Kafka just for learning) — get comfortable with the output-mode distinction specifically, since choosing the wrong one silently produces incorrect results rather than an obvious error.

## Stage 7 — Production concerns: tuning, execution plans, Delta Lake (ongoing)

Practice reading `explain()` output and the Spark UI on a real, moderately complex query — this is a skill that only develops through repeated exposure to real execution plans, not from reading about it once. If your work involves data lake architecture, build a small Delta Lake table and practice its ACID/upsert capabilities directly (Advanced).

## What "done" looks like at each level

- **Junior-ready**: understands lazy evaluation precisely, can write DataFrame transformations and read/write Parquet correctly.
- **Mid-level-ready**: understands shuffles and can apply broadcast joins deliberately, uses caching correctly (not reflexively), can use window functions for running totals/rankings.
- **Senior-ready**: can read a Spark execution plan and UI to diagnose a real performance problem, understands AQE and when manual tuning is still needed, has built a real streaming pipeline and a Delta Lake/lakehouse pattern.
