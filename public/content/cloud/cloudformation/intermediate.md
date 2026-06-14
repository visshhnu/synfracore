# CloudFormation — Intermediate

## Advanced Template Patterns

```yaml
# Cross-stack references — share outputs between stacks
# Stack A exports a VPC ID
Outputs:
  VpcId:
    Value: !Ref MyVPC
    Export:
      Name: !Sub "${AWS::StackName}-VpcId"

# Stack B imports it
Resources:
  MySubnet:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !ImportValue prod-network-VpcId   # Reference by export name
```

## Nested Stacks

```yaml
# Break large templates into reusable nested stacks
# Parent template
Resources:
  NetworkStack:
    Type: AWS::CloudFormation::Stack
    Properties:
      TemplateURL: https://s3.amazonaws.com/my-bucket/network.yaml
      Parameters:
        Environment: !Ref Environment
        VpcCidr: "10.0.0.0/16"

  AppStack:
    Type: AWS::CloudFormation::Stack
    DependsOn: NetworkStack
    Properties:
      TemplateURL: https://s3.amazonaws.com/my-bucket/app.yaml
      Parameters:
        VpcId: !GetAtt NetworkStack.Outputs.VpcId
        SubnetId: !GetAtt NetworkStack.Outputs.PublicSubnetId
```

## Custom Resources

```yaml
# Run Lambda during stack create/update/delete
Resources:
  PopulateDBFunction:
    Type: AWS::Lambda::Function
    Properties:
      Handler: index.handler
      Runtime: python3.12
      Role: !GetAtt LambdaRole.Arn
      Code:
        ZipFile: |
          import cfnresponse, boto3
          def handler(event, context):
              if event['RequestType'] == 'Create':
                  # Initialize database, create tables, seed data
                  responseData = {'Status': 'Initialized'}
              cfnresponse.send(event, context, cfnresponse.SUCCESS, responseData)

  DBInitializer:
    Type: AWS::CloudFormation::CustomResource
    Properties:
      ServiceToken: !GetAtt PopulateDBFunction.Arn
      DBEndpoint: !GetAtt MyRDS.Endpoint.Address
```
