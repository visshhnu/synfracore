# MongoDB — PYQ (Previously Asked / Practice Questions)

**Framing note:** MongoDB's Associate Developer exam is proctored and confidential — no public past-paper archive exists. Verified current format: 53 questions, 75 minutes, online-proctored, $150 (50% discount after completing the official learning path), no fixed expiration but tied to a specific major MongoDB version. On domain weighting specifically, I found genuinely conflicting figures across sources — one gave roughly even weighting across CRUD/Aggregation/Indexing/Data Modeling/Drivers/Transactions (~15-20% each), another cited CRUD as dominant at 51% with Drivers at 18% and Indexes at 17%. Rather than assert one breakdown confidently, treat CRUD and aggregation as the two heaviest-weighted areas regardless of which source is more accurate, and prepare accordingly. What follows is built from real task patterns across these domains. *(needs verification — confirm current exam format, pricing, and domain weighting directly on MongoDB's own certification page before relying on the specifics above.)*

---

### 1. (Data Modeling) A `products` collection needs to support both "get all details for one product" (fast, single lookup) and "get the current average rating for a product" (potentially expensive if computed live from thousands of reviews). What schema pattern addresses the second need without slowing down the first?

**Answer:** The computed pattern — store a pre-calculated `stats` sub-object (`averageRating`, `totalReviews`, `ratingDistribution`) directly on the product document, updated incrementally on each new review write rather than recalculated from scratch on every read. This trades a small amount of extra work on the (relatively rare) write path for avoiding an expensive aggregation on the (much more frequent) read path — exactly the tradeoff this course's own material describes for this pattern.

---

### 2. (Indexing) A compound index exists as `{ userId: 1, status: 1, createdAt: -1 }`. Which of these queries can use it efficiently: `{ userId: X }`, `{ status: "active" }`, `{ userId: X, createdAt: { $gt: someDate } }`?

**Answer:** `{ userId: X }` can use it efficiently (leftmost field, equality match). `{ status: "active" }` cannot use it at all — it skips the leftmost field entirely. `{ userId: X, createdAt: { $gt: someDate } }` can use the index for the `userId` portion, but since `status` (the middle field) isn't referenced, MongoDB can't use the index to help with the `createdAt` range condition as efficiently as it could if `status` were also specified — this is exactly the leftmost-prefix rule, and skipping a middle field in a query limits how much of a compound index MongoDB can actually leverage.

---

### 3. (Aggregation) Write a pipeline that returns, for each product category, the top 3 best-selling products by total quantity sold.

```javascript
db.sales.aggregate([
  { $group: {
      _id: { category: "$category", product: "$product" },
      totalQty: { $sum: "$quantity" }
  }},
  { $sort: { "_id.category": 1, totalQty: -1 } },
  { $group: {
      _id: "$_id.category",
      topProducts: { $push: { product: "$_id.product", qty: "$totalQty" } }
  }},
  { $project: {
      category: "$_id",
      topProducts: { $slice: ["$topProducts", 3] },
      _id: 0
  }}
])
```
**What's being tested:** combining `$group` (twice, at two different granularities), `$sort` before the second grouping (so `$push` accumulates in already-sorted order), and `$slice` to take just the top 3 from each accumulated array — a genuinely common "top N per group" pattern in MongoDB that requires this specific two-stage grouping approach, since a single `$group` stage can't directly limit array size per group without a subsequent `$slice`.

---

### 4. (Transactions) Why does MongoDB's own documentation generally recommend single-document atomicity via schema design over reaching for multi-document transactions, even though transactions are fully supported?

**Answer:** Multi-document transactions carry a real, measurable performance cost — they require coordination overhead (locking, holding resources open) across every document/collection involved, which single-document operations (already atomic by default in MongoDB, with no additional configuration needed) don't have. When a schema can be designed so a single atomic operation on one document accomplishes what would otherwise require a multi-document transaction (e.g., embedding related data that needs to update together, rather than referencing it across separate documents), that's usually the more performant choice. Transactions remain the right tool when the data genuinely can't be co-located this way — the recommendation is about defaulting to the cheaper option when it's actually available, not avoiding transactions as inherently broken or unsupported.

---

### 5. (CRUD/Drivers) What's the actual difference between `updateOne` with `$set` and `replaceOne`, and what's a real risk of using the wrong one?

