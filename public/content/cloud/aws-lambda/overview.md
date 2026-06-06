# AWS Lambda — Serverless Computing

Lambda lets you run code without managing servers. You upload code, define triggers, and AWS handles everything else — provisioning, scaling, patching, and high availability.

## How Lambda Works

```
Event Source          Lambda Function        Result
─────────────         ───────────────        ──────
API Gateway   ──→     Your code runs         Response
S3 upload     ──→     in a container         Side effects
SQS message   ──→     managed by AWS         (write to DB,
DynamoDB      ──→                            send email, etc.)
EventBridge   ──→
```

**Key facts:**
- Max execution time: **15 minutes** (900 seconds)
- Memory: **128MB to 10,240MB** (CPU scales proportionally)
- Concurrent executions: **1,000 per region** (default, can increase)
- Cold start: First invocation starts a container (~100ms–1s latency)
- Warm: Subsequent invocations reuse container (~1ms overhead)
- Free tier: **1 million requests + 400,000 GB-seconds/month**

## Writing Lambda Functions

```python
# Python Lambda handler
import json
import boto3
import os
from datetime import datetime

# Initialize clients OUTSIDE handler (reused across invocations)
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def handler(event, context):
    """
    event   — The trigger data (API GW request, S3 event, etc.)
    context — Runtime info (function name, memory limit, time remaining)
    """

    print(f"Event: {json.dumps(event)}")
    print(f"Remaining time: {context.get_remaining_time_in_millis()}ms")

    try:
        # API Gateway event
        body = json.loads(event.get('body', '{}'))
        user_id = event['pathParameters']['userId']

        # Process
        result = table.get_item(Key={'userId': user_id})
        user = result.get('Item')

        if not user:
            return {
                'statusCode': 404,
                'headers': {'Content-Type': 'application/json'},
                'body': json.dumps({'error': 'User not found'})
            }

        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps(user)
        }

    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'Internal server error'})
        }
```

```python
# S3 trigger — process uploaded file
import boto3
import json
from urllib.parse import unquote_plus

s3 = boto3.client('s3')
rekognition = boto3.client('rekognition')

def handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = unquote_plus(record['s3']['object']['key'])

        print(f"Processing: s3://{bucket}/{key}")

        # Analyze image with Rekognition
        response = rekognition.detect_labels(
            Image={'S3Object': {'Bucket': bucket, 'Name': key}},
            MaxLabels=10,
            MinConfidence=70
        )

        labels = [label['Name'] for label in response['Labels']]
        print(f"Labels detected: {labels}")

        # Store result in DynamoDB
        # ... process further
```

```python
# SQS trigger — process messages in batches
def handler(event, context):
    failed_items = []

    for record in event['Records']:
        try:
            message = json.loads(record['body'])
            process_order(message)

        except Exception as e:
            print(f"Failed to process: {record['messageId']} - {e}")
            # Report as failed so SQS retries
            failed_items.append({'itemIdentifier': record['messageId']})

    # Return failed items for SQS retry (partial batch failure)
    return {'batchItemFailures': failed_items}
```

## Deployment with SAM (Serverless Application Model)

```yaml
# template.yaml
AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31

Globals:
  Function:
    Runtime: python3.12
    Timeout: 30
    MemorySize: 256
    Environment:
      Variables:
        TABLE_NAME: !Ref UsersTable
        LOG_LEVEL: INFO

Resources:
  # API endpoint
  GetUserFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: src/handlers/get_user.handler
      Policies:
        - DynamoDBReadPolicy:
            TableName: !Ref UsersTable
      Events:
        GetUser:
          Type: Api
          Properties:
            Path: /users/{userId}
            Method: GET

  # S3 trigger
  ProcessImageFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: src/handlers/process_image.handler
      MemorySize: 1024        # More memory = more CPU for image processing
      Timeout: 300
      Policies:
        - S3ReadPolicy:
            BucketName: !Ref ImagesBucket
        - RekognitionDetectOnlyPolicy: {}
      Events:
        ImageUpload:
          Type: S3
          Properties:
            Bucket: !Ref ImagesBucket
            Events: s3:ObjectCreated:*
            Filter:
              S3Key:
                Rules:
                  - Name: suffix
                    Value: .jpg

  # Scheduled job
  DailyReportFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: src/handlers/daily_report.handler
      Timeout: 900            # 15 minutes max
      Events:
        DailySchedule:
          Type: Schedule
          Properties:
            Schedule: cron(0 8 * * ? *)   # 8am UTC daily
            Name: daily-report-trigger

  UsersTable:
    Type: AWS::DynamoDB::Table
    Properties:
      BillingMode: PAY_PER_REQUEST
      AttributeDefinitions:
        - AttributeName: userId
          AttributeType: S
      KeySchema:
        - AttributeName: userId
          KeyType: HASH

  ImagesBucket:
    Type: AWS::S3::Bucket

Outputs:
  ApiUrl:
    Value: !Sub 'https://${ServerlessRestApi}.execute-api.${AWS::Region}.amazonaws.com/Prod'
```

