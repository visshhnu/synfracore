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
