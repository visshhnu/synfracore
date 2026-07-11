# Database Design — Portfolio Projects

## Project 1: Normalize a deliberately bad schema (Beginner)

Start from a single, wide, unnormalized table (like Overview's `orders` example) with obvious repeating data, and normalize it to 3NF yourself — write the migration from the bad schema to the good one, not just the final result.

**What this demonstrates:** you understand normalization as a process with reasoning behind each step, not just the end-state definition. **What to show:** the before/after schema, the specific anomaly each normalization step fixes (named explicitly), and the migration script that transforms one into the other.

## Project 2: Index a slow query, with before/after evidence (Beginner/Intermediate)

Build a table with realistic data volume (tens/hundreds of thousands of rows), write a query against it that's genuinely slow, capture its `EXPLAIN ANALYZE` output, then add the appropriate index and capture the plan change.

**What this demonstrates:** real, hands-on indexing skill — not reciting index types, but diagnosing and fixing an actual slow query. **What to show:** both `EXPLAIN ANALYZE` outputs side by side, and your reasoning for which index type (single-column, composite, partial, covering) you chose and why.

## Project 3: Design a schema for a real, non-trivial domain (Intermediate)

Pick a genuinely non-trivial domain (a booking system with overlapping-time-slot constraints, an inventory system with multi-warehouse stock, a social app with follows/likes/comments) and design the full schema — tables, relationships, constraints, appropriate indexes — from scratch.

**What this demonstrates:** applying design judgment to a problem that isn't a textbook example, which is what real work actually looks like. **What to show:** an ER diagram, the full DDL, and a short write-up of at least one non-obvious design decision you made and why (a denormalization choice, a specific constraint, a many-to-many relationship that needed to become a richer entity).

## Project 4: Deliberate denormalization with justification (Intermediate/Advanced)

Take a fully-normalized schema and denormalize one specific piece of it to optimize a specific, named query pattern — implement both versions, benchmark the query against each, and document the update-anomaly risk you accepted in exchange for the performance gain.

**What this demonstrates:** denormalization as a deliberate, reasoned tradeoff rather than a shortcut — this is exactly the judgment senior design interviews probe for. **What to show:** the benchmark numbers (query time before/after), and an explicit statement of the tradeoff you accepted, not just the performance win.

## Project 5: Multi-tenant schema design, implemented (Advanced)

Design and implement a shared-table multi-tenant schema (`tenant_id` on every relevant table) with row-level security policies enforcing tenant isolation at the database level — then demonstrate that a query without proper tenant scoping is actually blocked by the RLS policy, not just documented as "should be scoped."

**What this demonstrates:** understanding that application-code discipline alone is an insufficient safeguard for tenant isolation — a database-level enforcement mechanism is the stronger, verifiable guarantee. **What to show:** the RLS policy definitions, and a demonstration of an under-scoped query actually being blocked/restricted by the database itself.
