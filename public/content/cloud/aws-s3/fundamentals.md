# AWS S3 — Fundamentals

## Core Concepts

```
Bucket: Container for objects (globally unique name)
Object: File + metadata (up to 5TB per object)
Key: Full path to object (e.g. images/2024/photo.jpg)
Region: Bucket lives in one region (data never leaves without explicit config)
```

## Bucket Operations

```bash
# Create bucket
aws s3api create-bucket \
  --bucket my-app-assets \
  --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1

# Enable versioning (allows recovery of deleted/overwritten objects)
aws s3api put-bucket-versioning \
  --bucket my-app-assets \
  --versioning-configuration Status=Enabled

# Block all public access (default, keep this on for most buckets)
aws s3api put-public-access-block \
  --bucket my-app-assets \
  --public-access-block-configuration \
    BlockPublicAcls=true,IgnorePublicAcls=true,\
    BlockPublicPolicy=true,RestrictPublicBuckets=true

# Upload files
aws s3 cp file.txt s3://my-app-assets/
aws s3 sync ./dist s3://my-app-assets/static/ --delete
```

## Bucket Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontOAC",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-app-assets/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudfront::123456789:distribution/ABCDEF"
        }
      }
    },
    {
      "Sid": "DenyUnencryptedPuts",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::my-app-assets/*",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "aws:kms"
        }
      }
    }
  ]
}
```

## Storage Classes

```
S3 Standard:          Frequently accessed, ms latency. $0.023/GB
S3 Standard-IA:       Infrequent access, same ms latency. $0.0125/GB + retrieval fee
S3 One Zone-IA:       Single AZ, 20% cheaper than IA. Risk of loss if AZ fails
S3 Intelligent-Tiering: Auto-moves between tiers. Small monthly monitoring fee
S3 Glacier Instant:   Archive, ms retrieval. $0.004/GB
S3 Glacier Flexible:  Minutes to hours retrieval. $0.0036/GB
S3 Glacier Deep Archive: 12-hour retrieval. $0.00099/GB (cheapest)
```

## Lifecycle Policies

```json
{
  "Rules": [{
    "ID": "archive-old-logs",
    "Status": "Enabled",
    "Filter": { "Prefix": "logs/" },
    "Transitions": [
      { "Days": 30, "StorageClass": "STANDARD_IA" },
      { "Days": 90, "StorageClass": "GLACIER" }
    ],
    "Expiration": { "Days": 365 }
  }]
}
```

## Presigned URLs

```python
import boto3
s3 = boto3.client('s3')

# Generate URL for secure upload (no AWS credentials needed by client)
presigned_url = s3.generate_presigned_url(
    'put_object',
    Params={'Bucket': 'my-uploads', 'Key': 'user123/photo.jpg', 'ContentType': 'image/jpeg'},
    ExpiresIn=3600  # 1 hour
)

# Generate URL for download
download_url = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': 'my-assets', 'Key': 'private/report.pdf'},
    ExpiresIn=300  # 5 minutes
)
```

## S3 Events → Lambda

```yaml
# Trigger Lambda on every upload
S3BucketNotification:
  LambdaConfigurations:
    - Event: s3:ObjectCreated:*
      Filter:
        S3Key:
          Rules:
            - Name: prefix
              Value: uploads/
            - Name: suffix
              Value: .jpg
      Function: !GetAtt ImageProcessorLambda.Arn
```
