# SQL — FAQ

## Is SQL actually "the same everywhere," or does it matter which database I'm using?

The core language (`SELECT`/`INSERT`/`UPDATE`/`DELETE`, `JOIN`, `GROUP BY`, basic `WHERE` clauses) is genuinely portable across PostgreSQL, MySQL, SQL Server, Oracle, and others — that's the appeal of learning SQL once. But real differences exist beneath that shared core: date/string function names differ (`DATE_FORMAT` in MySQL vs. `TO_CHAR` in PostgreSQL), pagination syntax differs (`LIMIT`/`OFFSET` vs. `TOP` vs. `ROWNUM`), and even something as fundamental as CTE materialization behavior can differ between engines (see the Real World tab for a concrete example of this causing a real, visible bug). "SQL is portable" is true for maybe 80% of everyday queries and false often enough that assuming full portability without testing is a real, common source of subtle bugs when moving between database engines.

## Why does everyone say "avoid SELECT *" when it's so much faster to type?

Beyond the commonly-cited reasons (unnecessary data transfer, breaking if column order changes), there's a more subtle performance cost: `SELECT *` prevents the database from using a covering index — an index that contains every column a query needs, letting the database satisfy the query entirely from the index without touching the actual table data at all. If a query only needs 2-3 specific columns and those happen to be covered by an existing index, `SELECT *` (which needs every column) forces a full row lookup regardless, silently giving up a performance optimization that would have been available if the query had specified only the columns actually needed.

## What's the actual difference between a subquery and a CTE, if they can often do the same thing?

A subquery is embedded directly inline within the larger query; a CTE (`WITH ... AS`) is defined once at the top and can be referenced multiple times within the rest of the query without repeating the same logic. Beyond readability, this matters for a genuinely practical reason: if the same complex filtering logic is needed in two different places within a query, a subquery forces you to write (and maintain) that logic twice, while a CTE lets you define it once and reference it by name — reducing the risk that the two copies drift out of sync if the logic ever needs to change.

## Why does a query with a NOT IN subquery sometimes return zero rows unexpectedly, even when logically it shouldn't?

This is one of the more infamous SQL gotchas: if the subquery inside `NOT IN` returns even a single `NULL` value, the *entire* `NOT IN` comparison becomes indeterminate for every row, and the query returns no rows at all — not an error, just silently empty or wrong results. This happens because SQL's three-valued logic means `x NOT IN (1, 2, NULL)` evaluates to `UNKNOWN` rather than `TRUE` or `FALSE` for any `x` that isn't 1 or 2, since the database can't rule out that `x` might equal whatever the `NULL` represents. The fix: either filter out `NULL`s in the subquery explicitly (`WHERE column IS NOT NULL`), or use `NOT EXISTS` instead, which doesn't have this specific failure mode.

## Is a database index always a performance improvement, or can it ever make things worse?

Indexes speed up reads but have a real, often underestimated cost on writes — every `INSERT`, `UPDATE`, or `DELETE` has to update every index on that table, not just the underlying data. A table with many indexes, especially one under heavy write load, can see meaningfully slower write performance from having "too many" indexes, particularly ones that are rarely or never actually used by real queries. This is exactly why the Advanced tab lists "tables with very heavy INSERT/UPDATE loads" as a case to be cautious about adding indexes — the right number of indexes is a genuine tradeoff between read and write performance, not simply "more indexes = better."

## Why do people say normalize your database design, but then also say denormalization is sometimes the right call?

Normalization (splitting data into separate related tables to avoid duplication) optimizes for data integrity and avoiding update anomalies — if a piece of information exists in only one place, you can't have it become inconsistent across duplicated copies. Denormalization (intentionally duplicating some data) trades that integrity guarantee for read performance, avoiding expensive joins for data that's read far more often than it's updated. Neither is universally "correct" — a normalized design is usually the right starting point, and denormalization is a deliberate, measured optimization applied to specific, identified hot paths once you know they actually need it, not a default starting posture.

## What's the actual risk of using ORDER BY on a column position number (ORDER BY 2) instead of the column name?

The query still runs correctly today, but it becomes silently fragile to any future change in column order — if someone later adds a new column earlier in the `SELECT` list, `ORDER BY 2` now refers to a completely different column than originally intended, with no error at all, just quietly wrong results. This is exactly the kind of bug that's hard to catch in code review, since the query still looks syntactically fine and the mistake only manifests as subtly wrong output. Using explicit column names in `ORDER BY` costs nothing and removes this entire class of fragile-to-refactoring risk.

## Why does UNION sometimes produce fewer rows than UNION ALL even when I expect the two queries to return entirely distinct result sets?

`UNION` performs an implicit `DISTINCT` across the combined result of both queries — if any row from the first query happens to be identical (in every selected column) to a row from the second query, `UNION` silently deduplicates them into one row, even if you conceptually think of them as coming from two different, unrelated sources. This is a common surprise when the two queries pull from genuinely different tables that happen to occasionally produce identical-looking rows by coincidence. `UNION ALL` never does this deduplication and is also faster (skips the distinct-checking work entirely) — the safe default is `UNION ALL` unless you specifically know you want deduplication.

## Is it ever OK to store data as a large JSON blob in a single column instead of proper relational columns?

It depends on how the data is actually queried, and it's worth being honest that this varies rather than assuming one universal answer. A JSON column is often fine for data that's mostly stored and retrieved as a whole (settings/preferences objects, event payloads that are rarely queried by their internal structure) — most modern databases (PostgreSQL's `JSONB`, MySQL's `JSON` type) support this reasonably well and even allow indexing specific JSON paths. It becomes a real problem when the application frequently needs to filter, join, or aggregate on specific fields *inside* that JSON blob — at that point, the flexibility that made JSON convenient becomes a performance and query-complexity cost that proper relational columns wouldn't have, and it's usually a sign those fields should be pulled out into real columns instead.

## Why do so many interview questions in this course reference LeetCode problem numbers — is that a good way to learn real SQL skill?

It's a genuinely reasonable, widely-used way to practice pattern recognition (window functions, self-joins, correlated subqueries) against realistic, well-vetted problems — these patterns show up constantly in real interviews specifically because they show up constantly in real analytical/reporting work. The limitation worth being aware of: LeetCode-style problems are almost always working against small, clean, already-well-structured sample data — they don't teach you to reason about messy real-world data, ambiguous business requirements, or performance at genuine production scale, which is exactly why the Real World tab (and this FAQ's earlier answers on indexing tradeoffs, engine portability, and NULL-handling gotchas) matters as a separate, complementary body of knowledge rather than a redundant one.
