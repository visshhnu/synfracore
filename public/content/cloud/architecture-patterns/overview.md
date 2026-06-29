# Cloud Architecture Patterns — Overview

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
