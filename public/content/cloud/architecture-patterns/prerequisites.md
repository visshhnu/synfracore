# Cloud Architecture Patterns — Prerequisites

Architecture patterns describe how services fit together — they assume you already know what the individual pieces do. Trying to learn patterns before the underlying services is like memorizing chess openings before knowing how the pieces move.

## What you need first

- **Core compute, storage, and networking basics on at least one cloud provider** — what a VPC/VNet is, the difference between a load balancer and an API gateway, object storage vs. block storage vs. a managed database. Patterns are combinations of these; you can't reason about a combination you don't recognize the parts of.
- **Basic distributed systems concepts** — what "eventual consistency" actually means (not just the phrase), why network calls can fail independently of the service being called, and why "it works on one machine" doesn't guarantee it works across many. Several patterns here (Saga, CQRS) exist specifically to manage problems that only appear once a system is distributed.
- **Comfort reading an architecture diagram** — boxes, arrows, and the convention that an arrow usually means "makes a network call to." If diagrams feel opaque, spend time reading a handful of real ones (AWS's own reference architectures are a good source) before this page's patterns will click.
- **Some hands-on experience deploying something real** — even a single EC2 instance or a Lambda function you've actually configured yourself. Patterns described purely in the abstract are much harder to internalize than patterns you can map onto something you've built, even at small scale.

## Helpful but not required

- **A specific cloud provider's certification-level knowledge** — useful, but patterns here are largely provider-agnostic in concept (Hub-and-Spoke, Strangler Fig, CQRS, and Saga aren't AWS-specific ideas, even where this page's examples use AWS service names).
- **Prior microservices experience** — several patterns (Saga, CQRS, Strangler Fig) are most relevant in a microservices context, but you don't need to have already built microservices to learn what problems these patterns solve; you need the distributed-systems basics above more than you need prior microservices scars.
