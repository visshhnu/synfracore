# AWS RDS & Aurora — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day) — RDS itself is approachable if you already know the underlying database engine; the real learning curve is AWS-specific operational concepts (Multi-AZ vs. read replicas, backup/restore mechanics, Aurora's distinct architecture) layered on top.

## Phase 1: Foundation (Week 1-2)

- Provisioning an RDS instance (engine choice, instance class, storage type) and connecting to it — same client tools as the underlying engine (psql, mysql client)
- Multi-AZ deployments: a synchronously-replicated standby purely for failover, not queryable directly and not a performance tool
- Automated backups and point-in-time restore, and the real difference between "backup happened" and "restore has actually been tested"
- Parameter groups and option groups for engine-level configuration, distinct from the instance-level settings

**Checkpoint:** can you explain why a Multi-AZ standby doesn't reduce read load on the primary, and what you'd add instead if read scaling is the actual goal?

## Phase 2: Read Replicas and Aurora's Architecture (Week 2-4)

- Read replicas: asynchronous replication, read-scaling purpose, and the replication lag tradeoff that comes with it
- Aurora's storage-compute separation — a distributed, log-structured storage layer spanning multiple AZs independently of any single compute instance, and why this makes Aurora's failover faster than traditional RDS
- Aurora Replicas sharing the same underlying storage as the primary (unlike traditional RDS read replicas, which each maintain a full separate copy)
- When Aurora is actually the better choice over standard RDS Postgres/MySQL, versus when the extra cost isn't justified for the workload

**Checkpoint:** can you explain, in your own words, why Aurora's failover is typically faster than traditional RDS Multi-AZ failover — what specifically about the storage architecture makes that true?

## Phase 3: Performance and Scaling (Week 4-6)

- Connection management: why a managed connection pooler (RDS Proxy, or an application-level pool) matters more on RDS than it might seem, given real connection-limit ceilings per instance class
- Performance Insights and CloudWatch metrics for diagnosing actual bottlenecks (CPU, IOPS, connections) rather than guessing at what to scale
- Storage autoscaling and IOPS provisioning (io1/io2 for RDS, Aurora's own I/O model) matched to real workload I/O patterns
- Aurora Serverless v2 for genuinely variable/unpredictable workloads, and why it's not automatically the right default for steady-state production traffic

**Checkpoint:** given a database instance showing consistently high CPU but low IOPS, can you reason about what that combination suggests versus the opposite pattern (low CPU, high IOPS)?

## Phase 4: Security, DR, and Interview Readiness (Week 6-8)

- Encryption at rest (KMS-backed) and in transit (SSL/TLS enforcement), and why enabling encryption after the fact on an existing unencrypted instance requires a snapshot-and-restore, not an in-place toggle
- Cross-region read replicas and Aurora Global Database for genuine cross-region disaster recovery, distinct from the AZ-level protection Multi-AZ provides
- IAM database authentication as an alternative to long-lived database passwords for application connections
- Review this course's Interview Q&A material, particularly the Multi-AZ vs. read replica distinction and Aurora architecture questions

## Common Pitfalls Specific to RDS/Aurora

- **Assuming Multi-AZ provides read scaling** — it doesn't; the standby exists purely for failover and isn't queryable in most configurations
- **Treating "backup enabled" as equivalent to "restore tested"** — an untested restore process is a real, common source of surprise during an actual incident
- **Not using a connection pooler and hitting the instance's real connection ceiling** — this is a common, avoidable production incident, especially with many application instances each opening their own direct connections
- **Choosing Aurora by default without confirming the workload actually benefits from its architecture** — for a small, steady, single-AZ-tolerant workload, standard RDS can be the simpler, cheaper, equally correct choice

## Getting Your First RDS/Aurora-Heavy Role

1. **Portfolio:** a project demonstrating a genuine Multi-AZ or Aurora setup with a documented failover test — not just a screenshot of the configuration
2. **Resume:** be specific — "diagnosed and resolved connection exhaustion by introducing RDS Proxy, eliminating a recurring production incident" is far stronger than "experience with AWS RDS"
3. **Know the Multi-AZ vs. read replica distinction cold:** this is one of the most commonly tested practical RDS concepts in real interviews, specifically because it's so often confused
4. **Certifications, if pursuing one:** RDS/Aurora feature heavily in AWS Database Specialty and Solutions Architect Associate — see this course's own Certification Guide for current format and pricing
