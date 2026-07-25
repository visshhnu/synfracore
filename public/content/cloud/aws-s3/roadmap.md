# AWS S3 — Learning Roadmap

## Estimated Time to Job-Ready
**4-6 weeks** of consistent learning (2-3 hours/day) — S3's basic put/get API is genuinely simple to learn quickly; the real depth is in access control (IAM vs. bucket policies vs. ACLs), storage class economics, and the consistency/versioning model.

## Phase 1: Foundation (Week 1-2)

- Buckets, keys, and objects — and why S3 has no real folder structure, just common key prefixes that tools display as folders
- Basic operations: `PutObject`, `GetObject`, `DeleteObject`, and listing objects by prefix
- Public access blocking (Block Public Access settings) as the default-safe posture, and understanding exactly what each of the four settings controls
- Object versioning: what it protects against (accidental overwrite/delete) and the real storage-cost implication of keeping every version

**Checkpoint:** can you explain why "the folder doesn't exist until you put something with that prefix" trips people up coming from a traditional filesystem background?

## Phase 2: Access Control (Week 2-3)

- The three layers of S3 access control — IAM policies (identity-based), bucket policies (resource-based), and ACLs (legacy, generally avoid for new buckets) — and how they interact when more than one applies
- Presigned URLs for granting temporary, scoped access to a private object without making it public
- Cross-account access patterns using bucket policies, and the common mistake of over-scoping a policy's `Resource`/`Principal` fields
- S3 Block Public Access as an account/bucket-level override that can silently defeat an otherwise-correct bucket policy intended to allow public access

**Checkpoint:** given a bucket policy that appears to grant public read access but requests are still being denied, what's the first thing you'd check?

## Phase 3: Storage Classes and Lifecycle (Week 3-5)

- Storage classes (Standard, Intelligent-Tiering, Standard-IA, Glacier variants) and matching access-pattern reality to storage-class choice, not defaulting to Standard for everything
- Lifecycle policies for automatic transitions between storage classes and eventual expiration, and why this is the standard mechanism for controlling storage cost on data with a predictable access-pattern decay
- Intelligent-Tiering specifically for data with genuinely unpredictable access patterns, where manually choosing a storage class would require guessing
- Cross-Region Replication (CRR) and Same-Region Replication (SRR) for compliance/DR requirements, distinct from versioning

**Checkpoint:** can you explain when Intelligent-Tiering is actually worth its small monitoring fee versus when a manually-configured lifecycle policy achieves the same cost outcome more cheaply?

## Phase 4: Performance, Events, and Interview Readiness (Week 5-6)

- S3 event notifications (to Lambda, SQS, SNS) as the standard trigger mechanism for event-driven pipelines built around object uploads
- Request rate performance characteristics and why key-naming schemes that avoid sequential prefixes matter less than older guidance suggested, but still matter for genuinely high-throughput workloads
- S3 Transfer Acceleration and multipart upload for large-object and cross-region upload performance
- Review this course's Interview Q&A material, particularly the access-control-layering and storage-class-selection questions

## Common Pitfalls Specific to S3

- **Assuming a bucket policy alone determines public accessibility** — Block Public Access settings at the account or bucket level can override an otherwise-correct policy, a common source of "why is this still denied" confusion
- **Enabling versioning without a lifecycle policy to expire old versions** — this silently accumulates storage cost indefinitely as objects are repeatedly overwritten
- **Treating all data as Standard-storage-class by default** — infrequently accessed data sitting in Standard when it qualifies for IA or Glacier is a real, common source of avoidable spend
- **Using ACLs for new access-control needs** — AWS's own current guidance favors bucket policies and IAM; ACLs are largely a legacy mechanism now

## Getting Your First S3-Heavy Role

1. **Portfolio:** a project demonstrating deliberate storage-class/lifecycle-policy design with a documented cost rationale, not just "objects stored in S3"
2. **Resume:** be specific — "reduced storage cost 40% by implementing a lifecycle policy transitioning 90-day-old logs to Glacier" is far stronger than "experience with AWS S3"
3. **Know the access-control layering cold:** the IAM/bucket-policy/Block-Public-Access interaction is one of the most commonly tested practical S3 concepts, specifically because it trips up even experienced engineers
4. **Certifications, if pursuing one:** S3 is foundational across nearly every AWS certification — see this course's own Certification Guide for current format and pricing
