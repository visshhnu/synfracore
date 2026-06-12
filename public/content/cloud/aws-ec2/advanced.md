# AWS EC2 — Advanced

## Spot Instance Fleet

```python
# Python script to manage Spot Instance Fleet
import boto3, json

ec2 = boto3.client('ec2')

def create_spot_fleet(target_capacity: int, image_id: str, subnets: list) -> str:
    """Create a diversified Spot Fleet for batch processing."""

    launch_specs = []
    # Multiple instance types for better availability
    for instance_type in ['m5.large', 'm5a.large', 'm5n.large', 't3.large']:
        for subnet in subnets:
            launch_specs.append({
                'ImageId': image_id,
                'InstanceType': instance_type,
                'SubnetId': subnet,
                'IamInstanceProfile': {'Arn': 'arn:aws:iam::123:instance-profile/BatchRole'},
                'UserData': base64.b64encode(BATCH_SCRIPT.encode()).decode(),
                'TagSpecifications': [{
                    'ResourceType': 'instance',
                    'Tags': [{'Key': 'Purpose', 'Value': 'batch-processing'}]
                }]
            })

    response = ec2.request_spot_fleet(
        SpotFleetRequestConfig={
            'AllocationStrategy': 'capacityOptimized',
            'TargetCapacity': target_capacity,
            'Type': 'maintain',     # Keep target capacity, replace interrupted instances
            'LaunchSpecifications': launch_specs,
            'IamFleetRole': 'arn:aws:iam::123:role/aws-ec2-spot-fleet-role',
            'TerminateInstancesWithExpiration': True,
            'ValidUntil': '2025-12-31T00:00:00Z',
        }
    )
    return response['SpotFleetRequestId']

# Handle Spot interruption notices (2-minute warning)
def setup_interruption_handler():
    """On EC2 instance: poll metadata for interruption notice."""
    import requests, time

    while True:
        try:
            # IMDSv2
            token = requests.put(
                'http://169.254.169.254/latest/api/token',
                headers={'X-aws-ec2-metadata-token-ttl-seconds': '21600'}
            ).text

            r = requests.get(
                'http://169.254.169.254/latest/meta-data/spot/interruption-action',
                headers={'X-aws-ec2-metadata-token': token},
                timeout=1
            )
            if r.status_code == 200:
                print("⚠️  Spot interruption notice received! Saving state...")
                checkpoint_job_state()   # Save progress
                drain_connections()      # Stop accepting new work
                break
        except:
            pass
        time.sleep(5)
```

## EC2 Image Builder

```yaml
# Automate AMI creation with EC2 Image Builder
# image-pipeline.yaml (for CloudFormation)
ImageRecipe:
  Type: AWS::ImageBuilder::ImageRecipe
  Properties:
    Name: hardened-amazon-linux
    Version: 1.0.0
    ParentImage: !Sub arn:aws:imagebuilder:${AWS::Region}:aws:image/amazon-linux-2023-x86/x.x.x
    Components:
      - ComponentArn: !Sub arn:aws:imagebuilder:${AWS::Region}:aws:component/aws-cli-version-2-linux/1.0.4/1
      - ComponentArn: !Sub arn:aws:imagebuilder:${AWS::Region}:aws:component/amazon-cloudwatch-agent-linux/1.0.1/1
      - ComponentArn: !Ref HardeningComponent

HardeningComponent:
  Type: AWS::ImageBuilder::Component
  Properties:
    Name: custom-hardening
    Version: 1.0.0
    Platform: Linux
    Data: |
      name: Custom Hardening
      schemaVersion: 1.0
      phases:
        - name: build
          steps:
            - name: Harden
              action: ExecuteBash
              inputs:
                commands:
                  - dnf update -y --security
                  - systemctl disable telnet.socket
                  - echo "umask 027" >> /etc/profile
                  - sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 90/' /etc/login.defs

ImagePipeline:
  Type: AWS::ImageBuilder::ImagePipeline
  Properties:
    Name: hardened-al2023
    ImageRecipeArn: !Ref ImageRecipe
    InfrastructureConfigurationArn: !Ref InfraConfig
    Schedule:
      ScheduleExpression: cron(0 0 * * 1)  # Every Monday
      PipelineExecutionStartCondition: EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE
```
