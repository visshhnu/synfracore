# MongoDB — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production MongoDB incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The embedded array that hit the document size limit in production

**The pattern:** A team designs a blog platform with comments embedded directly inside each post document — a reasonable choice early on, since comments and posts are almost always read together, and embedding avoids a `$lookup` on every page view. The application works fine for months. Then a single post goes viral, accumulates tens of thousands of comments, and writes to that document start failing outright — the document has hit MongoDB's 16MB per-document hard limit, and no further comments can be added at all.

**Why this is a genuinely predictable failure, not a rare edge case:** embedding is explicitly the right call for 1:few relationships where the "many" side stays small and bounded — the mistake here wasn't embedding itself, it was embedding an *unbounded* collection (comments on a post can grow arbitrarily large) without a plan for what happens as it grows. This is exactly the tradeoff this course's own material describes: "good for 1:few relationships... bad for 1:many (thousands of comments — document size limit 16MB)" — the theoretical limit was known, but the schema wasn't designed with a migration path for when a specific document actually approached it.

**What actually prevents this:**
- **For any embedded array with no natural upper bound, plan the referencing alternative from the start**, even if you launch with embedding for the read-performance benefit — comments should reference their parent post (or use a bucket pattern grouping comments in batches) rather than living inside the post document indefinitely.
- **Monitor document size distribution in production**, not just assume it based on the design intent — a metric tracking the largest documents in a collection over time would have caught this specific post's document size trending toward the limit well before it actually hit it.
- **Treat "always embed for 1:few" as a starting heuristic that needs re-evaluating once real usage patterns emerge**, not a permanent architectural decision — a relationship that looked like 1:few during design can turn into 1:many in practice once a specific piece of content goes unexpectedly viral.

---

## Scenario 2 (illustrative/composite): The write concern that was too weak for the operation it protected

**The pattern:** An e-commerce application processes orders with the default write concern (`w: 1` — acknowledged once the primary confirms it, without waiting for replication to secondaries). During a rare but real event — the primary crashes moments after acknowledging an order write, before that write has replicated to any secondary — a newly-elected primary doesn't have that order in its data at all. The customer received an order confirmation, but the order itself no longer exists anywhere in the database.

**Why the default write concern is a reasonable choice for most data but a real risk for specific operations:** `w: 1` is faster and is the right tradeoff for data where losing a very recent, rare write is an acceptable risk (a page-view counter, a non-critical log entry) — but for anything representing a real business commitment (an order, a payment, an inventory deduction), the same tradeoff represents genuine, unacceptable data loss risk in exactly the rare failure scenario it's designed to handle gracefully in the common case. The mistake wasn't "MongoDB is unreliable" — it's applying one write concern uniformly to operations with very different actual risk tolerances.

**What actually prevents this:**
- **Use `{ w: "majority", j: true }` specifically for operations representing real business state** (orders, payments, inventory changes) — this course's own Advanced material already documents this exact write concern for durability-critical writes; the fix isn't new knowledge, it's applying the *stronger* option where it actually matters rather than defaulting to the same setting everywhere.
- **Differentiate write concern by operation, not by a single application-wide default** — a page-view counter and an order confirmation don't need the same durability guarantee, and treating them identically either over-pays for unimportant writes or under-protects important ones.
- **Test failover under real write load, not just as a clean administrative drill** — this course's own Portfolio Project 3 specifically calls for triggering `rs.stepDown()` while a write is in flight and observing what actually happens to it, precisely because this is the scenario that's easy to overlook when replica sets are only ever tested in a quiet, no-load state.

---

## Scenario 3 (illustrative/composite): The shard key that seemed reasonable and created a permanent hotspot

**The pattern:** A team shards an `events` collection using `{ createdAt: 1 }` as the shard key — intuitively reasonable, since most queries filter by a date range, and range sharding is supposed to make range queries efficient. In practice, because `createdAt` is monotonically increasing (every new event has a timestamp later than the last), literally every single write goes to the same shard — whichever shard currently owns the most recent date range — permanently, regardless of how many shards exist in the cluster. Adding more shards does nothing to relieve write load, since new writes always target the same one.

**Why this specific mistake is so common despite being explicitly documented as a bad shard key pattern:** the instinct that produces this choice is genuinely reasonable — "my queries filter by date, so I should shard by date" — but it conflates *query pattern alignment* (a real, valid consideration for shard key choice) with *write distribution* (an equally important, separate consideration that a monotonically increasing key fails specifically because new writes always land at one end of the range). This course's own material names this exact failure mode directly ("monotonically increasing key creates hotspot on last shard"), but the underlying reasoning that leads people into this trap — matching the shard key to query patterns — is sound advice taken too far without also checking write-distribution implications.

**What actually prevents this:**
- **Explicitly check a candidate shard key against both query pattern alignment AND write distribution before committing to it** — these are separate, both-necessary criteria, not one check that covers both.
- **Use hashed sharding for genuinely monotonic fields when even write distribution matters more than range-query efficiency** — `{ userId: "hashed" }`-style hashed sharding trades away efficient range scans for guaranteed even distribution, which is often the right trade specifically for high-write-volume, monotonically-increasing data.
- **A compound shard key combining a high-cardinality, evenly-distributed field with the date field** (e.g., `{ deviceId: 1, timestamp: 1 }`, as this course's own material shows for time-series data) is often the actual answer — distributing writes across the high-cardinality field while still supporting efficient range queries within each device's own timestamp ordering, rather than choosing purely one extreme or the other.
