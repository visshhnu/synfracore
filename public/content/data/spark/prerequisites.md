# Apache Spark — Prerequisites

Spark is a distributed processing framework layered on top of skills you need first — trying to learn Spark's distributed-computing concepts without the underlying data and programming fundamentals makes everything feel more mysterious than it is.

## What you need first

- **Solid Python or Scala** (Python/PySpark is the far more common entry point) — comfortable with functions, list/dict operations, and basic OOP. Spark's DataFrame API will feel familiar to anyone comfortable with `pandas`, but you need general programming fluency first, not pandas specifically.
- **SQL, genuinely** — Spark SQL is a first-class part of the framework, and even the DataFrame API's operations (`filter`, `groupBy`, `join`) map directly onto SQL concepts. If SQL joins and aggregations aren't comfortable yet, that's a real prerequisite gap, not something Spark teaches you as a side effect.
- **Basic understanding of what "distributed" actually means** — that data and computation are split across multiple machines, that this introduces coordination overhead that doesn't exist on a single machine, and that not every operation parallelizes equally well. This page's Fundamentals section builds on this, but a rough conceptual starting point helps.
- **Comfort with the command line and basic cluster/cloud concepts** — running Spark for real (not just in a local single-machine mode for learning) involves cluster managers and cloud infrastructure; you don't need deep infrastructure expertise, but total unfamiliarity with concepts like a "cluster" or a "node" will slow you down.

## Not required to start

- **Deep Hadoop/HDFS knowledge** — Spark can run on top of Hadoop's HDFS, but doesn't require it; modern Spark deployments frequently read directly from cloud object storage (S3, GCS, ADLS) instead. Understanding HDFS deeply is not a prerequisite, though basic familiarity with distributed storage concepts is helpful context.
- **Prior "big data" experience** — this page assumes you're learning Spark as your entry point into large-scale data processing, not that you've already worked with a different big-data tool first.
- **Machine learning background** — Spark has an ML library (MLlib), but that's one part of a much broader framework; you can learn and use Spark extensively for data engineering (ETL, transformations, aggregations) without any ML knowledge at all.
