# Database Design — Prerequisites

## What you need first

- **Basic SQL** — `SELECT`, `INSERT`, `UPDATE`, `DELETE`, and simple `JOIN`s. Database design is about *how* to structure tables so queries like these work correctly and efficiently — you need to already be able to write the queries before design decisions have anything concrete to attach to.
- **What a primary key and foreign key actually enforce** — not just the syntax, but that a primary key guarantees uniqueness and a foreign key guarantees referential integrity (you can't insert an order for a customer that doesn't exist). Normalization (Overview) is built entirely on these two constraint types.
- **Basic set/relational thinking** — a table is a set of rows, a query is an operation over that set. You don't need formal relational algebra, but comfort thinking in terms of "which rows satisfy this condition" rather than a procedural, row-by-row mental model helps normalization and indexing both make more intuitive sense.

## Helpful but not required

- **Experience with a specific database engine's quirks** — this page's examples lean PostgreSQL-flavored (JSONB, `INCLUDE` covering indexes), but the underlying design principles (normalization, indexing strategy, CAP theorem tradeoffs) apply across relational databases broadly, and much of it transfers to understanding NoSQL design tradeoffs too, even where the implementation differs.
- **Prior experience with a badly-designed database** — genuinely useful context (you'll recognize *why* a normalization rule exists once you've seen the update-anomaly problem it prevents), but not required — this page explains the reasoning directly rather than assuming you've already hit the pain firsthand.

## A note on what this page assumes you're NOT starting from

If you've never written a `CREATE TABLE` statement or don't know what a data type is, this page is a level above where you need to start — get comfortable with basic SQL DDL/DML first, then come back. This page is about *design judgment* (how to structure a schema well), not an introduction to SQL syntax itself.
