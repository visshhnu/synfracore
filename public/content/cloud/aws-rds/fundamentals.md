# AWS RDS & Aurora — Fundamentals

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
  Storage: EBS volumes, grow in 10GB increments
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
  - Recovery in 30 seconds (vs several minutes for RDS)
  - Backtrack: Rewind database to any second in last 72h

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
