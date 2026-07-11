# Capacity Planning — Advanced

## Capacity planning for stateful services: why it's fundamentally harder

Everything covered on the Fundamentals/Intermediate tabs largely assumes stateless, horizontally-scalable services — add more replicas, load-balance across them. Databases and other stateful systems break that assumption in a way that changes the entire planning approach: adding a read replica genuinely helps read capacity, but write capacity in most relational databases doesn't scale by adding nodes the same way — it scales by a larger primary instance (vertical scaling, with a real ceiling) or by a fundamentally different architecture (sharding, which is a significant engineering project, not a capacity-planning knob to turn). Capacity planning for a stateful tier has to separately forecast read load (addressable via replicas) and write load (addressable only via vertical scaling or a sharding project with real lead time) — conflating the two into one "database capacity" number misses that they have entirely different scaling paths and entirely different lead times to actually execute.

## Cost-aware headroom: finding the minimum that reliably works, not the maximum that feels safe

Junior capacity planning tends toward "when in doubt, over-provision" — genuinely senior capacity planning is specifically about finding the *minimum* headroom that reliably meets demand, because over-provisioning is a real, ongoing cost that compounds every month, not a one-time safety purchase:

```
# A rough framework for right-sizing headroom, not just picking a fixed 30%
1. What's the autoscaler's actual measured reaction time under real load?
   (not the theoretical config value — measure it against a real scale event)
2. What's the fastest realistic traffic ramp rate for this specific service?
   (a launch/marketing spike ramps much faster than organic growth)
3. Headroom needs to cover: reaction time × realistic ramp rate,
   plus a margin for forecast error specifically — not a flat number
   copied from a different service with a different traffic profile
```
This is where capacity planning and FinOps/cost optimization directly intersect, and it's a genuinely different skill from just "add more headroom to be safe" — a service with fast, reliable autoscaling and smooth traffic needs meaningfully less headroom than a spiky, slow-to-scale one, and pricing both at the same flat margin either wastes money on the first or under-protects the second.

## Multi-region capacity: planning for failover load, not just steady-state

A multi-region architecture designed for failover changes the capacity math in a way that's easy to under-plan: if region B needs to absorb region A's full traffic during a regional failover, region B's steady-state capacity has to already include headroom for that failover scenario — provisioning each region only for its own normal steady-state traffic means a real regional failure doubles load onto a region sized for half that. This is a genuine cost tradeoff worth being explicit about with stakeholders (carrying real, ongoing failover headroom that sits mostly idle in normal operation), not an implementation detail to leave implicit — a multi-region design that "should" support failover but has never actually verified the target region can absorb the full load is a design decision that hasn't actually been capacity-tested, only assumed.

## Using chaos engineering to validate capacity assumptions, not just failure handling

Capacity planning produces forecasts and thresholds — but those numbers are themselves assumptions until tested under real conditions, and this is one of the more underused intersections between chaos engineering and capacity planning: deliberately simulating a capacity-relevant failure (killing a fraction of a service's replicas, forcing a failover to a secondary region) tests whether the *remaining* capacity actually absorbs the load as forecast, not just whether the system fails gracefully in the abstract. A capacity plan that says "we have 40% headroom" is a hypothesis; a chaos experiment that actually removes 40% of capacity and measures the real impact is the closest thing to genuinely verifying it before a real incident forces the test to happen unplanned.

## Capacity as an ongoing loop, not a quarterly exercise

The single biggest structural mistake in mature capacity planning isn't a wrong forecast — it's treating capacity planning as a periodic (quarterly, pre-launch) exercise rather than a continuous one. Traffic patterns, service dependencies, and cost structures all drift continuously; a capacity model built once and not revisited routinely becomes stale well before the next scheduled review catches it. The practical fix is making key capacity signals (headroom-versus-actual-peak, cost-per-unit-of-headroom, autoscaler reaction time) part of regular, automated reporting rather than something manually recalculated only when someone remembers to, or — more commonly — only after a capacity-related incident forces the review.
