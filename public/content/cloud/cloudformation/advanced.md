# CloudFormation — Advanced

## Stack Sets (Multi-Account, Multi-Region)

```bash
# Deploy to multiple accounts and regions simultaneously
aws cloudformation create-stack-set \
  --stack-set-name security-baseline \
  --template-body file://security.yaml \
  --permission-model SERVICE_MANAGED \
  --auto-deployment Enabled=true,RetainStacksOnAccountRemoval=false

# Deploy to all accounts in an OU
aws cloudformation create-stack-instances \
  --stack-set-name security-baseline \
  --deployment-targets OrganizationalUnitIds=["ou-abc123"] \
  --regions ap-south-1 us-east-1 \
  --operation-preferences MaxConcurrentPercentage=25,FailureTolerancePercentage=20
```

## Drift Detection

```bash
# Detect if someone manually changed resources outside CloudFormation
aws cloudformation detect-stack-drift --stack-name my-stack
aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id $ID

# List drifted resources
aws cloudformation describe-stack-resource-drifts \
  --stack-name my-stack \
  --stack-resource-drift-status-filters MODIFIED DELETED
```

## CloudFormation Macros (Transform)

```yaml
# AWS::Include macro — embed reusable snippets from S3
Transform: AWS::Include
Parameters:
  Location: s3://my-templates/common-tags.yaml

# SAM Transform (serverless)
Transform: AWS::Serverless-2016-10-31
Resources:
  MyFunction:
    Type: AWS::Serverless::Function
    Properties:
      Runtime: python3.12
      Handler: app.handler
      Events:
        Api:
          Type: Api
          Properties:
            Path: /hello
            Method: get
```

## Best Practices

```bash
# Always use change sets in production
aws cloudformation create-change-set \
  --stack-name prod-stack --change-set-name my-changes \
  --template-body file://template.yaml

aws cloudformation describe-change-set \
  --stack-name prod-stack --change-set-name my-changes

# Only execute after reviewing
aws cloudformation execute-change-set \
  --stack-name prod-stack --change-set-name my-changes

# Stack policies prevent accidental deletion
aws cloudformation set-stack-policy --stack-name prod-stack \
  --stack-policy-body '{"Statement":[{"Effect":"Deny","Action":"Update:Delete","Principal":"*","Resource":"*"}]}'
```