```bash
# SAM CLI commands
sam build                           # Build the application
sam local invoke GetUserFunction    # Test locally
sam local start-api                 # Local API server (port 3000)
sam deploy --guided                 # First deploy (interactive)
sam deploy                          # Subsequent deploys
sam logs -n GetUserFunction --tail  # Stream logs
```

## Lambda Best Practices

```python
# 1. Initialize outside handler (connection pooling)
import boto3
db_client = boto3.client('dynamodb')   # Created once, reused

def handler(event, context):
    # db_client is warm and ready
    pass

# 2. Use environment variables
import os
TABLE_NAME = os.environ['TABLE_NAME']   # Not hardcoded!

# 3. Set appropriate timeout and memory
# Monitor: Duration P99 in CloudWatch
# If P99 > 80% of timeout → increase timeout
# If memory usage < 50% → decrease memory to save cost

# 4. Handle partial failures (SQS, Kinesis)
def handler(event, context):
    failures = []
    for record in event['Records']:
        try:
            process(record)
        except Exception as e:
            failures.append({'itemIdentifier': record['messageId']})
    return {'batchItemFailures': failures}

# 5. Use Lambda Powertools
from aws_lambda_powertools import Logger, Tracer, Metrics
from aws_lambda_powertools.metrics import MetricUnit

logger = Logger()
tracer = Tracer()
metrics = Metrics()

@tracer.capture_lambda_handler
@logger.inject_lambda_context
@metrics.log_metrics
def handler(event, context):
    logger.info("Processing event", extra={"order_id": event['id']})
    metrics.add_metric(name="OrdersProcessed", unit=MetricUnit.Count, value=1)
```

## Cold Start Optimization

```python
# Problem: First invocation creates new container
# Cold start adds 100ms-1s latency

# Solutions:
# 1. Provisioned concurrency — pre-warm N containers
aws lambda put-provisioned-concurrency-config \
  --function-name myapp-prod \
  --qualifier LIVE \
  --provisioned-concurrent-executions 10

# 2. Use smaller packages
# Bad: pip install pandas (100MB+)
# Good: Use Lambda Layers or AWS Data Wrangler

# 3. Choose right runtime
# Go and Rust: 1-5ms cold start
# Python/Node.js: 50-200ms cold start
# Java: 500ms-2s cold start (use GraalVM native image or SnapStart)

# 4. Lambda SnapStart (Java 11+)
# Pre-initializes execution environment, saves snapshot
# Reduces Java cold start from seconds to milliseconds
```

## Interview Questions

**What is a Lambda cold start and how do you handle it?**
A cold start occurs when Lambda needs to create a new container for your function because no warm container is available. Lambda downloads your code, initializes the runtime, and runs your initialization code (outside the handler). This adds 100ms to 2s depending on runtime and package size. Solutions: minimize package size, move initialization outside handler, use Provisioned Concurrency (pre-warm N containers, costs money), or use Lambda SnapStart for Java. For user-facing APIs, cold starts matter; for async processing (SQS, S3), they usually don't.

**How does Lambda pricing work?**
Lambda charges on two dimensions: number of requests ($0.20 per million) and duration (GB-seconds — memory allocated × execution time). A 256MB function running for 500ms = 0.256 × 0.5 = 0.128 GB-seconds. Free tier: 1M requests and 400,000 GB-seconds/month. For cost optimization: reduce memory to minimum needed (but remember CPU scales with memory), minimize execution time, avoid long idle waits in handler code.

**When should you NOT use Lambda?**
Lambda is not ideal for: long-running workloads (>15 min limit), workloads needing persistent connections (Lambda is stateless), high-throughput streaming requiring sub-millisecond latency, applications needing GPU, or when you need fine-grained control over the execution environment. For these, use ECS Fargate, EC2, or EKS.
