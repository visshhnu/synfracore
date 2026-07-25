# AWS Lambda — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — Lambda's basic "write a function, add a trigger" workflow is quick to learn; real proficiency is in cold-start/concurrency tradeoffs, event-source-specific patterns, and knowing when Lambda is the wrong tool.

## Phase 1: Foundation (Week 1-2)

- Core execution model: handler function signature, event/context objects, and the request-response lifecycle for a synchronous invocation
- Event sources and how each shapes the event payload differently: API Gateway, S3, SQS, DynamoDB Streams, EventBridge
- Execution limits that actually matter day-to-day: max 15-minute timeout, 128MB-10,240MB memory (with CPU scaling proportionally), and deployment package size limits
- IAM execution roles — the permissions a function actually runs with, distinct from the permissions used to deploy it

**Checkpoint:** can you explain why a Lambda function reading from S3 needs an IAM execution role with `s3:GetObject` permission, even though the S3 bucket itself might also have a permissive bucket policy?

## Phase 2: Cold Starts, Concurrency, and Packaging (Week 2-4)

- Cold start vs. warm invocation — what actually happens during a cold start (container provisioning, runtime init, handler init) and which of those a developer can and can't influence
- Concurrency: default per-region concurrent execution limits, reserved concurrency (guaranteeing capacity for one function) vs. provisioned concurrency (pre-warming to eliminate cold starts for latency-sensitive functions)
- Deployment packaging: zip deployments vs. container images, and Lambda Layers for sharing dependencies across functions without duplicating them in every package
- Environment variables and Secrets Manager/Parameter Store integration for configuration that shouldn't be hardcoded

**Checkpoint:** given a latency-sensitive, low-traffic API endpoint where cold starts are visibly hurting user experience, can you explain the tradeoff of adding provisioned concurrency versus just accepting the cold start?

## Phase 3: Event-Driven Patterns and Error Handling (Week 4-6)

- Synchronous invocation (API Gateway) vs. asynchronous invocation (S3, SNS) vs. poll-based (SQS, DynamoDB Streams) — each has genuinely different retry and error-handling behavior
- Dead-letter queues (DLQs) and on-failure destinations for capturing events that a function fails to process, rather than silently losing them
- Idempotency — why a function triggered by an at-least-once delivery source (SQS, S3 event notifications under some conditions) needs to handle being invoked more than once for the same event
- Step Functions for orchestrating multi-step workflows across several Lambda functions, instead of one function trying to do everything

**Checkpoint:** can you explain why a Lambda function processing SQS messages needs to be written idempotently, even though SQS itself has a visibility timeout mechanism?

## Phase 4: Observability and Interview Readiness (Week 6-7)

- CloudWatch Logs/Metrics for Lambda: duration, throttles, errors, and concurrent executions as the metrics that actually diagnose real production issues
- X-Ray tracing for understanding latency across a Lambda function calling other AWS services or downstream APIs
- Cost model: pay-per-invocation plus GB-seconds, and why a function's memory setting affects both performance (CPU scales with memory) and cost simultaneously
- Review this course's Interview Q&A material, particularly cold-start mitigation and event-source-specific error-handling questions

## Common Pitfalls Specific to Lambda

- **Writing a non-idempotent handler for an at-least-once event source** — SQS and some S3 event configurations can redeliver the same event, and a handler that isn't safe to run twice on the same input will produce real bugs
- **Assuming more memory always costs more** — since CPU scales with memory, a function that's CPU-bound can sometimes run faster (and cheaper overall) at a higher memory setting because it finishes in less time
- **Bundling unnecessary dependencies into the deployment package** — a bloated package increases cold start time; Lambda Layers and trimming unused dependencies both help
- **Using Lambda for a genuinely long-running or steady-throughput workload** — the 15-minute timeout and per-invocation pricing model make Lambda a poor fit for workloads better served by a long-running container or EC2 instance

## Getting Your First Lambda-Heavy Role

1. **Portfolio:** a project demonstrating a real event-driven pipeline (e.g. S3 upload → Lambda → DynamoDB, or SQS → Lambda with a DLQ configured and deliberately tested)
2. **Resume:** be specific — "reduced p99 API latency from 2.1s to 180ms by adding provisioned concurrency to a cold-start-sensitive endpoint" is far stronger than "experience with AWS Lambda"
3. **Know when NOT to use Lambda:** interviewers commonly test whether a candidate defaults to serverless everywhere or can reason about when a container/EC2-based approach fits better
4. **Certifications, if pursuing one:** Lambda is central to AWS Developer Associate and Solutions Architect Associate — see this course's own Certification Guide for current format and pricing
