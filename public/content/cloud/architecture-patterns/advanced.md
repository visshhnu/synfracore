# Cloud Architecture Patterns — Advanced

## Designing for partial failure, not just total failure

Most architecture discussions default to reasoning about total outages (a service is either up or down), but real production failures are much more often partial: a service that's up but responding slowly, a dependency that fails for 2% of requests, a downstream service degraded but not fully down. Advanced pattern design accounts for this explicitly:

- **Circuit breakers** — after a dependency fails repeatedly past a threshold, stop calling it entirely for a cooldown period and fail fast instead, rather than letting every caller wait out a slow timeout against a service that's clearly unhealthy. This protects the *caller's* resources (threads, connections) from being exhausted waiting on a struggling dependency, and gives the struggling dependency room to recover instead of being hit with continued load while already degraded.
- **Bulkheads** — isolate resource pools (connection pools, thread pools) per dependency, so one slow/failing dependency can't exhaust resources shared with unrelated dependencies. Named after ship bulkheads, which contain flooding to one compartment instead of sinking the whole vessel.
- **Graceful degradation, designed explicitly per feature** — deciding, ahead of time, what a user-facing feature does when a non-critical dependency is unavailable (show cached/stale data, hide the feature, show a generic fallback) rather than discovering the actual behavior for the first time during an incident.

## Multi-region active-active, done correctly

Multi-region active-active (both regions serving real production traffic simultaneously, not one as disaster-recovery standby) is one of the hardest patterns to get right, because it forces explicit decisions that simpler patterns can leave implicit:

- **Conflict resolution for concurrent writes to the same entity in different regions** — last-write-wins (simple, but can silently lose a legitimate concurrent update), vector clocks/CRDTs (correct but adds real complexity), or routing all writes for a given entity to one "home" region (avoids the conflict entirely, at the cost of added latency for users far from that entity's home region).
- **Data residency and compliance constraints** — some data legally cannot leave a specific geographic region (GDPR-driven constraints are the common real-world example), which directly constrains which replication topology is even legally viable, not just which is technically simplest.
- **Split-brain handling during a network partition between regions** — if regions temporarily can't communicate, does each region keep serving writes independently (risking conflicting state that needs reconciling once connectivity returns) or does one region stop accepting writes (sacrificing availability for consistency)? This is CAP theorem made concrete, not an abstract exercise — a real architectural decision with real tradeoffs that need to be made deliberately, not discovered during an actual partition.

## Saga pattern at genuine production scale: idempotency and ordering

At scale, two problems compound the basic Saga pattern from Intermediate: message delivery isn't guaranteed exactly-once (most real message brokers guarantee at-least-once, meaning a step can receive the same event twice), and ordering isn't always guaranteed across partitions/shards. Production-grade Saga implementations need every step to be **idempotent** (processing the same event twice produces the same result as processing it once, not a duplicate side effect), and often need an explicit sequence number or vector-clock-style mechanism if step ordering genuinely matters and can't be guaranteed by the message infrastructure alone.

## Evolving CQRS: multiple read models for multiple consumers

At advanced scale, "the read side" often isn't one model — different consumers of the same underlying write-side data need genuinely different shapes (a search-optimized view via Elasticsearch, a real-time dashboard view via a different store, an analytics-optimized view via a data warehouse), all built from the same stream of write-side events. This is where event sourcing's replay capability (see Intermediate) becomes genuinely valuable rather than theoretical: adding a new read model later means subscribing a new consumer to the existing event stream and building its view, not re-architecting the write side to support a new access pattern that wasn't anticipated originally.

## Architecture Decision Records (ADRs) — documenting the "why," not just the "what"

At the point where a system has accumulated several of these patterns, the architecture itself becomes hard to reason about without documented history — why CQRS was chosen for this specific service and not that one, why Saga uses orchestration here and choreography there. ADRs are short, version-controlled documents capturing a specific decision, the alternatives considered, and the reasoning — not exhaustive documentation of the whole system, just the *decisions* and their context, written at the time they're made rather than reconstructed later from memory once the original reasoning is forgotten.
