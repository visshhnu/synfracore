# AWS RDS -- Portfolio Projects

---

## Project 1: Multi-AZ RDS with Automated Backups

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `aws-rds-production`

Production-grade RDS PostgreSQL with Multi-AZ, encryption, and automated backup testing.

```hcl
resource "aws_db_instance" "prod" {
  identifier             = "prod-postgres"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.medium"
  allocated_storage      = 100
  storage_type           = "gp3"
  storage_encrypted      = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  backup_retention_period = 7
  deletion_protection    = true
  skip_final_snapshot    = false
  final_snapshot_identifier = "prod-postgres-final"

  performance_insights_enabled = true
  monitoring_interval          = 60
  monitoring_role_arn          = aws_iam_role.rds_monitoring.arn
}
```

**Steps:** Private subnets, security group (port 5432 from app SG only), test failover, restore from snapshot

---

## Project 2: RDS Proxy for Connection Pooling

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `aws-rds-proxy`

RDS Proxy handles connection pooling for serverless workloads -- 10x more connections.

```hcl
resource "aws_db_proxy" "main" {
  name                   = "prod-proxy"
  debug_logging          = false
  engine_family          = "POSTGRESQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = aws_iam_role.rds_proxy.arn
  vpc_subnet_ids         = module.vpc.private_subnets
  vpc_security_group_ids = [aws_security_group.rds_proxy.id]

  auth {
    auth_scheme = "SECRETS"
    iam_auth    = "REQUIRED"
    secret_arn  = aws_secretsmanager_secret.db_password.arn
  }
}
```

**Steps:** Lambda connecting directly vs via proxy -- measure connection count under load

---

## Portfolio Checklist
- [ ] RDS in private subnets (no public access)
- [ ] Credentials in Secrets Manager (not environment variables)
- [ ] Automated backup + tested restore
- [ ] CloudWatch alarms: connections, CPU, storage
