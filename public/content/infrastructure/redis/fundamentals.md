# Redis — Fundamentals

## What is Redis?

Redis is one of the most widely used database systems in production environments. Understanding its fundamentals is essential for any backend developer or DevOps engineer.

## Core Concepts

### Data Model

Redis is an in-memory data structure store. It supports strings, hashes, lists, sets, sorted sets, bitmaps, and more. Data lives in RAM for ultra-fast access.




## Installation

### Docker (Fastest)
```bash

docker run -d --name redis -p 6379:6379 redis:7-alpine



```

### Connect
```bash

docker exec -it redis redis-cli



```

## First Commands


```bash\nSET name "Alice"\nGET name\nSET counter 0\nINCR counter\nEXPIRE name 3600\nTTL name\nHSET user:1 name "Alice" email "alice@example.com"\nHGETALL user:1\nLPUSH queue "task1" "task2"\nLPOP queue\n```




## Key Terminology


- **Key**: Unique identifier for a value\n- **TTL**: Time to live — automatic expiry\n- **Persistence**: RDB snapshots and AOF (Append Only File)\n- **Pub/Sub**: Message broker pattern\n- **Lua scripts**: Atomic multi-command execution



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
