# Cloud Databases — Notes

## Core mental model

- "Managed" removes specific, real operational work — patching, backup/restore infrastructure, failover logic — not the need to understand the tradeoffs of what's provisioned.
- Multi-AZ (availability/failover) and Read Replicas (read scaling) solve different problems — needing both means provisioning both, not picking one to cover the other's purpose.
- Automated backups protect against infrastructure failure within the retention window — not against a bad deploy corrupting data silently past that window. Choose retention period based on realistic problem-detection time.

## Relational vs. NoSQL

- Default starting question: ACID + joins + well-understood schema → relational; massive horizontal scale + ms latency at huge scale → NoSQL.
- Most application data fits relational comfortably — reaching for NoSQL because of its scale reputation before traffic actually justifies it is a common, avoidable over-engineering trap.
- True multi-region *writes* (Spanner, Cosmos DB) is a genuinely distinct, higher-cost, higher-complexity category from multi-region reads (most "multi-region" setups) — worth it only with a measured, real write-latency requirement driving it.

## DynamoDB / NoSQL specifics

- Partition key cardinality is the single most important early design decision — a low-cardinality key creates a hot partition that throttles performance regardless of how much capacity is provisioned, and is hard to fix later without a full migration.
- On-demand pricing removes capacity planning and throttling risk, but also removes the natural cost ceiling provisioned capacity provides — a traffic spike (legitimate or bug-driven) directly inflates cost rather than just causing throttling.

## Aurora specifics

- Storage-compute separation (distributed storage layer independent of any one compute instance) is what makes Aurora's failover faster and read-replica provisioning cheaper than traditional RDS — not just "AWS's faster Postgres."
- Aurora's per-request I/O billing can cost more than expected for I/O-heavy workloads not budgeted with that pricing model in mind.

## Disaster recovery

- DR architecture should be chosen from explicit RTO/RPO requirements, not defaulted to the most resilient (and most expensive) option available — a tested cross-region replica with manual promotion is a completely reasonable, much cheaper DR strategy when the real requirement tolerates tens of minutes of downtime.
- Replication lag to a DR replica is a direct, active threat to RPO and needs continuous monitoring/alerting — not something to discover only during an actual failover.

## Cost and vendor considerations

- Reserved capacity is worth it for genuinely stable, predictable workloads — not for anything still growing or changing shape.
- Vendor lock-in is a real, legitimate tradeoff (capability vs. portability), not something to avoid reflexively — the practical mitigation is isolating data-access logic behind an application-layer abstraction, not avoiding managed services outright.
- A genuine multi-cloud database requirement (not just "using multiple clouds for different workloads") is real for specific cases (regulatory data residency, extreme-criticality risk mitigation) but adds significant complexity — worth deciding explicitly and early, since retrofitting portability later is costly rework.

## Migration

- Schema/compatibility risk (proprietary stored procedures, vendor-specific functions/types) is usually the larger, earlier risk than the bulk data transfer itself — assess this before committing to a migration timeline.
- Big-bang cutover is simpler but requires accepting a real downtime window; dual-write avoids downtime but is meaningfully more complex to implement correctly and carries its own data-divergence risk if done carelessly.
