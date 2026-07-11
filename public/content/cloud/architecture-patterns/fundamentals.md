# Cloud Architecture Patterns — Fundamentals

## Why patterns exist at all: the same problems recur

Architecture patterns aren't arbitrary conventions — each one exists because a specific, recurring problem class doesn't have a good one-off solution. Before learning the patterns themselves, it's worth being explicit about which problem each one addresses, because that's what actually gets tested in interviews and what actually determines when to reach for one.

| Pattern | Problem it solves |
|---|---|
| Multi-AZ Active-Active | A single availability zone failing shouldn't take your whole service down |
| Hub-and-Spoke Networking | N VPCs needing to talk to each other and shared services becomes an unmanageable mesh as N grows |
| Strangler Fig | You can't safely rewrite a large legacy system in one big-bang release |
| CQRS | Read and write workloads have fundamentally different scaling/consistency needs, but one data model forces a compromise for both |
| Saga | A single database transaction can't span multiple independent microservices' data stores |
| Serverless Event-Driven | Provisioning fixed capacity for unpredictable, spiky load wastes money or under-provisions |

## Multi-AZ, explained mechanically

An Availability Zone (AZ) is a physically separate data center (or cluster of them) within a cloud region, with independent power, cooling, and networking — the point is that a failure in one AZ (a power outage, a hardware failure at scale) shouldn't correlate with a failure in another. "Multi-AZ Active-Active" specifically means both zones are actively serving real traffic simultaneously, not one sitting idle as a cold standby — this matters because an idle standby that's never received real traffic is untested in practice, and failover to it can surface problems (stale config, an unpatched dependency) that active-active setups catch continuously instead of during an actual incident.

## Hub-and-Spoke networking, explained mechanically

Without it: N VPCs that all need to talk to each other require roughly N² peering connections as N grows — unmanageable past a handful of VPCs, and every new VPC means updating routing in every existing one. Hub-and-Spoke centralizes this: every VPC ("spoke") connects only to a central hub (a Transit Gateway, in AWS terms), and the hub handles routing between spokes and to shared services (logging, monitoring, DNS) and on-premises connections. Adding a new VPC means one new connection to the hub, not N new connections to every existing spoke.

## Strangler Fig, explained mechanically

Named after the strangler fig plant, which grows around a host tree and gradually replaces it. In architecture terms: instead of rewriting a legacy monolith in one release (high-risk, long-feedback-loop), you put a routing layer (commonly an API Gateway or reverse proxy) in front of it, and migrate one capability at a time — new requests for that specific path route to a new microservice, everything else still routes to the legacy monolith. Over time, more and more traffic routes to new services until the legacy system handles nothing and can be retired. The core value: each migrated piece ships and is validated independently, rather than betting an entire rewrite on one release.

## CQRS, explained mechanically

Command Query Responsibility Segregation splits the write path (commands) from the read path (queries) into separate models, sometimes separate data stores entirely. The write side is optimized for correctness and consistency (a normalized relational schema, strong transactional guarantees). The read side is optimized for query performance (denormalized views, a search index like Elasticsearch, a cache like Redis) — shaped however reads actually need the data, not constrained by the write side's schema. The tradeoff, and the reason this isn't a default choice: the read side is now eventually consistent with the write side (there's a real, non-zero lag between a write and that write being reflected in read views), and you're maintaining two data models instead of one.

## Saga, explained mechanically

A traditional database transaction guarantees all-or-nothing across multiple operations within one database. Once you have multiple microservices, each with its own database, that guarantee doesn't span services — there's no single transaction that can atomically update Service A's database and Service B's database together. Saga replaces this with a sequence of local transactions, each publishing an event that triggers the next step; if a step fails partway through, **compensating transactions** run to undo the completed steps in reverse (a "cancel payment" event to undo a completed "charge payment" step, for example) rather than relying on a distributed transaction that doesn't actually exist at this scale.
