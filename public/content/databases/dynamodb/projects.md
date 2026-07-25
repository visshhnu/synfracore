# DynamoDB — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Single-Table Design from Access Patterns

**Level:** Beginner-Intermediate | **Time:** 2 days

Design a DynamoDB table for a realistic domain (an e-commerce app, a social feed) starting from a written list of access patterns, not from an entity-relationship diagram — this is the discipline DynamoDB schema design actually requires.

### Steps

1. Write down every access pattern your application needs first (e.g. "get a user's profile and their 20 most recent orders in one request")
2. Design a single table using generic `PK`/`SK` attributes and key overloading (e.g. `PK=USER#123, SK=PROFILE` and `PK=USER#123, SK=ORDER#2024-01-15#456`) to serve as many patterns as possible from one table
3. Add a GSI only where the base table's key structure genuinely can't serve a required access pattern (e.g. "look up an order by orderId alone")
4. Load realistic data volume and confirm each access pattern resolves with a `query()` or `get_item()`, not a `scan()`
5. Write a README mapping each access pattern to the exact key structure that serves it

### Skills Demonstrated

- Access-pattern-first schema design, DynamoDB's core discipline (the opposite of relational normalization)
- Key overloading and single-table design
- Recognizing when a GSI is actually needed versus over-engineering

### GitHub Repo Name

`dynamodb-single-table-design`

---

## Project 2: Transactional Order Flow with Optimistic Locking

**Level:** Intermediate | **Time:** 2-3 days

Build a realistic order-placement flow that needs true atomicity across multiple items — the exact scenario `TransactWriteItems` and conditional expressions exist for.

### Steps

1. Design tables/items for an order, its line items, and a product inventory counter (single-table or multi-table, your choice, justified in the README)
2. Implement order placement using `TransactWriteItems` so the order record, order items, and inventory decrement all succeed or all fail together
3. Add a `ConditionExpression` on the inventory update (e.g. `qty >= :requested`) so an order can never oversell inventory, and handle the resulting `TransactionCanceledException` correctly
4. Implement optimistic locking on order status updates using a version attribute and a `ConditionExpression`, and demonstrate what happens when two concurrent updates race
5. Document, with real test output, what happens when the transaction is deliberately forced to fail (insufficient inventory) — confirm nothing was partially applied

### Skills Demonstrated

- Real use of `TransactWriteItems` for genuine cross-item atomicity
- Conditional expressions for both business-rule enforcement and optimistic locking
- Verifying atomicity with actual failure-case testing, not just the happy path

### GitHub Repo Name

`dynamodb-transactional-orders`

---

## Project 3: Event-Driven Pipeline with Streams and Lambda

**Level:** Advanced | **Time:** 3-4 days

Build a real event-driven pipeline reacting to DynamoDB changes in real time — a genuinely common production pattern, not just a Streams demo.

### Steps

1. Enable DynamoDB Streams on a table and write a Lambda function triggered by it, distinguishing `INSERT`/`MODIFY`/`REMOVE` events
2. Implement at least two real downstream effects: e.g. syncing changed items to a search index, and sending a notification when an order's status transitions from `pending` to `shipped`
3. Handle the stream's `OldImage`/`NewImage` correctly to detect specific field transitions (not just "something changed")
4. Deliberately test what happens on a Lambda failure/retry and document how your pipeline handles (or doesn't yet handle) duplicate event delivery
5. If time allows, extend to Global Tables across two regions and document observed replication latency for a real write

### Skills Demonstrated

- Real event-driven architecture built on DynamoDB Streams, not just theory
- Correctly distinguishing stream event types and field-level transitions
- Understanding idempotency/duplicate-delivery concerns in event-driven pipelines

### GitHub Repo Name

`dynamodb-streams-event-pipeline`

---

## Tips for Great DynamoDB Projects

**Design from access patterns, not entities.** A DynamoDB schema that looks like a normalized relational design — separate tables per entity, expecting joins — is the clearest sign a project wasn't actually designed the DynamoDB way.

**Show that you avoided `scan()`.** Every access pattern in a well-designed DynamoDB project should resolve via `query()` or `get_item()` — being able to say "every read in this project is a targeted query, not a scan" is a genuinely strong signal.

**DynamoDB has no JOINs, no FOREIGN KEY constraints, and no window functions.** If a project design implies any of these, that's a sign the schema needs to be reshaped around single-table design and key overloading instead, not that DynamoDB is missing a feature.

## Portfolio Checklist

- [ ] At least one project's schema is explicitly derived from a written list of access patterns
- [ ] At least one project demonstrates real cross-item atomicity via `TransactWriteItems`
- [ ] At least one project includes a genuine event-driven pipeline built on DynamoDB Streams
- [ ] Each README explains the reasoning, not just the final schema
- [ ] You can walk through any of these projects for 5+ minutes without notes
