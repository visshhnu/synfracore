# AWS CloudFormation — Infrastructure as Code

**Before you start:** basic AWS familiarity (VPC, EC2 — see the AWS Core Services and VPC courses first if those are new) is assumed, since every template example below provisions those resource types directly. No prior infrastructure-as-code experience is required — the declarative model is explained from scratch below.

CloudFormation is AWS's native IaC service. Define your entire AWS infrastructure in YAML or JSON templates, and CloudFormation provisions and manages it as a single stack. It is the AWS alternative to Terraform — no third-party dependency, deep native integration.

## Why This Exists (The Hook)

Clicking through the AWS Console to create a VPC, subnets, an EC2 instance, and security groups works fine once. Do it again for a second environment and you'll misremember a setting, click things in a different order, or just forget a step — and now dev and prod have quietly diverged. CloudFormation solves this by making infrastructure a text file: the same template, applied twice, produces the same infrastructure twice. Change the file, and CloudFormation calculates exactly what needs to change in AWS to match — you never manually track "what did I already create."

**Analogy** — A CloudFormation template is like a furniture assembly instruction sheet with numbered steps, not a photo of a finished room. You don't tell CloudFormation "make my infrastructure look like this picture" — you give it declarative build steps (this VPC, this subnet inside it, this instance inside that), and CloudFormation figures out the order to execute them in (subnet before instance, VPC before subnet) and undoes them cleanly in reverse if you ask it to tear the stack down.

**Diagram** — the deploy lifecycle:

```
template.yaml  ──apply──►  CloudFormation  ──creates/updates──►  Real AWS resources
  (source of truth)          engine tracks:                        (VPC, EC2, etc.)
                              - what exists now (the Stack)
                              - what changed (a Change Set)
                              - dependency order (VPC before Subnet
                                before EC2Instance, automatically
                                inferred from !Ref / !GetAtt usage)
```

## Core Concepts

```
Template → Stack → Resources

Template: YAML/JSON file describing desired infrastructure
Stack:    A deployed instance of a template
StackSet: Deploy a stack across multiple accounts/regions
Change Set: Preview changes before applying
Drift Detection: Check if resources have changed outside CloudFormation
```

## Template Structure

```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: "Production VPC with public and private subnets"

# Input parameters (customise at deploy time)
Parameters:
  Environment:
    Type: String
    AllowedValues: [dev, staging, prod]
    Default: dev
  VPCCidr:
    Type: String
    Default: "10.0.0.0/16"

# Computed values
# NOTE: AMI IDs are region- and release-specific and change frequently as AWS
# publishes new AMI builds — the two below are illustrative only
# *(needs verification — look up the current Amazon Linux AMI ID per region,
# e.g. via the public SSM parameter /aws/service/ami-amazon-linux-latest/...,
# rather than hardcoding one)*
Mappings:
  RegionAMI:
    us-east-1:
      ami: ami-0c02fb55956c7d316
    ap-south-1:
      ami: ami-0bc8ae3ec8e338cbc

# Conditions
Conditions:
  IsProduction: !Equals [!Ref Environment, prod]

# The actual resources
Resources:
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VPCCidr
      EnableDnsHostnames: true
      EnableDnsSupport: true
      Tags:
        - Key: Name
          Value: !Sub "${Environment}-vpc"
        - Key: Environment
          Value: !Ref Environment

  PublicSubnet:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: "10.0.1.0/24"
      AvailabilityZone: !Select [0, !GetAZs ""]
      MapPublicIpOnLaunch: true

  # Elastic IP for the NAT Gateway — NatGateway below references this,
  # so it must exist as its own resource (a NAT Gateway cannot allocate
  # its own EIP automatically in a template)
  ElasticIP:
    Type: AWS::EC2::EIP
    Condition: IsProduction
    Properties:
      Domain: vpc

  # Conditionally create NAT Gateway only in production
  NatGateway:
    Type: AWS::EC2::NatGateway
    Condition: IsProduction
    Properties:
      SubnetId: !Ref PublicSubnet
      AllocationId: !GetAtt ElasticIP.AllocationId

  EC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: !FindInMap [RegionAMI, !Ref AWS::Region, ami]
      InstanceType: t3.micro
      SubnetId: !Ref PublicSubnet   # Without this, the instance launches into
                                     # the account's default VPC, not the one
                                     # this template just created
      UserData:
        Fn::Base64: |
          #!/bin/bash
          yum update -y
          yum install -y nginx
          systemctl start nginx

# Export values for other stacks to reference
Outputs:
  VPCId:
    Value: !Ref VPC
    Export:
      Name: !Sub "${Environment}-VPC-ID"
  PublicSubnetId:
    Value: !Ref PublicSubnet
    Export:
      Name: !Sub "${Environment}-PublicSubnet-ID"
```

