# AWS CloudFormation Interview Questions

## Core Concepts

**Q: What is CloudFormation? vs Terraform?**

CloudFormation is AWS's native IaC service. Define JSON/YAML templates, AWS provisions resources and manages state.

| | CloudFormation | Terraform |
|---|---|---|
| Cloud | AWS only | Multi-cloud |
| State | AWS manages (S3+DynamoDB) | You manage |
| Rollback | Automatic on failure | Manual |
| New services | Same-day support | Slightly behind |

---

**Q: Template structure.**

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Parameters:           # Dynamic inputs
  Env: {Type: String, AllowedValues: [dev, prod]}

Conditions:
  IsProd: !Equals [!Ref Env, prod]

Resources:            # Required — what to create
  MyBucket:
    Type: AWS::S3::Bucket
    DeletionPolicy: Retain
    Properties:
      BucketName: !Sub "my-bucket-${Env}"

Outputs:
  BucketArn:
    Value: !GetAtt MyBucket.Arn
    Export:
      Name: !Sub "${AWS::StackName}-BucketArn"
```

---

**Q: Key intrinsic functions.**

```yaml
!Ref MyParam              # Reference parameter or resource
!GetAtt Resource.Attr     # Get resource attribute (e.g., Arn, Endpoint)
!Sub "string-${Var}"      # String substitution
!Join [':', [a, b, c]]    # Join: "a:b:c"
!If [Cond, TrueVal, FalseVal]
!FindInMap [Map, Key1, Key2]
!ImportValue ExportName   # Cross-stack reference
```

---

**Q: ChangeSets and nested stacks.**

```bash
# Preview changes before applying (like terraform plan)
aws cloudformation create-change-set \
  --stack-name my-stack --template-body file://template.yaml \
  --change-set-name preview
aws cloudformation describe-change-set --change-set-name preview
aws cloudformation execute-change-set --change-set-name preview
```

Nested stacks: modular templates — parent references child via `AWS::CloudFormation::Stack` with `TemplateURL`.

---

**Q: Deletion policies and rollback.**

```yaml
DeletionPolicy: Retain     # Keep resource after stack delete
DeletionPolicy: Snapshot   # Take snapshot before delete (RDS/EBS)
UpdateReplacePolicy: Retain # Keep old resource when replacement needed
```

On failure: CloudFormation rolls back entire stack by default. Stack enters `ROLLBACK_COMPLETE` — must delete before retrying.

## Revision Notes
```
CFN: AWS-native IaC. JSON/YAML -> AWS manages state. Auto-rollback on failure.
vs Terraform: CFN=AWS-only, auto-rollback | TF=multi-cloud, self-managed state

TEMPLATE: Parameters | Conditions | Resources (required) | Outputs
FUNCTIONS: !Ref | !GetAtt | !Sub | !Join | !If | !ImportValue

CHANGESET: preview before apply (like terraform plan)
create-change-set -> describe -> execute

DELETION POLICY: Retain | Snapshot | UpdateReplacePolicy
ROLLBACK: automatic on failure -> ROLLBACK_COMPLETE -> must delete to retry
```
