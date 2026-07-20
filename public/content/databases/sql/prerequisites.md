# SQL — Prerequisites

## What You Need Before Starting

SQL is one of the more accessible technologies to start with — it doesn't require deep prior technical background, and many people learn it as their first genuinely "programming-adjacent" skill. A few things make the learning curve much smoother.

### 1. Basic spreadsheet familiarity (recommended, not required)

If you've used Excel or Google Sheets — sorting, filtering, basic formulas like `SUM` or `AVERAGE` — you already have real intuition to build on. A SQL table is conceptually similar to a spreadsheet tab: rows and columns, with SQL giving you a much more powerful and precise way to filter, combine, and summarize that data than spreadsheet formulas can. If spreadsheets are unfamiliar too, that's fine — just expect the first week to include building this basic tabular-data intuition alongside SQL syntax itself.

### 2. Comfort with basic logical thinking (AND/OR/NOT)

SQL's `WHERE` clause logic (`AND`, `OR`, `NOT`, combined with parentheses for precedence) maps directly onto ordinary logical reasoning — if you've ever reasoned through "I want A and B, but not C," you already have the intuition SQL's filtering logic is built on. This isn't a hard prerequisite, but if boolean logic feels genuinely unfamiliar, a little extra time on the Fundamentals tab's `WHERE`-clause material specifically will pay off across everything that follows.

### 3. A place to actually practice — required, not optional reading

You cannot learn SQL by reading queries alone; you need to run them, see real results, and — critically — make mistakes and see exactly what breaks. Reasonable starting points, easiest first:
- **SQLite** (via a browser-based tool like sqliteonline.com, or DB Browser for SQLite installed locally) — zero setup, the fastest way to start typing real queries today
- **PostgreSQL or MySQL locally** (via Docker: `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=pass postgres`) — closer to what you'll actually use professionally, worth moving to once basic syntax is comfortable
- **A cloud provider's free tier** (Supabase, Neon, PlanetScale all offer free-tier hosted databases) — no local setup at all, a genuinely production-like environment to practice against

### 4. Basic command-line comfort (helpful, not a hard blocker)

Many SQL tools have a GUI (DBeaver, pgAdmin, MySQL Workbench, TablePlus) that don't require command-line usage at all, so this isn't strictly required to start — but if you're comfortable with a terminal, being able to connect via `psql` or `mysql` command-line clients directly is a useful skill that shows up in real professional environments, worth building alongside SQL itself rather than treating GUI tools as the only path.

### 5. What you do *not* need yet

- Programming experience of any kind — SQL is a declarative query language, meaningfully different from procedural programming (Python, JavaScript), and doesn't require prior coding background to start learning
- Database administration knowledge (backups, replication, server tuning) — this course focuses on writing and reasoning about queries; deeper database *administration* is a related but genuinely separate skill set
- A specific database engine's advanced features — this course teaches core, broadly-portable SQL first, with engine-specific quirks (Oracle's `ROWNUM`, MySQL vs. PostgreSQL CTE behavior) flagged explicitly where they matter, rather than assuming deep prior expertise in any one engine

### Quick self-check

Given a spreadsheet-style table of `orders` (customer name, amount, date), can you describe in plain English what "show me the total amount spent by each customer, but only customers who spent more than $500 total" is actually asking for, step by step? If yes — even without knowing the SQL syntax yet — you already have the logical structure the Fundamentals tab will teach you to express in actual SQL (this is exactly a `GROUP BY` + `HAVING` query). If describing that request feels hard, spend a little time on prerequisite #2 first; the SQL syntax will be much easier to absorb once the underlying logical structure is comfortable.
