# Apache Spark — Key Takeaways

- **Transformations are lazy, actions trigger execution** — the single most foundational mechanical concept; Spark optimizes the entire chain together, which is why performance and behavior can differ from what eager, line-by-line execution would produce.
- **Shuffles (network data movement to co-locate matching keys) are usually the most expensive part of a job** — minimizing unnecessary shuffles via broadcast joins and sensible partitioning is one of the highest-leverage performance skills.
- **Broadcast joins avoid shuffles entirely when one side is small enough to fit in memory on every worker** — a genuinely high-value, frequently-applicable optimization, not a niche technique.
- **DataFrames, not RDDs, are the default modern API** — schema-aware DataFrames let Catalyst's optimizer reason about and optimize your operations far more effectively than opaque RDD operations allow.
- **Parquet is the standard format for real reasons**: columnar storage, embedded schema, and predicate pushdown — not an arbitrary convention.
- **Caching only helps when a DataFrame is genuinely reused multiple times** — caching reflexively, without confirmed reuse, adds memory overhead with no corresponding benefit.
- **Data skew (uneven key distribution) makes one partition the bottleneck for the whole job** — visible directly in the Spark UI as dramatically uneven task timing; salting is the common mitigation, applied based on confirmed skew, not preemptively.
- **Structured Streaming's output modes (`complete`/`append`/`update`) are not interchangeable** — picking the wrong one for a given query type can silently produce semantically incorrect output rather than an obvious error.
- **The Spark UI and `explain()` are the actual diagnostic tools for performance problems** — reasoning about performance from code alone, without checking actual execution plans and stage/task timing, is guessing.
- **Databricks' Associate Developer certification is the most directly relevant credential for this specific technology** — and, per the exam's own design, rewards genuine hands-on experience over memorized API syntax.
