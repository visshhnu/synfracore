# Apache Spark — Getting Set Up

## Fastest start: PySpark via pip (local mode, no cluster needed)

```bash
python3 -m venv spark-env
source spark-env/bin/activate      # Windows: spark-env\Scripts\activate

pip install pyspark

# Requires a Java runtime — Spark runs on the JVM even when driven from Python
java -version   # needs Java 8, 11, or 17 depending on your Spark version — check compatibility
```

```python
# Verify it works — this runs Spark in local mode, using your own machine
# as a single-node "cluster," which is exactly right for learning
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("verify-install").getOrCreate()
df = spark.createDataFrame([(1, "test")], ["id", "value"])
df.show()
spark.stop()
```

## Why local mode is the right way to learn, not a lesser version

Spark's local mode runs the exact same DataFrame/SQL API you'd use on a real multi-machine cluster — the code you write and test locally is largely the same code that runs distributed later. This matters directly: you can learn Spark's actual programming model on your laptop, without provisioning any real cluster infrastructure, and the concepts transfer directly once you do move to a real cluster.

## Databricks Community Edition — a free, hosted alternative

If you'd rather not manage a local Java/Python environment, Databricks (founded by Spark's original creators) offers a free community tier with a notebook interface and a small managed cluster — a genuinely easy on-ramp that avoids local environment setup entirely, and it's the environment a meaningful share of real-world production Spark work actually runs on, so familiarity with it has direct practical value.

## Common early setup issues

- **Java version mismatch** — Spark has specific Java version compatibility requirements that change across Spark releases; a Java version that's too new or too old for your installed PySpark version is a common source of cryptic startup errors. Check your specific PySpark version's documented Java compatibility before assuming your existing Java install will work.
- **`PYSPARK_PYTHON` environment variable** — if you have multiple Python installations, Spark's worker processes can end up using a different Python than your driver process, causing confusing version-mismatch errors; setting `PYSPARK_PYTHON` explicitly to your venv's Python resolves this.
- **Windows-specific**: PySpark on Windows commonly needs `winutils.exe` (a Hadoop compatibility binary) available and `HADOOP_HOME` set, even for pure local-mode use with no real Hadoop involved — a well-known, slightly awkward Windows-specific setup step.
