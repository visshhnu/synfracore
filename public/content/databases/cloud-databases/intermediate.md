# Cloud Databases — Intermediate

## Aurora's storage-compute separation: what actually makes it different from RDS Postgres

Standard RDS Postgres couples compute and storage in the traditional way — the database engine and its storage volume are tightly bound to one instance. Aurora separates them: a distributed, log-structured storage layer spans multiple Availability Zones independently of the compute layer, and the database engine writes only redo log records to that storage layer rather than full data pages:

```
Traditional (RDS Postgres):    Compute instance ↔ single EBS volume
                                (storage tied to one instance's lifecycle)

Aurora:                        Compute instance ↔ distributed storage
                                (storage layer replicated across 3 AZs,
                                 independent of any single compute instance)
```
The practical consequences worth knowing beyond "it's fast": failover is faster because a new compute instance can attach to the existing, already-replicated storage layer rather than waiting for a traditional replica to catch up from a lag; read replicas share the same underlying storage rather than each maintaining their own full copy, which is both faster to provision and avoids replica-storage-lag in the way traditional read replicas can experience; and Aurora specifically bills storage and I/O separately from compute in a way that rewards workloads with a stable dataset size but variable query load, and can cost more than expected for I/O-heavy workloads that weren't budgeted with Aurora's per-request I/O pricing in mind.

## DynamoDB partition key design: the decision that determines everything else

DynamoDB's entire performance model depends on data being spread evenly across partitions — a poorly chosen partition key creates a **hot partition**, where one partition receives disproportionate traffic while others sit idle, throttling performance regardless of how much total provisioned or on-demand capacity exists:

```
BAD partition key: a "status" field with only 3 possible values
  → all "active" records land on effectively one partition,
    no matter how much capacity is provisioned

GOOD partition key: a naturally high-cardinality field, like user_id
  → traffic spreads evenly across many partitions
```
```python
# A common pattern for time-series data — avoid a hot partition
# by adding a random or time-bucketed suffix to distribute writes
partition_key = f"{device_id}#{date.today().isoformat()}"
```
The general principle: choose a partition key with enough distinct values that write/read traffic distributes evenly across your actual query patterns — a key with low cardinality (few distinct values) will create hot partitions no matter how the rest of the schema is designed, and this decision is genuinely difficult to change later without a full data migration, making it worth getting right at design time rather than treating it as an implementation detail to fix once a problem appears.

## Cosmos DB / Spanner: multi-region writes as a genuinely distinct category

Most databases — including most "multi-region" relational setups — support multi-region *reads* via replicas, with writes still going to one primary region. Cosmos DB and Spanner offer something categorically different: multi-region **writes**, where an application can write to whichever region is geographically closest to the user, with the database handling conflict resolution and consistency guarantees across regions automatically:

```
Single-primary multi-region (most databases):
  Writes → always to primary region → replicated out to other regions for reads

True multi-region writes (Cosmos DB / Spanner):
  Writes → accepted in any configured region → synchronized/resolved across all
```
This genuinely matters for a global, latency-sensitive application (a user in Tokyo writing to a database whose only write-capable region is in Virginia pays real, unavoidable cross-continent latency on every write) — but it's also a meaningfully more complex consistency model to reason about correctly, and comes at real additional cost. Reaching for this category specifically because "global" sounds like the right scale, without an actual measured latency requirement driving it, is a common over-engineering trap — most applications, even genuinely global ones, are well served by a single write region with read replicas closer to users, and should only move to true multi-region writes once write latency to a single region is a confirmed, measured problem.

## Migration tooling: schema compatibility as the real early risk

Moving from a self-managed database (or a different engine entirely — Oracle/SQL Server to Postgres/MySQL) to a managed cloud database is rarely just "copy the data" — schema and behavior compatibility is usually the larger, earlier risk:

```bash
# AWS Schema Conversion Tool — assess compatibility before migrating data
# Identifies proprietary features (Oracle PL/SQL packages, SQL Server-specific
# functions) that don't have a direct equivalent in the target engine and
# need manual rewriting, not automatic conversion
```
Running a schema conversion assessment *before* committing to a migration timeline is what surfaces the real scope of manual rewrite work early — proprietary stored procedures, vendor-specific functions, and engine-specific data types are the actual source of migration delays far more often than the bulk data transfer itself, which tools like AWS DMS handle largely automatically. Underestimating this step is one of the most common causes of a database migration running significantly over its original timeline.

## Cutover strategy: big-bang vs. dual-write

- **Big-bang** — a defined maintenance window, application stopped, final data sync completed, traffic cut over to the new database, application restarted; simpler to reason about, but requires accepting real downtime proportional to final sync time
- **Dual-write** — the application writes to both old and new databases during a transition period, with reads gradually shifted to the new database as confidence builds; avoids a hard downtime window, but is meaningfully more complex to implement correctly (keeping both databases genuinely consistent during the transition is real engineering work, not just a config flag) and carries its own risk of subtle data divergence if not implemented carefully

The right choice depends mostly on how much downtime is actually acceptable — a system with a well-understood, bounded low-traffic maintenance window (an internal tool, an off-peak batch system) is often better served by the simplicity of big-bang; a system where even a short planned downtime is unacceptable (a customer-facing production service with global traffic) more often justifies dual-write's added complexity.
