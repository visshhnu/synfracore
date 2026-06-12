# AWS S3 — Cheatsheet

```bash
# ── BUCKETS ──────────────────────────────────────────────────
aws s3 mb s3://my-bucket --region ap-south-1
aws s3 rb s3://my-bucket --force          # Delete bucket + all objects
aws s3 ls                                  # List all buckets
aws s3 ls s3://my-bucket                  # List objects in bucket
aws s3 ls s3://my-bucket/prefix/ --recursive

# ── OBJECTS ──────────────────────────────────────────────────
aws s3 cp file.txt s3://my-bucket/
aws s3 cp s3://my-bucket/file.txt ./
aws s3 cp s3://src-bucket/ s3://dst-bucket/ --recursive
aws s3 mv file.txt s3://my-bucket/
aws s3 rm s3://my-bucket/file.txt
aws s3 rm s3://my-bucket/ --recursive    # Delete all objects

# Sync (only transfers changed/new files)
aws s3 sync ./dist s3://my-bucket/static/ --delete  # --delete removes orphaned
aws s3 sync s3://my-bucket/ ./backup/ --exclude "*.tmp"

# ── PRESIGNED URLS ───────────────────────────────────────────
aws s3 presign s3://my-bucket/file.pdf --expires-in 3600   # 1 hour
aws s3 presign s3://my-bucket/upload.jpg --expires-in 300

# ── API (s3api) ──────────────────────────────────────────────
# Versioning
aws s3api put-bucket-versioning \
    --bucket my-bucket \
    --versioning-configuration Status=Enabled

# Block public access
aws s3api put-public-access-block \
    --bucket my-bucket \
    --public-access-block-configuration \
    "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Enable encryption
aws s3api put-bucket-encryption \
    --bucket my-bucket \
    --server-side-encryption-configuration '{
        "Rules": [{"ApplyServerSideEncryptionByDefault": {
            "SSEAlgorithm": "aws:kms",
            "KMSMasterKeyID": "arn:aws:kms:..."
        }}]}'

# Lifecycle rule
aws s3api put-bucket-lifecycle-configuration \
    --bucket my-bucket \
    --lifecycle-configuration file://lifecycle.json
```

## Storage Classes Quick Reference

```
Standard:           $0.023/GB  — frequent access, <1ms latency
Standard-IA:        $0.0125/GB — infrequent, <1ms latency, retrieval fee
One Zone-IA:        $0.01/GB   — single AZ, infrequent access
Intelligent-Tiering: auto-moves between tiers, monitoring fee
Glacier Instant:    $0.004/GB  — archive, ms retrieval
Glacier Flexible:   $0.0036/GB — archive, min-hours retrieval
Glacier Deep:       $0.00099/GB — long-term, 12h retrieval
```

## Common Bucket Policy Patterns

```json
// Force HTTPS only
{"Effect":"Deny","Principal":"*","Action":"s3:*",
 "Resource":["arn:aws:s3:::bucket","arn:aws:s3:::bucket/*"],
 "Condition":{"Bool":{"aws:SecureTransport":"false"}}}

// Allow specific IAM role only
{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::123:role/AppRole"},
 "Action":["s3:GetObject","s3:PutObject"],
 "Resource":"arn:aws:s3:::bucket/*"}

// Cross-account read access
{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::OTHER_ACCOUNT:root"},
 "Action":"s3:GetObject","Resource":"arn:aws:s3:::bucket/*"}
```
