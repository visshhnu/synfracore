# AWS RDS Cheatsheet

## Core CLI Commands
```bash
# Create DB instance
aws rds create-db-instance \
  --db-instance-identifier mydb \
  --db-instance-class db.t3.micro \
  --engine mysql --engine-version 8.0 \
  --master-username admin \
  --master-user-password MyPassword123! \
  --allocated-storage 20 \
  --db-name myapp \
  --vpc-security-group-ids sg-xxx \
  --db-subnet-group-name my-subnet-group \
  --backup-retention-period 7 \
  --multi-az

# Snapshot
aws rds create-db-snapshot \
  --db-instance-identifier mydb \
  --db-snapshot-identifier mydb-snap-20250624

# Restore from snapshot
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier mydb-restored \
  --db-snapshot-identifier mydb-snap-20250624

# Read replica
aws rds create-db-instance-read-replica \
  --db-instance-identifier mydb-replica \
  --source-db-instance-identifier mydb

# Scale storage
aws rds modify-db-instance \
  --db-instance-identifier mydb \
  --allocated-storage 100 --apply-immediately

aws rds describe-db-instances
aws rds delete-db-instance --db-instance-identifier mydb --skip-final-snapshot
```

## Multi-AZ vs Read Replica
| Feature | Multi-AZ | Read Replica |
|---------|----------|--------------|
| Purpose | High availability | Read scaling |
| Replication | Synchronous | Asynchronous |
| Endpoint | Single (auto-failover) | Separate endpoint |
| Promote | Automatic (failover) | Manual (break replica) |
| Cross-region | Standby same region | Replica across regions |
| Use | HA, disaster recovery | Analytics, reporting, read offload |

## Supported Engines
```
MySQL          → 5.7, 8.0
PostgreSQL     → 13, 14, 15, 16
MariaDB        → 10.6, 10.11
Oracle         → SE2, EE (BYOL or LI)
SQL Server     → Express, Web, Standard, Enterprise
Aurora MySQL   → MySQL 5.7/8.0 compatible (serverless v2 option)
Aurora PostgreSQL → PG 13/14/15 compatible (serverless v2 option)
```

## RDS Proxy
```bash
# Create proxy (reduces connection overhead)
aws rds create-db-proxy \
  --db-proxy-name myproxy \
  --engine-family MYSQL \
  --auth Description=admin,SecretArn=arn:aws:secretsmanager:... \
  --role-arn arn:aws:iam::123456789:role/RDSProxy \
  --vpc-subnet-ids subnet-xxx subnet-yyy \
  --vpc-security-group-ids sg-xxx

# Use case: Lambda → RDS Proxy → RDS (avoids connection exhaustion)
```

## Key Points
```
Parameter Group: tune DB settings (max_connections, innodb_buffer_pool, etc.)
Option Group:    add features (Oracle TDE, SQL Server backup, etc.)
Encryption:      at rest (KMS), in transit (SSL/TLS) — enable at creation
Automated backup: 1-35 days retention | point-in-time recovery within window
Performance Insights: visualise DB load, top SQL, wait events (free 7-day retention)
Enhanced Monitoring: OS metrics at 1-60 second granularity
```
