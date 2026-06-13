# Apache Cassandra — Distributed NoSQL Database

Cassandra handles massive scale with no single point of failure. Originally built by Facebook for the Inbox feature, now used by Netflix, Apple, Instagram, Uber, and Discord for their most demanding workloads.

## Why Cassandra

```
Traditional database:         Cassandra:
One big server                Hundreds of equal nodes
Add bigger server (vertical)  Add more nodes (horizontal)
Single point of failure       No master — any node handles any request
Complex replication setup     Built-in multi-datacenter replication
Millisecond latency at scale  Sub-millisecond writes at any scale
```

## The CAP Theorem and Cassandra

Cassandra chooses **Availability + Partition Tolerance** over Consistency.
- Every write succeeds even if some nodes are down
- Every read returns a result even if data might be slightly stale
- You control the consistency level per query

:::info When to use Cassandra
- You need to write millions of rows per second
- Data must be available 24/7 even during datacenter failures
- Time-series data (IoT, metrics, logs, events)
- Global applications needing geo-distributed data
:::

## Data Model: Think About Queries First

```sql
-- SQL: Design tables, then write queries
-- Cassandra: Design tables AROUND your queries

-- Query: "Get all messages in a conversation, newest first"
CREATE TABLE messages_by_conversation (
    conversation_id UUID,
    message_time    TIMESTAMP,
    message_id      UUID,
    sender_id       UUID,
    content         TEXT,
    PRIMARY KEY (conversation_id, message_time, message_id)
) WITH CLUSTERING ORDER BY (message_time DESC);

-- Query: "Get latest readings from a sensor today"
CREATE TABLE sensor_readings (
    sensor_id    TEXT,
    date         DATE,
    reading_time TIMESTAMP,
    value        FLOAT,
    PRIMARY KEY ((sensor_id, date), reading_time)
) WITH CLUSTERING ORDER BY (reading_time DESC);
```
