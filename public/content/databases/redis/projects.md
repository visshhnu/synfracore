# Redis — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Redis Schema Design Project

**Level:** Beginner | **Time:** 2 days

Design and implement a real-world database schema for an e-commerce or social media application using Redis. Practice normalization, indexing, and query optimization.

### Steps

1. Design the entity-relationship diagram on paper first
2. Implement the schema in Redis with proper data types
3. Add constraints (NOT NULL, UNIQUE, CHECK, FOREIGN KEY)
4. Create indexes for your most common query patterns
5. Load sample data (use Faker library for realistic data)
6. Write and optimize 10 complex queries (joins, aggregations, window functions)

### Skills Demonstrated

- Schema design
- Indexing strategy
- Query optimization

### GitHub Repo Name

`redis-schema-design`

---

## Project 2: Redis Performance Optimization

**Level:** Intermediate | **Time:** 3 days

Take a slow database and make it 10x faster. Profile queries, identify bottlenecks, add indexes, rewrite queries, and set up connection pooling.

### Steps

1. Load 1M+ rows of test data
2. Identify slow queries using EXPLAIN/query profiler
3. Add appropriate indexes, measure improvement
4. Rewrite N+1 queries to efficient JOINs
5. Set up connection pooling (PgBouncer/ProxySQL)
6. Document before/after query execution plans and timings

### Skills Demonstrated

- Query optimization
- Index design
- Database profiling

### GitHub Repo Name

`redis-performance-tuning`

---

## Project 3: Redis Backend for a REST API

**Level:** Advanced | **Time:** 4 days

Build the complete data layer for a production REST API using Redis. Includes schema, migrations, stored procedures/aggregations, replication, and monitoring.

### Steps

1. Design schema for a social media or SaaS app
2. Implement migration system (Flyway/Liquibase/Alembic)
3. Write stored procedures/aggregation pipelines for complex operations
4. Set up read replica for read scaling
5. Implement backup strategy with automated testing
6. Add monitoring: slow query log, connection metrics, disk usage alerts

### Skills Demonstrated

- Database migrations
- Replication
- Production operations

### GitHub Repo Name

`redis-api-backend`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a Kubernetes cluster to deploy my personal blog" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
