# AWS RDS & Aurora — Managed Relational Databases

Amazon RDS (Relational Database Service) takes the operational burden of running databases off your team. No OS patching, no manual backups, no replication setup — AWS handles it. Aurora is AWS's cloud-native database that's MySQL/PostgreSQL compatible but up to 5× faster.

## RDS vs Aurora vs Self-Managed

| Feature | Self-Managed EC2 | RDS | Aurora |
|---------|-----------------|-----|--------|
| **OS patching** | You | AWS | AWS |
| **Backups** | You | AWS (auto) | AWS (continuous) |
| **Replication** | You configure | 1-click standby | Auto (6 copies) |
| **Failover time** | Minutes (manual) | ~60-120 seconds | ~30 seconds |
| **Storage scaling** | Manual | Auto (up to 64TB) | Auto (up to 128TB) |
| **Read replicas** | You configure | Up to 5 | Up to 15 |
| **Cost** | Lowest (infra only) | Medium | Higher (~20%) |
| **Best for** | Full control | Standard workloads | High performance |

## Supported Engines

```
RDS:    MySQL 8.0, PostgreSQL 15, MariaDB, Oracle, SQL Server
Aurora: Aurora MySQL, Aurora PostgreSQL (cloud-native)
```

## Create RDS Instance (Terraform)

```hcl
# VPC and subnet group first
resource "aws_db_subnet_group" "main" {
  name       = "prod-db-subnet-group"
  subnet_ids = var.private_subnet_ids   # ALWAYS use private subnets!
  tags = { Name = "prod-db-subnet-group" }
}

# Security group - only allow app tier
resource "aws_security_group" "rds" {
  name   = "prod-rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]  # Only app servers
  }
  # No public ingress - database is private
}

# RDS Parameter Group
resource "aws_db_parameter_group" "postgres" {
  name   = "prod-postgres15"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
  parameter {
    name  = "log_min_duration_statement"
    value = "1000"   # Log queries taking > 1 second
  }
  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
  }
}

# RDS Instance
resource "aws_db_instance" "main" {
  identifier        = "prod-postgres"
  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.r6g.xlarge"   # 4 vCPU, 32GB RAM

  # Storage
  allocated_storage     = 100
  max_allocated_storage = 1000           # Auto-scales up to 1TB
  storage_type          = "gp3"
  storage_encrypted     = true
  kms_key_id            = aws_kms_key.rds.arn

  # Credentials - use Secrets Manager, never hardcode!
  username = "postgres"
  password = random_password.db.result
  manage_master_user_password = true    # AWS manages rotation

  # Network
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false        # NEVER true in production!

  # High Availability
  multi_az = true                       # Standby in different AZ

  # Backups
  backup_retention_period = 30          # Keep 30 days
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:04:00-sun:05:00"

  # Monitoring
  monitoring_interval          = 60     # Enhanced monitoring every 60s
  monitoring_role_arn          = aws_iam_role.rds_monitoring.arn
  performance_insights_enabled = true
  performance_insights_retention_period = 731  # 2 years

  # Parameters
  parameter_group_name = aws_db_parameter_group.postgres.name

  # Protection
  deletion_protection = true            # Prevent accidental deletion
  skip_final_snapshot = false
  final_snapshot_identifier = "prod-postgres-final-${formatdate("YYYYMMDD", timestamp())}"

  tags = { Environment = "production", Team = "platform" }
}

# Read replica for reporting/analytics
resource "aws_db_instance" "replica" {
  identifier          = "prod-postgres-replica"
  instance_class      = "db.r6g.large"
  replicate_source_db = aws_db_instance.main.identifier
  publicly_accessible = false
  
  # Read replicas inherit most settings from primary
  tags = { Role = "read-replica" }
}
```

## Aurora Serverless v2

