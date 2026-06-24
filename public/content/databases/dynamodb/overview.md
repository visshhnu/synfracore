# DynamoDB Overview

## What is DynamoDB?

Amazon DynamoDB is a fully managed, serverless, NoSQL key-value and document database provided by AWS. It delivers single-digit millisecond performance at any scale and is used by companies like Amazon, Lyft, Airbnb, and Samsung for applications requiring high-throughput, low-latency data access.

## Core Concepts

```
TABLE: collection of items (like a table in SQL)
ITEM: a record in the table (like a row, up to 400KB)
ATTRIBUTE: a data element (like a column, but flexible — each item can differ)

PRIMARY KEY (uniquely identifies every item):
  Simple (hash): partition key only
    aws_region -> no sort key
  Composite (hash + range): partition key + sort key
    user_id (PK) + order_date (SK) -> enables range queries within a user

PARTITION KEY: determines which partition stores the item (hashed)
  Design for high cardinality → even distribution → avoid hot partitions
  
SORT KEY: determines order within a partition
  Enables: >, <, BETWEEN, begins_with queries on sort key
  Enables: rich query patterns within a single partition

CAPACITY MODES:
  Provisioned: specify Read Capacity Units (RCU) and Write Capacity Units (WCU)
    1 RCU = 1 strongly consistent read/sec of ≤4KB item (or 2 eventually consistent)
    1 WCU = 1 write/sec of ≤1KB item
    Use with Auto Scaling for variable traffic
  On-Demand: pay per request, no capacity planning
    Use for: unpredictable traffic, new applications
```

## Key Operations

```bash
# Create table
aws dynamodb create-table \
  --table-name Orders \
  --attribute-definitions \
    AttributeName=UserId,AttributeType=S \
    AttributeName=OrderDate,AttributeType=S \
  --key-schema \
    AttributeName=UserId,KeyType=HASH \
    AttributeName=OrderDate,KeyType=RANGE \
  --billing-mode PAY_PER_REQUEST

# Put item
aws dynamodb put-item --table-name Orders \
  --item '{"UserId":{"S":"user-123"},"OrderDate":{"S":"2025-06-24"},"Total":{"N":"99.99"}}'

# Get item (by exact primary key)
aws dynamodb get-item --table-name Orders \
  --key '{"UserId":{"S":"user-123"},"OrderDate":{"S":"2025-06-24"}}'

# Query (by partition key, optionally filter by sort key)
aws dynamodb query --table-name Orders \
  --key-condition-expression "UserId = :uid AND OrderDate BETWEEN :start AND :end" \
  --expression-attribute-values '{":uid":{"S":"user-123"},":start":{"S":"2025-01-01"},":end":{"S":"2025-12-31"}}'

# Scan (all items — expensive, avoid in production)
aws dynamodb scan --table-name Orders \
  --filter-expression "Total > :amount" \
  --expression-attribute-values '{":amount":{"N":"50"}}'
```

## Advanced Features

```
GLOBAL SECONDARY INDEX (GSI):
  Alternative access patterns (different PK + SK)
  Eventual consistency only | separate RCU/WCU from table
  Up to 20 GSIs per table

LOCAL SECONDARY INDEX (LSI):
  Same partition key, different sort key
  Must be created at table creation
  Up to 5 LSIs; shares table RCU/WCU; strongly consistent reads possible

STREAMS:
  Time-ordered sequence of item-level changes (24-hour retention)
  Trigger Lambda functions → event-driven patterns
  Use for: cross-region replication, audit logs, cache invalidation

GLOBAL TABLES:
  Multi-region, multi-active replication
  DynamoDB Streams + replication across selected regions
  Conflict resolution: last-writer-wins based on timestamps

TRANSACTIONS:
  TransactGetItems / TransactWriteItems
  ACID across up to 100 items in same or different tables
  Use for: order placement, financial transfers

TTL (Time to Live):
  Set expiration timestamp attribute on items
  DynamoDB automatically deletes expired items
  No charge for TTL deletes; items removed within 48 hours of expiry
```

## Study Resources
- **DynamoDB documentation** (docs.aws.amazon.com/dynamodb) — official
- **The DynamoDB Book** (Alex DeBrie) — best single resource for DynamoDB design
- **DynamoDB Design Patterns** (AWS re:Invent sessions on YouTube) — real examples
- **AWS SAA-C03 / DAS-C01** — certifications that include DynamoDB heavily
