# AWS S3 — Advanced

## S3 Select and Analytics

```python
# S3 Select — query data directly in S3 without downloading
# Supports: CSV, JSON, Parquet | Query language: SQL subset

import boto3

s3 = boto3.client('s3')

# Query a large CSV without downloading it
response = s3.select_object_content(
    Bucket='my-data-lake',
    Key='sales/2024/all-transactions.csv',
    ExpressionType='SQL',
    Expression="""
        SELECT customer_id, SUM(CAST(amount AS DECIMAL)) as total
        FROM S3Object
        WHERE region = 'APAC' AND date BETWEEN '2024-01-01' AND '2024-03-31'
        GROUP BY customer_id
        HAVING SUM(CAST(amount AS DECIMAL)) > 10000
    """,
    InputSerialization={
        'CSV': {'FileHeaderInfo': 'USE', 'RecordDelimiter': '\n', 'FieldDelimiter': ','},
        'CompressionType': 'GZIP'   # Supports gzip/bzip2 compressed files too
    },
    OutputSerialization={'CSV': {}},
)

# Stream results (huge files — don't load all at once)
results = []
for event in response['Payload']:
    if 'Records' in event:
        results.extend(event['Records']['Payload'].decode().splitlines())
```

## S3 Inventory and Batch Operations

```bash
# S3 Inventory — daily/weekly list of all objects with metadata
aws s3api put-bucket-inventory-configuration \
    --bucket my-bucket \
    --id full-inventory \
    --inventory-configuration '{
        "Destination": {
            "S3BucketDestination": {
                "Bucket": "arn:aws:s3:::inventory-bucket",
                "Format": "Parquet",
                "Prefix": "inventory/my-bucket/"
            }
        },
        "IsEnabled": true,
        "Id": "full-inventory",
        "IncludedObjectVersions": "All",
        "OptionalFields": ["Size", "LastModifiedDate", "StorageClass", "EncryptionStatus", "ReplicationStatus"],
        "Schedule": {"Frequency": "Daily"}
    }'

# S3 Batch Operations — run operations on millions of objects
# Create a manifest from inventory, then run operations

# Reencrypt all objects with new KMS key
aws s3control create-job \
    --account-id 123456789 \
    --operation '{"S3CopyObject": {
        "TargetKeyPrefix": "",
        "TargetResource": "arn:aws:s3:::my-bucket",
        "CannedAccessControlList": "private",
        "NewObjectMetadata": {"RequesterCharged": false},
        "StorageClass": "STANDARD",
        "SSEAwsKmsKeyId": "arn:aws:kms:us-east-1:123:key/new-key"
    }}' \
    --manifest '{"Spec": {"Format": "S3InventoryReport_CSV_20161130"}, "Location": {"ObjectArn": "arn:aws:s3:::inventory-bucket/manifest.json", "ETag": "abc123"}}' \
    --report '{"Bucket": "arn:aws:s3:::logs-bucket", "Format": "Report_CSV_20180820", "Enabled": true, "Prefix": "batch-reports/", "ReportScope": "AllTasks"}' \
    --priority 10 \
    --role-arn arn:aws:iam::123:role/S3BatchRole
```

## S3 Security Deep Dive

```bash
# Macie — ML-powered sensitive data discovery
aws macie2 enable-macie
aws macie2 create-classification-job \
    --job-type SCHEDULED \
    --schedule-frequency MONTHLY \
    --s3-job-definition '{
        "bucketDefinitions": [{
            "accountId": "123456789",
            "buckets": ["customer-data", "uploads"]
        }]
    }' \
    --name monthly-pii-scan

# Get findings
aws macie2 list-findings \
    --finding-criteria '{"criterion": {"severity.description": {"eq": ["High", "Critical"]}}}' \
    --query 'findings[*].[id,type,severity.description]' \
    --output table

# Block public S3 at account level (do this immediately for new accounts)
aws s3control put-public-access-block \
    --account-id 123456789 \
    --public-access-block-configuration \
    "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Enable Server Access Logging
aws s3api put-bucket-logging \
    --bucket prod-data \
    --bucket-logging-status '{
        "LoggingEnabled": {
            "TargetBucket": "access-logs",
            "TargetPrefix": "prod-data/"
        }
    }'
```
