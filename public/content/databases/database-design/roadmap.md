# Database Design — Learning Roadmap

## Stage 1 — SQL fluency, if not already solid (1-2 weeks)

Don't start design-specific learning without genuine SQL comfort first (see Prerequisites) — you need to be able to write and read joins fluently before normalization decisions or indexing tradeoffs mean anything concrete.

## Stage 2 — Normalization, hands-on (1 week)

Work through Overview's normalization example yourself, from an unnormalized starting table through 1NF/2NF/3NF, actually writing the `CREATE TABLE` statements at each step (see Installation) rather than only reading the end result. Then deliberately query the *unnormalized* version to observe an update anomaly firsthand (change a value that's duplicated across rows, notice the inconsistency) — this is what makes normalization's purpose land as real, not just a rule to memorize.

## Stage 3 — Indexing, with `EXPLAIN ANALYZE` from day one (1-2 weeks)

Build a practice table with enough rows to make performance differences visible (a few hundred thousand rows, not ten), then practice: query without an index, observe the seq scan in `EXPLAIN ANALYZE`, add an appropriate index, observe the plan change. Do this for single-column, composite, and partial indexes specifically — reading about index types is much weaker than watching your own query plan actually change.

## Stage 4 — Constraints and referential integrity (3-5 days)

Practice foreign keys, `CHECK` constraints, and `ON DELETE` behavior (Fundamentals) by deliberately trying to violate them — attempt an insert that should fail, confirm it does, and understand exactly why. This builds real intuition for what the database is actually enforcing versus what you'd need to enforce in application code without it.

## Stage 5 — Denormalization and schema patterns (1 week)

Work through Intermediate's denormalization section and Overview's Star Schema/JSONB patterns hands-on — build a small analytical schema using the star pattern, and a small semi-structured schema using JSONB, so you have concrete experience with both ends of the normalization spectrum, not just the fully-normalized default.

## Stage 6 — Schema evolution and migrations (3-5 days)

Set up a migration tool (Flyway, Alembic, or your stack's equivalent — see Intermediate) against a practice database and practice writing, applying, and rolling back a few real migrations, rather than only reading about migration discipline as a concept.

## Stage 7 — Advanced scaling patterns (ongoing, project-driven)

Pick one advanced topic — partitioning, sharding, or multi-tenant design (see Advanced) — and actually implement a small version rather than reading about all three shallowly. These are genuinely hard to internalize without hands-on practice, even at toy scale.

## What "done" looks like at each level

- **Junior-ready**: can normalize a schema to 3NF and explain which anomaly each step prevents, understands what a foreign key actually enforces.
- **Mid-level-ready**: can read and act on `EXPLAIN ANALYZE` output, can make and justify a deliberate denormalization decision, understands composite index column ordering.
- **Senior-ready**: can design a multi-tenant isolation strategy with real tradeoff reasoning, understands partitioning/sharding tradeoffs concretely, and can design around read-replica replication lag correctly rather than assuming synchronous consistency everywhere.
