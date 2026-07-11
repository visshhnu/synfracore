# Cloud Architecture Patterns — Quick Reference

## Pattern → problem it solves (memorize this mapping, not just names)

| Pattern | Solves |
|---|---|
| Multi-AZ Active-Active | A single AZ failing shouldn't take the service down |
| Hub-and-Spoke | N VPCs needing to talk becomes an unmanageable mesh as N grows |
| Strangler Fig | Can't safely rewrite a large legacy system in one release |
| CQRS | Read and write workloads need different scaling/consistency shapes |
| Saga | No single transaction can span multiple microservices' databases |
| Serverless Event-Driven | Fixed capacity wastes money or under-provisions for spiky load |

## When to reach for each pattern (quick decision guide)

| If you need... | Consider |
|---|---|
| 99.99%+ uptime, single region | Multi-AZ Active-Active |
| Many VPCs sharing services/on-prem connectivity | Hub-and-Spoke |
| To migrate a legacy system without a big-bang rewrite | Strangler Fig |
| High read volume, different shape than write model | CQRS |
| Multi-step process across independent microservices | Saga |
| Unpredictable/spiky load, don't want idle fixed capacity | Serverless Event-Driven |
| Regional-scale disaster tolerance | Multi-region (on top of Multi-AZ, not instead of it) |

## Saga: choreography vs. orchestration, quick comparison

| | Choreography | Orchestration |
|---|---|---|
| Coordinator | None — services react to events | Central coordinator (e.g. Step Functions) |
| Process visibility | Scattered across services | Visible in one place |
| Best for | Few steps, loose coupling | Many steps, complex compensation logic |
| New dependency introduced | None | Every step depends on the coordinator |

## Resilience patterns for partial failure

| Pattern | Purpose |
|---|---|
| Circuit breaker | Stop calling a repeatedly-failing dependency, fail fast |
| Bulkhead | Isolate resource pools per dependency |
| Graceful degradation | Pre-decided fallback behavior per feature, not improvised during an incident |

## Cost tradeoff quick reference

| Pattern | Real added cost |
|---|---|
| Multi-AZ Active-Active | ~2x compute (both AZs at full capacity, not idle standby) |
| Hub-and-Spoke | Per-hour + per-GB Transit Gateway charges on top of connected resources |
| CQRS | Operating two data stores instead of one |
| Multi-region active-active | Cross-region data transfer + full duplicate infrastructure |

## AWS Well-Architected Framework — 6 pillars, one-line memory hook

| Pillar | One-line question |
|---|---|
| Operational Excellence | Can you run and monitor this, with runbooks? |
| Security | Who can do what, is data encrypted? |
| Reliability | Can you recover from failure — have you tested that? |
| Performance Efficiency | Right resource for the job? |
| Cost Optimization | Paying only for what you use? |
| Sustainability | Minimum environmental impact for the workload? |
