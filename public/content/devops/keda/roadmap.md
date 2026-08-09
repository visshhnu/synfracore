# KEDA Learning Roadmap

**Goal**: From zero event-driven autoscaling experience to production KEDA operations

## Learning Phases

### Phase 1: KEDA Fundamentals (1 day)

- Why HPA alone can't scale on queue depth/lag — the core problem KEDA solves
- `ScaledObject` — the CRD that replaces direct HPA management
- Scale-to-zero and activation thresholds
- CNCF graduated project status and ecosystem context

### Phase 2: Triggers and Scaling Patterns (2-3 days)

- Kafka lag, RabbitMQ queue depth, cron, Prometheus query triggers
- Combining multiple triggers (scale on whichever is higher)
- `ScaledJob` vs. `ScaledObject` — when each fits

### Phase 3: Intermediate Configuration (2-3 days)

- `TriggerAuthentication` — secret-based and cloud-identity-based credential management
- HPA `behavior` tuning — asymmetric scale-up/scale-down rates
- `idleReplicaCount` vs. `minReplicaCount` — the actual scale-to-zero mechanism
- KEDA HTTP Add-on for synchronous HTTP services

### Phase 4: Advanced Production Operations (3-4 days)

- KEDA's own metrics-server internals and the External Metrics API chain
- Building a custom External Scaler via gRPC
- Multi-cluster and federation patterns
- KEDA Operator HA and CRD versioning/migration

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing `READY: False` ScaledObjects and scaling rate limits
- Cold-start latency and cron-timezone bugs
- Practice explaining the HPA-vs-KEDA distinction concretely — Overview's own Kafka-lag example is the canonical answer to "why would you need KEDA at all"

## Job Roles This Enables

- Platform Engineer
- Kubernetes/Cloud-Native Infrastructure Engineer
- DevOps Engineer (autoscaling/cost-optimization focus)

## Target Certifications

`(needs verification — recheck against current source for CNCF's current KEDA-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's `TriggerAuthentication` and HPA-tuning material assumes Phase 2's trigger types are already familiar
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real cluster with a test queue (a local RabbitMQ or Kafka instance works) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — demonstrating a real scale-to-zero-to-N cycle against actual queue depth is far more convincing than describing the configuration
4. Use the Troubleshooting section's real scenarios as active study material — cron-timezone bugs and `READY: False` states are genuinely common real-world gotchas, not contrived examples
5. Phase 4's custom External Scaler material is worth understanding conceptually even if you never build one — it's the answer to "what if KEDA doesn't have a built-in scaler for my system," a real interview question

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 1-2 weeks (part-time)
The idleReplicaCount vs. minReplicaCount distinction is the single
most commonly confused KEDA concept — budget deliberate practice time
there specifically, not just reading comprehension
```
