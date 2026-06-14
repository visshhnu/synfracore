# MySQL — Fundamentals

## What is MySQL?

MySQL is one of the most widely used database systems in production environments. Understanding its fundamentals is essential for any backend developer or DevOps engineer.

## Core Concepts

### Data Model
MySQL uses a relational (table-based) model. Data is stored in rows and columns with strict schema enforcement. Relationships are defined using foreign keys.





## Installation

### Docker (Fastest)
```bash
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=secret -p 3306:3306 mysql:8.0




```

### Connect
```bash
docker exec -it mysql mysql -uroot -psecret




```

## First Commands

```sql\nSHOW DATABASES;\nCREATE DATABASE myapp;\nUSE myapp;\nCREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255) UNIQUE NOT NULL, name VARCHAR(100), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);\nINSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice');\nSELECT * FROM users;\n```





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
