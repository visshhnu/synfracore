# AWS Lambda Interview Questions

## Core Concepts

**Q: How does Lambda work? What is cold start?**

Lambda is serverless compute — you provide code, AWS runs it on demand. No servers to manage.

**Execution model:**
1. Event triggers Lambda (API Gateway, S3, SQS, CloudWatch Events, etc.)
2. AWS finds/creates execution environment (container)
3. Runs your handler function
4. Returns response or writes to output
5. Environment stays "warm" briefly (reuse for next invocation) or is destroyed

**Cold start**: First invocation (or after idle period) requires:
- Spin up execution environment (~100ms)
- Download deployment package
- Initialise runtime (Python/Node.js)
- Run initialisation code outside handler

Cold start latency: ~100ms-1s (Java worst, Python/Node.js better, SnapStart for Java).

**Mitigation:**
- Provisioned Concurrency: pre-warms environments (eliminates cold starts, extra cost)
- Keep deployment package small
- Move heavy initialisation outside handler (connection pooling, SDK clients)
- Use Python/Node.js for latency-sensitive functions

---

**Q: Lambda limits and concurrency.**

| Limit | Value |
|---|---|
| Max memory | 10,240 MB |
| Max timeout | 15 minutes |
| Deployment package | 50MB zipped, 250MB unzipped |
| Container image | Up to 10GB |
| Concurrent executions | 1,000 (soft limit, can increase) |
| Ephemeral storage (/tmp) | 512MB default, up to 10GB |

**Concurrency types:**
- **Reserved concurrency**: Caps maximum concurrent executions for a function (throttles beyond limit)
- **Provisioned concurrency**: Pre-initialised environments (warm, no cold start, costs money)

---

**Q: Lambda invocation types — synchronous vs asynchronous.**

**Synchronous** (request-response): Caller waits for result.
Triggers: API Gateway, ALB, Lambda (SDK call), Cognito

**Asynchronous**: Lambda queues event, returns immediately (202). Retries 2x on failure.
Triggers: S3, SNS, CloudWatch Events

**Event Source Mapping** (stream/queue): Lambda polls source.
Triggers: SQS, Kinesis, DynamoDB Streams, Kafka

**Error handling:**
- Sync: Error returned to caller
- Async: Retries, then DLQ (Dead Letter Queue)
- Event source mapping: Retries until expiry, BisectOnError

---

**Q: How do you connect Lambda to a VPC?**

```python
# Lambda VPC config - add in function configuration
VpcConfig:
  SubnetIds: [subnet-xxx, subnet-yyy]  # Private subnets
  SecurityGroupIds: [sg-xxx]

# Lambda needs AWSLambdaVPCAccessExecutionRole
# For internet access from VPC: needs NAT Gateway
# For AWS services: use VPC Endpoints (avoid NAT)
```

**Why VPC?**: Access RDS, ElastiCache, or other private resources.
**VPC caveat**: Adds ~100ms cold start. Use VPC Endpoints for AWS services to avoid NAT Gateway costs.

---

**Q: Lambda layers and container images — when to use each?**

**Layers**: Shared code/dependencies packaged as a ZIP.
- Max 5 layers per function
- Separate deployment from updates (update layer once, all functions benefit)
- Good for: shared libraries (pandas, requests), custom runtimes, security tools

**Container Images** (up to 10GB):
- Full control of environment
- Larger ML models, complex dependencies
- Familiar Docker workflow
- Better for ML inference, large dependency trees

## Revision Notes
```
LAMBDA: serverless, event-driven, max 15min timeout, 10GB memory
COLD START: ~100ms-1s. Mitigate: Provisioned Concurrency, small packages, warm code outside handler.

CONCURRENCY:
Reserved: caps maximum (throttles beyond)
Provisioned: pre-warmed (no cold start, costs money)
Default limit: 1,000 concurrent (can raise)

INVOCATION TYPES:
Sync: API GW, ALB → wait for result
Async: S3, SNS → queued, retries 2x
Event Source Mapping: SQS, Kinesis → Lambda polls

LAYERS: shared code (max 5). Container: large deps/ML models.
VPC: adds cold start time. Use VPC Endpoints for AWS services.
```
