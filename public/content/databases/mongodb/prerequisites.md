# MongoDB — Prerequisites

## What You Need Before Starting

MongoDB is often a genuinely accessible entry point into databases specifically because its document model maps closely onto JSON, which many people already have some familiarity with from web development or general programming — but a few things will smooth the learning curve.

### 1. Comfort reading and writing JSON (required)

MongoDB documents are JSON-like (technically BSON, a binary form of JSON with a few extra types like dates and ObjectIds) — if nested objects, arrays, and key-value pairs in JSON are already comfortable to read, you're most of the way to reading MongoDB documents and queries fluently. If JSON itself is unfamiliar, spend a little time there first; this course's material assumes it throughout.

### 2. Basic JavaScript syntax familiarity (helpful, not a hard blocker)

MongoDB's shell (`mongosh`) and query syntax borrow JavaScript object/array syntax directly, and this course's driver examples use Node.js. You don't need to be a JavaScript developer, but recognizing basic syntax (`{}`, `[]`, arrow functions, `await`) will make the examples land faster. If you're coming from Python specifically, this course also covers PyMongo, MongoDB's Python driver, as an alternative path.

### 3. Some general database/data-modeling intuition (recommended)

You don't need prior SQL or relational database experience specifically, but having thought at all about "how should related pieces of data be organized" — even informally, from spreadsheet design or general programming data structures — helps the embed-vs-reference schema design material land as a genuine design decision rather than arbitrary syntax to memorize. If you've completed this platform's SQL material first, the relational concepts you already know (normalization, joins, foreign keys) transfer directly as useful contrast — MongoDB's schema design decisions are frequently best understood *in relation to* what a relational design would have done differently, which is exactly how this course's own material frames embedding vs. referencing.

### 4. A place to actually run queries — required, not optional reading

You cannot build real MongoDB fluency by reading examples alone:
- **MongoDB Atlas free tier (M0)** — a genuinely free-forever 512MB cluster, the fastest path to a real, production-shaped MongoDB instance with zero local setup
- **Docker** (`docker run mongo:8`) — fast local setup if you prefer working offline or want full control
- **MongoDB Compass** — the official GUI, useful for visually exploring documents and building queries interactively while you're still building command syntax fluency

### 5. What you do *not* need yet

- Prior NoSQL database experience — this course builds MongoDB-specific concepts from a reasonable starting point, not assuming familiarity with a different NoSQL system
- Deep distributed systems theory — replication and sharding are covered at a practical, applied level; you don't need prior CAP-theorem-level distributed systems coursework, though this course does cover CAP theorem specifically as it applies to MongoDB
- SQL/relational database experience — genuinely not required, though it does provide useful contrast if you have it (see #3)

### Quick self-check

Given this document:
```json
{ "name": "Alice", "address": { "city": "Austin" }, "tags": ["admin", "user"] }
```
Can you write, without looking anything up, a query to find documents where `address.city` is `"Austin"` and where `tags` contains `"admin"`? If yes, your JSON/query-syntax fluency is solid enough to dive into this course's Fundamentals section. If not, that's fine — this exact pattern (dot notation for nested fields, implicit array-contains matching) is covered early and specifically because it trips up people coming from a background where neither pattern exists.