## Intrinsic Functions

```yaml
!Ref ResourceName          # Reference a resource or parameter
!GetAtt Resource.Attribute # Get attribute of resource (e.g., ARN, DNS name)
!Sub "String ${Variable}"  # String substitution
!Join [",", [a, b, c]]    # Join list with delimiter: "a,b,c"
!Select [0, !GetAZs ""]   # Select first AZ in current region
!If [Condition, IfTrue, IfFalse]
!And, !Or, !Not            # Logical operators for conditions
!ImportValue ExportName    # Reference output from another stack
```

## Nested Stacks

```yaml
# Break large templates into manageable nested stacks
Resources:
  NetworkStack:
    Type: AWS::CloudFormation::Stack
    Properties:
      TemplateURL: https://s3.amazonaws.com/my-bucket/network.yaml
      Parameters:
        VPCCidr: !Ref VPCCidr

  AppStack:
    Type: AWS::CloudFormation::Stack
    DependsOn: NetworkStack
    Properties:
      TemplateURL: https://s3.amazonaws.com/my-bucket/app.yaml
      Parameters:
        VPCId: !GetAtt NetworkStack.Outputs.VPCId
```

## Key CLI Commands

```bash
# Validate template
aws cloudformation validate-template --template-body file://template.yaml

# Create stack
aws cloudformation create-stack \
  --stack-name prod-vpc \
  --template-body file://template.yaml \
  --parameters ParameterKey=Environment,ParameterValue=prod \
  --capabilities CAPABILITY_IAM

# Preview changes before applying
aws cloudformation create-change-set \
  --stack-name prod-vpc \
  --change-set-name update-v2 \
  --template-body file://template-v2.yaml
aws cloudformation execute-change-set --change-set-name update-v2 --stack-name prod-vpc

# Check drift (resources changed outside CloudFormation)
aws cloudformation detect-stack-drift --stack-name prod-vpc
aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id <id>

# Delete stack (deletes ALL resources in stack)
aws cloudformation delete-stack --stack-name prod-vpc
```

## CloudFormation vs Terraform

| Feature | CloudFormation | Terraform |
|---------|---------------|-----------|
| Provider | AWS-only | Multi-cloud |
| State | AWS manages | Local/remote state file |
| Language | YAML/JSON | HCL (cleaner) |
| Registry | AWS Resource Types | Terraform Registry |
| Rollback | Automatic on failure | Manual or with `-target` |
| Cost | Free | Free (Terraform Cloud paid) |
| Best for | AWS-only shops | Multi-cloud, existing teams |

## Try It (2 Minutes)

If you have AWS CLI access to a sandbox account, validate the template structure above without deploying anything (`validate-template` only checks syntax and doesn't create resources, so it's safe to run):
```bash
aws cloudformation validate-template --template-body file://template.yaml
```
No AWS access handy? Reason through it instead: the template above creates `PublicSubnet` with `VpcId: !Ref VPC`, and `VPC` with no dependency on anything else. If you deleted the `VPC` resource block entirely but left `PublicSubnet` referencing it, would `validate-template` catch that mistake, or only `create-stack`? What's the difference between what each command actually checks?
