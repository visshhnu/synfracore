# AWS Lambda & Serverless Certification Guide

## Primary Certification

**AWS Certified Developer Associate (DVA-C02)**

*Format*: 65 questions | 130 minutes | 720/1000 | $150 USD *(needs verification — exam format/pricing changes over time, check the current AWS Certification page before relying on these numbers)*

## Related Certifications

- AWS Solutions Architect Associate
- AWS DevOps Engineer Professional

## Key Exam Topics

- Lambda execution model: invocation types (sync/async/event source mapping)
- Cold starts: JVM/Python worse than Node.js; provisioned concurrency prevents them
- Concurrency: reserved concurrency (limits) + provisioned concurrency (pre-warm)
- Lambda layers: shared dependencies, runtimes, custom extensions
- Lambda@Edge and CloudFront Functions: run code at CDN edge
- Event sources: API Gateway, ALB, S3, DynamoDB Streams, SQS, SNS, Kinesis
- Lambda VPC: private subnet + NAT Gateway for internet access; historically added cold-start latency via ENI creation, largely mitigated since AWS's 2019 Hyperplane ENI networking change — know both the mechanism and that it's no longer the dominant cold-start factor, since exam material predating that change may still frame it as a downside

## Must-Know CLI Commands

```bash
aws lambda create-function --function-name my-fn --runtime python3.12 --handler lambda_function.lambda_handler --role arn:... --zip-file fileb://function.zip
aws lambda invoke --function-name my-fn --payload '{"key":"value"}' response.json
aws lambda update-function-configuration --function-name my-fn --memory-size 1024
aws lambda put-function-concurrency --function-name my-fn --reserved-concurrent-executions 100
aws logs tail /aws/lambda/my-fn --follow
```

## Exam Tips

- Execution environment reuse: initialize outside handler for connection pooling
- /tmp is 512MB-10GB — use for temporary files during execution
- Lambda Powertools (Python/Java/TypeScript): structured logging, tracing, metrics
- Avoid long-running tasks: max 15 min — use Step Functions for orchestration

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AWS Certified Developer Associate (DVA-C02)

TOP TOPICS:
  Lambda execution model: invocation types (sync/async/event source mapping)
  Cold starts: JVM/Python worse than Node.js; provisioned concurrency prevents the
  Concurrency: reserved concurrency (limits) + provisioned concurrency (pre-warm)
  Lambda layers: shared dependencies, runtimes, custom extensions
```
