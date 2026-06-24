# AWS Lambda Cheatsheet

## Core Commands
```bash
# Deploy function
aws lambda create-function \
  --function-name my-function \
  --runtime python3.12 \
  --handler lambda_function.lambda_handler \
  --role arn:aws:iam::123456789:role/lambda-role \
  --zip-file fileb://function.zip

# Update code
aws lambda update-function-code \
  --function-name my-function \
  --zip-file fileb://function.zip

# Invoke
aws lambda invoke --function-name my-function \
  --payload '{"key":"value"}' response.json

# Configuration
aws lambda update-function-configuration \
  --function-name my-function \
  --memory-size 512 --timeout 30

# Environment variables
aws lambda update-function-configuration \
  --function-name my-function \
  --environment Variables={DB_HOST=mydb.example.com,ENV=prod}

# Versions and aliases
aws lambda publish-version --function-name my-function
aws lambda create-alias --function-name my-function \
  --name prod --function-version 5

# List and delete
aws lambda list-functions
aws lambda delete-function --function-name my-function
```

## Event Sources (Triggers)
```
API Gateway    → HTTP requests; synchronous invocation
S3             → object create/delete events; asynchronous
SQS            → poll queue; batch processing; async
SNS            → pub/sub notifications; async
DynamoDB Streams → record changes; async
EventBridge    → scheduled (cron) or event-driven; async
Kinesis        → real-time streaming data; async
Cognito        → auth triggers (pre/post login); sync
CloudFront     → Lambda@Edge; sync at CDN
ALB            → HTTP requests via load balancer; sync
```

## Handler and Context
```python
import json

def lambda_handler(event, context):
    # context attributes
    print(context.function_name)
    print(context.memory_limit_in_mb)
    print(context.get_remaining_time_in_millis())
    
    # event is the trigger payload
    body = event.get('body', '{}')
    
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json'},
        'body': json.dumps({'message': 'success'})
    }
```

## Key Limits and Defaults
| Setting | Default | Max |
|---------|---------|-----|
| Timeout | 3 sec | 15 min |
| Memory | 128 MB | 10,240 MB |
| Concurrency | 1,000 (account) | Increase by request |
| Package size | — | 50 MB (zip), 250 MB (unzipped) |
| /tmp storage | — | 10 GB |
| Env vars | — | 4 KB total |

## Key Patterns
```
Cold start mitigation: provisioned concurrency | keep-warm pings (not best)
VPC Lambda: assign subnets + SGs; needs NAT for internet; adds cold start time
Layers: shared libraries/dependencies (up to 5 layers, 250 MB unzipped total)
Destinations: on success or failure → SQS/SNS/EventBridge/Lambda
Dead letter queue (DLQ): SQS/SNS for failed async invocations
Power Tuning: AWS Lambda Power Tuning tool → find optimal memory/cost tradeoff
```
