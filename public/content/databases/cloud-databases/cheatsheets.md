# Cloud Databases — Quick Reference

## Provider landscape

| Provider | Relational | NoSQL | Known for |
|---|---|---|---|
| AWS | RDS, Aurora | DynamoDB | Broadest ecosystem, Aurora storage-compute separation |
| Azure | Azure SQL, Azure DB for PostgreSQL | Cosmos DB | Cosmos DB multi-model, multi-region writes |
| GCP | Cloud SQL, AlloyDB | Firestore, Bigtable | Spanner — globally-consistent relational scale |
| Vendor-neutral | Self-managed Postgres/MySQL | MongoDB Atlas, Redis Cloud | Portability across clouds |

## Multi-AZ vs. Read Replica

| | Multi-AZ | Read Replica |
|---|---|---|
| Purpose | High availability / failover | Read scaling |
| Replication | Synchronous | Usually asynchronous |
| Queryable directly? | No | Yes |
| Failover | Automatic | Manual promotion |

## Relational vs. NoSQL — decision shortcut

```
Need ACID + joins + well-understood schema     → managed relational
Need massive horizontal scale + ms latency     → managed NoSQL
Need global multi-region WRITES specifically   → Spanner / Cosmos DB
  (not just multi-region reads — a genuinely distinct, higher-cost category)
```

## DynamoDB partition key design

```
Low cardinality (e.g. a status field, 3 values) → hot partition risk
High cardinality (e.g. user_id)                  → even distribution

Time-series pattern to avoid hot partitions:
  partition_key = f"{device_id}#{date.today().isoformat()}"
```

## AWS RDS — quick commands

```bash
# Provision with Multi-AZ and automated backups
aws rds create-db-instance --db-instance-identifier myapp-prod \
  --engine postgres --multi-az --backup-retention-period 7

# Check replication lag on a read replica
aws cloudwatch get-metric-statistics --namespace AWS/RDS \
  --metric-name ReplicaLag --dimensions Name=DBInstanceIdentifier,Value=myapp-replica

# Manually promote a read replica (for DR failover)
aws rds promote-read-replica --db-instance-identifier myapp-replica
```

## Cost model — pricing dimensions

```
Compute       — instance size / capacity units
Storage       — per GB-month
I/O/requests  — per request (NoSQL) or per I/O operation
Data transfer — cross-AZ/region egress

DynamoDB specifically:
  On-demand   — pay per request, no capacity planning, no throttling risk
  Provisioned — cheaper at steady predictable load, throttles if under-sized
```

## DR design — RTO/RPO reference

| Architecture | Typical RTO | Typical RPO | Relative cost |
|---|---|---|---|
| Cross-region read replica + manual promotion | Minutes–tens of minutes | Seconds–minutes | Lower |
| Multi-region write (Cosmos DB / Spanner) | Near-zero | Near-zero | Significantly higher |

## Migration checklist

```
[ ] Schema/compatibility assessment run BEFORE committing to a timeline
    (AWS SCT or equivalent — proprietary features are the real risk,
    not the bulk data transfer)
[ ] Migration tool validation/comparison report run before cutover
[ ] Cutover strategy chosen deliberately: big-bang (simpler, has a
    downtime window) vs. dual-write (no downtime, more complex)
[ ] Rollback plan defined before cutover, not improvised during it
```
