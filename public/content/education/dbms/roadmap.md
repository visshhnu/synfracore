# DBMS — Learning Roadmap

## Estimated Time to GATE/Interview-Ready
**8-10 weeks** of consistent learning (2-3 hours/day) — DBMS is 8-10 marks in GATE CSE and essential for nearly every backend developer interview, so this is genuinely dual-purpose study time.

## Phase 1: Foundation (Week 1-2)

- The relational model: relations, tuples, attributes, keys (super, candidate, primary, foreign)
- Relational algebra operations (select, project, join, union, etc.)
- Complete the Fundamentals section in this course

**Checkpoint:** can you explain the difference between a candidate key and a primary key, and why a table can have multiple candidate keys but only one primary key?

## Phase 2: SQL and Normalization (Week 2-5)

- SQL: joins (inner, outer, self), aggregations, subqueries, and window functions if your curriculum covers them
- Normalization: functional dependencies, and normal forms (1NF through BCNF)
- Complete Project 1 (normalized schema design) from this course's Projects section

**Checkpoint:** given an unnormalized table, can you identify the functional dependencies and normalize it to 3NF yourself, explaining each step?

## Phase 3: Transactions, Indexing, and Applied Practice (Week 5-8)

- ACID properties, transaction isolation levels, and concurrency control
- Indexing strategies (B-tree indexes especially) and how the query planner uses them
- Complete Project 2 (query optimization case study) from this course's Projects section

**Checkpoint:** can you explain, concretely, what a "dirty read" is and which isolation level prevents it?

## Phase 4: Concurrency Depth and Interview/GATE Readiness (Week 8-10)

- Deadlocks in the transaction context, and locking protocols
- Complete Project 3 (transaction and concurrency control demo) and review this course's Interview Q&A section
- For GATE specifically: normalization and relational algebra numerical problems are a recurring, high-yield question pattern

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Relational Model | Keys, relational algebra, and schema design |
| SQL Fluency | Joins, aggregations, subqueries, and query construction |
| Normalization | Identifying and fixing schema design problems |
| Transactions | ACID properties and isolation levels in practice |
| Performance | Indexing strategy and reading query execution plans |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   SQL practice problems (joins, aggregations, subqueries)
Wednesday: Normalization or relational-algebra numerical problems
Thursday:  Work on the relevant portfolio project
Friday:    Review previous-year GATE questions on the topic
Weekend:   Timed practice test, or continue project work
```

## Red Flags to Avoid

- ❌ Learning SQL syntax without understanding what a query actually does to the underlying data (which rows survive a join, and why)
- ❌ Normalizing schemas by rote pattern-matching instead of actually identifying functional dependencies
- ❌ Treating transaction isolation levels as trivia to memorize instead of understanding the specific problem (dirty read, lost update, phantom read) each one prevents
- ❌ Never running `EXPLAIN` on a real query — indexing intuition without evidence is often wrong
- ❌ Skipping relational algebra because "SQL is what's actually used" — GATE tests relational algebra directly, and it's the theoretical foundation SQL is built on

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Interview Q&A
- **GATE previous-year papers**: normalization and relational algebra are consistently high-yield topics
- **A real database (PostgreSQL is a strong free choice)**: theory without hands-on query practice doesn't build real fluency
- **Database System Concepts (Silberschatz, Korth, Sudarshan)**: the standard reference textbook

## Getting GATE/Interview-Ready

1. **Portfolio**: the projects in this course's Projects section — a documented schema-design or query-optimization project is a strong, concrete signal for backend interviews specifically
2. **SQL fluency under pressure**: practice writing joins and subqueries without a reference open — many interviews include a live SQL-writing component
3. **GATE-specific practice**: normalization and relational algebra numerical problems recur strongly across years — high-value practice material
4. **Interview readiness**: be ready to explain normalization trade-offs (when denormalization is the right call) and to reason about transaction isolation with concrete examples
5. **Connect theory to real database behavior**: knowing what `EXPLAIN` output actually means, and having run it yourself, is a genuine differentiator over purely textbook DBMS knowledge
