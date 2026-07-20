# SQL — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production database incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1: The query that worked fine for a year, then suddenly took down the database

**The pattern:** A reporting query joins three tables and filters with `WHERE YEAR(created_at) = 2024` — a pattern that's worked fine for a year on a table with a few hundred thousand rows. As the table grows past several million rows, the same query starts taking minutes instead of milliseconds, and eventually starts causing lock contention that slows down unrelated write operations on the same table.

**Why this specific pattern degrades so predictably, not randomly:** wrapping an indexed column in a function (`YEAR(created_at)`) prevents the database from using any index on `created_at` at all — the database has to compute `YEAR()` for every single row before it can even check the filter condition, forcing a full table scan regardless of how well-indexed the column is. This is exactly the "avoid functions on indexed columns" pattern flagged in the Advanced tab — the query didn't get slower because something broke; it was always doing a full scan, and the cost of that scan simply grew linearly with table size until it became noticeable and then severe.

**What actually prevents this:**
- **Rewrite range-based date filters as range comparisons, not function calls on the column**: `WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'` lets the database use an index on `created_at` directly, since the column itself is being compared, not transformed first.
- **Run `EXPLAIN` on any query touching a table expected to grow significantly**, not just the ones that already feel slow — a query that's fast today on a small table can hide a full-table-scan pattern that will degrade badly at scale, and `EXPLAIN` reveals this before it becomes a production problem.
- **Load-test queries against realistic future data volumes**, not just current volumes — a query tested against a small development dataset gives no signal about how it'll behave once a table reaches production scale, which is exactly the gap this specific incident falls through.

---

## Scenario 2: The migration that silently corrupted data through a cascading delete

**The pattern:** A database migration script adds `ON DELETE CASCADE` to a foreign key relationship between `orders` and `order_line_items`, intending to make cleanup easier when a test order gets deleted in a staging environment. The migration gets promoted to production without anyone reconsidering whether cascade delete is actually the right behavior there — and months later, a routine data-cleanup script deletes what the operator believed was a small batch of stale customer records, which silently cascades through several more relationships than anyone traced through at review time, deleting a meaningfully larger set of related orders and line items than intended.

**Why "it worked correctly in the environment it was designed for" doesn't mean "it's correct everywhere":** `ON DELETE CASCADE` is a genuinely useful, correct tool — for relationships where deleting the parent record truly should delete all its dependents (a user's session tokens when the user account itself is deleted, for instance). The mistake here isn't using cascade delete at all; it's applying a decision made for one context (fast cleanup during testing) to production data without separately reconsidering whether losing history and audit-relevant records automatically, with no confirmation step, is actually the desired production behavior.

**What actually prevents this:**
- **Treat cascade-delete behavior as a decision requiring explicit sign-off for any table holding data with real business/audit significance** (financial records, order history) — separate from the decision of whether cascade delete is convenient for a specific development or testing workflow.
- **Prefer `ON DELETE SET NULL` or a soft-delete pattern (a `deleted_at` timestamp column) over hard cascade delete for anything with audit/compliance value** — the Fundamentals tab already shows `ON DELETE SET NULL` as an alternative to cascade specifically for cases where losing the child record's *existence* isn't acceptable, even if the specific parent reference should be cleared.
- **Test any migration that changes delete behavior by actually attempting a deletion against a realistic copy of production-scale, production-shaped data** in a non-production environment — not just confirming the migration applies without error, which says nothing about whether its *behavior* under real deletion patterns is what anyone actually intended.

---

## Scenario 3: The dashboard that returned different numbers depending on when you ran it

**The pattern:** A business intelligence dashboard shows "total revenue this quarter" using a query built on a CTE that itself references a live table currently being written to by an active order-processing pipeline. On MySQL, the CTE gets re-evaluated multiple times within the same query as different parts of the surrounding query reference it, occasionally picking up slightly different underlying data mid-execution if new orders are being inserted concurrently — producing a number that visibly, if subtly, differs by a few dollars depending on the exact millisecond the query runs, which several stakeholders eventually notice and start distrusting.

**Why this is a real, documented behavioral difference between database engines, not a one-off fluke:** PostgreSQL materializes a CTE by default (computing it once, then treating the result as a fixed snapshot for the rest of the query), while MySQL's CTE handling has historically behaved more like a view — potentially re-evaluated multiple times within the same overall query execution. A query written and tested against PostgreSQL that assumes "the CTE is computed once" can behave subtly differently when the same SQL runs against MySQL, especially against a table receiving concurrent writes — this is exactly the distinction flagged in the Interview tab, and it's a genuinely easy thing to miss until a stakeholder notices numbers that don't quite match between two runs.

**What actually prevents this:**
- **Know your specific database engine's CTE materialization behavior explicitly, rather than assuming it's universal across SQL databases** — this is exactly the kind of "SQL is mostly portable, but not entirely" gap that trips up teams moving between database engines or maintaining queries meant to run on more than one.
- **For reporting queries against actively-written tables, snapshot the data explicitly** (a transaction with an appropriate isolation level, or querying a read replica with known replication lag rather than the live primary) so the report reflects one consistent point in time rather than an ambiguous, possibly-shifting one.
- **If a dashboard number needs to be exactly reproducible on demand for stakeholder trust, that's a strong signal it belongs on top of a scheduled, snapshotted extract rather than a live query against a table under active write load** — reproducibility and "always current to the second" are genuinely competing goals, and a report that needs to be trusted usually needs the former more than the latter.
