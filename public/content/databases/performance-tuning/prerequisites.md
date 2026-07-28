# Database Performance Tuning — Prerequisites

## What You Need Before Starting

### 1. Basic SQL and comfort with at least one relational database (required)

This course's Fundamentals tab opens directly with `EXPLAIN ANALYZE` output
and index creation — it doesn't re-teach `SELECT`/`JOIN`/`GROUP BY` first.
Every example is written against PostgreSQL or MySQL syntax directly
(`pg_stat_statements`, `autovacuum`, MySQL's slow query log), so basic
comfort with at least one of the two — this platform's own PostgreSQL or
MySQL technology — is assumed, not taught here.

### 2. Basic indexing concepts (recommended, not required)

This course goes deep on index *strategy* (composite column order, covering
indexes, partial indexes) starting from Fundamentals, but assumes you
already know what an index conceptually is (a data structure that avoids a
full table scan) — that specific groundwork is covered in this platform's
Database Design technology, if it's not already familiar.

### 3. Basic Python, for the application-layer examples (helpful, not required)

The N+1 query problem and connection-pooling sections use Python
(SQLAlchemy-style ORM calls, a `psycopg2` connection pool) to illustrate an
application-layer problem that isn't really about Python — the concept
(too many round-trips, too many idle connections) transfers regardless of
language. Not being able to read Python specifically will make those
particular code blocks less immediately clear, but won't block understanding
the underlying concept.

### 4. What you do *not* need yet

- **Database administration/operations background** — autovacuum tuning,
  replication, and connection pooling are covered as this course progresses
  (Intermediate through Advanced), not assumed upfront.
- **Prior performance-tuning experience on any specific engine** — reading
  `EXPLAIN ANALYZE` output, composite index design, and every other concept
  here is taught from first principles, not assumed as prior tribal
  knowledge.
- **OLAP/data-warehouse experience** — the OLTP-vs-OLAP distinction
  (Advanced tab) is explained directly; you don't need to have worked with
  a columnar data warehouse first to follow it.

### Quick self-check

Given a query that's taking 10 seconds instead of 10 milliseconds, could you
already name the first diagnostic step you'd take (rather than immediately
guessing at a fix)? If "run `EXPLAIN ANALYZE` and look at the actual query
plan before changing anything" feels like a natural first instinct, you're
ready to start at Fundamentals. If SQL itself is still the harder part of
that sentence, start with this platform's SQL Mastery technology first.
