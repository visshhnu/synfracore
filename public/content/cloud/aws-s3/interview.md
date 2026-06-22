# AWS S3 Interview Questions

## Core Concepts

**Q: What is S3? Explain storage classes.**

S3 is AWS's object storage — unlimited capacity, 99.999999999% (11 nines) durability.

| Storage Class | Use Case | Retrieval | Cost |
|---|---|---|---|
| S3 Standard | Frequently accessed | Instant | Highest |
| S3 Intelligent-Tiering | Unknown/changing access | Instant | Auto-optimises |
| S3 Standard-IA | Infrequent access | Instant | Lower storage, retrieval fee |
| S3 One Zone-IA | Infrequent, single AZ | Instant | 20% cheaper than IA |
| S3 Glacier Instant | Archive, accessed quarterly | Instant | Cheap |
| S3 Glacier Flexible | Archive, retrieved in hours | 1-12 hrs | Very cheap |
| S3 Glacier Deep Archive | Long-term archive | 12-48 hrs | Cheapest |

Lifecycle policies automate transition between classes.

---

**Q: S3 security — how do you secure a bucket?**

1. **Block Public Access** (enabled by default) — prevents accidental public exposure
2. **Bucket Policy** — resource-based policy attached to bucket
3. **IAM Policy** — identity-based, who can access
4. **ACLs** — legacy, avoid for new buckets
5. **S3 Object Ownership** — enforce bucket owner owns all objects
6. **Encryption**: SSE-S3 (AWS managed), SSE-KMS (customer managed keys), SSE-C (customer provides key), client-side

```json
// Bucket policy: enforce HTTPS only
{
  "Effect": "Deny",
  "Principal": "*",
  "Action": "s3:*",
  "Resource": "arn:aws:s3:::my-bucket/*",
  "Condition": {"Bool": {"aws:SecureTransport": "false"}}
}
```

---

**Q: S3 replication — CRR vs SRR?**

**CRR (Cross-Region Replication)**: Replicate objects to a bucket in another region. Use for DR, latency, compliance.
**SRR (Same-Region Replication)**: Replicate within same region. Use for log aggregation, test/prod data sync.

Requirements: Versioning must be enabled on both source and destination.

---

**Q: S3 performance optimisation.**

- **Multipart upload**: For objects >100MB. Upload in parallel parts. Required for >5GB.
- **Transfer Acceleration**: Routes through CloudFront edge locations for faster uploads from geographically distant clients.
- **Prefix sharding**: S3 scales to 3,500 PUT/5,500 GET per prefix. Add random prefixes for high-throughput workloads.
- **S3 Select**: Query CSV/JSON data in S3 without downloading entire object (SQL-like).

## Revision Notes
```
S3: object storage, 11 nines durability, unlimited capacity
STORAGE CLASSES: Standard → IA → Glacier (cost drops, retrieval time increases)
Lifecycle policies automate transitions
SECURITY: Block Public Access + Bucket Policy + IAM + Encryption
SSE-S3 (default) | SSE-KMS (audit trail) | SSE-C (you manage key)
REPLICATION: CRR (cross-region DR) | SRR (same region log agg) — needs versioning
PERFORMANCE: Multipart (>100MB) | Transfer Accel | Prefix sharding | S3 Select
```
