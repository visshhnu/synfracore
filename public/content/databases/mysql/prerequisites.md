# MySQL — Prerequisites

## What You Need Before Starting

### 1. Basic SQL (required)

`SELECT`, `INSERT`, `UPDATE`, `DELETE`, and simple `JOIN`s. This course's own
Fundamentals tab assumes this and starts directly with MySQL-specific syntax
(`AUTO_INCREMENT`, `ENGINE=InnoDB`, `utf8mb4`) rather than re-teaching basic
SQL — if plain `SELECT`/`JOIN` queries aren't yet comfortable, this
platform's own SQL Mastery technology is a genuine prerequisite, not just
generically helpful background (this course's own Roadmap tab says so
directly).

### 2. Comfort with the command line (recommended, not required)

The Fundamentals and Cheatsheet tabs both run everything through the `mysql`
CLI client (`mysql -u root -p`, `SHOW PROCESSLIST`, etc.). GUI tools
(MySQL Workbench, TablePlus, DBeaver) can substitute for hands-on practice,
but the course's own examples are CLI-first throughout.

### 3. Docker, if using the fastest setup path (helpful, not required)

The Overview tab's quickest setup is a single `docker run` command against
the `mysql:8.4` image. A native install works equally well if Docker isn't
already set up.

### 4. Basic Python familiarity (helpful, not required)

The Overview tab includes a connection-pooling example using
`mysql.connector`. It's there to illustrate why pooling matters under real
load, not a required skill to follow the rest of the course — the SQL and
administration material afterward doesn't depend on it.

### 5. What you do *not* need yet

- **Prior MySQL or any specific RDBMS experience** — InnoDB, replication
  terminology, and every other MySQL-specific concept are explained from
  scratch as they're introduced (Fundamentals through Advanced).
- **Database administration background** — replication, connection pooling
  (ProxySQL), and sharding (Vitess) are covered progressively later in this
  course, not assumed upfront.
- **Familiarity with PostgreSQL or other databases** — the Overview tab's
  MySQL-vs-PostgreSQL comparison is contextual, not a requirement to
  understand first.

### Quick self-check

Can you already write, without looking anything up, a query like "find every
order over $100 for a given customer, joined against that customer's name"?
If yes, you're ready to start at Fundamentals. If that query itself feels
unclear, spend time on this platform's SQL Mastery technology first — this
course's MySQL-specific material builds directly on that foundation rather
than re-covering it.
