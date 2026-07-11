# Cloud Data Warehouses — Intermediate

## Choosing partition and clustering keys deliberately

Partitioning (covered on Fundamentals) handles the "which large chunk of the table do I need" question — **clustering** (Snowflake's term; BigQuery calls it clustering too, Redshift calls it sort keys) handles finer-grained ordering *within* a partition, for queries filtering on a second, high-cardinality column:

```sql
-- BigQuery — partition by date (coarse), cluster by customer_id (fine)
CREATE TABLE orders (
  order_id INT64,
  order_date DATE,
  customer_id INT64,
  revenue FLOAT64
)
PARTITION BY order_date
CLUSTER BY customer_id;
```
A query filtering on both `order_date` and `customer_id` benefits from both together — partition pruning eliminates irrelevant date ranges first, then clustering lets the engine skip further within the remaining partitions by keeping rows with the same `customer_id` physically co-located. The practical guidance: partition by the column most queries filter on for broad date-range narrowing (almost always a date/timestamp column), and cluster by the next most commonly filtered high-cardinality column — getting this pairing wrong (clustering by a low-cardinality column, for instance) provides little real benefit over not clustering at all.

## Storage-compute separation: what it actually buys you operationally

Snowflake, BigQuery, and Redshift Serverless all separate storage (where data physically lives) from compute (the processing power that runs queries against it) — this isn't just a cost model detail, it changes real operational behavior:

```
Traditional cluster-based warehouse:
  Fixed cluster size → compute and storage scale together →
  scaling for a big query means resizing the whole cluster

Storage-compute separated:
  Storage grows independently → compute ("virtual warehouses" in
  Snowflake terms) spins up/down or scales independently per workload
```
The practical consequence: a genuinely heavy analytical query can spin up a larger, temporary compute cluster just for that query, without affecting or resizing the compute serving normal dashboard traffic — multiple independent compute clusters can query the *same* underlying stored data simultaneously, at different sizes, for different workloads (a BI dashboard's compute separate from a data science team's ad-hoc heavy query compute), without contention between them. This is a meaningfully different operational model from a traditional fixed cluster, where a single heavy query competing for the same shared compute resources as everything else is a real, common source of contention and unpredictable performance for unrelated workloads.

## Semi-structured data: querying JSON/VARIANT without a rigid upfront schema

```sql
-- Snowflake — querying a VARIANT column containing JSON directly
SELECT
  order_id,
  raw_data:customer:name::STRING AS customer_name,
  raw_data:items[0]:sku::STRING AS first_item_sku
FROM raw_orders;

-- BigQuery — similar pattern with JSON functions
SELECT
  order_id,
  JSON_VALUE(raw_data, '$.customer.name') AS customer_name
FROM raw_orders;
```
Modern warehouses support querying semi-structured data (JSON, Avro, Parquet nested structures) directly via native functions, without requiring a rigid, fully-flattened schema defined upfront — genuinely valuable when ingesting from a source with a schema that evolves or varies (an API response, an event-tracking payload) where forcing a fully fixed schema at ingestion time would break on every source-side change. The tradeoff worth knowing: querying deeply nested/semi-structured data directly is typically slower than querying an equivalent fully-flattened, strongly-typed column, since the engine has to parse the semi-structured value at query time rather than reading a pre-typed column directly — a common, sound pattern is landing data in its raw semi-structured form, then using dbt to flatten frequently-queried fields into proper typed columns in staging models, getting query performance where it matters most while retaining ingestion flexibility for the raw layer.

## Query optimization: reading and acting on a query execution plan

```sql
-- BigQuery — check estimated bytes before running, using dry run
-- (most warehouses have an equivalent "explain" or dry-run capability)
```
Before running a potentially expensive query against a large table, checking the estimated bytes/cost via a dry-run or execution plan preview — rather than discovering the actual cost only after the query completes and the bill reflects it — is a genuinely valuable habit, especially in an environment where query cost is billed per-bytes-scanned. A query plan also reveals whether partition pruning and clustering are actually being used as intended — a query that was designed to filter on the partition column but accidentally applies that filter after a join or subquery in a way that defeats pruning is a common, real performance bug that's invisible without actually checking the plan, not something you'd catch just by reading the SQL and assuming it's correct.

## When NOT to use a data warehouse: recognizing the wrong tool

A data warehouse is optimized for exactly the pattern covered above — large aggregate queries across historical data — and is a genuinely poor fit for the opposite pattern: frequent, small, single-row lookups and updates (an application's live transactional data), which is what an OLTP database (Postgres, MySQL) is built for instead. Using a data warehouse as an application's primary transactional database is a common architectural mismatch — warehouse query latency (often seconds, not milliseconds, even for a simple lookup) and per-query billing models are fundamentally unsuited to serving live application requests. The correct pattern keeps operational data in an OLTP database and periodically loads/syncs it into the warehouse for analytical use — recognizing which category a given workload actually falls into, the same OLTP-vs-OLAP distinction covered in this academy's Performance Tuning content, is the first design decision, not something to discover after building the wrong architecture.
