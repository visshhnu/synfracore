# HA / DR Design — Prerequisites

## What You Need Before Starting

HA/DR design is an architecture-level discipline that sits on top of several other technologies — it's about how to combine infrastructure you already understand into a resilient system, rather than a standalone tool or skill to learn in isolation.

### 1. Working knowledge of Kubernetes fundamentals (required)

This course's material assumes you already know what a Deployment, Pod, Service, and basic scheduling concepts are — the HA patterns covered here (anti-affinity, PodDisruptionBudget, readiness/liveness probes) are refinements applied on top of that base, not an introduction to Kubernetes itself. If Kubernetes basics are still new, that should come first; trying to learn "how to make Kubernetes highly available" before understanding what a Deployment does in the first place makes both harder.

### 2. Basic cloud infrastructure concepts — regions, availability zones (required)

You should understand, at least conceptually, the difference between an availability zone (a physically distinct data center within a region, but with low-latency connections to other AZs in the same region) and a region (a fully separate geographic location) — this distinction is the entire basis for why HA (surviving an AZ failure) and DR (surviving a region failure) are different problems requiring different solutions. If these concepts are unfamiliar, this platform's Cloud Fundamentals or a specific cloud provider's fundamentals material is worth a pass first.

### 3. Basic database concepts — replication, at a conceptual level (recommended)

You don't need deep database administration expertise, but understanding that a database can have a "primary" that accepts writes and a "replica" that receives copies of those writes, and that a replica can potentially be "promoted" to become the new primary during a failover, will make the Database HA sections click much faster. If databases are still largely a black box to you, a general database fundamentals pass first will pay off here.

### 4. Basic networking — DNS, load balancers (recommended)

DNS failover (and why TTL specifically matters for how fast a failover actually takes effect from a user's perspective) and load balancer health checks are both directly used in DR runbooks throughout this course's material. This platform's own Networking technology covers this ground if it's unfamiliar.

### 5. Some exposure to incident response concepts (helpful, not required)

This platform's own Incident Management technology covers the human/process side of responding to a failure (communication, escalation, decision-making under uncertainty) that pairs directly with the technical HA/DR material here — a DR runbook execution is, functionally, a specific kind of incident response. They're not strictly sequential prerequisites, but the two subjects reinforce each other well if studied close together.

### 6. What you do *not* need yet

- Deep expertise in any single cloud provider — this course's examples span AWS and Azure specifically to illustrate that the underlying concepts (multi-AZ, DR tiers, DNS failover) transfer across providers, even though exact service names differ
- Prior experience actually running a real failover — this is exactly what this course is meant to build; nobody starts with this experience, and it's a genuinely rare thing to have hands-on experience with outside of dedicated practice (GameDays) or an actual disaster
- Distributed systems theory beyond CAP theorem at a conceptual level — you need to understand the Consistency/Availability tradeoff well enough to reason about which a given system should prioritize, not the deeper formal distributed-systems literature behind it

### Quick self-check

Given a business requirement of "RTO under 15 minutes, RPO under 1 minute" for a payment system, can you explain — without looking anything up — roughly which DR strategy tier this rules out (Backup & Restore, certainly) and which tier is the likely minimum fit (Warm Standby)? If yes, you're ready for this course's Fundamentals section. If translating a business requirement into an architecture-tier decision doesn't yet feel intuitive, that's exactly what this course is designed to build — proceed to Fundamentals regardless, this is the core skill being taught, not something you need to already have.
