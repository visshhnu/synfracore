# AWS Lambda — Cheatsheet

```bash
# ── DEPLOY & MANAGE ───────────────────────────────────────
# Create function
zip function.zip lambda_function.py
aws lambda create-function   --function-name my-function   --runtime python3.12   --role arn:aws:iam::ACCOUNT:role/LambdaRole   --handler lambda_function.lambda_handler   --zip-file fileb://function.zip   --timeout 30 --memory-size 512

# Update code
zip -r function.zip .
aws lambda update-function-code --function-name my-function --zip-file fileb://function.zip

# Update config
aws lambda update-function-configuration --function-name my-function   --timeout 60 --memory-size 1024   --environment "Variables={DB_HOST=db.internal,LOG_LEVEL=INFO}"

# Invoke
aws lambda invoke --function-name my-function   --payload '{"key":"value"}' --cli-binary-format raw-in-base64-out   output.json && cat output.json

# ── MONITORING ────────────────────────────────────────────
aws logs tail /aws/lambda/my-function --follow --since 10m
aws logs filter-log-events --log-group-name /aws/lambda/my-function   --filter-pattern "ERROR" --start-time $(date -d '1 hour ago' +%s000)

# Key metrics (CloudWatch):
# Duration, Errors, Throttles, ConcurrentExecutions
# IteratorAge (Kinesis/DynamoDB streams), DeadLetterErrors

# ── TRIGGERS & EVENT SOURCES ─────────────────────────────
# S3 trigger
aws lambda add-permission --function-name my-function   --statement-id s3-trigger --action lambda:InvokeFunction   --principal s3.amazonaws.com --source-arn arn:aws:s3:::my-bucket

# EventBridge (cron)
aws events put-rule --name daily-job --schedule-expression "cron(0 2 * * ? *)"
aws events put-targets --rule daily-job   --targets "Id=1,Arn=arn:aws:lambda:REGION:ACCOUNT:function:my-function"

# SQS trigger
aws lambda create-event-source-mapping   --function-name my-function   --event-source-arn arn:aws:sqs:REGION:ACCOUNT:my-queue   --batch-size 10 --maximum-batching-window-in-seconds 30

# ── VERSIONS & ALIASES ────────────────────────────────────
aws lambda publish-version --function-name my-function
aws lambda create-alias --function-name my-function --name prod   --function-version 5 --routing-config '{"AdditionalVersionWeights":{"4":0.1}}'
# 90% to v5 (prod), 10% to v4 (canary)

# ── LAMBDA FUNCTION URL ───────────────────────────────────
aws lambda create-function-url-config   --function-name my-function --auth-type NONE
# Returns: https://xxxxx.lambda-url.REGION.on.aws/

# ── COMMON LIMITS ─────────────────────────────────────────
# Max execution time: 15 minutes
# Memory: 128MB – 10,240MB (10GB)
# Package size: 50MB (zip), 250MB (unzipped), 10GB (container)
# Concurrent executions: 1,000 (soft limit, request increase)
# /tmp storage: 512MB – 10,240MB
```
