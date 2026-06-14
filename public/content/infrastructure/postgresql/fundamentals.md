# PostgreSQL — Fundamentals

## What is PostgreSQL?

PostgreSQL is one of the most widely used database systems in production environments. Understanding its fundamentals is essential for any backend developer or DevOps engineer.

## Core Concepts

### Data Model



PostgreSQL is an advanced relational database with full SQL compliance, ACID transactions, and powerful extensions like PostGIS (geospatial) and TimescaleDB (time-series).


## Installation

### Docker (Fastest)
```bash



docker run -d --name postgres -e POSTGRES_PASSWORD=secret -p 5432:5432 postgres:16-alpine

```

### Connect
```bash



docker exec -it postgres psql -U postgres

```

## First Commands




```sql\nCREATE TABLE users (\n    id BIGSERIAL PRIMARY KEY,\n    email TEXT UNIQUE NOT NULL,\n    name TEXT NOT NULL,\n    created_at TIMESTAMPTZ DEFAULT NOW()\n);\nINSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice');\nSELECT * FROM users;\n\\d users\n```


## Key Terminology

- **Table**: Collection of rows with the same columns\n- **Primary Key**: Uniquely identifies each row\n- **Index**: Data structure for faster queries\n- **Transaction**: Group of SQL statements executed atomically\n- **ACID**: Atomicity, Consistency, Isolation, Durability




## Next Steps
Move to the **Intermediate** section to learn queries, indexing, and real-world patterns.

## Practice in Labs

Use the **Labs** section to run real commands in a simulated environment. The lab has:
- Pre-loaded sample data to query against
- Simulated command execution with realistic output
- Step-by-step exercises with explanations
- Common patterns you will use in production

## Common Beginner Mistakes

1. **Not setting TTLs** (Redis) — memory fills up over time
2. **Missing indexes** — queries become slow as data grows
3. **No connection pooling** — each request opens a new connection (expensive)
4. **Storing passwords in plain text** — always hash with bcrypt
5. **Skipping backups** — test your restore procedure before you need it
