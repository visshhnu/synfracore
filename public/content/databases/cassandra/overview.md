# Apache Cassandra Overview

**Before you start:** basic familiarity with distributed systems concepts (what a node and replication mean) helps but isn't required — the ring architecture and consistency levels are explained from scratch below. No prior NoSQL experience is assumed.

## What is Cassandra?

Apache Cassandra is an open-source, distributed, wide-column NoSQL database originally developed at Facebook and open-sourced in 2008. It is now maintained by the Apache Software Foundation. Cassandra is designed for handling very large amounts of data across many commodity servers with no single point of failure.

## Why This Exists (The Hook)

A traditional relational database has a primary node — if it goes down, writes stop until a replica is promoted, and that failover takes time. For a system that genuinely cannot ever stop accepting writes (Facebook's original use case was the inbox-search feature, where losing writes for even a minute at global scale was unacceptable), that's a real problem. Cassandra exists to remove the single point of failure entirely: every node is equal, any node can accept a write, and data is automatically replicated across multiple nodes and even multiple data centers — the tradeoff is giving up the convenience of joins and ad-hoc queries that a relational database gives you for free.

**Analogy** — Think of a traditional database like a single post office that's the only place you can mail a letter from — efficient, but if it closes, nobody in town can send mail that day. Cassandra is like a city with mailboxes on every corner, all connected to the same postal network — you can drop a letter in any box (write to any node), and the system routes it to wherever it actually needs to be stored, with copies kept at multiple sorting facilities (replicas) so no single facility going offline stops the mail.

**Try it (2 minutes)** — Reason through why Cassandra queries must include the partition key, without running anything: in a relational database, `WHERE event_time > '2025-06-01'` can scan an index across the whole table no matter which machine the data lives on, because it's all on one machine (or a small cluster the query planner coordinates). In Cassandra, data is physically scattered across potentially hundreds of nodes based on a hash of the partition key. If you asked for `WHERE event_time > '2025-06-01'` *without* specifying `device_id`, how would Cassandra know which of those hundreds of nodes to even ask?

## Architecture

```
RING ARCHITECTURE:
  All nodes are equal — no master/slave
  Data distributed using consistent hashing around a ring
  Each node is responsible for a range of tokens
  Virtual nodes (vnodes): each physical node holds multiple token ranges
    → More even distribution, easier to add/remove nodes

REPLICATION:
  Replication Factor (RF): number of copies of each partition
  RF=3 typical: data exists on 3 nodes
  NetworkTopologyStrategy: specify RF per datacenter
  SimpleStrategy: single datacenter, not for production

COORDINATOR:
  Any node can be coordinator for any request
  Client connects to any node → that node routes request
  Coordinator determines which nodes own the data (replicas)

CONSISTENCY LEVELS:
  Write: ONE, TWO, THREE, QUORUM, LOCAL_QUORUM, EACH_QUORUM, ALL
  Read:  ONE, TWO, THREE, QUORUM, LOCAL_QUORUM, ALL, SERIAL, LOCAL_SERIAL
  Strong consistency: R + W > RF (typically QUORUM + QUORUM with RF=3)
```

## Data Model

```
KEYSPACE → TABLE → ROW

CREATE KEYSPACE mykeyspace
  WITH replication = {'class': 'NetworkTopologyStrategy', 'us-east': 3, 'eu-west': 3};

USE mykeyspace;

-- Wide-column: each row can have different columns
CREATE TABLE sensor_data (
  device_id UUID,           -- partition key
  event_time TIMESTAMP,     -- clustering key (sort order)
  temperature DOUBLE,
  humidity DOUBLE,
  PRIMARY KEY (device_id, event_time)
) WITH CLUSTERING ORDER BY (event_time DESC);

-- Query MUST include partition key
SELECT * FROM sensor_data WHERE device_id = 550e8400-e29b-41d4-a716-446655440000;
SELECT * FROM sensor_data WHERE device_id = ? AND event_time > '2025-06-01';

-- Composite partition key (spreads load across more nodes)
CREATE TABLE time_series (
  sensor_id TEXT,
  month TEXT,               -- bucket to prevent hot partitions
  event_time TIMESTAMP,
  value DOUBLE,
  PRIMARY KEY ((sensor_id, month), event_time)  -- (sensor_id, month) = partition key
);
```

## When to Use (and Not Use) Cassandra

```conceptgrid
{
  "boxes": [
    { "title": "Time-Series Data", "description": "IoT, metrics, logs, events", "color": "blue" },
    { "title": "Write-Heavy Workloads", "description": "Millions of writes per second", "color": "purple" },
    { "title": "Multi-Region Active-Active", "description": "Never-down requirements, 99.999% availability", "color": "amber" },
    { "title": "Naturally Partitioned Data", "description": "Data keyed by something like user_id", "color": "green" }
  ]
}
```

```
USE CASSANDRA FOR:
  Time-series data (IoT, metrics, logs, events)
  Write-heavy workloads (millions of writes/second)
  Data that's naturally partitioned by a key (user data by user_id)
  Multi-region active-active requirements
  Never-down requirements (99.999% availability)

DO NOT USE FOR:
  Ad-hoc queries (no secondary index flexibility like SQL)
  Joins across tables (no joins — denormalize instead)
  ACID transactions across multiple partitions (use SQL database)
  Small data (overhead not worth it below millions of rows)
  Aggregations across all data (full scans are expensive)

USED BY: Netflix, Apple, Instagram, Uber, Facebook (original), Discord
```

## Study Resources
- **DataStax Academy** (academy.datastax.com) — free Cassandra courses
- **Cassandra: The Definitive Guide** (O'Reilly) — comprehensive reference
- **Apache Cassandra documentation** (cassandra.apache.org/doc) — official
- **DataStax Cassandra Driver docs** — Python, Java, Node.js client libraries