**Answer:** `updateOne` with `$set` modifies only the specific fields named in the update, leaving every other field in the document untouched. `replaceOne` replaces the *entire* document with the new document provided, except for `_id` — any field not included in the replacement document is simply gone afterward. The real risk: using `replaceOne` when `updateOne`/`$set` was intended silently deletes every field not explicitly included in the replacement, which can cause real, hard-to-notice data loss if the replacement document was built from an incomplete object (e.g., a form that only collected a subset of the document's actual fields).

---

### 6. (Indexing) A query with `db.orders.find({ status: "pending" }).explain("executionStats")` shows `totalDocsExamined: 500000` and `nReturned: 200`. What does this ratio indicate, and what's the likely fix?

**Answer:** A `totalDocsExamined`-to-`nReturned` ratio this far from 1:1 indicates the query is examining far more documents than it actually needs to return — almost certainly a full collection scan (`COLLSCAN`) rather than an index-supported query, or an index that doesn't selectively narrow down to the matching documents. The fix, after confirming via the `winningPlan.stage` field, is typically adding an index on `status` (or whatever field(s) the query actually filters on) so MongoDB can jump directly to matching documents rather than scanning the entire collection to find them.

---

### 7. (Data Modeling) Why would a bucket pattern (grouping many small time-series readings into fewer, larger parent documents) generally outperform storing one document per reading, for a high-frequency sensor data use case?

**Answer:** One document per reading (potentially millions per sensor per day) creates enormous per-document overhead — every document has its own `_id`, its own BSON structure overhead, and its own index entries, which adds up to significant storage and indexing cost at scale, along with slower range queries that need to touch many separate documents. The bucket pattern groups readings into time-windowed batches (e.g., one document per sensor per hour, containing an array of that hour's readings plus pre-computed min/max/count), meaningfully reducing document count and index entries while still supporting efficient range queries within a reasonable time window — a direct tradeoff of write complexity (readings need to be appended to the correct bucket) for read/storage efficiency at scale.

---

### 8. (Aggregation) What's the difference between `$match` placed as the first stage of a pipeline versus placed later, and why does this matter for performance?

**Answer:** A `$match` stage placed **first** can use an existing index on the matched field(s), narrowing down the working document set before any subsequent, more expensive stages (`$group`, `$lookup`) process it — this is the standard, recommended pattern. A `$match` placed **later** in the pipeline, after other stages have already reshaped or expanded the data (e.g., after a `$lookup` or `$unwind`), can no longer benefit from an index on the original collection's fields at all, since it's now filtering the already-transformed intermediate result rather than the indexed source documents. This is exactly why "filter first" is standard aggregation pipeline advice, not just a stylistic preference.

---

### 9. (Replication/Drivers) An application reads immediately after writing, using `readPreference: "secondary"` for load balancing. Under what circumstances would this produce a genuinely wrong result for the user, and what's the fix?

**Answer:** If replication lag exists at the moment of the read (even briefly, under load), the secondary might not yet have the just-written data, and the user could see stale results immediately after their own write — a classic "read your own writes" consistency problem. The fix: route reads immediately following a write from the same session back to the primary (or use `readConcern: "majority"` combined with appropriate write concern, or MongoDB's causal consistency sessions, which guarantee a client sees the effects of its own prior writes even when reading from secondaries) rather than applying `secondary` read preference uniformly regardless of how recently a write occurred.

---

### 10. (Data Modeling/Schema Evolution) A collection has documents from before and after a schema change — some documents have an `email` field, others have `emailAddress` (a later rename). What's the safe way to query "give me the email for every document," and why is directly querying `{ email: ... }` alone insufficient?

**Answer:** Since MongoDB's flexible schema means older documents may genuinely lack the renamed field, querying `{ email: someValue }` alone would silently miss every document still using the old `emailAddress` field name — MongoDB won't error or warn about this, it'll just return incomplete results. The safe approaches: use `$or` to check both field names during a transition period (`{ $or: [{ email: X }, { emailAddress: X }] }`), or better, run a one-time migration script that copies `emailAddress` into `email` across all existing documents and removes the old field, so the schema is genuinely consistent going forward rather than requiring every future query to account for both possible field names indefinitely.
