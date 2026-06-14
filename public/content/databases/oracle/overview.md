# Oracle Database — Overview

## What is Oracle Database?

Oracle Database is the world's leading enterprise relational database management system (RDBMS), used by Fortune 500 companies, banks, telecoms, and governments. Known for: enterprise features, RAC (Real Application Clusters) for extreme HA, advanced security, and decades of stability.

## Oracle vs PostgreSQL vs MySQL

| Feature | Oracle | PostgreSQL | MySQL |
|---|---|---|---|
| License | Commercial (expensive) | Open source (free) | Open source (free) |
| Enterprise features | Best in class | Excellent | Good |
| Cost | $$$$ | Free | Free |
| Syntax | PL/SQL | PL/pgSQL | Stored procedures |
| Used for | Enterprise, banking, telco | Startups to enterprise | Web apps |

## When You'll Encounter Oracle

- Large enterprises (banks, insurance, government)
- SAP, Oracle ERP systems (run on Oracle DB)
- Legacy systems (30+ years of Oracle deployments)
- Companies migrating FROM Oracle to PostgreSQL/AWS Aurora

## Oracle Architecture

```
Instance: the memory + background processes (PMON, SMON, DBWn, LGWR, CKPT)
Database: the physical files on disk (datafiles, redo logs, control files)

SGA (System Global Area):
  Buffer Cache     → caches data blocks in memory
  Shared Pool      → caches parsed SQL statements
  Redo Log Buffer  → log of changes before writing to disk
  
PGA (Program Global Area):
  Private to each session
  Sort area, hash join area
```

## Key Oracle-Specific Concepts

**Tablespace** — logical storage unit grouping related segments. Like a filesystem folder for database objects.

**Sequence** — auto-incrementing number generator. In PostgreSQL, BIGSERIAL does this automatically; in Oracle, you create sequences explicitly.

**PL/SQL** — Oracle's procedural extension to SQL for stored procedures, functions, triggers, and packages.

**RAC (Real Application Clusters)** — multiple Oracle instances sharing the same storage. Provides extreme HA — a node can fail with zero downtime.

**ASM (Automatic Storage Management)** — Oracle's built-in volume manager for database storage.

## Getting Started with Oracle

**Free Options:**
- Oracle Database 21c Express Edition (XE) — free, limited to 2 CPUs, 2GB RAM, 12GB storage
- Oracle Cloud Free Tier — Autonomous Database with 20GB storage

```bash
# Docker (quickest for learning)
docker pull gvenzl/oracle-xe:21-slim
docker run -d --name oracle-xe \
  -e ORACLE_PASSWORD=MyPassword \
  -p 1521:1521 \
  gvenzl/oracle-xe:21-slim

# Connect
docker exec -it oracle-xe sqlplus system/MyPassword@//localhost:1521/XEPDB1
```

## Oracle SQL Basics

```sql
-- Oracle uses DUAL table for expressions without a real table
SELECT SYSDATE FROM DUAL;          -- Current date/time
SELECT 2 + 2 FROM DUAL;            -- Returns 4
SELECT USER FROM DUAL;             -- Current user

-- Sequences (no SERIAL/AUTO_INCREMENT)
CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 1;
INSERT INTO users (id, name) VALUES (users_seq.NEXTVAL, 'Alice');

-- Rownum (old) vs ROW_NUMBER() (modern)
SELECT * FROM users WHERE ROWNUM <= 10;   -- Old way
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY id) rn FROM users) WHERE rn <= 10;
```

## Course Sections
- **Fundamentals** — SQL syntax, PL/SQL basics, Oracle architecture
- **Intermediate** — Performance tuning, indexes, execution plans
- **Advanced** — RAC, Data Guard, partitioning, security
- **Labs** — Practice SQL in our interactive console
