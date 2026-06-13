# DynamoDB — Intermediate

## Single Table Design

```python
# Single Table Design: ALL data in ONE DynamoDB table
# Uses generic PK/SK with prefixes to differentiate record types

import boto3
from boto3.dynamodb.conditions import Key, Attr

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('app-table')

# Example entities and their key patterns:
# User Profile:   PK=USER#123          SK=PROFILE
# User Orders:    PK=USER#123          SK=ORDER#2024-01-15T10:30:00#456
# Order Detail:   PK=ORDER#456         SK=METADATA
# Order Items:    PK=ORDER#456         SK=ITEM#789
# Product:        PK=PRODUCT#789       SK=METADATA

def get_user_with_orders(user_id: str) -> dict:
    """Get user profile AND all their orders in a SINGLE request."""
    response = table.query(
        KeyConditionExpression=Key('PK').eq(f'USER#{user_id}'),
        # Returns: PROFILE item + all ORDER# items
    )

    items = response['Items']
    user = next((i for i in items if i['SK'] == 'PROFILE'), None)
    orders = [i for i in items if i['SK'].startswith('ORDER#')]

    return {'user': user, 'orders': orders}

def create_order(user_id: str, order_id: str, items: list, total: float):
    """Create order and all items atomically."""
    from botocore.exceptions import ClientError

    # TransactWriteItems — all succeed or all fail (up to 100 items)
    try:
        dynamodb.meta.client.transact_write_items(
            TransactItems=[
                {
                    'Put': {
                        'TableName': 'app-table',
                        'Item': {
                            'PK': f'ORDER#{order_id}',
                            'SK': 'METADATA',
                            'userId': user_id,
                            'total': str(total),
                            'status': 'pending',
                            'createdAt': datetime.utcnow().isoformat(),
                        },
                        'ConditionExpression': 'attribute_not_exists(PK)'  # Don't overwrite
                    }
                },
                {
                    'Put': {
                        'TableName': 'app-table',
                        'Item': {
                            'PK': f'USER#{user_id}',
                            'SK': f'ORDER#{datetime.utcnow().isoformat()}#{order_id}',
                            'orderId': order_id,
                            'total': str(total),
                            'status': 'pending',
                        }
                    }
                },
                # Decrement inventory counter
                {
                    'Update': {
                        'TableName': 'app-table',
                        'Key': {'PK': f'PRODUCT#{items[0]["productId"]}', 'SK': 'INVENTORY'},
                        'UpdateExpression': 'ADD qty :delta',
                        'ExpressionAttributeValues': {':delta': -items[0]['quantity'], ':min': 0},
                        'ConditionExpression': 'qty >= :min'
                    }
                }
            ]
        )
    except ClientError as e:
        if e.response['Error']['Code'] == 'TransactionCanceledException':
            raise Exception("Order failed: insufficient inventory or duplicate order")
        raise
```

## DynamoDB Streams + Lambda

```python
# Process every DynamoDB change in real-time
def handle_stream(event, context):
    for record in event['Records']:
        if record['eventName'] == 'INSERT':
            new_item = record['dynamodb'].get('NewImage', {})
            pk = new_item.get('PK', {}).get('S', '')

            if pk.startswith('ORDER#'):
                order_id = pk.replace('ORDER#', '')
                # Process new order
                send_confirmation_email(new_item)
                update_analytics(new_item)

        elif record['eventName'] == 'MODIFY':
            old = record['dynamodb'].get('OldImage', {})
            new = record['dynamodb'].get('NewImage', {})

            old_status = old.get('status', {}).get('S')
            new_status = new.get('status', {}).get('S')

            if old_status == 'pending' and new_status == 'shipped':
                send_shipping_notification(new)
```
