# Apache Spark — Portfolio Projects

## Project 1: CSV-to-Parquet ETL pipeline with a real performance comparison (Beginner)

Take a realistically-sized public dataset (hundreds of thousands to millions of rows), build a Spark job that reads the raw CSV, applies a few transformations, and writes partitioned Parquet output — then benchmark a representative query against both the original CSV and your Parquet output.

**What this demonstrates:** you understand *why* Parquet matters, not just that it's recommended. **What to show:** the actual benchmark numbers (query time against CSV vs. Parquet), not just the pipeline code.

## Project 2: Join optimization, demonstrated with evidence (Intermediate)

Join a large fact-style dataset against a small lookup/dimension table two ways — a standard join and an explicit broadcast join — and compare execution time and Spark UI shuffle statistics between them.

**What this demonstrates:** hands-on understanding of the shuffle cost and broadcast joins' real value, backed by evidence rather than description. **What to show:** Spark UI screenshots or exported stage statistics for both versions, side by side.

## Project 3: Window functions for a real analytical question (Intermediate)

Using a dataset with a natural time/customer dimension (transaction history, event logs), compute running totals, rankings, or rolling aggregations using window functions — answer a genuine analytical question (e.g., "each customer's cumulative spend over time" or "rank each product's sales within its category") rather than a toy example.

**What this demonstrates:** window functions applied to a real problem, which is a common, genuinely differentiating interview and production skill. **What to show:** the specific business question you answered and the window specification you used to answer it.

## Project 4: A real Structured Streaming pipeline (Advanced)

Build a streaming pipeline with a genuine source (file-based streaming or Kafka), an aggregation, and a sink — deliberately test and document the difference between `complete`, `append`, and `update` output modes on the same underlying query.

**What this demonstrates:** hands-on streaming experience, and specifically an understanding of output-mode semantics, which is where most real streaming mistakes happen. **What to show:** the pipeline code plus a short write-up of what changed in the output between each output mode on the same query — the comparison is the actual point.

## Project 5: Diagnose and fix data skew (Advanced)

Construct (or find) a dataset with genuine key skew, run a groupBy/join that surfaces the skew as a slow, uneven task in the Spark UI, then apply a salting mitigation and demonstrate the improvement.

**What this demonstrates:** advanced, hands-on performance debugging — this is a differentiated skill most portfolios don't show, since it requires actually diagnosing a real performance problem from the Spark UI, not just knowing skew exists conceptually. **What to show:** the Spark UI's task-timing view before and after the fix, showing the skewed task specifically and its resolution.
