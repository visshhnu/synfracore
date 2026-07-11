# Cloud Databases — Advanced

## Disaster recovery across regions: RTO/RPO as the design driver, not an afterthought

A Multi-AZ deployment (covered on Fundamentals) protects against a single Availability Zone failure — it does **not** protect against a full regional outage, which is rare but does happen. Designing genuine cross-region disaster recovery starts from two explicit numbers, not from a specific technology choice:

- **RTO (Recovery Time Objective)** — how long can the system realistically be down during a regional failure before the business impact is unacceptable
- **RPO (Recovery Point Objective)** — how much data loss (measured in time — the last N minutes of writes) is acceptable in that scenario

```
Cross-region read replica + manual promotion:
  RTO: minutes to tens of minutes (manual intervention required)
  RPO: seconds to minutes (depends on replication lag at failure time)

Cross-region synchronous/multi-region-write setup (Cosmos DB, Spanner):
  RTO: near-zero (no promotion step needed)
  RPO: near-zero (already synchronously consistent across regions)
  Cost: significantly higher, real latency tradeoff on every write
```
The actual design decision is matching the DR architecture's cost and complexity to genuinely required RTO/RPO — not defaulting to the most resilient (and most expensive) option available. A cross-region read replica with a documented, tested manual promotion runbook is a completely reasonable, much cheaper DR strategy for a system whose actual business requirement tolerates 15-30 minutes of downtime during a genuinely rare regional failure; building a full multi-region-write architecture for that same system is over-engineering relative to its real requirement, not a strictly "more correct" choice.

## Vendor lock-in: a real cost, worth pricing explicitly rather than ignoring

Choosing a provider-specific managed database (DynamoDB, Cosmos DB, Aurora's proprietary extensions) trades portability for capability — this is a legitimate tradeoff, not something to avoid reflexively, but it's worth being deliberate about rather than accepting implicitly. The practical mitigation isn't "avoid managed services" — it's isolating the coupling: keeping data-access logic behind an application-layer abstraction (a repository pattern, a data-access module) so a future migration, if ever needed, means rewriting that isolated layer rather than every place in the codebase that touches the database directly. For genuinely vendor-neutral requirements (a product explicitly designed to be deployable across multiple clouds for customers, for instance), self-managed Postgres/MySQL or a vendor-neutral managed service (MongoDB Atlas, which itself runs across all three major clouds) trades some of the "fully managed, zero ops" convenience for that portability — a real, explicit tradeoff worth naming to stakeholders rather than deciding unconsciously through whichever database happened to be the default choice at project start.

## Cost optimization at real scale: beyond on-demand vs. provisioned

Once a cloud database workload is large enough for cost to be a genuine line item worth optimizing, a few levers beyond the basic on-demand/provisioned choice from the Fundamentals tab matter:

- **Reserved capacity/instances** — committing to 1 or 3 years of usage in exchange for a meaningfully lower rate; worth it specifically for a workload with genuinely stable, predictable baseline load, not for anything still growing or changing shape
- **Storage tiering** — moving genuinely infrequently-accessed data (old records rarely queried) to cheaper storage classes where the platform supports it, rather than paying primary-storage rates for data that's effectively archival
- **Right-sizing based on actual utilization**, not initial provisioning guesses — a database instance sized generously at launch, before real traffic patterns were known, is a common source of ongoing overpayment that a routine utilization review (not just a one-time sizing decision) catches
- **NoSQL request-shape optimization** — for DynamoDB/Cosmos DB specifically, poorly designed queries (scanning instead of querying by key, over-fetching attributes not actually needed) directly inflate request-based billing in a way that's invisible until a cost review, unlike relational databases where inefficient queries show up primarily as latency rather than as a separate, distinct cost line

## Multi-cloud database strategy: when it's a real requirement versus unnecessary complexity

A genuine multi-cloud database requirement — running the same workload's database layer across two different cloud providers, not just using multiple clouds for different, independent workloads — is a real and legitimate need for specific cases (regulatory requirements mandating data residency across specific jurisdictions with no single provider covering all of them, or genuine risk mitigation against a full single-provider outage for an extremely critical system) but is significant added complexity for anything short of that. Vendor-neutral options (self-managed Postgres/MySQL, MongoDB Atlas) are the practical path when multi-cloud is a genuine requirement, since provider-specific managed services (DynamoDB, Cosmos DB, Aurora) are inherently single-provider by design — the decision to require multi-cloud database portability should be made explicitly, early, and for a specific, articulable reason, since retrofitting portability onto an architecture already built around one provider's specific managed service is real, costly rework, not a late-stage adjustment.
