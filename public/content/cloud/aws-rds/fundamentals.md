# AWS RDS & Aurora — Fundamentals

Every application eventually needs somewhere durable to put its data, and someone has to keep that database patched, backed up, and running when a server dies at 3am. RDS is AWS's answer: you still design your schema and write your queries exactly like you would against a database you host yourself, but AWS takes over the operational parts — provisioning the underlying server, applying OS/engine patches, taking backups, and handling failover if hardware fails.

## Quick Analogy

Think of RDS the way you'd think of hiring a building superintendent instead of doing all your own home maintenance: you still decide how to furnish and use each room (your schema, your queries, your indexes), but the "super" (AWS) handles the boiler, the plumbing, and calling a backup unit if something breaks overnight. Aurora takes this further — it's like moving into a building that was engineered from the ground up for reliability (distributed storage across multiple AZs) instead of a converted regular house.

## RDS Overview

```
RDS = Managed relational database service
AWS handles: Hardware, OS, patching, backups, replication, failover

Supported engines:
  PostgreSQL 11-16
  MySQL 5.7, 8.0
  MariaDB 10.5-10.11
  Oracle (bring your own license)
  SQL Server (Standard/Enterprise)
  Aurora (MySQL-compatible or PostgreSQL-compatible)
```

*(needs verification — these are the engine major/minor versions available at time of writing; AWS regularly adds new versions and deprecates old ones, so check the current "supported engine versions" page before relying on this list.)*

## How the Pieces Fit Together

```
             Client / App tier (private subnet)
                        │
                        ▼
        ┌───────────────────────────────┐
        │   Security Group (rds SG)      │   inbound 5432 from app SG only
        └───────────────┬────────────────┘
                        ▼
        ┌───────────────────────────────┐
        │   DB Subnet Group               │   spans private subnets in 2+ AZs
        │   ┌───────────┐  ┌───────────┐ │
        │   │ Primary    │  │ Standby   │ │  ← Multi-AZ: sync replication,
        │   │ (AZ-1)     │  │ (AZ-2)    │ │    standby not readable
        │   └───────────┘  └───────────┘ │
        └───────────────────────────────┘
```

The subnet group, security group, and Multi-AZ standby are the three pieces every production RDS instance needs — miss any one and you either have no HA, an unreachable database, or an accidentally public one.

## Create RDS Instance (Terraform)

```hcl
resource "aws_db_subnet_group" "main" {
  name       = "prod-db-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds" {
  name   = "prod-rds-sg"
  vpc_id = var.vpc_id
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.app_sg_id]  # Only app servers can connect
  }
}

resource "aws_db_instance" "postgres" {
  identifier        = "prod-postgres"
  engine            = "postgres"
  engine_version    = "16.1"
  instance_class    = "db.r6g.large"    # Graviton — 20% cheaper
  allocated_storage = 100
  storage_type      = "gp3"
  storage_encrypted = true              # Always encrypt!
  kms_key_id        = aws_kms_key.rds.arn

  db_name  = "myapp"
  username = "postgres"
  password = random_password.db.result  # Use Secrets Manager in prod

  multi_az               = true         # Automatic failover to standby
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  backup_retention_period = 7           # 7 days automated backups
  backup_window           = "03:00-04:00"  # UTC
  maintenance_window      = "sun:04:00-sun:05:00"

  deletion_protection = true
  skip_final_snapshot = false
  final_snapshot_identifier = "prod-postgres-final"

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  monitoring_interval                   = 60  # Enhanced monitoring
  monitoring_role_arn                   = aws_iam_role.rds_enhanced.arn

  tags = { Environment = "prod" }
}
```

## Aurora vs RDS

```
RDS PostgreSQL/MySQL:
  Standard PostgreSQL/MySQL — fully compatible
  Single-AZ or Multi-AZ (1 standby)
  Storage: EBS volumes, auto-scaling triggers when free space is low *(needs verification — exact increment/threshold formula for storage autoscaling, check current AWS RDS docs)*
  Replicas: Up to 5 read replicas

Aurora:
  Custom storage engine built for cloud
  Shared storage across 6 AZ copies — 6 copies always exist
  Replicas: Up to 15 read replicas (any is primary-capable)
  Aurora Serverless v2: Auto-scales compute 0.5-128 ACUs
  Compatible with MySQL 8.0 or PostgreSQL 14/15/16
  
  Aurora advantages:
  - 5× throughput vs MySQL, 3× vs PostgreSQL
  - Storage auto-grows to 128TB
  - Recovery in ~30 seconds (vs ~60-120 seconds/1-2 minutes for RDS Multi-AZ)
  - Backtrack: Rewind database to any second in last 72h (Aurora MySQL only —
    Aurora PostgreSQL does not support Backtrack)

  Aurora disadvantages:
  - More expensive (about 20% higher than equivalent RDS)
  - Aurora-specific features break standard compatibility
```

## RDS Proxy

```hcl
# RDS Proxy — connection pooler for serverless and Lambda
resource "aws_db_proxy" "main" {
  name                   = "prod-rds-proxy"
  debug_logging          = false
  engine_family          = "POSTGRESQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = aws_iam_role.rds_proxy.arn
  vpc_security_group_ids = [aws_security_group.rds_proxy.id]
  vpc_subnet_ids         = var.private_subnet_ids

  auth {
    iam_auth    = "REQUIRED"        # Lambda uses IAM auth — no passwords!
    secret_arn  = aws_secretsmanager_secret.db.arn
  }

  target_group_name = "default"  # Links to RDS instance automatically
}
```

## Maintenance and Operations

```bash
# Check slow queries (PostgreSQL RDS)
# Enable pg_stat_statements in parameter group first
psql -h $DB_HOST -U postgres -d myapp -c "
SELECT query, calls, mean_exec_time, total_exec_time
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 20;"

# RDS Performance Insights — best tool for slow query analysis
# AWS Console → RDS → Performance Insights → SQL tab

# Manual snapshot (before risky migrations)
aws rds create-db-snapshot \
    --db-instance-identifier prod-postgres \
    --db-snapshot-identifier before-migration-$(date +%Y%m%d)

# Promote read replica (for failover testing or migration)
aws rds promote-read-replica --db-instance-identifier prod-replica

# Modify instance class (causes reboot or failover)
aws rds modify-db-instance \
    --db-instance-identifier prod-postgres \
    --db-instance-class db.r6g.xlarge \
    --apply-immediately  # or --no-apply-immediately for maintenance window
```

## Try It Yourself (2 minutes)

If you have access to any RDS instance (even a free-tier `db.t3.micro`), run:

```bash
aws rds describe-db-instances \
    --query 'DBInstances[*].[DBInstanceIdentifier,MultiAZ,PubliclyAccessible,Endpoint.Address]' \
    --output table
```

Check the `PubliclyAccessible` column specifically. For any real database it should read `False` — if you ever see `True` on a production instance, that's a database reachable from the open internet and worth fixing immediately, regardless of what the security group says.
