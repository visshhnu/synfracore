# MongoDB — Fundamentals

## What is MongoDB?

MongoDB is one of the most widely used database systems in production environments. Understanding its fundamentals is essential for any backend developer or DevOps engineer.

## Core Concepts

### Data Model


MongoDB stores data as BSON documents (Binary JSON) in collections. Schema is flexible — documents in the same collection can have different fields.



## Installation

### Docker (Fastest)
```bash


docker run -d --name mongodb -p 27017:27017 mongo:7


```

### Connect
```bash


docker exec -it mongodb mongosh


```

## First Commands



```javascript\nuse myapp\ndb.users.insertOne({name: "Alice", email: "alice@example.com", createdAt: new Date()})\ndb.users.find({})\ndb.users.find({name: "Alice"})\ndb.users.updateOne({name: "Alice"}, {$set: {name: "Alice Smith"}})\ndb.users.deleteOne({name: "Alice Smith"})\n```



## Key Terminology



- **Collection**: Group of documents (like a table)\n- **Document**: A single JSON/BSON record\n- **Field**: A key-value pair within a document\n- **Index**: Improves query performance\n- **Aggregation Pipeline**: Multi-stage data transformation


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
