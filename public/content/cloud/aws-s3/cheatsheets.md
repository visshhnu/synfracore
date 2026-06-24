# AWS S3 Cheatsheet

## Core CLI Commands
```bash
# Bucket operations
aws s3 mb s3://my-bucket --region us-east-1
aws s3 ls
aws s3 ls s3://my-bucket
aws s3 rb s3://my-bucket --force   # delete with contents

# Object operations
aws s3 cp file.txt s3://my-bucket/path/file.txt
aws s3 cp s3://my-bucket/path/file.txt ./file.txt
aws s3 mv s3://my-bucket/old.txt s3://my-bucket/new.txt
aws s3 rm s3://my-bucket/file.txt
aws s3 sync ./local-dir s3://my-bucket/prefix/ --delete

# Presigned URL (temporary access)
aws s3 presign s3://my-bucket/file.txt --expires-in 3600

# Recursive operations
aws s3 cp s3://source/ s3://dest/ --recursive
aws s3 rm s3://my-bucket/prefix/ --recursive
```

## Storage Classes
| Class | Use Case | Min Duration | Retrieval |
|-------|----------|-------------|-----------|
| S3 Standard | Frequent access | None | Immediate |
| S3-IA | Infrequent access | 30 days | Immediate |
| S3 One Zone-IA | Non-critical, infrequent | 30 days | Immediate |
| S3 Glacier Instant | Archive, rare access | 90 days | Immediate |
| S3 Glacier Flexible | Archive | 90 days | 1-12 hours |
| S3 Glacier Deep Archive | Long-term archive | 180 days | 12-48 hours |
| S3 Intelligent-Tiering | Unknown pattern | None | Immediate |

## Bucket Policy Example
```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::my-public-bucket/*",
    "Condition": {"IpAddress": {"aws:SourceIp": "203.0.113.0/24"}}
  }]
}
```

## Key Features Quick Reference
```
Versioning:        enable per bucket; versions accumulate; delete = delete marker
MFA Delete:        require MFA to permanently delete versioned objects
Lifecycle Rules:   auto-transition between storage classes or expire objects
Replication:       CRR (cross-region) or SRR (same-region); requires versioning
Event Notifications: trigger Lambda/SNS/SQS on object create/delete
Object Lock:       WORM (write-once-read-many); Compliance or Governance mode
Transfer Acceleration: CloudFront edge → S3 (faster for distant uploads)
S3 Select:         SQL query on S3 object (CSV/JSON/Parquet); reduce data transfer
Multipart Upload:  required >5GB; recommended >100MB; parallel parts

ENCRYPTION:
  SSE-S3:   AWS managed keys (AES-256)
  SSE-KMS:  KMS keys (auditable, cross-account)
  SSE-C:    customer provides key per request
  Client-side: encrypt before uploading
```