```hcl
resource "aws_rds_cluster" "aurora" {
  cluster_identifier   = "prod-aurora-postgres"
  engine               = "aurora-postgresql"
  engine_version       = "15.4"
  engine_mode          = "provisioned"   # Use with serverless_v2_scaling_configuration

  database_name   = "myapp"
  master_username = "postgres"
  manage_master_user_password = true

  # Aurora stores 6 copies across 3 AZs automatically
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds.id]

  # Continuous backup to S3
  backup_retention_period  = 35
  preferred_backup_window  = "03:00-04:00"

  storage_encrypted = true

  serverless_v2_scaling_configuration {
    min_capacity = 0.5    # 0.5 ACU minimum (~0.5GB RAM)
    max_capacity = 64     # Scale up to 64 ACU (128GB RAM)
  }

  deletion_protection = true
}

# Add instances to the cluster
resource "aws_rds_cluster_instance" "writer" {
  count               = 1
  identifier          = "prod-aurora-writer-${count.index}"
  cluster_identifier  = aws_rds_cluster.aurora.id
  instance_class      = "db.serverless"
  engine              = aws_rds_cluster.aurora.engine
  engine_version      = aws_rds_cluster.aurora.engine_version
  publicly_accessible = false
  performance_insights_enabled = true
}

resource "aws_rds_cluster_instance" "reader" {
  count               = 2
  identifier          = "prod-aurora-reader-${count.index}"
  cluster_identifier  = aws_rds_cluster.aurora.id
  instance_class      = "db.serverless"
  engine              = aws_rds_cluster.aurora.engine
  engine_version      = aws_rds_cluster.aurora.engine_version
  publicly_accessible = false
}
```

## Connecting to RDS Securely

```python
# Python - Using AWS Secrets Manager (best practice)
import boto3
import json
import psycopg2
from functools import lru_cache

@lru_cache(maxsize=1)
def get_db_credentials():
    """Fetch and cache database credentials from Secrets Manager."""
    client = boto3.client('secretsmanager')
    secret = client.get_secret_value(
        SecretId='prod/myapp/db-credentials'
    )
    return json.loads(secret['SecretString'])

def get_db_connection():
    creds = get_db_credentials()
    return psycopg2.connect(
        host=creds['host'],
        port=creds['port'],
        database=creds['dbname'],
        user=creds['username'],
        password=creds['password'],
        sslmode='require',          # Always use SSL for RDS
        connect_timeout=5,
    )

# Using IAM authentication (even more secure - no password)
import boto3

def get_iam_token():
    rds_client = boto3.client('rds')
    return rds_client.generate_db_auth_token(
        DBHostname='mydb.cluster-xxx.us-east-1.rds.amazonaws.com',
        Port=5432,
        DBUsername='app_user',
        Region='us-east-1'
    )

conn = psycopg2.connect(
    host='mydb.cluster-xxx.us-east-1.rds.amazonaws.com',
    database='myapp',
    user='app_user',
    password=get_iam_token(),
    sslmode='require',
)
```

## Performance Monitoring

```sql
-- Check slow queries (Performance Insights or pg_stat_statements)
SELECT 
    query,
    calls,
    ROUND(total_exec_time::numeric, 2) AS total_ms,
    ROUND(mean_exec_time::numeric, 2) AS avg_ms,
    ROUND((100 * total_exec_time / SUM(total_exec_time) OVER ())::numeric, 2) AS pct_total
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 20;

-- Check active connections
SELECT count(*), state, wait_event_type, wait_event
FROM pg_stat_activity
WHERE datname = 'myapp'
GROUP BY state, wait_event_type, wait_event;

-- Check table sizes
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(relid)) as total_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC
LIMIT 20;
```

## Interview Questions

**What is Multi-AZ RDS and how is it different from a Read Replica?**
Multi-AZ creates a synchronous standby replica in a different Availability Zone. It exists purely for high availability — the standby doesn't serve any traffic. If the primary fails, RDS automatically fails over to the standby (60-120 seconds). A Read Replica is an asynchronous copy used for read scaling — it serves SELECT queries to reduce load on the primary. You can promote a Read Replica to become the new primary, but it's not automatic.

**What is Aurora and when would you choose it over standard RDS?**
Aurora is AWS's cloud-native MySQL/PostgreSQL-compatible database. It stores 6 copies of data across 3 AZs automatically, provides up to 15 read replicas (vs 5 for RDS), and Aurora Serverless v2 auto-scales from near-zero to 128 vCPUs in seconds. Choose Aurora when you need: higher availability (Aurora clusters survive losing 2 of 3 AZs), more read replicas, faster failover (~30s vs ~60-120s), or Serverless auto-scaling. Use standard RDS when you need Oracle or SQL Server (Aurora doesn't support these), want the lowest cost for small workloads, or need specific engine features not available in Aurora.
