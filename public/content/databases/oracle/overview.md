# Oracle Database — Overview

**Before you start:** basic SQL (SELECT/WHERE/JOIN) is assumed — see the SQL Mastery course first if that's new. No prior Oracle-specific experience is required; every Oracle-specific term below is defined as it comes up.

## What is Oracle Database?

Oracle Database is the world's leading enterprise relational database management system (RDBMS), used by Fortune 500 companies, banks, telecoms, and governments. Known for: enterprise features, RAC (Real Application Clusters) for extreme HA, advanced security, and decades of stability.

## Why This Exists (The Hook)

A bank processing millions of transactions a second, across multiple data centers, cannot tolerate a database going down even for the minutes a failover normally takes — and it needs decades-old audit and compliance features baked into the platform itself, not bolted on. Oracle Database exists because it was built from the start for exactly that tier of requirement: extreme high availability (RAC lets multiple database instances share the same storage so the database stays up even if a node dies), enterprise security, and support contracts with guaranteed response times — at a real licensing cost that reflects that guarantee.

**Analogy** — Think of Oracle like a private, dedicated fire department versus PostgreSQL's excellent volunteer department. Both will show up and put out the fire (both are real, capable relational databases) — but the private department comes with a guaranteed response-time contract, redundant equipment at every station (RAC), and a direct line to a paid support team, all for a real annual fee. The volunteer department is free, highly skilled, and handles the vast majority of fires just as well — but there's no contractual guarantee behind it.

**Try it (2 minutes)** — Reason through why `SELECT 2 + 2 FROM DUAL;` looks strange coming from PostgreSQL or MySQL, without running anything: in most databases, you can just write `SELECT 2 + 2;` — no table required for a plain expression. Oracle's SQL implementation historically required every `SELECT` to name a table. `DUAL` is a real, permanent one-row table Oracle ships specifically so expressions have something to "select from." What does this tell you about the era and design philosophy Oracle's SQL dialect grew out of, compared to more modern SQL implementations?

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

```conceptgrid
{
  "boxes": [
    { "title": "Tablespace", "description": "Logical storage unit grouping related segments -- like a folder for DB objects", "color": "blue" },
    { "title": "Sequence", "description": "Auto-incrementing number generator, created explicitly (unlike Postgres's BIGSERIAL)", "color": "purple" },
    { "title": "PL/SQL", "description": "Oracle's procedural extension to SQL -- procedures, functions, triggers, packages", "color": "amber" },
    { "title": "RAC", "description": "Real Application Clusters -- multiple instances sharing storage for extreme HA", "color": "green" }
  ]
}
```

**Tablespace** — logical storage unit grouping related segments. Like a filesystem folder for database objects.

**Sequence** — auto-incrementing number generator. In PostgreSQL, BIGSERIAL does this automatically; in Oracle, you create sequences explicitly.

**PL/SQL** — Oracle's procedural extension to SQL for stored procedures, functions, triggers, and packages.

**RAC (Real Application Clusters)** — multiple Oracle instances sharing the same storage. Provides extreme HA — if one node fails, the database as a whole stays up and surviving nodes keep serving traffic, though sessions connected to the failed node still need to reconnect/fail over (not literally zero-impact for those specific sessions).

**ASM (Automatic Storage Management)** — Oracle's built-in volume manager for database storage.

## Getting Started with Oracle

**Free Options:**
- Oracle Database Express Edition (XE) — free, resource-limited (CPU/RAM/storage caps that vary by XE release)
- Oracle Cloud Free Tier — includes an Autonomous Database tier

*(needs verification — exact XE version and its specific CPU/RAM/storage limits, and Free Tier storage allowance, change between Oracle releases; confirm current values on Oracle's own download/Cloud Free Tier pages)*

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
