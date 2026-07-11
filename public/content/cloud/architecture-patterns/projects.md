# Cloud Architecture Patterns — Portfolio Projects

## Project 1: Serverless event-driven pipeline (Beginner)

Build the Overview's S3→Lambda→DynamoDB→SNS pattern for real — a file upload triggers processing, results are stored, and a notification fires on completion.

**What this demonstrates:** you can wire together an actual event-driven chain across multiple managed services, not just describe the pattern abstractly. **What to show:** the infrastructure definition (Terraform/CDK/CloudFormation, not just console clicks you can't reproduce), and a walkthrough of an event actually flowing through the whole chain.

## Project 2: Strangler Fig migration, simulated (Intermediate)

Build two small services (a "legacy" one and a "new" one) behind an API Gateway, route specific paths to the new service, and demonstrate migrating a second path over without downtime — ideally with feature-flag-controlled routing (see Intermediate) rather than a hard cutover.

**What this demonstrates:** understanding of incremental migration as a real, implementable pattern, including the routing-layer mechanics that make it safe. **What to show:** the routing configuration, and a before/during/after view of which paths route where at each stage.

## Project 3: CQRS with a real read/write split (Intermediate)

Build a small service with a genuinely separate write path (a relational database) and read path (a denormalized view in a different store — even a simple cache or search index), with an explicit mechanism keeping the read side updated (an event, a change-data-capture stream, or a simple polling sync as a minimal version).

**What this demonstrates:** understanding of CQRS's actual mechanics and its consistency-lag tradeoff, not just the acronym. **What to show:** a demonstration of the lag itself — write something, show the read view hasn't updated yet, then show it catching up — this is the part reviewers actually want to see understood, not just implemented.

## Project 4: Saga with deliberate failure and compensation (Advanced)

Build a multi-step process across at least 2-3 services/functions, using either choreography or orchestration (see Intermediate), and deliberately trigger a failure partway through — demonstrate the compensating transactions actually undoing the completed steps correctly.

**What this demonstrates:** genuine understanding of distributed transaction management, which is one of the more differentiated skills on this list — most portfolios show a saga's happy path only. **What to show:** a walkthrough of the failure scenario specifically, not just the successful path — the compensation logic is the actual point.

## Project 5: Multi-AZ failover, demonstrated live (Advanced)

Deploy a small application across two AZs with real Multi-AZ database failover configured, then deliberately simulate an AZ failure (stopping the primary instance, or using your cloud provider's failover-testing tooling) and time/document the actual recovery.

**What this demonstrates:** you've verified resilience claims empirically rather than just configuring something and assuming it works — an untested failover path is a common, real production risk, and demonstrating you've actually tested one is a genuine signal. **What to show:** a recording or detailed timeline of the failover event, including how long it actually took and what (if anything) was lost or delayed during the transition.
