# Database Design — Troubleshooting

## A query is slow despite having what looks like the right index

Run `EXPLAIN ANALYZE` before assuming anything — check whether the planner is actually using the index at all (it might be choosing a sequential scan anyway, which can be correct for a query returning a large fraction of the table, see Intermediate). If it's using the index but still slow, check whether the index actually matches the query's filter/sort columns in the right order (a composite index's column order matters — see Fundamentals/Interview) and whether statistics are stale (`ANALYZE tablename;` refreshes the planner's row-count estimates, which can be badly out of date after a large bulk insert/delete and cause the planner to make a poor choice).

## Foreign key constraint violation on an insert that "should" be valid

Check whether the referenced row genuinely exists at the moment of the insert, in a transaction-aware way — a common real cause in concurrent systems: the parent row is being inserted in the same transaction but hasn't actually committed yet when the child insert runs, or a race condition where the parent row was deleted by a concurrent transaction between when your application checked for its existence and when it attempted the insert. Wrapping related inserts in a single transaction (parent then child, both committed together) is usually the correct fix, not removing the constraint.

## `ON DELETE CASCADE` deleted more data than expected

This is a design issue more than a bug — `CASCADE` deletes everywhere the deleted row's key is referenced, transitively, if those child tables also have `CASCADE` foreign keys onward. Before adding `CASCADE`, trace the full dependency chain explicitly (what actually cascades, how many levels deep) rather than assuming it only affects the immediately obvious child table — a chain of cascading deletes across several tables can remove far more data than a quick glance at one foreign key definition suggests.

## Normalized schema requires too many joins for a common query, hurting performance

This is the exact scenario denormalization (Intermediate) exists to address — but before denormalizing, confirm with `EXPLAIN ANALYZE` that the joins are actually the bottleneck (versus missing indexes on the join columns themselves, which is a much smaller, safer fix than denormalizing). Adding proper indexes on foreign key columns used in joins often resolves join-performance problems that look like they'd require denormalization, without taking on denormalization's data-duplication tradeoff at all.

## Migration fails partway through, leaving the schema in an inconsistent state

Check whether your migration tool wraps each migration in a transaction by default (most do, but not universally, and some DDL statements in some databases can't run inside a transaction at all, which is a real, specific limitation worth knowing about for your specific database engine). If a migration can't be transactional for that reason, it needs to be written to be safely re-runnable (idempotent) or to have an explicit, tested rollback script — "just re-run the migration" is not a safe recovery plan if the migration isn't actually idempotent and partially applied changes are already in place.

## A composite unique constraint isn't preventing the duplicate you expected it to block

Check column order and null handling specifically — a `UNIQUE (a, b)` constraint allows multiple rows where either `a` or `b` is `NULL`, since SQL's standard null-handling treats `NULL` as not equal to anything, including another `NULL` — this is a common, genuine surprise for people expecting `NULL` to behave like a regular comparable value in a uniqueness check. If you need to treat `NULL` as a real value for uniqueness purposes, you need an explicit workaround (a partial unique index with a `WHERE column IS NOT NULL` clause, or using a sentinel value instead of `NULL`), not the plain constraint as written.
