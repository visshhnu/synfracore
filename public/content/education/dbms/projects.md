# DBMS — Portfolio Projects

Build these to practice real database design and query work — the skills that actually get tested in backend developer interviews, beyond just knowing SQL syntax.

## Project 1: Normalized Schema Design From a Real Scenario (Beginner)

**Time:** 2-3 days

Take a realistic scenario (a college's student-course-enrollment system, an e-commerce order system, a library) and design a properly normalized schema from scratch — ER diagram through to 3NF tables.

### Steps

1. Write out the requirements in plain English first (what entities exist, what relationships between them)
2. Draw an ER diagram: entities, attributes, relationships, and cardinalities (one-to-many, many-to-many, etc.)
3. Convert to relational tables, and normalize step by step: identify functional dependencies, then apply 1NF → 2NF → 3NF, showing your reasoning at each step
4. Implement the schema in a real database (PostgreSQL or MySQL) with proper primary keys, foreign keys, and constraints
5. Write 5-10 sample queries against your schema (joins, aggregations, filtering) to confirm the design actually supports real use cases

### Skills Demonstrated
- ER modeling and normalization applied to a real scenario, not just textbook examples
- Translating a design into real DDL (CREATE TABLE statements) with proper constraints
- Validating a schema design against real query needs

### Repository Name
`dbms-normalized-schema-design`

---

## Project 2: Query Optimization Case Study (Intermediate)

**Time:** 4-5 days

Take a moderately complex query against a reasonably-sized dataset, deliberately write an inefficient version first, then optimize it using indexing and query restructuring — documenting the measured improvement at each step.

### Steps

1. Set up a database with a non-trivial amount of data (tens of thousands of rows minimum — small tables don't reveal performance differences)
2. Write a query that's naturally slow (e.g., a join with no supporting index, or a subquery that could be rewritten as a join)
3. Use `EXPLAIN`/`EXPLAIN ANALYZE` to see the actual query plan and identify the bottleneck
4. Add an appropriate index and re-run — measure the actual improvement, don't just assume it helped
5. Try restructuring the query itself (e.g., subquery → join, or vice versa) and compare
6. Document each version's query plan and execution time in a table

### Skills Demonstrated
- Reading and interpreting query execution plans
- Indexing strategy, not just "add an index and hope"
- Measuring performance claims instead of asserting them

---

## Project 3: Transaction and Concurrency Control Demo (Advanced)

**Time:** 1-2 weeks

Build a small application (even a simple banking-transfer simulator) that deliberately demonstrates transaction isolation levels and concurrency issues — then fixes them properly.

### Steps

1. Build a simple scenario with concurrent operations (e.g., two "transfers" happening simultaneously on the same account balance)
2. Deliberately reproduce a concurrency bug — a lost update or a dirty read — by running operations without proper isolation
3. Fix it using appropriate transaction isolation levels or explicit locking, and demonstrate the bug no longer occurs
4. Document which specific isolation level (Read Committed, Repeatable Read, Serializable) solves which specific problem, and what the performance trade-off is for using a stricter level than necessary
5. Explain ACID properties concretely in terms of what your demo actually shows for each one

### Skills Demonstrated
- Practical understanding of transaction isolation levels, not just definitions
- Reproducing and fixing real concurrency bugs
- Reasoning about the isolation-vs-performance trade-off

### Repository Name
`dbms-transaction-concurrency-demo`

---

## Tips for Great Projects

**Use a real database, not just theory.** Running actual `EXPLAIN` output and real query timings is far more convincing — to an interviewer and to yourself — than reasoning about performance in the abstract.

**Show your normalization reasoning, not just the final schema.** Being able to explain *why* a table violates 2NF (partial dependency) or 3NF (transitive dependency) is exactly what gets tested, more than just producing a correctly normalized end result.

**Measure, don't assume.** "I added an index and it should be faster" is weaker than "I added an index and query time dropped from 450ms to 12ms, confirmed via `EXPLAIN ANALYZE`."

**For backend interviews specifically:** be ready to explain when denormalization is actually the right call (read-heavy systems where join cost outweighs redundancy cost) — interviewers often probe whether you understand normalization as a trade-off, not a rule to always maximize.

## Project Checklist
- [ ] A properly normalized schema (through 3NF) with documented reasoning
- [ ] At least one project demonstrating measured query optimization (before/after with real numbers)
- [ ] At least one project demonstrating a real concurrency issue and its fix
- [ ] Comfortable explaining ACID properties with concrete examples, not just definitions
- [ ] All schemas implemented in a real database, not just diagrammed
