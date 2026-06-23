# AWS DynamoDB Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **AWS Certified Database Specialty (DBS-C01)** | AWS | $300 | MCQ, 180 min |
| **AWS Certified Developer Associate (DVA-C02)** | AWS | $150 | MCQ, 130 min |
| **AWS Solutions Architect Associate** | AWS | $150 | MCQ — covers DynamoDB |

DynamoDB is a major topic in AWS Database Specialty and Developer Associate exams.

---

## Core Concepts and Code

```python
import boto3, time
from boto3.dynamodb.conditions import Key, Attr

table = boto3.resource('dynamodb', region_name='us-east-1').Table('Orders')

# PUT (create or full replace)
table.put_item(Item={
    'userId': 'U123', 'orderId': 'O456',
    'amount': 99.99, 'status': 'pending',
    'ttl': int(time.time()) + 86400 * 30   # auto-delete in 30 days
})

# GET
item = table.get_item(Key={'userId': 'U123', 'orderId': 'O456'}).get('Item')

# UPDATE with condition
table.update_item(
    Key={'userId': 'U123', 'orderId': 'O456'},
    UpdateExpression='SET #s = :s',
    ExpressionAttributeNames={'#s': 'status'},   # 'status' is a reserved word
    ExpressionAttributeValues={':s': 'shipped'},
    ConditionExpression=Attr('status').eq('pending')  # optimistic locking
)

# QUERY — efficient, uses partition key (always prefer over scan)
response = table.query(
    KeyConditionExpression=Key('userId').eq('U123') &
                           Key('orderId').begins_with('O')
)

# SCAN — avoid! reads entire table partition by partition
response = table.scan(
    FilterExpression=Attr('status').eq('pending') & Attr('amount').gt(50)
)
```

---

## Key Exam Concepts

```
CAPACITY MODES:
  On-demand:    auto-scales, pay per request, no capacity planning needed
  Provisioned:  specify RCU/WCU, cheaper for predictable traffic patterns
  1 RCU  = 1 strongly consistent read of up to 4 KB/sec
          (0.5 RCU for eventually consistent reads)
  1 WCU  = 1 write of up to 1 KB/sec

INDEXES:
  GSI (Global Secondary Index):
    Entirely new partition key + optional sort key
    Can be added or deleted after table creation
    Only eventually consistent reads
  LSI (Local Secondary Index):
    Same partition key as base table, different sort key
    Must be defined at table creation time (cannot add later)
    Supports strongly consistent reads

SINGLE-TABLE DESIGN:
  Store multiple entity types in one table using key overloading
  Example: PK="USER#123" SK="PROFILE"
           PK="USER#123" SK="ORDER#2024-01"
  One Query returns entity + all related items (no joins needed)

STREAMS + LAMBDA (event-driven patterns):
  DynamoDB Streams captures INSERT / MODIFY / REMOVE events
  Trigger Lambda for: search sync, notifications, audit log, cache invalidation

GLOBAL TABLES:  multi-region active-active, sub-second replication
DAX:            in-memory write-through cache, microsecond read latency
TTL:            auto-delete items based on a timestamp attribute (free feature)
```

---

## Study Resources

- **AWS Docs DynamoDB** (docs.aws.amazon.com/amazondynamodb) — comprehensive
- **The DynamoDB Book** by Alex DeBrie — best deep-dive paid resource
- **AWS Workshops catalog** — free hands-on DynamoDB labs
- **AWS Skill Builder** — free DynamoDB digital courses and labs

## Revision Notes
```
DYNAMODB: serverless, fully managed key-value + document store, single-digit ms

KEY DESIGN: partition key distributes data evenly (high cardinality required)
  Sort key enables range queries, sorting, and pagination within partition
  GSI: new PK/SK for alternate access patterns (add later)
  LSI: same PK, different SK — must define at table creation

CAPACITY: on-demand (variable cost, auto) vs provisioned (cheaper, auto-scaling)
SINGLE-TABLE: overload PK/SK with entity-type prefixes for efficient co-location

STREAMS -> Lambda: event-driven fanout for search, audit, notifications
GLOBAL TABLES: multi-region active-active with last-writer-wins conflict resolution
DAX: 10x read throughput boost as a managed in-memory cache layer
```
