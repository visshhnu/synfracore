# AWS RDS Interview Questions

## Core Concepts

**Q: What is RDS? Multi-AZ vs Read Replica?**

RDS (Relational Database Service) is managed relational databases — AWS handles patching, backups, failover.

Supported engines: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, Aurora (MySQL/PostgreSQL compatible).

**Multi-AZ (High Availability):**
- Synchronous replication to standby in another AZ
- Automatic failover in 1-2 minutes (DNS changes, no manual intervention)
- Standby is NOT readable — only for failover
- Use for: production databases, HA requirement

**Read Replica (Scalability):**
- Asynchronous replication
- Readable (offload read queries from primary)
- Can be promoted to standalone (for DR)
- Up to 5 replicas per primary (MySQL/MariaDB/PostgreSQL)
- Can be cross-region (for geo-distributed reads and DR)

---

**Q: What is Aurora? How is it different from standard RDS?**

Aurora is AWS's proprietary cloud-native database — MySQL and PostgreSQL compatible but with significant architectural improvements.

**Key Aurora differences:**
- 6-way replication across 3 AZs (storage layer) — survives 2 AZ failures
- Up to 15 read replicas (vs 5 for standard RDS)
- Failover in ~30 seconds (vs 1-2 mins for Multi-AZ RDS)
- Storage auto-scales in 10GB increments up to 128TB
- Aurora Global Database: single primary, up to 5 secondary regions (sub-second replication)
- Aurora Serverless: auto-scales capacity (good for unpredictable workloads)

**When Aurora over standard RDS**: Production workloads needing high availability, high throughput, or global scale.

---

**Q: RDS backup and recovery.**

**Automated backups**: Daily snapshots + transaction logs. Retention: 1-35 days. Point-in-time recovery to any second within retention period.

**Manual snapshots**: User-initiated. Stored until deleted. Persist after RDS deletion.

**Cross-region backups**: Copy automated backups to another region (DR).

**RTO/RPO:**
- Multi-AZ: RTO ~1-2 min, RPO near-zero (synchronous)
- Aurora: RTO ~30s, RPO near-zero
- Single-AZ + backups: RTO hours (restore), RPO = last backup

---

**Q: RDS security best practices.**

1. **Private subnet**: Never in public subnet. Use SG to allow only app servers.
2. **Encryption at rest**: Enable KMS encryption (required for compliance).
3. **Encryption in transit**: SSL/TLS for connections. Enforce with parameter group (`require_secure_transport = ON`).
4. **IAM Database Authentication**: Use IAM roles instead of passwords for MySQL/PostgreSQL connections.
5. **Secrets Manager**: Rotate database credentials automatically.
6. **VPC Security Groups**: Only allow inbound from app security group, specific port.
7. **No public accessibility**: Disable public access.

---

**Q: RDS Performance Insights and optimisation.**

**Performance Insights**: Visualise DB load by wait events, SQL queries. Identify top waits (CPU, I/O, locks).

**Optimisation:**
- Identify slow queries: Performance Insights top SQL, or `pg_stat_statements`, `slow_query_log`
- Add appropriate indexes
- Connection pooling: RDS Proxy (serverless/Lambda use cases)
- Read replicas for read-heavy workloads
- Right-size instance class (use Performance Insights before sizing up)
- Parameter groups: tune `max_connections`, `shared_buffers`, etc.

**RDS Proxy**: Pooled connection management. Reduces overhead for Lambda functions (which create new connections per invocation).

## Revision Notes
```
RDS: managed relational DB. MySQL/PostgreSQL/Aurora/Oracle/SQL Server.

MULTI-AZ: Sync replication, auto-failover (1-2min). Standby NOT readable.
READ REPLICA: Async replication, readable. Up to 5. Promote for DR.

AURORA vs RDS:
6-way replication (3 AZs) | 15 read replicas | 30s failover
Auto-scaling storage | Aurora Global DB (sub-second cross-region)

BACKUP: Automated (1-35 day retention) + Manual snapshots
Point-in-time recovery within retention window

SECURITY:
Private subnet | Encryption at rest (KMS) | SSL in transit
IAM auth | Secrets Manager rotation | No public access

RDS PROXY: connection pooling (Lambda use case)
Performance Insights: identify top wait events and slow queries
```
