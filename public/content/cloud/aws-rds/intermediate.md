# AWS RDS — Intermediate

## Read Replicas and Scaling

```bash
# Create read replica in same region
aws rds create-db-instance-read-replica \
    --db-instance-identifier prod-postgres-replica-1 \
    --source-db-instance-identifier prod-postgres \
    --db-instance-class db.r6g.large \
    --publicly-accessible false

# Create cross-region read replica (for DR and geo-performance)
aws rds create-db-instance-read-replica \
    --db-instance-identifier prod-postgres-replica-india \
    --source-db-instance-identifier arn:aws:rds:us-east-1:123:db:prod-postgres \
    --db-instance-class db.r6g.large \
    --region ap-south-1

# Application connection string patterns
# PRIMARY (writes):
# postgresql://postgres:pass@prod-postgres.cluster-xxx.us-east-1.rds.amazonaws.com:5432/myapp

# REPLICA (reads):
# postgresql://postgres:pass@prod-postgres-replica-1.xxx.us-east-1.rds.amazonaws.com:5432/myapp

# With PgBouncer or connection pooling — point app to proxy, not directly to RDS
```

## Aurora Specific Features

```bash
# Aurora Global Database — single primary, replicate to 5 regions
# Write latency: same as single-region (writes stay local)
# Replication lag to secondary regions: < 1 second

aws rds create-global-cluster \
    --global-cluster-identifier my-global-db \
    --engine aurora-postgresql \
    --engine-version 16.1

# Add secondary region
aws rds create-db-cluster \
    --db-cluster-identifier prod-aurora-india \
    --global-cluster-identifier my-global-db \
    --engine aurora-postgresql \
    --db-cluster-instance-class db.r6g.large \
    --region ap-south-1

# Managed failover (promote secondary to primary)
aws rds failover-global-cluster \
    --global-cluster-identifier my-global-db \
    --target-db-cluster-identifier prod-aurora-india

# Aurora Serverless v2 — auto-scale compute on demand
# Measured in ACUs (Aurora Capacity Units)
# 1 ACU ≈ 2GB RAM + proportional CPU
aws rds modify-db-cluster \
    --db-cluster-identifier my-aurora \
    --serverless-v2-scaling-configuration MinCapacity=0.5,MaxCapacity=128
```

## Database Proxy Deep Dive

```python
# Using RDS Proxy with IAM authentication from Lambda

import boto3, json
import psycopg2
from functools import lru_cache

rds_client = boto3.client('rds', region_name='us-east-1')

@lru_cache(maxsize=1)
def get_auth_token():
    """Generate IAM auth token (valid for 15 minutes, cache it)."""
    return rds_client.generate_db_auth_token(
        DBHostname=os.environ['DB_PROXY_ENDPOINT'],
        Port=5432,
        DBUsername='lambda_user',
        Region='us-east-1'
    )

def get_db_connection():
    """Get database connection via RDS Proxy with IAM auth."""
    token = get_auth_token()

    # Download RDS CA bundle for SSL verification
    ssl_config = {'sslmode': 'verify-full', 'sslrootcert': '/tmp/rds-ca-cert.pem'}

    return psycopg2.connect(
        host=os.environ['DB_PROXY_ENDPOINT'],
        port=5432,
        database='myapp',
        user='lambda_user',
        password=token,  # Token IS the password
        **ssl_config
    )

# Lambda reuses the connection across warm invocations
# RDS Proxy multiplexes this to the actual RDS instance
conn = None

def handler(event, context):
    global conn
    if conn is None or conn.closed:
        conn = get_db_connection()

    with conn.cursor() as cur:
        cur.execute("SELECT * FROM users WHERE id = %s", (event['user_id'],))
        return cur.fetchone()
```
