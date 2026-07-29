# Cassandra — Prerequisites

## What You Need Before Starting

### 1. Basic SQL-like query comfort (recommended, not a hard blocker)

CQL (Cassandra Query Language) deliberately looks SQL-like (`SELECT`,
`INSERT`, `WHERE`) — this course's own Fundamentals tab leans on that
resemblance rather than re-teaching basic query syntax from scratch. You
don't need deep relational database experience, but if `SELECT * FROM table
WHERE column = value` is unfamiliar syntax entirely, this platform's SQL
Mastery technology will make the CQL sections land faster.

### 2. Willingness to unlearn relational schema-design instincts (the actual hard part)

This is more important than any specific prior tool knowledge. Cassandra
schema design starts from *query patterns*, not entities or normalization —
this course's own material calls this "the opposite instinct from relational
normalization" and treats it as the single biggest learning-curve item,
harder than the CQL syntax itself. Prior relational database experience is
genuinely useful context, but only if you're prepared to consciously set
aside the "design the entities first, normalize, then query" instinct while
learning this material — that instinct actively works against correct
Cassandra schema design.

### 3. Basic distributed-systems intuition (helpful, not required)

Concepts like replication, consistency levels, and "no single point of
failure" are explained from scratch in this course's Overview and
Fundamentals tabs — you don't need prior distributed-systems coursework.
That said, if terms like "eventual consistency" or "quorum" are entirely
new, expect Phase 3 of the Roadmap (consistency levels, `R + W > RF`) to
take real extra time — this course covers it directly, but doesn't assume
it's intuitive on first exposure.

### 4. Docker, for the fastest setup path (helpful, not required)

This course's projects assume the ability to run a Cassandra
instance/cluster locally — Docker is the fastest path, covered directly in
the Roadmap and Portfolio Projects sections.

### 5. What you do *not* need yet

- **Prior NoSQL experience of any kind** — this course builds Cassandra's
  specific concepts (wide-column model, partition/clustering keys, tunable
  consistency) from a reasonable starting point, not assuming familiarity
  with a different NoSQL system.
- **Cassandra operations/administration background** — `nodetool`,
  compaction strategy selection, and multi-datacenter replication are
  covered progressively (Intermediate through Advanced), not assumed
  upfront.
- **Familiarity with any other wide-column or document database** — nothing
  here assumes you've used MongoDB, DynamoDB, or a similar system first.

### Quick self-check

Given the requirement "get the last 50 messages in a conversation, newest
first," would your first instinct be to design a `conversations` table and a
separate `messages` table linked by a foreign key (the relational instinct),
or a single table keyed specifically to serve that one query directly (the
Cassandra instinct)? If the relational answer came first, that's completely
normal — it's exactly the instinct this course's Fundamentals and
Intermediate material is built to retrain, not a sign you're starting from
the wrong place.
