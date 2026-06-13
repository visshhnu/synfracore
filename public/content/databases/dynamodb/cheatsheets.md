# DynamoDB — Cheatsheet

```bash
# ── TABLE OPS ─────────────────────────────────────────────
aws dynamodb list-tables
aws dynamodb describe-table --table-name my-table
aws dynamodb describe-table --table-name my-table \
    --query 'Table.[TableStatus,ItemCount,TableSizeBytes]'

# ── ITEMS ─────────────────────────────────────────────────
# Put item
aws dynamodb put-item --table-name t \
    --item '{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"},"name":{"S":"Alice"}}'

# Get item (exact keys only)
aws dynamodb get-item --table-name t \
    --key '{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"}}'

# Conditional put (only if not exists)
aws dynamodb put-item --table-name t \
    --item '{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"},"name":{"S":"Alice"}}' \
    --condition-expression "attribute_not_exists(PK)"

# Update item
aws dynamodb update-item --table-name t \
    --key '{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"}}' \
    --update-expression "SET #n = :n, updatedAt = :t" \
    --expression-attribute-names '{"#n":"name"}' \
    --expression-attribute-values '{":n":{"S":"Bob"},":t":{"S":"2024-01-15"}}'

# Delete item
aws dynamodb delete-item --table-name t \
    --key '{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"}}'

# ── QUERY (uses index, efficient) ─────────────────────────
aws dynamodb query --table-name t \
    --key-condition-expression "PK = :pk" \
    --expression-attribute-values '{":pk":{"S":"USER#1"}}' \
    --scan-index-forward false \
    --limit 20

# With sort key condition
aws dynamodb query --table-name t \
    --key-condition-expression "PK = :pk AND begins_with(SK, :sk)" \
    --expression-attribute-values '{":pk":{"S":"USER#1"},":sk":{"S":"ORDER#"}}'

# Query GSI
aws dynamodb query --table-name t \
    --index-name status-createdAt-index \
    --key-condition-expression "#s = :s AND createdAt > :d" \
    --expression-attribute-names '{"#s":"status"}' \
    --expression-attribute-values '{":s":{"S":"pending"},":d":{"S":"2024-01-01"}}'

# ── SCAN (full table, avoid in prod) ──────────────────────
aws dynamodb scan --table-name t \
    --filter-expression "#s = :s" \
    --expression-attribute-names '{"#s":"status"}' \
    --expression-attribute-values '{":s":{"S":"pending"}}'

# ── BATCH OPS ─────────────────────────────────────────────
# Batch get (up to 100 items)
aws dynamodb batch-get-item --request-items \
    '{"t":{"Keys":[{"PK":{"S":"USER#1"},"SK":{"S":"PROFILE"}},{"PK":{"S":"USER#2"},"SK":{"S":"PROFILE"}}]}}'
```

```python
# Python patterns
from boto3.dynamodb.conditions import Key, Attr
import boto3

table = boto3.resource('dynamodb').Table('my-table')

# Query with Python (cleaner than CLI)
result = table.query(
    KeyConditionExpression=Key('PK').eq('USER#123') & Key('SK').begins_with('ORDER#'),
    FilterExpression=Attr('status').eq('pending'),
    Limit=20,
    ScanIndexForward=False
)

# Paginate through all results
def query_all(**kwargs):
    items = []
    while True:
        result = table.query(**kwargs)
        items.extend(result['Items'])
        if 'LastEvaluatedKey' not in result:
            break
        kwargs['ExclusiveStartKey'] = result['LastEvaluatedKey']
    return items
```
