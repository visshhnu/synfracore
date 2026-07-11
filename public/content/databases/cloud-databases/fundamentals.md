# Cloud Databases — Fundamentals

## Provisioning your first managed relational database

The core value proposition of a managed database shows up immediately at provisioning time — compare what you're actually responsible for versus a self-managed instance:

```bash
# AWS RDS — provisioning a managed PostgreSQL instance
aws rds create-db-instance \
  --db-instance-identifier myapp-prod \
  --db-instance-class db.t3.medium \
  --engine postgres \
  --engine-version 16.3 \
  --master-username admin \
  --master-user-password "$(cat /run/secrets/db_password)" \
  --allocated-storage 100 \
  --multi-az \
  --backup-retention-period 7
```
Two flags here are doing real work worth understanding, not just copying: `--multi-az` provisions a synchronously-replicated standby in a separate Availability Zone that automatically takes over if the primary fails — you get this failover capability without writing any failover logic yourself. `--backup-retention-period 7` enables automated daily backups plus point-in-time restore for the last 7 days, meaning you can restore to any specific minute within that window, not just to the most recent nightly backup — both of these would be real, ongoing operational work to build and maintain on a self-managed instance, and are simply a configuration flag on a managed one.

## Multi-AZ vs. Read Replicas: two different problems, often confused

These solve genuinely different problems, and picking the wrong one for your actual need is a common early mistake:

| | Multi-AZ (standby) | Read Replica |
|---|---|---|
| Purpose | High availability — automatic failover | Read scaling — offload read traffic |
| Replication | Synchronous | Usually asynchronous |
| Can serve reads? | No (standby is not queryable in most setups) | Yes — that's its entire purpose |
| Failover | Automatic, usually under a minute | Manual promotion required |

A Multi-AZ standby exists purely for failover — it's not a performance tool, and you can't query it directly to reduce load on the primary. A Read Replica exists purely to add read capacity — it can be manually promoted to a standalone primary during a disaster, but that's a manual operation, not an automatic failover the way Multi-AZ is. Needing both availability *and* read scaling means provisioning both, not choosing one as if it covered the other's purpose too.

## Choosing relational vs. NoSQL for a new project

The Overview tab's landscape comparison is the reference table — the fundamental decision beneath it comes down to two questions asked in order: **do you need ACID transactions and joins across normalized tables** (relational is the natural fit — RDS/Aurora, Cloud SQL, Azure SQL), and **do you need massive horizontal write scale or single-digit-millisecond latency at huge scale** (NoSQL is built for this — DynamoDB, Cosmos DB, Firestore). Most application data genuinely fits the relational model comfortably — the common early mistake is reaching for a NoSQL database because of its scale reputation, before the application's actual traffic has anywhere near the volume that would make relational scaling a real constraint. Starting relational and migrating specific hot paths to NoSQL once a genuine, measured scaling need appears is a more common and more defensible path than starting NoSQL by default.

## On-demand vs. provisioned pricing: the tradeoff in practice

```
DynamoDB on-demand:   pay per actual read/write request — no capacity
                       planning needed, costs scale directly with traffic
DynamoDB provisioned: reserve a fixed read/write capacity ahead of time —
                       cheaper per-request at steady, predictable load,
                       but under-provisioning causes throttling
```
On-demand is the right starting choice for a new or unpredictable-traffic workload — you pay for exactly what you use, with no capacity-planning exercise required upfront, and no risk of throttling from under-provisioning. Provisioned capacity becomes worth the added planning overhead once traffic is well-understood and steady enough to forecast reliably — at that point, reserved capacity is genuinely cheaper per request, the same tradeoff pattern as reserved vs. on-demand compute instances elsewhere in cloud infrastructure.

## Automated backups: what "managed" actually buys you here

A managed database's automated backup and point-in-time restore capability isn't just a convenience — it removes an entire category of operational risk that self-managed databases carry as a real, ongoing responsibility: backup scripts that silently stop working, backups that were never actually tested for restorability, or a restore process that's never been rehearsed and fails under the pressure of an actual incident. The one genuine caveat worth internalizing from day one: automated backups protect against infrastructure failure and data corruption discovered within the retention window — they do **not** protect against a bad deploy or application bug that corrupts data silently and isn't noticed until after the retention window has rolled past the last good state, which is exactly why retention period (the `--backup-retention-period 7` above) should be chosen based on realistic detection time for problems, not just a default value.
