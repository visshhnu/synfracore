# Cloud Architecture Patterns — Getting Set Up to Practice

There's nothing to "install" for architecture patterns themselves — they're design approaches, not software. What you need is a sandbox where you can actually build small versions of these patterns rather than only reading about them.

## Setting up a practice environment

```bash
# AWS CLI, if you don't already have it — most pattern examples
# on this site's cloud content assume AWS, though the concepts transfer
aws configure   # needs an access key + secret from IAM, free-tier account is enough

# Terraform, if you want to practice patterns as infrastructure-as-code
# rather than clicking through the console each time
terraform init
```

**Use a dedicated practice account, not a production one** — several patterns here (Multi-AZ failover testing, chaos-style failure injection) are specifically about deliberately breaking things to observe behavior. Doing that against real infrastructure with real traffic is a very different risk profile than doing it in an isolated sandbox account.

## A minimal environment for practicing each pattern type

- **Multi-AZ / Hub-and-Spoke**: a free-tier VPC setup across 2 AZs is enough to practice the networking concepts — you don't need real production traffic to understand how Transit Gateway routing or Multi-AZ failover behaves.
- **Strangler Fig**: any two small services (even two toy Lambda functions) and an API Gateway in front of them, routing by path — enough to practice the routing-based migration pattern without a real legacy system to migrate.
- **CQRS / Saga**: a small event-driven setup (SQS/SNS or EventBridge, a couple of Lambda functions) is enough to practice the message-passing and compensating-transaction concepts at toy scale.
- **Serverless Event-Driven**: S3 + Lambda + DynamoDB, all within AWS's free tier, is the standard practice setup for this pattern and matches the Overview's example almost directly.

## Cost management while practicing

Free-tier AWS covers most of the above at small scale, but set a billing alert regardless — a Multi-AZ RDS instance left running, or a Transit Gateway with per-hour attachment costs, can accumulate charges faster than expect-nothing intuition suggests if you forget to tear it down after a practice session.
