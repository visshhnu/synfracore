# AWS RDS — Advanced

## Blue-Green Deployments

```bash
# RDS Blue-Green Deployment — zero-downtime major version upgrades
# Creates a parallel "green" copy, applies changes, then promotes

# Create blue-green deployment
aws rds create-blue-green-deployment \
    --blue-green-deployment-name pg15-upgrade \
    --source arn:aws:rds:us-east-1:123:db:prod-postgres \
    --target-engine-version 16.1 \
    --target-db-parameter-group-name pg16-params \
    --target-db-cluster-parameter-group-name pg16-cluster-params

# Monitor green environment
aws rds describe-blue-green-deployments \
    --filters Name=blue-green-deployment-name,Values=pg15-upgrade

# Test the green environment (it's a real running DB)
# Point staging/test traffic to the green endpoint
# Run your test suite against it

# Switch over (< 1 minute downtime)
aws rds switchover-blue-green-deployment \
    --blue-green-deployment-identifier bgd-xxx \
    --switchover-timeout 300  # Max wait in seconds

# Old blue becomes the new green (easy rollback if needed)
# Delete old blue when satisfied
aws rds delete-blue-green-deployment \
    --blue-green-deployment-identifier bgd-xxx \
    --delete-target
```

## RDS Advanced Monitoring

```python
# Enhanced Monitoring via CloudWatch (1-60 second intervals)
# Performance Insights API for query analysis

import boto3
from datetime import datetime, timedelta

pi = boto3.client('pi', region_name='us-east-1')

def get_slow_queries(db_resource_id: str, minutes: int = 60) -> list:
    """Get top slow queries from Performance Insights."""
    end = datetime.utcnow()
    start = end - timedelta(minutes=minutes)

    response = pi.get_resource_metrics(
        ServiceType='RDS',
        Identifier=db_resource_id,
        MetricQueries=[
            {
                'Metric': 'db.load.avg',
                'GroupBy': {
                    'Group': 'db.sql',
                    'Dimensions': ['db.sql.tokenized_id'],
                    'Limit': 10,
                }
            }
        ],
        StartTime=start,
        EndTime=end,
        PeriodInSeconds=60,
    )

    queries = []
    for point in response.get('MetricList', []):
        for key, value in point.get('DataPoints', {}).items():
            if key.startswith('db.sql.tokenized_id='):
                query_id = key.split('=')[1]
                queries.append({
                    'sql': get_sql_text(pi, db_resource_id, query_id),
                    'avg_load': value,
                })
    return sorted(queries, key=lambda x: x['avg_load'], reverse=True)

# Automated vacuum monitoring for PostgreSQL
def check_bloat(conn) -> list:
    """Find tables with excessive dead tuples (needs vacuum)."""
    cursor = conn.cursor()
    cursor.execute("""
        SELECT schemaname, tablename,
               n_dead_tup, n_live_tup,
               ROUND(n_dead_tup::numeric / NULLIF(n_live_tup + n_dead_tup, 0) * 100, 1) AS dead_pct,
               last_autovacuum
        FROM pg_stat_user_tables
        WHERE n_dead_tup > 10000
        ORDER BY n_dead_tup DESC
        LIMIT 20
    """)
    return cursor.fetchall()
```

## RDS Cheatsheet

```bash
# ── STATUS ─────────────────────────────────────────────────
aws rds describe-db-instances \
    --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,DBInstanceClass,Endpoint.Address]' \
    --output table

# ── SNAPSHOTS ──────────────────────────────────────────────
aws rds create-db-snapshot \
    --db-instance-identifier prod-postgres \
    --db-snapshot-identifier prod-postgres-pre-migration-$(date +%Y%m%d)

aws rds describe-db-snapshots \
    --db-instance-identifier prod-postgres \
    --query 'DBSnapshots[*].[DBSnapshotIdentifier,SnapshotCreateTime,Status]' \
    --output table

aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier prod-postgres-restore \
    --db-snapshot-identifier prod-postgres-pre-migration-20240115

# Point-in-time restore (any second within retention window)
aws rds restore-db-instance-to-point-in-time \
    --source-db-instance-identifier prod-postgres \
    --target-db-instance-identifier prod-postgres-restored \
    --restore-time 2024-01-15T10:30:00Z

# ── MAINTENANCE ───────────────────────────────────────────
aws rds modify-db-instance \
    --db-instance-identifier prod-postgres \
    --db-instance-class db.r6g.xlarge \
    --no-apply-immediately     # Apply in next maintenance window

aws rds reboot-db-instance \
    --db-instance-identifier prod-postgres \
    --force-failover            # Forces Multi-AZ failover (for testing)

# ── MONITORING ───────────────────────────────────────────
aws rds describe-events \
    --source-identifier prod-postgres \
    --source-type db-instance \
    --duration 10080            # Last 7 days in minutes

aws cloudwatch get-metric-statistics \
    --namespace AWS/RDS \
    --metric-name DatabaseConnections \
    --dimensions Name=DBInstanceIdentifier,Value=prod-postgres \
    --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ) \
    --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
    --period 60 --statistics Maximum
```
