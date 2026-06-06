# AWS S3 — Simple Storage Service

S3 is AWS's object storage service — infinitely scalable, 11 nines of durability (99.999999999%), and the foundation of data lakes, static websites, application artifacts, and backups across millions of AWS workloads.

## Core Concepts

**Object storage** — Not a filesystem. You store objects (files) identified by a key (path-like string). No directories — just objects with key names that look like paths. Ideal for: write once, read many access patterns.

**Bucket** — Container for objects. Globally unique name across all AWS accounts. Region-specific.

**Object** — A file + metadata. Maximum 5TB per object. Each object has: Key (name), Value (data), Metadata, Version ID, Access Control.

**Key** — The full "path" to the object: `logs/2024/01/app.log`. The `/` is just part of the name — not a real folder.

## S3 vs EBS vs EFS

| | S3 | EBS | EFS |
|--|--|--|--|
| **Type** | Object storage | Block storage | Shared filesystem |
| **Access** | HTTP API / SDK | Single EC2 at a time | Multiple EC2 instances |
| **Use for** | Backups, data lake, static files | OS disk, databases | Shared app content |
| **Durability** | 99.999999999% | 99.999% | 99.999999999% |
| **Latency** | Milliseconds | Sub-millisecond | Milliseconds |
| **Cost** | Cheapest | Medium | Most expensive |

## Storage Classes

| Class | Use Case | Retrieval | Cost |
|-------|---------|-----------|------|
| **Standard** | Frequently accessed | Instant | Highest |
| **Standard-IA** | Infrequently accessed | Instant | 40% cheaper than Standard |
| **One Zone-IA** | Non-critical, single AZ | Instant | 20% cheaper than IA |
| **Glacier Instant** | Archives accessed quarterly | Instant | Low |
| **Glacier Flexible** | Archives accessed yearly | Minutes-hours | Very Low |
| **Glacier Deep Archive** | Compliance, 7+ year retention | Up to 12 hours | Lowest |
| **Intelligent-Tiering** | Unknown access patterns | Instant | Auto-optimizes |

## Essential Operations

```bash
# AWS CLI S3 commands
aws s3 ls                              # List buckets
aws s3 ls s3://my-bucket               # List bucket contents
aws s3 ls s3://my-bucket/logs/ --recursive  # Recursive list

# Copy files
aws s3 cp file.txt s3://my-bucket/
aws s3 cp s3://my-bucket/file.txt .
aws s3 cp s3://source-bucket/ s3://dest-bucket/ --recursive

# Sync directories (only copies changed files — like rsync)
aws s3 sync ./local-dir s3://my-bucket/prefix/
aws s3 sync s3://my-bucket/prefix/ ./local-dir

# Remove
aws s3 rm s3://my-bucket/file.txt
aws s3 rm s3://my-bucket/logs/ --recursive

# Presigned URL (temporary access — valid for 1 hour)
aws s3 presign s3://my-bucket/private-file.pdf --expires-in 3600

# Move (copy + delete source)
aws s3 mv s3://my-bucket/old-name.txt s3://my-bucket/new-name.txt
```

## S3 Security

```json
// Bucket policy — allow CloudFront only
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontOnly",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-static-site/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudfront::123456789:distribution/ABCDEF"
        }
      }
    }
  ]
}
```

```bash
# Block all public access (most buckets should have this!)
aws s3api put-public-access-block \
  --bucket my-bucket \
  --public-access-block-configuration \
  "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket my-bucket \
  --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
  --bucket my-bucket \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "aws:kms",
        "KMSMasterKeyID": "arn:aws:kms:..."
      },
      "BucketKeyEnabled": true
    }]
  }'

# Enable access logging
aws s3api put-bucket-logging \
  --bucket my-bucket \
  --bucket-logging-status '{
    "LoggingEnabled": {
      "TargetBucket": "my-access-logs",
      "TargetPrefix": "my-bucket-logs/"
    }
  }'
```

## Lifecycle Policies

```json
{
  "Rules": [
    {
      "ID": "TransitionToGlacier",
      "Status": "Enabled",
      "Filter": { "Prefix": "logs/" },
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        }
      ],
      "Expiration": {
        "Days": 365
      },
      "NoncurrentVersionExpiration": {
        "NoncurrentDays": 30
      }
    }
  ]
}
```

## boto3 — Python SDK

```python
import boto3
from botocore.exceptions import ClientError

s3 = boto3.client("s3", region_name="us-east-1")

# Upload with metadata and encryption
s3.upload_file(
    Filename="/tmp/report.pdf",
    Bucket="my-reports",
    Key="reports/2024/Q1/report.pdf",
    ExtraArgs={
        "ServerSideEncryption": "aws:kms",
        "ContentType": "application/pdf",
        "Metadata": {
            "generated-by": "pipeline",
            "version": "2.1.0"
        }
    }
)

# Stream large file (don't load into memory)
with open("large-file.zip", "wb") as f:
    s3.download_fileobj("my-bucket", "large-file.zip", f)

# Generate presigned URL
url = s3.generate_presigned_url(
    "get_object",
    Params={"Bucket": "my-bucket", "Key": "private/document.pdf"},
    ExpiresIn=3600  # 1 hour
)

# List with pagination
paginator = s3.get_paginator("list_objects_v2")
for page in paginator.paginate(Bucket="my-bucket", Prefix="logs/2024/"):
    for obj in page.get("Contents", []):
        print(f"{obj['Key']} — {obj['Size']} bytes")

# Delete multiple objects (efficient batch delete)
objects = [{"Key": f"temp/{i}.log"} for i in range(100)]
s3.delete_objects(
    Bucket="my-bucket",
    Delete={"Objects": objects}
)
```

## S3 Event Notifications

```python
# Trigger Lambda when object uploaded
# In S3 bucket configuration:
{
  "LambdaFunctionConfigurations": [
    {
      "LambdaFunctionArn": "arn:aws:lambda:...",
      "Events": ["s3:ObjectCreated:*"],
      "Filter": {
        "Key": {
          "FilterRules": [
            {"Name": "prefix", "Value": "uploads/"},
            {"Name": "suffix", "Value": ".jpg"}
          ]
        }
      }
    }
  ]
}

# Lambda function receiving S3 event
def handler(event, context):
    for record in event["Records"]:
        bucket = record["s3"]["bucket"]["name"]
        key = record["s3"]["object"]["key"]
        print(f"Processing: s3://{bucket}/{key}")
        # Process the uploaded file
```

## Interview Questions

**Explain S3 consistency model.**
Since December 2020, S3 provides strong read-after-write consistency for all operations — PUT, GET, LIST, DELETE. Previously, eventually consistent for some operations. Now: if you write an object and immediately read it, you will see the new version. If you delete an object and list the bucket, the deleted object won't appear. This applies to all S3 regions and all object types.

**What is S3 Transfer Acceleration?**
Transfer Acceleration uses AWS CloudFront's globally distributed edge locations to speed up uploads to S3. Instead of uploading directly to S3 in one region, data travels over the public internet to the nearest CloudFront edge, then over AWS's optimized network backbone to S3. Useful for users geographically far from your S3 bucket's region. Has an additional cost per GB.

**How do you secure an S3 bucket used for a static website?**
Use CloudFront in front of S3 — never expose S3 directly. Block all public access on the S3 bucket. Use Origin Access Control (OAC) so only CloudFront can access S3. Enable bucket versioning for recovery. Enable server-side encryption. Enable access logging. Set up CloudFront WAF for DDoS protection. Use presigned URLs for any private content access.
