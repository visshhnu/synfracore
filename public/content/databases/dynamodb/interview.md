# DynamoDB Interview Questions

## Core Concepts

**Q: What is DynamoDB? When to choose it?**

DynamoDB is AWS's fully managed NoSQL key-value and document database. Serverless — no instances to manage, automatic scaling, single-digit millisecond performance at any scale.

**Choose DynamoDB when:**
- Need consistent single-digit ms latency at any scale
- Access patterns are known and simple (get by key, query by partition)
- Want serverless/fully managed (no capacity planning)
- Need automatic scaling for unpredictable traffic
- Multi-region active-active replication (Global Tables)

**Don't use when:**
- Complex queries with JOINs needed
- Flexible ad-hoc queries (use RDS/Aurora instead)
- Strong ACID transactions across many items (limited support)
- Analytical queries (use Redshift or Athena instead)

---

**Q: DynamoDB data model — partition key, sort key, indexes.**

```python
import boto3

dynamodb = boto3.resource('dynamodb')

# Table with composite key: PK + SK
# PK = partition key (hash), SK = sort key (range)
table = dynamodb.create_table(
    TableName='Orders',
    KeySchema=[
        {'AttributeName': 'customerId', 'KeyType': 'HASH'},   # Partition key
        {'AttributeName': 'orderId', 'KeyType': 'RANGE'}       # Sort key
    ],
    AttributeDefinitions=[
        {'AttributeName': 'customerId', 'AttributeType': 'S'},
        {'AttributeName': 'orderId', 'AttributeType': 'S'},
        {'AttributeName': 'orderDate', 'AttributeType': 'S'},
    ],
    # GSI: query by different attributes
    GlobalSecondaryIndexes=[{
        'IndexName': 'OrdersByDate',
        'KeySchema': [
            {'AttributeName': 'customerId', 'KeyType': 'HASH'},
            {'AttributeName': 'orderDate', 'KeyType': 'RANGE'}
        ],
        'Projection': {'ProjectionType': 'ALL'}
    }]
)
```

**Key concepts:**
- **Partition key (PK)**: Determines which partition stores the item. High cardinality = even distribution.
- **Sort key (SK)**: Within a partition, items sorted by SK. Enables range queries.
- **GSI (Global Secondary Index)**: New PK/SK pair — query patterns not covered by table key.
- **LSI (Local Secondary Index)**: Same PK, different SK — must be defined at table creation.

---

**Q: DynamoDB single-table design.**

```python
# ENTITY TYPE OVERLOADING — store multiple entity types in one table
# PK = partition key, SK = sort key
# Pattern: PK="USER#123", SK="METADATA" → user info
#           PK="USER#123", SK="ORDER#456" → user's order
#           PK="ORDER#456", SK="ITEM#789" → order line item

# Benefits: single request fetches user + all orders (no JOIN)
# Get all items for user:
table.query(
    KeyConditionExpression=Key('PK').eq('USER#123')
)

# Get user metadata only:
table.get_item(Key={'PK': 'USER#123', 'SK': 'METADATA'})

# Get user's orders by date range:
table.query(
    KeyConditionExpression=Key('PK').eq('USER#123') &
                           Key('SK').between('ORDER#2024-01', 'ORDER#2024-12')
)
```

---

**Q: DynamoDB capacity modes and auto-scaling.**

**Provisioned capacity**: You specify read/write capacity units (RCU/WCU). Cheaper for predictable traffic. Auto-scaling adjusts within bounds.
- 1 RCU = 1 strongly consistent read of ≤4KB/second
- 1 WCU = 1 write of ≤1KB/second

**On-demand capacity**: Pay per request. No capacity planning. More expensive at steady scale. Best for unpredictable traffic.

**DynamoDB Accelerator (DAX)**: In-memory cache, microsecond read latency. Sit in front of DynamoDB for read-heavy workloads.

---

**Q: DynamoDB streams and event-driven patterns.**

```python
# DynamoDB Streams: capture every change (INSERT, MODIFY, REMOVE)
# → Trigger Lambda → fanout to other services

# Use cases:
# - Replicate to Elasticsearch for search
# - Audit log (who changed what, when)
# - Trigger notifications on certain changes
# - Cross-region replication (Global Tables uses streams internally)

# Global Tables: multi-region active-active
# Create table → enable Global Tables → add replica regions
# Writes replicate in < 1 second across regions
# Use for: disaster recovery, low-latency global reads/writes
```

## Revision Notes
```
DYNAMODB: AWS managed NoSQL. Serverless. Single-digit ms at any scale.
Use for: known access patterns, key-value, auto-scaling, global tables
NOT for: complex queries, joins, ad-hoc analytics

DATA MODEL:
PK (partition key): determines storage partition, must be high cardinality
SK (sort key): range queries within partition
GSI: alternate PK/SK for different query patterns (can add after creation)
LSI: same PK, different SK (must define at table creation)

SINGLE-TABLE DESIGN: all entities in one table
PK="USER#123" SK="METADATA" | PK="USER#123" SK="ORDER#456"
Enables fetching related data in single request

CAPACITY:
Provisioned: specify RCU/WCU (cheaper, predictable) | On-demand: pay per request
1 RCU = 1 strong read ≤4KB | 1 WCU = 1 write ≤1KB
DAX: microsecond cache layer for reads

STREAMS: capture INSERT/MODIFY/REMOVE → trigger Lambda → event-driven
GLOBAL TABLES: multi-region active-active, <1s replication
```
