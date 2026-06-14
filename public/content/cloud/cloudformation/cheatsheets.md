# CloudFormation — Cheatsheet

```bash
# ── DEPLOY ────────────────────────────────────────────────
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name my-stack \
  --parameter-overrides Env=prod InstanceType=t3.medium \
  --capabilities CAPABILITY_IAM \
  --region ap-south-1

aws cloudformation validate-template --template-body file://template.yaml

# ── CHANGE SETS (production) ──────────────────────────────
aws cloudformation create-change-set \
  --stack-name my-stack --change-set-name changes \
  --template-body file://template.yaml
aws cloudformation describe-change-set --stack-name my-stack --change-set-name changes
aws cloudformation execute-change-set --stack-name my-stack --change-set-name changes

# ── INSPECT ───────────────────────────────────────────────
aws cloudformation describe-stacks --stack-name my-stack
aws cloudformation describe-stack-events --stack-name my-stack | head -40
aws cloudformation describe-stack-resources --stack-name my-stack
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE

# ── INTRINSIC FUNCTIONS ───────────────────────────────────
!Ref LogicalName          # Resource ID or parameter value
!GetAtt Resource.Attr     # Attribute of resource
!Sub "prefix-${Name}"     # String interpolation
!Join ["-", [a, b, c]]   # Join: "a-b-c"
!Select [0, [a,b,c]]     # Index: "a"
!If [Condition, a, b]    # Conditional value
!ImportValue ExportName   # Cross-stack reference
!FindInMap [Map, Key1, Key2]
!Base64 "string"

# ── PSEUDO-PARAMETERS ─────────────────────────────────────
AWS::AccountId            # 123456789012
AWS::Region               # ap-south-1
AWS::StackName            # my-stack
AWS::StackId              # Full ARN
AWS::NoValue              # Remove property (use in conditionals)
AWS::URLSuffix            # amazonaws.com

# ── CONDITION FUNCTIONS ───────────────────────────────────
!Equals [!Ref Env, prod]
!And [!Condition C1, !Condition C2]
!Or  [!Condition C1, !Condition C2]
!Not [!Condition C1]

# ── COMMON PATTERNS ───────────────────────────────────────
# Conditional resource
Conditions:
  IsProd: !Equals [!Ref Env, prod]
Resources:
  MultiAZDB:
    Type: AWS::RDS::DBInstance
    Condition: IsProd
    Properties:
      MultiAZ: true

# DeletionPolicy
DeletionPolicy: Snapshot    # Take snapshot before delete
DeletionPolicy: Retain      # Keep resource when stack deleted
DeletionPolicy: Delete      # Default

# ── DELETE ────────────────────────────────────────────────
aws cloudformation delete-stack --stack-name my-stack
aws cloudformation wait stack-delete-complete --stack-name my-stack
```
