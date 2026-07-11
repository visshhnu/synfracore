# Cloud Architecture Patterns — Intermediate

## Choreography vs. orchestration in the Saga pattern

Fundamentals introduced Saga's core idea (local transactions + compensating transactions), but there are two genuinely different ways to coordinate the sequence, and the choice has real consequences:

- **Choreography**: each service listens for events and decides its own next action independently — no central coordinator. Simpler to start, but the overall business process isn't visible in any single place; understanding "what happens when an order is placed" means tracing event listeners across every service involved.
- **Orchestration**: a central coordinator (an explicit state machine — AWS Step Functions is a common implementation) directs each step and handles compensating actions on failure. The business process is visible in one place, easier to reason about and modify, but the coordinator becomes a component every involved service now depends on.

Real guidance: choreography scales better for a small number of steps with loose coupling; orchestration becomes clearly better once a saga has more than a handful of steps or the failure/compensation logic gets complex — "which step do I compensate to, in what order" gets hard to reason about across scattered event listeners once the saga is nontrivial.

## CQRS with event sourcing — the natural pairing

CQRS is often paired with event sourcing (storing every state change as an immutable event, rather than storing only current state) because it solves CQRS's own hardest problem: how does the read side actually get updated after a write? With event sourcing, the write side publishes an event for every change, and the read side subscribes and builds its denormalized views by replaying/consuming those events — this also gives you a genuine audit log (every historical event is preserved) and the ability to rebuild a read view from scratch by replaying history, which is valuable when you need to add a new read view later that wasn't designed in from the start.

The real cost: event sourcing is a meaningfully bigger commitment than plain CQRS — schema evolution for events over time, and eventual consistency lag between write and read, both need deliberate design rather than being incidental details.

## Making Strangler Fig migrations actually safe

The routing layer alone isn't the whole pattern in practice — a few things separate a genuinely safe strangler migration from a risky one:

- **Shadow traffic before cutover** — route a copy of real traffic to the new service without actually using its response, and compare its output against the legacy system's real response. This surfaces behavioral differences before any real user is affected by them.
- **Feature-flag-controlled routing**, not a hard cutover — being able to route a percentage of traffic to the new path, or instantly revert to the legacy path, without a deployment, is what makes rollback fast if something's wrong.
- **Data synchronization strategy, decided explicitly** — if the legacy and new services need to read/write overlapping data during the migration window, you need a real plan (dual writes, change-data-capture replication) for that, not an assumption that it'll sort itself out.

## Multi-region, not just multi-AZ

Multi-AZ protects against a single data center failing; it does not protect against a regional-scale event (a cloud provider's entire region having an outage, or a real disaster affecting a whole geographic area). Multi-region architectures replicate across genuinely separate regions, and introduce a real, unavoidable tradeoff: cross-region replication has meaningfully higher latency than cross-AZ replication (tens to low-hundreds of milliseconds vs. single-digit), which usually rules out synchronous replication across regions for latency-sensitive writes — most multi-region setups use asynchronous replication and accept some potential data loss window in exchange for not blocking every write on a slow cross-region round trip.

## Cost implications that don't show up until you design for them

Every resiliency pattern here has a real cost tradeoff, and articulating it precisely is often exactly what separates a mid-level answer from a senior one in an interview: Multi-AZ Active-Active roughly doubles compute cost for the AZs involved (you're running full capacity in both, not one idle standby). Hub-and-Spoke adds per-hour and per-GB data processing charges for the Transit Gateway itself, on top of the resources it connects. CQRS with a separate read store means paying for and operating two data stores instead of one. None of these costs make the pattern wrong to use — they make "do we actually need this yet" a real question worth asking before defaulting to the most resilient possible design at the smallest scale.
