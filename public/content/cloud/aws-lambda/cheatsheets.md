# AWS Lambda Quick Reference

## CLI Commands
```bash
# Deploy
zip function.zip index.js
aws lambda create-function --function-name my-fn \
  --runtime nodejs20.x --handler index.handler \
  --role arn:aws:iam::123:role/LambdaRole \
  --zip-file fileb://function.zip

aws lambda update-function-code --function-name my-fn --zip-file fileb://function.zip
aws lambda publish-version --function-name my-fn
aws lambda create-alias --function-name my-fn --name prod --function-version 5

# Invoke
aws lambda invoke --function-name my-fn --payload '{}' response.json
aws lambda invoke --function-name my-fn --invocation-type Event --payload '{}'  output.json  # Async

# Config
aws lambda update-function-configuration --function-name my-fn --memory-size 512 --timeout 30
aws lambda put-function-concurrency --function-name my-fn --reserved-concurrent-executions 100
aws lambda put-provisioned-concurrency-config --function-name my-fn --qualifier prod --provisioned-concurrent-executions 10

# Logs
aws logs tail /aws/lambda/my-fn --follow
aws logs filter-log-events --log-group-name /aws/lambda/my-fn --filter-pattern 'ERROR'
```

## Key Limits & Concepts
```
Limits:
  Memory:    128MB – 10,240MB
  Timeout:   max 15 minutes
  Package:   50MB zip, 250MB unzipped, 10GB container image
  /tmp:      512MB default, up to 10GB
  Concurrent: 1,000 default (increase via support)

Invocation types:
  RequestResponse (sync):  API GW, SDK calls — caller waits
  Event (async):           S3, SNS — queued, retries 2x on failure
  DryRun:                  check permissions only

Pricing: 1M free requests/month + 400,000 GB-seconds compute
  After free tier: $0.20 per 1M requests + $0.0000166667/GB-sec

Cold start mitigation:
  Provisioned Concurrency: pre-warm environments (cost: $$)
  Keep package small | minimize init code outside handler
  Use arm64 (Graviton): 20% cheaper, often faster
```
