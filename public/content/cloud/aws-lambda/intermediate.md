# AWS Lambda — Intermediate

## Event-Driven Architecture Patterns

```python
# Pattern 1: Fan-out — one event triggers many Lambdas
# S3 upload → SNS topic → multiple Lambda subscribers

import boto3, json

sns = boto3.client('sns')

def handle_upload(event, context):
    """Process S3 upload and fan out to multiple processors."""
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']

        # Publish to SNS topic — multiple Lambdas subscribe
        sns.publish(
            TopicArn=os.environ['PROCESSING_TOPIC_ARN'],
            Message=json.dumps({
                'bucket': bucket,
                'key': key,
                'size': record['s3']['object']['size'],
                'content_type': record['s3']['object'].get('contentType'),
            }),
            MessageAttributes={
                'event_type': {
                    'DataType': 'String',
                    'StringValue': 'file_uploaded'
                }
            }
        )
```

```yaml
# SAM template — multiple Lambda subscribers
Resources:
  UploadTopic:
    Type: AWS::SNS::Topic

  ImageProcessor:
    Type: AWS::Serverless::Function
    Properties:
      Handler: processor.handle_image
      Events:
        SNSEvent:
          Type: SNS
          Properties:
            Topic: !Ref UploadTopic
            FilterPolicy:           # Only process images
              content_type:
                - image/jpeg
                - image/png

  VirusScanner:
    Type: AWS::Serverless::Function
    Properties:
      Handler: scanner.scan
      Events:
        SNSEvent:
          Type: SNS
          Properties:
            Topic: !Ref UploadTopic  # Same topic, different processor
```

## Lambda + SQS Queue Processing

```python
import boto3, json
from typing import Any

def process_batch(event: dict, context: Any) -> dict:
    """Process SQS batch with partial failure support."""
    failed_ids = []

    for record in event['Records']:
        message_id = record['messageId']
        try:
            body = json.loads(record['body'])
            process_message(body)
        except Exception as e:
            print(f"Failed to process {message_id}: {e}")
            failed_ids.append({'itemIdentifier': message_id})

    # Return failed message IDs — Lambda will retry ONLY these
    # Without this, ALL messages retry if ANY fails
    return {'batchItemFailures': failed_ids}

def process_message(body: dict) -> None:
    # Your business logic here
    order_id = body['order_id']
    # If this raises an exception, the message goes back to queue
    ...
```

## Lambda Power Tuning

```bash
# AWS Lambda Power Tuning — find optimal memory for cost/performance
# Runs your function at different memory sizes, measures cost and duration

# Deploy using AWS Step Functions
aws cloudformation deploy \
    --template-url https://s3.amazonaws.com/lambda-power-tuning/template.yml \
    --stack-name lambda-power-tuning \
    --capabilities CAPABILITY_IAM

# Trigger tuning for your function
aws stepfunctions start-execution \
    --state-machine-arn arn:aws:states:us-east-1:123:stateMachine:powerTuningStateMachine \
    --input '{
        "lambdaARN": "arn:aws:lambda:us-east-1:123:function:my-function",
        "powerValues": [128, 256, 512, 1024, 2048, 3008],
        "num": 50,
        "payload": {"test": "data"},
        "parallelInvocation": true,
        "strategy": "cost"
    }'

# Memory vs Performance tradeoffs:
# 128MB:  cheapest per GB-second, but slow (no throttling at high concurrency)
# 1769MB: 1 full vCPU allocated (linear scaling below this)
# 10240MB: max, 6 vCPUs - use for CPU-intensive tasks like ML inference
```

## Lambda Extensions

```python
# Lambda Extensions run alongside your function
# Use for: telemetry, secrets management, monitoring agents

# wrapper script for DataDog APM (Lambda Extension approach)
# Handler: /opt/datadog_wrapper mymodule.handler

# Or use Layers approach for APM
# For Python with OpenTelemetry:
import opentelemetry.instrumentation.botocore  # Auto-instrument AWS SDK
from aws_lambda_powertools import Logger, Tracer, Metrics
from aws_lambda_powertools.metrics import MetricUnit

logger = Logger()
tracer = Tracer()
metrics = Metrics(namespace="MyApp")

@tracer.capture_lambda_handler
@logger.inject_lambda_context
@metrics.log_metrics(capture_cold_start_metric=True)
def handler(event, context):
    metrics.add_metric(name="ProcessedOrders", unit=MetricUnit.Count, value=1)
    logger.info("Processing order", extra={"order_id": event.get("order_id")})

    with tracer.capture_method:
        result = process_order(event)

    return result
```
