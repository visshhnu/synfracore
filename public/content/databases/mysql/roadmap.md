# MySQL — Learning Roadmap

## Estimated Time to Job-Ready
**5-8 weeks** of consistent learning (2-3 hours/day), assuming basic SQL fluency already (this platform's own SQL technology is a genuine prerequisite — MySQL-specific material builds directly on standard SQL rather than re-teaching it).

## Phase 1: Foundation (Week 1-2)

- Install MySQL (Docker is fastest — use the current `mysql:8.4` image rather than the older `mysql:8.0`) and connect via the CLI
- Core MySQL-specific syntax: `AUTO_INCREMENT`, `ENGINE=InnoDB`, `utf8mb4` charset (always use this, never plain `utf8`, for correct emoji/Unicode support)
- InnoDB vs. MyISAM — understand why InnoDB is the only real choice for new applications today
- Basic transactions: `START TRANSACTION`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`

**Checkpoint:** can you explain, without looking it up, why `utf8mb4` is preferred over MySQL's own `utf8` charset? (The historical `utf8` alias is actually a 3-byte-max encoding that can't represent the full Unicode range, including emoji and some CJK characters — a genuinely confusing MySQL-specific naming trap.)

## Phase 2: Indexing and Query Performance (Week 3-4)

- `EXPLAIN` output — learn to actually read the `type`, `key`, `rows`, and `Extra` columns, not just run it
- Composite index leftmost-prefix rule, and index selectivity/cardinality
- Covering indexes, and why `SELECT *` defeats them
- Complete Portfolio Project 1 (schema design and indexing) from this course's Projects section

**Checkpoint:** given a slow query and its `EXPLAIN` output showing `type: ALL`, can you name at least two possible causes and how you'd investigate which one applies? If not, spend more time here — this is one of the most commonly tested practical MySQL skills in real interviews.

## Phase 3: Replication and Operational Skills (Week 5-6)

- Replication concepts (binlog, relay log, GTID) and — critically — the current terminology: `CHANGE REPLICATION SOURCE TO`, `START REPLICA`, `SHOW REPLICA STATUS`, not the removed `MASTER`/`SLAVE` commands (a common trap when learning from older tutorials/blog posts written before the terminology change)
- Locking and deadlocks — row-level locking, `FOR UPDATE`, and how to read a deadlock report from `SHOW ENGINE INNODB STATUS`
- Backup/restore with `mysqldump --single-transaction`
- Complete Portfolio Project 2 (replication lab)

**Checkpoint:** if you found a MySQL tutorial online using `CHANGE MASTER TO`, would you recognize that as outdated syntax rather than assuming it's still correct? This gotcha trips up a meaningful number of people learning from material that predates the terminology change.

## Phase 4: Scaling and Interview Readiness (Week 7-8)

- Partitioning for large time-series tables
- ProxySQL for connection pooling and read/write splitting; Vitess for horizontal sharding at genuine scale (know when each is actually warranted vs. overkill)
- Complete Portfolio Project 3 (performance investigation at realistic scale) — this is one of the highest-value exercises for interview readiness
- Review this course's Interview Q&A material and practice explaining ACID properties and isolation levels out loud, not just recognizing them when reading

## Common Pitfalls Specific to MySQL (Not Generic Study Advice)

- **Learning from outdated tutorials without checking currency** — MySQL's replication terminology changed in 8.0.23/8.4, and a meaningful share of existing online tutorials still use the removed `MASTER`/`SLAVE` commands; always cross-check against current MySQL documentation, not just tutorial recency
- **Treating MyISAM as a valid modern choice** — it shows up in older material and still technically exists, but has no real place in new application development given InnoDB's transaction/foreign-key/concurrency advantages
- **Assuming `utf8` means full Unicode support** — this specific MySQL naming trap (see Phase 1) catches people who assume "utf8" is the same thing it means in other contexts
- **Adding indexes reactively only after something feels slow** — the stronger habit is running `EXPLAIN` on new queries *before* they become a production problem, not just once complaints start coming in

## Getting Your First MySQL-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each backed by real evidence (`EXPLAIN` output, actual replication logs, before/after benchmarks)
2. **Resume:** be specific — "diagnosed and fixed a full-table-scan query using EXPLAIN, converting a 4-second query to 40ms via a composite index" is far stronger than "experience with MySQL"
3. **Use current terminology consistently** — if your resume or portfolio still references `MASTER`/`SLAVE` replication commands, that's a visible signal of outdated material to anyone reviewing it who works with current MySQL versions
4. **Certifications, if pursuing one:** Oracle's MySQL Database Administrator (1Z0-908) — see this course's own Certification Guide for current format and pricing *(needs verification — confirm current details on Oracle's certification page)*
