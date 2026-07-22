# Cloud Architecture Patterns — Overview

## Why this exists (the hook)

Two teams can use the exact same cloud services — EC2, RDS, Lambda — and end up with wildly different reliability, cost, and scalability outcomes. The difference usually isn't which services they picked; it's how those services are arranged relative to each other. Architecture patterns are the reusable arrangements that solve specific, recurring problems (a zone failing, a legacy system that can't be rewritten overnight, reads and writes that scale differently) — knowing the pattern names and when each one actually applies is what separates "I've used AWS" from "I can design a system that survives real failure conditions."

## Analogy

Think of individual cloud services (EC2, RDS, S3, Lambda) as building materials — bricks, beams, wiring. Architecture patterns are the blueprints that tell you how to arrange those materials for a specific structural goal: a load-bearing wall needs a different arrangement than a suspension bridge, even though both might use steel and concrete. Knowing what a brick is doesn't tell you how to build an earthquake-resistant building — that's the pattern layer, and it's learned separately from the materials themselves.

## How it fits together (diagram)

```
                    A recurring problem
             (zone failure, N-to-N networking,
          legacy rewrite risk, read/write asymmetry,
              cross-service transactions,
                  unpredictable load)
                          │
                          ▼
              Match to the pattern designed
                for THAT problem class
                          │
          ┌───────┬───────┼───────┬───────┬────────┐
          ▼       ▼       ▼       ▼       ▼        ▼
      Multi-AZ  Hub-&-  Strangler CQRS   Saga   Serverless
      Active-   Spoke   Fig                     Event-Driven
      Active
          │       │       │       │       │        │
          └───────┴───────┴───────┴───────┴────────┘
                          │
                          ▼
            Each pattern has a real cost/complexity
             tradeoff — apply only when the specific
                problem it solves is actually present
```

## What are Architecture Patterns?

Proven design approaches for building reliable, scalable, and cost-efficient systems on cloud. Unlike tool guides, patterns describe how multiple services work together.

## AWS Well-Architected Framework (6 Pillars)

| Pillar | Key Question |
|--------|-------------|
| Operational Excellence | Can you run and monitor? Do you have runbooks? |
| Security | Who can do what? Is data encrypted? |
| Reliability | Can you recover from failure? Do you test failure? |
| Performance Efficiency | Right resource for the job? |
| Cost Optimization | Paying for what you use? |
| Sustainability | Minimum environmental impact? |

## Core Patterns

### Multi-AZ Active-Active
Both availability zones serve traffic simultaneously. RDS automatic failover in ~60 seconds. Zero data loss with synchronous replication.

### Hub-and-Spoke Networking
Transit Gateway connects Dev, Staging, Production VPCs to shared services (monitoring, DNS, logging) and on-premises. No VPC peering mesh complexity.

### Strangler Fig (Migration Pattern)
API Gateway routes specific paths to new microservices while the legacy monolith handles the rest. Migrate one domain at a time — no big-bang rewrite.

### CQRS (Command Query Responsibility Segregation)
- Write path: optimized for consistency (event store, transactional DB)
- Read path: optimized for performance (Elasticsearch, Redis, denormalized views)
- Both are separate services with separate data stores

### Saga Pattern (Distributed Transactions)
Replace 2-phase commit with compensating transactions. Each microservice publishes events. On failure, compensating events undo completed steps.

### Serverless Event-Driven
S3 upload triggers Lambda which processes, stores in DynamoDB, and sends SNS notification. No servers to manage, scales from zero to millions automatically.

## Choosing the Right Pattern

| Scenario | Pattern |
|---------|---------|
| 99.99% uptime required | Multi-AZ Active-Active |
| Microservices with transactions | Saga + CQRS |
| Legacy to cloud migration | Strangler Fig |
| High read, low write traffic | CQRS + Read Replica + Redis |
| Event-driven, unpredictable load | Serverless + EventBridge + SQS |

## Try it yourself (2 minutes)

Pick one system you've actually used or built (even a small side project). Ask: which of the six problem classes above does it genuinely have? A blog with rare writes and heavy reads has read/write asymmetry (CQRS territory) even at tiny scale. A single-EC2-instance app has no Multi-AZ story at all — is that actually a problem for what it does, or is the added complexity not yet justified? The exercise isn't "add all six patterns" — it's confirming you can tell which problems are actually present before reaching for a pattern that solves a problem you don't have.
