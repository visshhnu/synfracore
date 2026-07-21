# AWS CloudFormation — Infrastructure as Code

## The Hook

Every resource in a CloudFormation template is declared, not scripted — you never write "first create the VPC, then create the subnet inside it." You just write both resource blocks, one referencing the other with `!Ref`, and CloudFormation works out the create order from those references (and the reverse order for deletion) on its own.

**Analogy** — Think of `Resources:` as a family tree, not a to-do list. You don't say "do step 1, then step 2." You say "this subnet's parent is this VPC" (`VpcId: !Ref VPC`), and CloudFormation walks the tree to figure out who has to exist before whom — the same way you'd know a grandparent has to exist before a grandchild can, without anyone telling you the order explicitly.

## Template Structure

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'My Application Stack'

Parameters:                      # User inputs at deploy time
  Environment:
    Type: String
    Default: staging
    AllowedValues: [dev, staging, prod]
  
  InstanceType:
    Type: String
    Default: t3.medium

Mappings:                        # Static lookup tables
  InstanceTypes:
    dev:     { Type: t3.micro }
    staging: { Type: t3.medium }
    prod:    { Type: m5.large }

Conditions:                      # Conditional resource creation
  IsProd: !Equals [!Ref Environment, prod]

Resources:                       # Required — what to create
  WebServer:
    Type: AWS::EC2::Instance
    Properties:
      InstanceType: !FindInMap [InstanceTypes, !Ref Environment, Type]
      ImageId: !Sub '{{resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64}}'
      Tags:
        - Key: Name
          Value: !Sub '${Environment}-web-server'

  Database:
    Type: AWS::RDS::DBInstance
    Condition: IsProd              # Only create in prod
    DeletionPolicy: Snapshot       # Take snapshot before delete
    Properties:
      DBInstanceClass: db.r6g.large
      Engine: postgres
      MasterUsername: !Sub '{{resolve:secretsmanager:${Environment}/db:username}}'
      MasterUserPassword: !Sub '{{resolve:secretsmanager:${Environment}/db:password}}'

Outputs:                          # Values to export
  WebServerIP:
    Value: !GetAtt WebServer.PublicIp
    Export:
      Name: !Sub '${AWS::StackName}-WebIP'
```

## Common Intrinsic Functions

```yaml
!Ref Resource           # Reference a resource's default value
!GetAtt Resource.Attr   # Get specific attribute
!Sub 'prefix-${Param}'  # String substitution
!Join ['-', [a, b, c]]  # Join array: a-b-c
!Select [0, [a,b,c]]    # Select by index: a
!If [Condition, yes, no] # Conditional value
!FindInMap [Map,Key1,Key2] # Lookup in Mappings
!ImportValue ExportName  # Cross-stack reference

# Condition functions
!Equals [!Ref Env, prod]
!And [!Condition C1, !Condition C2]
!Or  [!Condition C1, !Condition C2]
!Not [!Condition C1]
```

## CloudFormation CLI + Cheatsheet

```bash
# Deploy/update stack
aws cloudformation deploy \
    --stack-name my-app-prod \
    --template-file template.yaml \
    --parameter-overrides Environment=prod InstanceType=m5.large \
    --capabilities CAPABILITY_IAM \
    --region ap-south-1

# Validate template
aws cloudformation validate-template --template-body file://template.yaml

# Describe stack and outputs
aws cloudformation describe-stacks --stack-name my-app-prod
# There is no separate "describe-stack-outputs" subcommand — outputs are a
# field on the stack description above; extract them with --query:
aws cloudformation describe-stacks --stack-name my-app-prod \
    --query 'Stacks[0].Outputs'

# List events (debug failures)
aws cloudformation describe-stack-events --stack-name my-app-prod \
    --query 'StackEvents[?ResourceStatus==`CREATE_FAILED`]'

# Delete stack (careful!)
aws cloudformation delete-stack --stack-name my-app-dev

# Change sets (preview changes before applying)
aws cloudformation create-change-set \
    --stack-name my-app-prod \
    --change-set-name my-changes \
    --template-body file://template.yaml
aws cloudformation describe-change-set --stack-name my-app-prod --change-set-name my-changes
aws cloudformation execute-change-set --stack-name my-app-prod --change-set-name my-changes
```

## Try It (2 Minutes)

If you have AWS CLI access to a sandbox account, create a change set WITHOUT executing it — this previews what would happen with zero risk of actually changing anything:
```bash
aws cloudformation create-change-set \
    --stack-name my-app-dev \
    --change-set-name preview-only \
    --template-body file://template.yaml \
    --parameters ParameterKey=Environment,ParameterValue=dev
aws cloudformation describe-change-set --stack-name my-app-dev --change-set-name preview-only
# Read the "Changes" list — each entry shows Action (Add/Modify/Remove) and
# whether it requires replacement (destroys and recreates the resource)
```
No AWS access handy? Reason through it instead: `InstanceType` in the template above is read via `!FindInMap [InstanceTypes, !Ref Environment, Type]` — it depends entirely on the `Environment` parameter, not on any hardcoded value. If you re-deploy with `Environment=prod` instead of `dev`, does the EC2 instance update in place, or does it have to be destroyed and recreated? (Hint: changing `InstanceType` on `AWS::EC2::Instance` is generally an in-place update, not a replacement — unlike changing something like a VPC's CIDR block.)
