# AWS S3 Quick Reference

## CLI Commands
```bash
# Bucket operations
aws s3 mb s3://my-bucket --region us-east-1
aws s3 rb s3://my-bucket --force    # Remove bucket (--force empties first)
aws s3 ls                            # List all buckets
aws s3 ls s3://my-bucket/            # List bucket contents
aws s3 ls s3://my-bucket/prefix/ --recursive

# File operations
aws s3 cp file.txt s3://my-bucket/
aws s3 cp s3://my-bucket/file.txt .
aws s3 cp s3://my-bucket/ . --recursive
aws s3 mv file.txt s3://my-bucket/
aws s3 rm s3://my-bucket/file.txt
aws s3 rm s3://my-bucket/ --recursive
aws s3 sync ./local-dir s3://my-bucket/  # Sync (only changed files)
aws s3 sync s3://bucket1 s3://bucket2    # Cross-bucket sync
aws s3 presign s3://my-bucket/file.txt --expires-in 3600  # Pre-signed URL

# Advanced
aws s3api put-bucket-versioning --bucket my-bucket \
  --versioning-configuration Status=Enabled
aws s3api put-bucket-lifecycle-configuration --bucket my-bucket \
  --lifecycle-configuration file://lifecycle.json
aws s3api get-bucket-policy --bucket my-bucket
aws s3api put-public-access-block --bucket my-bucket \
  --public-access-block-configuration BlockPublicAcls=true,RestrictPublicBuckets=true
```

## Storage Classes Reference
```
Standard          → frequent access, millisecond retrieval
Intelligent-Tier  → auto-moves between tiers based on access
Standard-IA       → infrequent access, same retrieval speed, retrieval fee
One Zone-IA       → single AZ, 20% cheaper than IA, risk of AZ failure
Glacier Instant   → archive, ms retrieval, quarterly access
Glacier Flexible  → archive, 1-12hr retrieval, pennies/GB
Glacier Deep      → long-term archive, 12-48hr retrieval, cheapest

Lifecycle transitions (min days in class before moving):
  Standard → IA: 30 days minimum
  IA → Glacier: 90 days minimum
  Multipart cleanup: always add rule to clean incomplete uploads
```
