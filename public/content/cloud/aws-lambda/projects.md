# AWS Lambda -- Portfolio Projects

---

## Project 1: REST API with Lambda + API Gateway + DynamoDB

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `aws-serverless-api`

Serverless CRUD API -- no servers, automatic scaling, pay per request.

```python
import boto3, json

dynamodb = boto3.resource("dynamodb")
table    = dynamodb.Table("Items")

def lambda_handler(event, context):
    method = event["httpMethod"]
    path   = event["path"]

    if method == "GET" and path == "/items":
        result = table.scan()
        return {"statusCode": 200, "body": json.dumps(result["Items"])}

    if method == "POST" and path == "/items":
        body = json.loads(event["body"])
        table.put_item(Item=body)
        return {"statusCode": 201, "body": json.dumps(body)}

    return {"statusCode": 404, "body": "Not Found"}
```

```hcl
resource "aws_lambda_function" "api" {
  filename      = "function.zip"
  function_name = "items-api"
  runtime       = "python3.12"
  handler       = "handler.lambda_handler"
  role          = aws_iam_role.lambda.arn
  memory_size   = 256
  timeout       = 30
}
```

**Steps:** Lambda + API Gateway + DynamoDB via Terraform, test with curl, add x-ray tracing

---

## Project 2: Event-Driven Processing with SQS

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `aws-lambda-event-driven`

Lambda processes SQS messages with batching, dead-letter queue, and retry logic.

```python
def lambda_handler(event, context):
    success, failed = [], []
    for record in event["Records"]:
        try:
            msg = json.loads(record["body"])
            process_message(msg)
            success.append(record["messageId"])
        except Exception as e:
            print(f"Failed {record['messageId']}: {e}")
            failed.append({"itemIdentifier": record["messageId"]})

    return {"batchItemFailures": failed}  # Partial batch failure reporting
```

**Steps:** SQS + Lambda trigger, DLQ for failed messages, CloudWatch alarm on DLQ depth

---

## Portfolio Checklist
- [ ] Lambda in VPC with private subnet (for RDS/ElasticCache access)
- [ ] IAM role with minimum necessary permissions
- [ ] X-Ray tracing enabled
- [ ] Reserved concurrency set (prevent runaway scaling)
- [ ] CloudWatch alarm: error rate > 1%
