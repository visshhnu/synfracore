# Apache Cassandra Overview

## What is Cassandra?

Apache Cassandra is an open-source, distributed, wide-column NoSQL database originally developed at Facebook and open-sourced in 2008. It is now maintained by the Apache Software Foundation. Cassandra is designed for handling very large amounts of data across many commodity servers with no single point of failure.

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
