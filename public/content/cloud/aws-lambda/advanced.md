# AWS Lambda — Advanced

## Lambda SnapStart (Java)

```java
// SnapStart dramatically reduces cold starts for Java Lambda
// Initializes JVM + application code, takes snapshot, restores from snapshot

// pom.xml
<dependency>
    <groupId>software.amazon.lambda</groupId>
    <artifactId>powertools-logging</artifactId>
</dependency>

// Lambda function with SnapStart hooks
import com.amazonaws.services.lambda.runtime.CrSnapshotContext;
import org.crac.Context;
import org.crac.Core;
import org.crac.Resource;

@CrSnapshotContext
public class Handler implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent>, Resource {

    private static final DynamoDbClient dynamo;
    private static final S3Client s3;

    static {
        // Heavy initialization at class load time
        dynamo = DynamoDbClient.create();
        s3 = S3Client.create();
    }

    public Handler() {
        Core.getGlobalContext().register(this);
    }

    @Override
    public void beforeCheckpoint(Context<? extends Resource> context) {
        // Called before snapshot — warm up connections
        dynamo.describeTable(r -> r.tableName("users"));
    }

    @Override
    public void afterRestore(Context<? extends Resource> context) {
        // Called after restore — reinitialize anything that can't be snapshotted
        // e.g., network connections, time-sensitive resources
    }
}
```

```hcl
# Enable SnapStart in Terraform
resource "aws_lambda_function" "api" {
  function_name = "java-api"
  runtime       = "java21"
  handler       = "com.example.Handler"
  role          = aws_iam_role.lambda.arn
  filename      = "function.jar"

  snap_start {
    apply_on = "PublishedVersions"   # Required: must use versions
  }

  # Must publish a version to use SnapStart
  publish = true
}
```

## Step Functions + Lambda Orchestration

```json
{
  "Comment": "Order processing workflow",
  "StartAt": "ValidateOrder",
  "States": {
    "ValidateOrder": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123:function:validate-order",
      "Retry": [{
        "ErrorEquals": ["Lambda.ServiceException", "Lambda.AWSLambdaException"],
        "IntervalSeconds": 2, "MaxAttempts": 3, "BackoffRate": 2
      }],
      "Catch": [{
        "ErrorEquals": ["ValidationError"],
        "Next": "HandleValidationError"
      }],
      "Next": "ProcessPayment"
    },
    "ProcessPayment": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123:function:process-payment",
      "TimeoutSeconds": 30,
      "Next": "FulfillOrder"
    },
    "FulfillOrder": {
      "Type": "Parallel",
      "Branches": [
        {
          "StartAt": "SendConfirmationEmail",
          "States": {
            "SendConfirmationEmail": {
              "Type": "Task",
              "Resource": "arn:aws:lambda:us-east-1:123:function:send-email",
              "End": true
            }
          }
        },
        {
          "StartAt": "UpdateInventory",
          "States": {
            "UpdateInventory": {
              "Type": "Task",
              "Resource": "arn:aws:lambda:us-east-1:123:function:update-inventory",
              "End": true
            }
          }
        }
      ],
      "Next": "Success"
    },
    "Success": {"Type": "Succeed"},
    "HandleValidationError": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123:function:handle-error",
      "End": true
    }
  }
}
```

## Lambda Cheatsheet

```bash
# ── DEPLOY ────────────────────────────────────────────────
# Update code
aws lambda update-function-code \
    --function-name my-function \
    --zip-file fileb://function.zip

# Update code from S3
aws lambda update-function-code \
    --function-name my-function \
    --s3-bucket my-bucket \
    --s3-key lambda/function.zip

# Update environment variables
aws lambda update-function-configuration \
    --function-name my-function \
    --environment "Variables={DB_HOST=db.example.com,LOG_LEVEL=info}"

# Publish version (immutable snapshot)
aws lambda publish-version --function-name my-function

# Create/update alias
aws lambda create-alias --function-name my-function \
    --name prod --function-version 5
aws lambda update-alias --function-name my-function \
    --name prod --routing-config AdditionalVersionWeights={"4"=0.1}  # 10% canary

# ── INVOKE ────────────────────────────────────────────────
aws lambda invoke --function-name my-function \
    --payload '{"key":"value"}' \
    --cli-binary-format raw-in-base64-out \
    output.json
cat output.json

# Async invoke
aws lambda invoke --function-name my-function \
    --invocation-type Event \
    --payload '{"key":"value"}' /dev/null

# ── MONITOR ───────────────────────────────────────────────
aws lambda get-function-concurrency --function-name my-function
aws logs tail /aws/lambda/my-function --follow
aws cloudwatch get-metric-statistics \
    --namespace AWS/Lambda \
    --metric-name Errors \
    --dimensions Name=FunctionName,Value=my-function \
    --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ) \
    --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
    --period 300 --statistics Sum
```
