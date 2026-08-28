# Cloud Databases

**Before you start:** basic familiarity with relational vs NoSQL databases (see this academy's SQL Mastery and MongoDB courses if those are new) is assumed. No prior cloud experience is required.

## What Are Cloud Databases?

Cloud databases are managed database services run by a cloud provider — they handle provisioning, patching, backups, and failover for you. This page deliberately covers the landscape **across providers**, not one vendor in isolation, because the decision engineers actually face is "which managed database fits this workload," not "how does one specific service work."

## Why This Exists (The Hook)

Running your own database means being the one who wakes up at 3am when a disk fills up, applies security patches before a vulnerability gets exploited, and manually promotes a replica when the primary dies. A cloud database exists to make that someone else's job — you still design the schema and write the queries, but the provider handles the operational load of actually keeping the database alive, patched, and backed up, in exchange for a real ongoing cost.

**Analogy** — Think of a self-managed database like owning a car, and a cloud database like a car with a full maintenance plan. Both get you where you're going (both are real databases you connect to and query), but with the maintenance plan, someone else handles the oil changes, recalls, and the emergency tow if it breaks down — you just drive it and pay a bit more for that peace of mind.

**Try it (2 minutes)** — Reason through the on-demand vs provisioned pricing tradeoff without doing any math: a startup with wildly unpredictable traffic (maybe 10 requests a minute, maybe 10,000 during a viral moment) is choosing between DynamoDB's on-demand pricing (pay per request, no capacity planning) and provisioned capacity (cheaper per-request, but you pre-commit to a throughput ceiling). Which one avoids the risk of the app falling over during an unexpected traffic spike — and which one would actually be cheaper for a large, established company with steady, predictable daily traffic?

## The Landscape, Compared

| Provider | Relational (managed) | NoSQL (managed) | Best known for |
|---|---|---|---|
| AWS | RDS (Postgres/MySQL), Aurora | DynamoDB | Broadest ecosystem, Aurora's storage-compute separation |
| Azure | Azure SQL Database, Azure Database for PostgreSQL | Cosmos DB | Cosmos DB's multi-model, multi-region writes |
| GCP | Cloud SQL, AlloyDB, Spanner | Firestore, Bigtable | Spanner's globally-consistent relational scale |
| Vendor-neutral | Self-managed Postgres/MySQL on any VM | MongoDB Atlas, Redis Cloud | Full control, portability across clouds |

```conceptgrid
{
  "boxes": [
    { "title": "AWS", "description": "RDS (Postgres/MySQL), Aurora, DynamoDB -- broadest ecosystem", "color": "blue" },
    { "title": "Azure", "description": "Azure SQL, Azure Database for PostgreSQL, Cosmos DB (multi-model, multi-region)", "color": "purple" },
    { "title": "GCP", "description": "Cloud SQL, AlloyDB, Spanner (globally-consistent relational scale)", "color": "amber" },
    { "title": "Vendor-Neutral", "description": "Self-managed Postgres/MySQL, MongoDB Atlas, Redis Cloud -- full portability", "color": "green" }
  ]
}
```

## Why "Managed" Matters

- **No patching/upgrades** — the provider handles OS and database engine patches.
- **Automated backups & point-in-time restore** — built in, not something you script yourself.
- **Multi-AZ failover** — a standby replica takes over automatically during an outage, usually in under a minute.
- **Read replicas** — scale read-heavy workloads without re-architecting the app.

## Choosing Relational vs NoSQL (Managed)

- Need ACID transactions, joins, well-understood schema → **managed relational** (RDS/Aurora, Cloud SQL, Azure SQL).
- Need massive horizontal scale, flexible schema, single-digit-millisecond latency at huge scale → **managed NoSQL** (DynamoDB, Cosmos DB, Firestore).
- Need global write scale with strong consistency → **Spanner** or **Cosmos DB** (multi-region writes) — a genuinely distinct category from single-region relational.

## Cost Model Basics

Cloud databases are billed on a mix of: compute (instance size or "capacity units"), storage (per GB-month), I/O/requests, and data transfer. NoSQL services like DynamoDB additionally offer **on-demand** (pay-per-request) vs **provisioned** (reserved throughput) pricing — on-demand is simpler for unpredictable traffic, provisioned is cheaper for steady, predictable load.

## Migration Considerations

Moving from a self-managed database to a cloud-managed one usually means: schema compatibility checks (especially Oracle/SQL Server → Postgres/MySQL), a data migration tool (AWS DMS, Azure Database Migration Service), and a cutover strategy (big-bang vs. dual-write during transition).

:::tip When to specialise
Once you've picked a primary cloud provider for a project, it's completely reasonable to go deep on that provider's specific service (e.g. DynamoDB) — this page is the "compare before you commit" step, not a replacement for vendor-specific deep dives.
:::
