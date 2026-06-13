# DynamoDB — Advanced

## DynamoDB Global Tables

```python
# Global Tables: multi-region, active-active replication
# Any region can write — DynamoDB resolves conflicts automatically
# Last-writer-wins based on timestamp

# Create global table via boto3
client = boto3.client('dynamodb', region_name='us-east-1')

# First create the base table
client.create_table(
    TableName='global-app-table',
    KeySchema=[{'AttributeName': 'PK', 'KeyType': 'HASH'},
               {'AttributeName': 'SK', 'KeyType': 'RANGE'}],
    AttributeDefinitions=[
        {'AttributeName': 'PK', 'AttributeType': 'S'},
        {'AttributeName': 'SK', 'AttributeType': 'S'}
    ],
    BillingMode='PAY_PER_REQUEST',
    StreamSpecification={'StreamEnabled': True, 'StreamViewType': 'NEW_AND_OLD_IMAGES'},
    TableClass='STANDARD'
)

# Add replica regions
client.create_global_table(
    GlobalTableName='global-app-table',
    ReplicationGroup=[
        {'RegionName': 'us-east-1'},
        {'RegionName': 'eu-west-1'},
        {'RegionName': 'ap-south-1'}
    ]
)
# Users in India read/write ap-south-1 (< 5ms)
# Users in US read/write us-east-1 (< 5ms)
# Data automatically synced globally (< 1 second)
```

## DynamoDB Cheatsheet

```bash
# ── TABLE OPS ─────────────────────────────────────────────
aws dynamodb list-tables
aws dynamodb describe-table --table-name my-table
aws dynamodb describe-limits                    # Account-level limits

# ── CRUD ──────────────────────────────────────────────────
# Put item
aws dynamodb put-item --table-name t \
    --item '{"PK": {"S": "USER#1"}, "SK": {"S": "PROFILE"}, "name": {"S": "Alice"}}'

# Get item (exact key lookup)
aws dynamodb get-item --table-name t \
    --key '{"PK": {"S": "USER#1"}, "SK": {"S": "PROFILE"}}'

# Query (uses index, fast)
aws dynamodb query --table-name t \
    --key-condition-expression "PK = :pk AND begins_with(SK, :sk)" \
    --expression-attribute-values '{":pk": {"S": "USER#1"}, ":sk": {"S": "ORDER#"}}'

# Scan (full table scan, expensive — avoid in production)
aws dynamodb scan --table-name t \
    --filter-expression "status = :s" \
    --expression-attribute-values '{":s": {"S": "pending"}}'

# Update
aws dynamodb update-item --table-name t \
    --key '{"PK": {"S": "USER#1"}, "SK": {"S": "PROFILE"}}' \
    --update-expression "SET #n = :n, updatedAt = :t" \
    --expression-attribute-names '{"#n": "name"}' \
    --expression-attribute-values '{":n": {"S": "Alice Smith"}, ":t": {"S": "2024-01-15"}}'

# ── MONITORING ────────────────────────────────────────────
aws cloudwatch get-metric-statistics \
    --namespace AWS/DynamoDB \
    --metric-name ConsumedReadCapacityUnits \
    --dimensions Name=TableName,Value=my-table \
    --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ) \
    --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
    --period 60 --statistics Sum
```
