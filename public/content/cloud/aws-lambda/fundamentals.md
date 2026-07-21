# AWS Lambda — Fundamentals

## The Hook

You don't provision a server, size an instance, or run `systemctl start` anything for Lambda. You write a function, tell AWS what should invoke it, and upload it. That's the entire deployment surface — no OS to patch, no capacity to plan for.

**Analogy** — A traditional server is like renting an apartment: you pay rent every month whether you're home or not, and you're responsible for its upkeep. Lambda is like a hotel room you're billed for only while you're actually checked in — down to the minute. Walk out (finish executing), and the meter stops.

## What Lambda Does

```
You provide: Code (Python, Node.js, Java, Go, .NET, Ruby)
AWS provides: Servers, scaling, OS, runtime, HA
You pay: Per invocation + per GB-second of execution
         First 1M requests/month FREE forever

Cold start: First invocation spins up container (~100ms-1s)
Warm start: Subsequent calls reuse container (~1ms)
```

## Write Your First Lambda

```python
# handler.py
import json
import boto3

# Code outside handler = runs once per container (reuse connections!)
s3 = boto3.client('s3')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('users')

def handler(event, context):
    """
    event: The triggering event (API Gateway request, S3 event, etc.)
    context: Runtime info (function name, remaining time, request ID)
    """
    print(f"Event: {json.dumps(event)}")
    print(f"Remaining time: {context.get_remaining_time_in_millis()}ms")
    
    # Process API Gateway request
    user_id = event.get('pathParameters', {}).get('userId')
    if not user_id:
        return {
            'statusCode': 400,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps({'error': 'userId is required'})
        }
    
    response = table.get_item(Key={'userId': user_id})
    user = response.get('Item')
    
    if not user:
        return {'statusCode': 404, 'body': json.dumps({'error': 'User not found'})}
    
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(user, default=str)
    }
```

## Deploy with Terraform

```hcl
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "handler.py"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "api" {
  filename         = "lambda.zip"
  function_name    = "user-api"
  role             = aws_iam_role.lambda.arn
  handler          = "handler.handler"
  runtime          = "python3.12"
  timeout          = 30
  memory_size      = 512  # More memory = more CPU proportionally

  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.users.name
      LOG_LEVEL  = "INFO"
    }
  }

  # VPC config (only if Lambda needs to access private resources)
  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [aws_security_group.lambda.id]
  }
}

# Lambda needs IAM role
resource "aws_iam_role" "lambda" {
  name = "lambda-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
```

## Event Sources

```yaml
# API Gateway trigger
Events:
  ApiGateway:
    Type: Api
    Properties:
      Path: /users/{userId}
      Method: GET

# S3 trigger (process uploads)
  S3Upload:
    Type: S3
    Properties:
      Bucket: !Ref UploadsBucket
      Events: s3:ObjectCreated:*
      Filter:
        S3Key:
          Rules:
            - Name: suffix
              Value: .csv

# SQS trigger (process queue messages)
  SQSQueue:
    Type: SQS
    Properties:
      Queue: !GetAtt ProcessingQueue.Arn
      BatchSize: 10
      FunctionResponseTypes:
        - ReportBatchItemFailures  # retry failed messages only

# EventBridge (scheduled)
  Schedule:
    Type: Schedule
    Properties:
      Schedule: rate(5 minutes)
```

## Lambda Layers (Share Code)

```bash
# Create a layer with shared dependencies
pip install requests pandas -t python/lib/python3.12/site-packages/
zip -r layer.zip python/

aws lambda publish-layer-version \
  --layer-name common-deps \
  --zip-file fileb://layer.zip \
  --compatible-runtimes python3.12

# Reference layer in function
aws lambda update-function-configuration \
  --function-name my-function \
  --layers arn:aws:lambda:us-east-1:123456789:layer:common-deps:3
```

## Cold Start Optimization

```python
# 1. Keep handler lean — heavy imports at module level
import boto3  # Outside handler = cached between invocations
client = boto3.client('s3')

# 2. Provisioned Concurrency for latency-critical functions
# Keeps N containers warm at all times
aws lambda put-provisioned-concurrency-config \
  --function-name my-api \
  --qualifier prod \
  --provisioned-concurrent-executions 5

# 3. Use smaller runtimes — Python/Node faster cold start than Java
# 4. Reduce deployment package size — only include what you need
# 5. Increase memory — 1769MB = 1 full vCPU (proportional)
```

## Try It (2 Minutes)

If you have AWS CLI access to a sandbox account, package and deploy the handler above yourself:
```bash
zip function.zip handler.py
aws lambda create-function \
  --function-name fundamentals-test \
  --runtime python3.12 \
  --handler handler.handler \
  --role <your-lambda-execution-role-arn> \
  --zip-file fileb://function.zip

aws lambda invoke --function-name fundamentals-test \
  --payload '{"pathParameters":{"userId":"123"}}' \
  --cli-binary-format raw-in-base64-out out.json
cat out.json   # expect a 404 — there's no "123" item in a table that doesn't exist yet
```
No AWS access handy? Reason through it instead: the handler calls `table.get_item()` before checking whether the table exists — what specific AWS error (not a 404 from your own code) would you expect back if `TABLE_NAME` pointed at a DynamoDB table that was never created?
