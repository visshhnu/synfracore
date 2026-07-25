# Cassandra — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Query-Driven Schema Design for a Real Domain

**Level:** Beginner-Intermediate | **Time:** 2 days

Design a Cassandra schema for a realistic domain (a messaging app, an IoT sensor platform, or an activity feed) starting from the queries you need to serve, not from an ER diagram — this is the core discipline Cassandra schema design actually requires.

### Steps

1. Write down every query pattern your application actually needs first (e.g. "get the last 50 messages in a conversation, newest first")
2. Design one table per query pattern, choosing partition and clustering keys that make each query a single-partition read — deliberately denormalize and duplicate data across tables where needed, since Cassandra has no JOINs
3. Implement the schema with appropriate data types, and use bucketing (e.g. partitioning by `(sensor_id, date)` rather than `sensor_id` alone) for any naturally unbounded partition
4. Load realistic data volume and confirm each query actually hits a single partition (not `ALLOW FILTERING`)
5. Write a README explaining, for each table, which specific query it exists to serve

### Skills Demonstrated

- Query-first (not entity-first) schema design, Cassandra's core discipline
- Deliberate denormalization with a clear justification per table
- Partition sizing and bucketing to avoid hot/unbounded partitions

### GitHub Repo Name

`cassandra-query-driven-schema`

---

## Project 2: Time-Series Ingestion with TTL and Compaction Tuning

**Level:** Intermediate | **Time:** 2-3 days

Build a realistic time-series ingestion pipeline (IoT sensor readings or application metrics) and tune it the way a real production Cassandra deployment would be tuned.

### Steps

1. Design a bucketed time-series table (e.g. `PRIMARY KEY ((device_id, day), reading_time)`) and set an appropriate `default_time_to_live` for your domain's real retention needs
2. Write a load generator that simulates realistic write volume across many partitions (not just one device/sensor) to avoid an artificially skewed test
3. Set `TimeWindowCompactionStrategy` on the table and explain in your README why it's the right choice for time-series + TTL data specifically, versus the default `SizeTieredCompactionStrategy`
4. Query recent data and confirm via `TRACING ON` that the query is hitting a bounded number of partitions/SSTables, not scanning broadly
5. Document what happens to disk usage over time as TTL'd data expires and gets compacted away

### Skills Demonstrated

- Time-series-specific schema design (bucketing, TTL)
- Choosing and justifying a compaction strategy for a specific workload
- Verifying query behavior with `TRACING`, not just assuming it's correct

### GitHub Repo Name

`cassandra-timeseries-ingestion`

---

## Project 3: Multi-Node Cluster with Consistency Level Tradeoffs

**Level:** Advanced | **Time:** 3-4 days

Stand up a real multi-node Cassandra cluster (Docker Compose is fine) and actually exercise consistency-level tradeoffs, not just configure a single node.

### Steps

1. Run a 3-node cluster with `replication_factor: 3` and confirm via `nodetool status` and `nodetool ring` that data is actually distributed across nodes
2. Write with `CONSISTENCY ONE` and immediately read with `CONSISTENCY ONE` from a different node — deliberately trigger and document a case where you read stale data
3. Repeat with `CONSISTENCY QUORUM` for both reads and writes, and confirm you no longer see the stale-read behavior — explain in your README why `R + W > RF` guarantees this
4. Take a node down (`docker stop`) and confirm which consistency levels still succeed and which start failing — this demonstrates the real availability/consistency tradeoff, not just the theory
5. Run `nodetool repair` after bringing the node back and document what it actually does

### Skills Demonstrated

- Real, hands-on understanding of consistency-level tradeoffs, not just definitions
- Multi-node cluster operations (`nodetool status`/`ring`/`repair`)
- Demonstrating the availability/consistency tradeoff with actual failure injection, not just theory

### GitHub Repo Name

`cassandra-consistency-cluster-lab`

---

## Tips for Great Cassandra Projects

**Design from queries, not entities.** A schema that looks like a normalized relational design (with implied joins) is the single most common sign a Cassandra project wasn't actually designed the way Cassandra requires.

**Show real distributed behavior, not just single-node CRUD.** `nodetool status`, a genuine multi-node cluster, and a real consistency-level tradeoff demonstrated (not just described) are what separate a Cassandra project from "I ran some CQL commands."

**Cassandra has no JOINs and no foreign keys — don't reach for SQL-shaped solutions.** If a project design implies a JOIN across tables, that's a signal the schema needs to be denormalized differently, not that Cassandra is missing a feature.

## Portfolio Checklist

- [ ] At least one project's schema is explicitly justified by the query patterns it serves, not by entity relationships
- [ ] At least one project demonstrates a real consistency-level tradeoff with actual evidence (a stale read reproduced and then fixed)
- [ ] At least one project runs against a genuine multi-node cluster, not a single instance
- [ ] Each README explains the reasoning, not just the final schema
- [ ] You can walk through any of these projects for 5+ minutes without notes
