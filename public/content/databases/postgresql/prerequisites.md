# PostgreSQL — Prerequisites

## What You Need Before Starting

### 1. Basic SQL (required)

`SELECT`, `INSERT`, `UPDATE`, `DELETE`, and simple `JOIN`s. This course's own
Fundamentals tab starts directly with PostgreSQL-specific data types and
patterns (`JSONB`, `IDENTITY` columns, upserts) rather than re-teaching basic
SQL from scratch — if writing a plain `SELECT ... WHERE ... JOIN` query isn't
yet comfortable, this platform's own SQL Mastery technology is the right
starting point first.

### 2. Comfort with the command line (recommended, not required)

Most of this course's examples run through `psql`, PostgreSQL's command-line
client. The Installation tab does cover GUI-only paths (Postgres.app on Mac,
the Windows installer + pgAdmin) if a terminal genuinely isn't an option yet,
but `psql` is what the rest of the course — Fundamentals through
Troubleshooting — actually uses throughout, so building basic comfort with it
early pays off.

### 3. Docker, if using the fastest setup path (helpful, not required)

The Installation tab's quickest option is a single `docker run` command. Native
package installs (Ubuntu's `apt`, Homebrew) and platform installers are also
covered if Docker isn't set up yet.

### 4. What you do *not* need yet

- **Prior PostgreSQL or any specific RDBMS experience** — this course assumes
  general SQL fluency, not prior Postgres-specific knowledge; JSONB, MVCC,
  window functions, and every other PostgreSQL-distinctive feature are
  explained from scratch as they're introduced.
- **Database administration background** — replication, backup/restore, and
  connection pooling are covered as this course progresses (Intermediate
  through Troubleshooting), not assumed upfront.
- **Familiarity with MySQL or other databases** — the Overview tab's
  PostgreSQL-vs-MySQL comparison is there for context if useful, not a
  requirement to understand first.

### Quick self-check

Can you already write, without looking anything up, a query like "find every
order over $100 for a given customer, joined against that customer's name"?
If yes, you're ready to start at Fundamentals. If that query itself feels
unclear, spend time on this platform's SQL Mastery technology first — the
PostgreSQL-specific material here builds directly on that foundation rather
than re-covering it.
