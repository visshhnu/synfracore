# PostgreSQL — Certification Guide

## EDB PostgreSQL Associate Certification

| Detail | Info |
|---|---|
| **Provider** | EDB (EnterpriseDB) |
| **Cost** | $195 USD |
| **Format** | 75 questions, 90 minutes, multiple choice |
| **Validity** | Lifetime |

### Domain Breakdown
- **25%** Database Design and DDL
- **20%** SQL Query Writing and DML
- **20%** Database Administration
- **20%** Performance Tuning and Optimization
- **15%** Security, Backup, and Recovery

### Key Topics
- SQL: JOINs, CTEs, window functions, aggregations
- EXPLAIN ANALYZE — reading and optimizing execution plans
- Index types: B-tree, GIN, GiST, BRIN, Partial, Covering
- VACUUM and autovacuum configuration
- MVCC internals — how PostgreSQL handles concurrent access
- Streaming replication configuration
- pg_stat_statements, pg_stat_activity monitoring views
- Backup: pg_dump, pg_dumpall, pg_basebackup, WAL archiving
- Connection pooling: PgBouncer transaction vs session mode
- PostgreSQL extensions: PostGIS, TimescaleDB, pg_stat_statements

---

## AWS Database Specialty (DBS-C01)

If you use PostgreSQL on AWS (RDS PostgreSQL or Aurora PostgreSQL), this certification covers it in depth:

| Detail | Info |
|---|---|
| **Cost** | $300 USD |
| **Format** | 65 questions, 180 minutes |
| **Focus** | RDS, Aurora, DynamoDB, ElastiCache, Redshift |

Covers: RDS Multi-AZ vs Aurora Global Database, migration strategies (AWS DMS), encryption at rest and in transit, performance insights, parameter groups.

---

## Self-Study Resources

1. **Official PostgreSQL documentation** — postgresql.org/docs (best reference, free)
2. **PostgreSQL Tutorial** — postgresqltutorial.com (practical examples)
3. **pgexercises.com** — interactive SQL exercises
4. **USE THE INDEX, LUKE** — use-the-index-luke.com (indexing deep dive)
5. **EDB Learning Portal** — enterprisedb.com/training (official exam prep)
