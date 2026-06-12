# DynamoDB — Fundamentals

## Core Concepts

```
Table:          Collection of items (no fixed schema)
Item:           A record (like a row) — up to 400KB
Attribute:      A key-value pair within an item
Partition Key:  Required — determines which partition stores the item
Sort Key:       Optional — enables range queries within a partition
GSI:            Global Secondary Index — query on non-key attributes
LSI:            Local Secondary Index — alternate sort key, same partition
```

## Table Design

```python
import boto3
from boto3.dynamodb.conditions import Key, Attr

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')

# Create table
table = dynamodb.create_table(
    TableName='Orders',
    KeySchema=[
        {'AttributeName': 'userId',   'KeyType': 'HASH'},   # Partition key
        {'AttributeName': 'orderId',  'KeyType': 'RANGE'}   # Sort key
    ],
    AttributeDefinitions=[
        {'AttributeName': 'userId',   'AttributeType': 'S'},
        {'AttributeName': 'orderId',  'AttributeType': 'S'},
        {'AttributeName': 'status',   'AttributeType': 'S'},
        {'AttributeName': 'createdAt','AttributeType': 'S'},
    ],
    GlobalSecondaryIndexes=[
        {
            'IndexName': 'status-createdAt-index',
            'KeySchema': [
                {'AttributeName': 'status',    'KeyType': 'HASH'},
                {'AttributeName': 'createdAt', 'KeyType': 'RANGE'}
            ],
            'Projection': {'ProjectionType': 'ALL'}
        }
    ],
    BillingMode='PAY_PER_REQUEST'   # On-demand (no capacity planning)
)
```

## CRUD Operations

```python
table = dynamodb.Table('Orders')

# PUT (create or replace)
table.put_item(Item={
    'userId': 'user123',
    'orderId': 'order456',
    'status': 'pending',
    'total': Decimal('99.99'),
    'items': [
        {'productId': 'prod789', 'qty': 2, 'price': Decimal('49.99')}
    ],
    'createdAt': '2024-01-15T10:30:00Z'
})

# GET (exact key lookup — O(1))
response = table.get_item(
    Key={'userId': 'user123', 'orderId': 'order456'}
)
order = response.get('Item')

# UPDATE (modify specific attributes)
table.update_item(
    Key={'userId': 'user123', 'orderId': 'order456'},
    UpdateExpression='SET #s = :s, updatedAt = :t ADD version :one',
    ExpressionAttributeNames={'#s': 'status'},   # 'status' is reserved word
    ExpressionAttributeValues={
        ':s': 'shipped',
        ':t': '2024-01-16T14:00:00Z',
        ':one': 1
    },
    ConditionExpression='#s = :expected',         # Optimistic locking
    ExpressionAttributeValues={
        ':s': 'shipped', ':t': '...', ':one': 1,
        ':expected': 'pending'                    # Only update if still pending
    }
)

# DELETE
table.delete_item(Key={'userId': 'user123', 'orderId': 'order456'})

# QUERY (uses index — fast)
response = table.query(
    KeyConditionExpression=Key('userId').eq('user123') &
                           Key('orderId').begins_with('ORD-2024'),
    FilterExpression=Attr('status').eq('completed'),
    ScanIndexForward=False,    # Sort descending
    Limit=20
)

# Query GSI
response = table.query(
    IndexName='status-createdAt-index',
    KeyConditionExpression=Key('status').eq('pending') &
                           Key('createdAt').gt('2024-01-01T00:00:00Z')
)
```

## Single Table Design

```
DynamoDB best practice: Put everything in ONE table
Use generic attribute names (PK, SK) and prefix-based keys

PK          SK              Type        Data
USER#123    PROFILE         user        {name, email, ...}
USER#123    ORDER#456       order       {status, total, ...}
USER#123    ORDER#789       order       {status, total, ...}
ORDER#456   ITEM#prod1      orderItem   {qty, price, ...}
PRODUCT#101 METADATA        product     {name, price, ...}

Benefits:
- Single request to get user + all orders
- Minimal cost (fewer reads)
- Better performance (no joins needed)
```

## Access Patterns First

```
Design DynamoDB table by listing ALL access patterns first:
1. Get user by userId                → PK=USER#id, SK=PROFILE
2. Get order by orderId              → GSI: PK=ORDER#id
3. List all orders for a user        → PK=USER#id, SK begins_with ORDER#
4. List pending orders               → GSI: PK=pending, SK=createdAt (range)
5. Get order with all items          → PK=USER#id, SK between ORDER#id...ITEM#

This drives your key design — not the other way around.
```
