# Database Design — Fundamentals

## Why normalization exists — the actual problems it prevents

Overview covers the normal forms as rules; the more useful fundamental understanding is *what breaks* without them. An unnormalized table (repeating customer name/email on every order row, per Overview's example) has three concrete, real problems:

- **Update anomaly** — a customer changes their email, and you have to update every single order row that repeated it, or the data becomes inconsistent (some rows show the old email, some the new).
- **Insertion anomaly** — you can't record a new customer until they place an order, because customer data only exists embedded in order rows.
- **Deletion anomaly** — deleting a customer's only order accidentally deletes their customer data too, since it was never stored independently.

Each normal form (1NF, 2NF, 3NF) eliminates a specific one of these — this is why memorizing "3NF means no transitive dependencies" is much more useful once you can also explain *which anomaly* that rule is preventing.

## Primary keys: natural vs. surrogate

A **natural key** is a real-world attribute that's already unique (an email address, a national ID number). A **surrogate key** is an artificial identifier with no business meaning (an auto-incrementing integer, a UUID) created solely to serve as the primary key. The practical guidance, and why it's the common default: natural keys can change (an email address gets updated) or turn out not to be as unique as assumed (two people sharing what you thought was a unique attribute), and a primary key changing is disruptive since every foreign key referencing it needs to cascade. Surrogate keys avoid this by design — `id SERIAL PRIMARY KEY` never needs to change for business reasons, because it never carried business meaning to begin with.

## Foreign keys and referential integrity, precisely

A foreign key doesn't just document a relationship — it's an enforced database-level constraint that prevents orphaned data: `customer_id INT NOT NULL REFERENCES customers(id)` means the database itself rejects an insert into `orders` referencing a `customer_id` that doesn't exist in `customers`, regardless of what your application code does or doesn't check. This matters precisely because application-level validation can have bugs or get bypassed (a direct database script, a different service writing to the same table) — the foreign key constraint is a guarantee the database enforces unconditionally, not a convention that depends on every writer behaving correctly.

## `ON DELETE` behavior — a detail that matters more than it initially seems

```sql
customer_id INT NOT NULL REFERENCES customers(id) ON DELETE RESTRICT  -- block the delete if orders exist
-- vs
customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE   -- deleting a customer deletes their orders too
```

`RESTRICT` (Overview's example) is the safer default for most real systems — it forces an explicit decision about what happens to related data rather than silently cascading deletes, which can destroy far more data than intended if a delete statement's scope is broader than expected. `CASCADE` is appropriate specifically where the child data has no meaning without the parent (deleting a blog post's comments when the post itself is deleted, for example) — the distinction is whether the child row is meaningful in isolation.

## Indexes: what they actually cost, not just what they buy

Overview covers index types; the fundamental tradeoff worth internalizing early: every index speeds up the reads it's designed for, but also slows down writes (every `INSERT`/`UPDATE`/`DELETE` on an indexed column has to update the index too) and takes real storage space. This is why "just add an index" isn't universally correct advice — an index on a rarely-queried column, or on a write-heavy table where the read pattern doesn't actually benefit from it, is a real cost with no corresponding benefit, not a free performance improvement.
