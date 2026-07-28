# Oracle Database — Prerequisites

## What You Need Before Starting

### 1. Basic SQL (required)

`SELECT`, `INSERT`, `UPDATE`, `DELETE`, joins, and `GROUP BY`. This course's
own Roadmap tab states this directly — Oracle-specific material builds on
standard SQL and adds a genuinely large amount of Oracle-only syntax
(`DUAL`, sequences, `NVL`) and PL/SQL on top of it, rather than re-teaching
basic SQL from scratch. If plain `SELECT`/`JOIN` queries aren't yet
comfortable, this platform's own SQL Mastery technology is the right
starting point first.

### 2. Basic programming concepts — variables, conditionals, loops (recommended, not required)

The Fundamentals tab introduces PL/SQL (`DECLARE`/`BEGIN`/`IF`/`EXCEPTION`
blocks, variables, loops) starting from its very first section, assuming
comfort with these general concepts from *any* prior programming exposure
(even basic scripting) rather than teaching "what is a variable" from
scratch. No prior *procedural SQL* experience is needed — PL/SQL's specific
syntax is taught here — but general programming logic (an `IF`/`ELSE`
branch, a loop) being unfamiliar in any language would make this section
harder than it needs to be.

### 3. Docker, if using the fastest setup path (helpful, not required)

The Overview tab's quickest setup path is a single `docker run` command
against the `gvenzl/oracle-xe` image. Oracle Live SQL (browser-based, no
install) is also covered as a zero-setup alternative.

### 4. What you do *not* need yet

- **Prior Oracle or enterprise-DBA experience** — architecture (SGA, PGA,
  background processes), PL/SQL, and every Oracle-distinctive feature
  (`CONNECT BY`, RAC, Data Guard) are explained from scratch as they're
  introduced.
- **Familiarity with PostgreSQL/MySQL specifically** — the Overview tab's
  Oracle-vs-PostgreSQL-vs-MySQL comparisons are there for context if useful,
  not something you need to already know.
- **Production DBA operations** (backup/recovery, RAC cluster administration) —
  this course covers what each concept solves and why it matters
  conceptually, not hands-on production administration.

### Quick self-check

Can you already write a query like "find every employee earning more than
$5000, joined against their department name"? If yes, you're ready to start
at Fundamentals — the SQL itself won't be the obstacle, Oracle's specific
syntax and PL/SQL will be. If that query itself feels unclear, spend time on
this platform's SQL Mastery technology first.
