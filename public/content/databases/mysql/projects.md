# MySQL — Portfolio Projects

## Project 1: Schema Design and Indexing for a Real Application

**Level:** Beginner-Intermediate | **Time:** 1-2 days

Design a normalized MySQL schema for a realistic small application (a simple e-commerce store, a booking system, or similar), then deliberately test and tune its indexing.

### Steps

1. Design the schema (at least 4-5 related tables) with correct data types, `utf8mb4` charset, appropriate `PRIMARY KEY`/`FOREIGN KEY`/`UNIQUE` constraints
2. Seed it with a realistic volume of data (tens of thousands of rows, not just a handful) — small toy datasets hide performance problems that only show up at scale
3. Write the 5-6 most important queries your application would actually run, and run `EXPLAIN` on each before adding any indexes
4. Add indexes based on what `EXPLAIN` actually shows (not guesses), and re-run `EXPLAIN` to confirm each index is actually being used
5. Deliberately test a query with a function wrapped around an indexed column (`WHERE YEAR(created_at) = 2024`) and document the performance difference against the range-comparison equivalent
6. Write a README explaining each indexing decision with the actual `EXPLAIN` output as evidence, not just the final schema

### Skills Demonstrated

- Schema design fundamentals and InnoDB-specific conventions
- Evidence-based indexing (via `EXPLAIN`), not guesswork
- Understanding the real performance cost of common query anti-patterns

### GitHub Repo Name

`mysql-schema-indexing-project`

---

## Project 2: Set Up and Test Real MySQL Replication

**Level:** Intermediate | **Time:** 2-3 days

Stand up a primary/replica MySQL setup (Docker Compose is fine) and actually exercise it — configuration alone doesn't demonstrate understanding.

### Steps

1. Configure two MySQL containers as source and replica using the current, correct replication commands (`CHANGE REPLICATION SOURCE TO`, `START REPLICA`, `SHOW REPLICA STATUS`) — not the removed `MASTER`/`SLAVE` terminology
2. Confirm replication is actually working: write to the source, confirm the change appears on the replica, and check `Seconds_Behind_Source` stays near zero
3. Deliberately break replication (stop the replica mid-write, introduce a conflicting write directly on the replica) and practice diagnosing the failure from `SHOW REPLICA STATUS`'s error fields
4. Set up GTID-based replication as an alternative to file/position-based replication and explain in your README why GTID is generally preferred
5. Simulate a basic failover: promote the replica to accept writes, and document exactly what steps that required

### Skills Demonstrated

- Real, hands-on MySQL replication setup using current (not deprecated) syntax
- Diagnosing replication failures from actual error output, not just theory
- Understanding the practical difference between file/position and GTID-based replication

### GitHub Repo Name

`mysql-replication-lab`

---

## Project 3: Query Performance Investigation Under Realistic Load

**Level:** Advanced | **Time:** 3-4 days

Simulate a production-scale MySQL workload, find real performance problems, and fix them with evidence.

### Steps

1. Generate a large synthetic dataset (millions of rows across related tables) using a script, not manual inserts
2. Write a handful of realistic application queries and benchmark them under this data volume
3. Enable the slow query log, set a low `long_query_time`, and identify which of your queries actually qualify as "slow" at this scale
4. Use `EXPLAIN ANALYZE` (or `EXPLAIN FORMAT=JSON`) to diagnose the root cause of each slow query — missing index, function-wrapped column, N+1 pattern, or something else
5. Fix each one and benchmark again to quantify the actual improvement (not just "it feels faster" — show before/after numbers)
6. Cover at least one deadlock scenario: deliberately create two transactions that access rows in different orders, trigger a real deadlock, and document what `SHOW ENGINE INNODB STATUS` reveals about it

### Skills Demonstrated

- Realistic performance testing at meaningful data scale
- Systematic root-cause diagnosis using `EXPLAIN`/slow query log, not guesswork
- Deadlock investigation and prevention

### GitHub Repo Name

`mysql-performance-investigation`

---

## Tips for Great MySQL Projects

**Test at realistic scale, not toy data.** A schema and set of indexes that look fine against a thousand rows can behave completely differently against millions — the strongest projects above all involve testing at a volume large enough to actually reveal performance problems.

**Show the `EXPLAIN` output, not just the final indexes.** "I added this index" is far less convincing than "here's the `EXPLAIN` output before, showing a full scan, and after, showing an index-only scan."

**Use current syntax.** If your replication project uses `CHANGE MASTER TO` or `SHOW SLAVE STATUS`, that's an immediate, visible signal to anyone reviewing it that the material wasn't verified against current MySQL versions — those commands no longer exist in MySQL 8.4+.

## Portfolio Checklist

- [ ] At least one project demonstrates indexing decisions backed by actual `EXPLAIN` evidence
- [ ] At least one project involves real, working replication using current SOURCE/REPLICA terminology
- [ ] At least one project includes a genuine before/after performance comparison with real numbers
- [ ] Each README explains the reasoning, not just the final configuration
- [ ] You can walk through any of these projects for 5+ minutes without notes
