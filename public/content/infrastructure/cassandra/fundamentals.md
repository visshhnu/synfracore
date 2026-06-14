# Cassandra — Fundamentals

## What is Cassandra?

Cassandra is one of the most widely used database systems in production environments. Understanding its fundamentals is essential for any backend developer or DevOps engineer.

## Core Concepts

### Data Model




Cassandra is a distributed wide-column store. Designed for massive scale across many servers with no single point of failure. Data is distributed using consistent hashing.

## Installation

### Docker (Fastest)
```bash




docker run -d --name cassandra -p 9042:9042 cassandra:4.1
```

### Connect
```bash




docker exec -it cassandra cqlsh
```

## First Commands





```cql\nCREATE KEYSPACE myapp WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};\nUSE myapp;\nCREATE TABLE users (id UUID PRIMARY KEY, email TEXT, name TEXT, created_at TIMESTAMP);\nINSERT INTO users (id, email, name) VALUES (uuid(), 'alice@example.com', 'Alice');\nSELECT * FROM users;\n```

## Key Terminology




- **Keyspace**: Top-level namespace (like a database)\n- **Table**: Collection of rows with same columns\n- **Partition Key**: Determines which node stores the data\n- **Clustering Key**: Orders data within a partition\n- **Replication Factor**: Number of copies of each row

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
