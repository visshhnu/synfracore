# Database Design — Intermediate

## Denormalization: deliberately breaking normalization rules, for a reason

Normalization (Overview/Fundamentals) optimizes for data integrity and avoiding update anomalies. It does not optimize for read performance — a fully normalized schema often requires many joins to reconstruct a commonly-needed view of the data, which has a real query-performance cost at scale. Denormalization is the deliberate, informed choice to duplicate some data (storing a `customer_name` directly on an `orders` row, alongside the `customer_id` foreign key) to avoid that join cost for a specific, high-frequency query pattern.

The key word is *deliberate* — denormalization done as a design decision, with a clear understanding of the specific query it's optimizing for and the specific update-anomaly risk being accepted in exchange, is different from a schema that's simply unnormalized because normalization was never done at all. Overview's Star Schema pattern is a real, common example of intentional denormalization for a specific purpose (analytical query performance), not a mistake.

## Composite index column order — why it's not arbitrary

Overview mentions composite index column order matters; here's the mechanical reason why. A composite index `(customer_id, status)` is structured so that `customer_id` narrows the search first, and `status` narrows *within* that already-narrowed set — this means the index is efficient for queries filtering on `customer_id` alone, or `customer_id` AND `status` together, but not efficient for queries filtering on `status` alone, since the index isn't organized to search by status independently. The general rule: put the column with an equality condition and higher selectivity (narrows the result set more) first, range conditions or lower-selectivity columns after.

## Query plan reading: sequential scan vs. index scan, and when a seq scan is actually correct

Seeing `Seq Scan` in `EXPLAIN ANALYZE` output isn't automatically a problem — for a small table, or a query returning a large fraction of the table's rows, a sequential scan can genuinely be faster than an index scan (index lookups have their own per-row overhead, and reading an entire small table sequentially can beat that overhead). The query planner's cost-based decision is usually correct; the more useful intermediate skill is recognizing when an index scan *should* be happening but isn't (a large table, a highly selective filter, yet still a seq scan) — that's the actual signal worth investigating, not the mere presence of a seq scan in the plan.

## Handling many-to-many relationships beyond the basic junction table

Overview's junction table example (`enrollments(student_id, course_id, enrolled_date)`) is the standard pattern, but real many-to-many relationships often carry more relationship-specific data than a simple link — a junction table isn't just a link table, it can be a full entity in its own right (an `enrollments` row might need `grade`, `completion_status`, `enrolled_by` — data that belongs to the *relationship* between a student and a course, not to either entity alone). Recognizing when a junction table needs to become a richer entity, rather than staying a bare two-column link, is a real intermediate design judgment call.

## Schema versioning and migrations, as a first-class design concern

A schema isn't designed once — it evolves, and how you evolve it matters as much as the initial design. Migration tools (Flyway, Alembic, Prisma Migrate, and similar) version schema changes as ordered, repeatable scripts rather than manual, undocumented `ALTER TABLE` statements run directly against production. The design-level discipline this enables: every schema change is reviewable (a migration file in a pull request, same as application code), reproducible across environments (dev/staging/production apply the same ordered migrations), and reversible where the migration tool supports rollback — none of which is true for ad hoc manual schema changes made directly against a live database.
