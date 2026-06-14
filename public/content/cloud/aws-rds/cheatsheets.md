# AWS RDS — Cheatsheet

```bash
# ── CREATE & MANAGE ───────────────────────────────────────
# Create RDS PostgreSQL
aws rds create-db-instance   --db-instance-identifier prod-db   --db-instance-class db.t3.medium   --engine postgres --engine-version 16   --master-username admin   --master-user-password $(openssl rand -base64 16)   --allocated-storage 100 --storage-type gp3   --multi-az --no-publicly-accessible   --backup-retention-period 7 --deletion-protection

aws rds wait db-instance-available --db-instance-identifier prod-db

# Get endpoint
aws rds describe-db-instances --db-instance-identifier prod-db   --query 'DBInstances[0].Endpoint.Address' --output text

# Modify instance
aws rds modify-db-instance --db-instance-identifier prod-db   --db-instance-class db.r6g.large --apply-immediately

# ── SNAPSHOTS & BACKUP ────────────────────────────────────
aws rds create-db-snapshot --db-instance-identifier prod-db --db-snapshot-identifier manual-snap-$(date +%Y%m%d)
aws rds describe-db-snapshots --db-instance-identifier prod-db --output table
aws rds restore-db-instance-from-db-snapshot   --db-instance-identifier restored-db   --db-snapshot-identifier manual-snap-20240115

# Point-in-time restore (within retention window)
aws rds restore-db-instance-to-point-in-time   --source-db-instance-identifier prod-db   --target-db-instance-identifier restored-pitr   --restore-time 2024-01-15T14:00:00Z

# ── MONITORING ────────────────────────────────────────────
aws rds describe-db-log-files --db-instance-identifier prod-db
aws cloudwatch get-metric-statistics --namespace AWS/RDS   --metric-name DatabaseConnections   --dimensions Name=DBInstanceIdentifier,Value=prod-db   --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)   --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) --period 60 --statistics Average

# Key metrics to monitor:
# DatabaseConnections, CPUUtilization, FreeStorageSpace
# ReadLatency, WriteLatency, ReadIOPS, WriteIOPS
# FreeableMemory, SwapUsage, ReplicaLag (for read replicas)

# ── READ REPLICAS ─────────────────────────────────────────
aws rds create-db-instance-read-replica   --db-instance-identifier prod-db-replica   --source-db-instance-identifier prod-db
aws rds promote-read-replica --db-instance-identifier prod-db-replica  # Promote to standalone

# ── PARAMETER GROUPS ─────────────────────────────────────
aws rds create-db-parameter-group   --db-parameter-group-name custom-postgres16   --db-parameter-group-family postgres16   --description "Custom PostgreSQL 16"
aws rds modify-db-parameter-group   --db-parameter-group-name custom-postgres16   --parameters "ParameterName=max_connections,ParameterValue=500,ApplyMethod=pending-reboot"
```
