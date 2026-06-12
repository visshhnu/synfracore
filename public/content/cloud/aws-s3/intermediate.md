# AWS S3 — Intermediate

## S3 Event Processing Pipeline

```python
# S3 → Lambda → DynamoDB pipeline
import boto3, json, csv
from io import StringIO

s3 = boto3.client('s3')
dynamo = boto3.resource('dynamodb').Table('processed-data')

def handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        size = record['s3']['object']['size']

        print(f"Processing {key} ({size} bytes)")

        # Stream large files without loading entirely into memory
        response = s3.get_object(Bucket=bucket, Key=key)
        body = response['Body'].read().decode('utf-8')
        reader = csv.DictReader(StringIO(body))

        # Batch write to DynamoDB
        with dynamo.batch_writer() as batch:
            for row in reader:
                batch.put_item(Item={
                    'pk': row['id'],
                    'sk': 'DATA',
                    'source_key': key,
                    **{k: v for k, v in row.items() if v}  # Skip empty values
                })

        # Move to processed/ prefix
        s3.copy_object(
            Bucket=bucket,
            CopySource={'Bucket': bucket, 'Key': key},
            Key=key.replace('incoming/', 'processed/')
        )
        s3.delete_object(Bucket=bucket, Key=key)
```

## S3 Replication

```bash
# Cross-region replication for compliance and DR
aws s3api put-bucket-versioning \
    --bucket source-bucket \
    --versioning-configuration Status=Enabled

aws s3api put-bucket-replication \
    --bucket source-bucket \
    --replication-configuration '{
        "Role": "arn:aws:iam::123:role/S3ReplicationRole",
        "Rules": [{
            "ID": "ReplicateAll",
            "Status": "Enabled",
            "Filter": {"Prefix": ""},
            "Destination": {
                "Bucket": "arn:aws:s3:::destination-bucket",
                "ReplicationTime": {
                    "Status": "Enabled",
                    "Time": {"Minutes": 15}
                },
                "Metrics": {
                    "Status": "Enabled",
                    "EventThreshold": {"Minutes": 15}
                },
                "StorageClass": "STANDARD_IA"
            },
            "DeleteMarkerReplication": {"Status": "Enabled"}
        }]
    }'

# Monitor replication lag
aws s3api get-bucket-replication-time-control \
    --bucket source-bucket
```

## S3 Object Lambda

```python
# S3 Object Lambda — transform data as it's read
# Add a Lambda function between S3 and the requester

import boto3, json
from io import BytesIO

s3_client = boto3.client('s3')

def handler(event, context):
    # Get the original S3 object
    object_context = event['getObjectContext']
    output_route = object_context['outputRoute']
    output_token = object_context['outputToken']
    s3_url = object_context['inputS3Url']

    # Fetch original object
    response = s3_client.get_object(...)
    original_data = json.loads(response['Body'].read())

    # Transform: remove PII fields before returning
    user_id = event['userRequest']['headers'].get('X-User-ID')
    if user_id != original_data.get('owner_id'):
        # Redact sensitive fields for non-owners
        for field in ['ssn', 'credit_card', 'phone']:
            if field in original_data:
                original_data[field] = '***REDACTED***'

    # Return transformed data
    s3_client.write_get_object_response(
        Body=json.dumps(original_data),
        RequestRoute=output_route,
        RequestToken=output_token,
        ContentType='application/json',
    )
```
