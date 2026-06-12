# Python for DevOps — Intermediate

## AWS Automation with Boto3

```python
import boto3
from botocore.exceptions import ClientError, NoCredentialsError
import logging

log = logging.getLogger(__name__)

class AWSManager:
    def __init__(self, region: str = "ap-south-1"):
        self.ec2 = boto3.client('ec2', region_name=region)
        self.s3  = boto3.client('s3', region_name=region)
        self.ssm = boto3.client('ssm', region_name=region)

    def get_running_instances(self, tag_filter: dict = None) -> list[dict]:
        """Get all running EC2 instances, optionally filtered by tags."""
        filters = [{'Name': 'instance-state-name', 'Values': ['running']}]
        if tag_filter:
            for key, value in tag_filter.items():
                filters.append({'Name': f'tag:{key}', 'Values': [value]})

        paginator = self.ec2.get_paginator('describe_instances')
        instances = []
        for page in paginator.paginate(Filters=filters):
            for reservation in page['Reservations']:
                for inst in reservation['Instances']:
                    name = next(
                        (t['Value'] for t in inst.get('Tags', []) if t['Key'] == 'Name'),
                        inst['InstanceId']
                    )
                    instances.append({
                        'id': inst['InstanceId'],
                        'name': name,
                        'type': inst['InstanceType'],
                        'ip': inst.get('PrivateIpAddress'),
                        'launch_time': inst['LaunchTime'],
                    })
        return instances

    def run_ssm_command(self, instance_ids: list, command: str) -> dict:
        """Run a shell command on EC2 instances via SSM (no SSH needed)."""
        response = self.ssm.send_command(
            InstanceIds=instance_ids,
            DocumentName='AWS-RunShellScript',
            Parameters={'commands': [command]},
            TimeoutSeconds=300,
        )
        command_id = response['Command']['CommandId']

        # Poll for completion
        import time
        for _ in range(30):
            time.sleep(2)
            result = self.ssm.get_command_invocation(
                CommandId=command_id,
                InstanceId=instance_ids[0],
            )
            if result['Status'] not in ('InProgress', 'Pending'):
                break

        return {
            'status': result['Status'],
            'stdout': result.get('StandardOutputContent', ''),
            'stderr': result.get('StandardErrorContent', ''),
        }

    def rotate_ami(self, asg_name: str, new_ami_id: str) -> None:
        """Update an Auto Scaling Group to use a new AMI."""
        asg = boto3.client('autoscaling')
        lt_client = boto3.client('ec2')

        # Get current launch template
        asg_info = asg.describe_auto_scaling_groups(
            AutoScalingGroupNames=[asg_name]
        )['AutoScalingGroups'][0]

        lt_spec = asg_info['LaunchTemplate']
        lt_id = lt_spec['LaunchTemplateId']

        # Create new version with updated AMI
        new_version = lt_client.create_launch_template_version(
            LaunchTemplateId=lt_id,
            SourceVersion='$Latest',
            LaunchTemplateData={'ImageId': new_ami_id},
        )['LaunchTemplateVersion']['VersionNumber']

        # Update ASG to use new version
        asg.update_auto_scaling_group(
            AutoScalingGroupName=asg_name,
            LaunchTemplate={
                'LaunchTemplateId': lt_id,
                'Version': str(new_version),
            }
        )
        log.info(f"ASG {asg_name} updated to AMI {new_ami_id} (LT version {new_version})")
```

## Kubernetes Python Client

```python
from kubernetes import client, config, watch
from kubernetes.client.rest import ApiException

# Load config (auto-detects in-cluster or kubeconfig)
try:
    config.load_incluster_config()   # Running inside K8s pod
except config.ConfigException:
    config.load_kube_config()        # Using local kubeconfig

apps_v1 = client.AppsV1Api()
core_v1  = client.CoreV1Api()

# List deployments across all namespaces
def get_deployments(namespace: str = None) -> list:
    if namespace:
        deps = apps_v1.list_namespaced_deployment(namespace)
    else:
        deps = apps_v1.list_deployment_for_all_namespaces()

    return [{
        'name': d.metadata.name,
        'namespace': d.metadata.namespace,
        'replicas': d.spec.replicas,
        'ready': d.status.ready_replicas or 0,
        'image': d.spec.template.spec.containers[0].image,
    } for d in deps.items]

# Scale a deployment
def scale_deployment(name: str, namespace: str, replicas: int):
    apps_v1.patch_namespaced_deployment_scale(
        name=name,
        namespace=namespace,
        body={'spec': {'replicas': replicas}}
    )

# Watch for pod events
def watch_pods(namespace: str = "default"):
    w = watch.Watch()
    for event in w.stream(core_v1.list_namespaced_pod, namespace=namespace):
        pod = event['object']
        event_type = event['type']
        if event_type in ('MODIFIED', 'DELETED'):
            print(f"{event_type}: {pod.metadata.name} → {pod.status.phase}")
```

## CLI Tools with Click

```python
#!/usr/bin/env python3
"""Production deployment CLI tool."""
import click, boto3, subprocess
from rich.console import Console
from rich.table import Table

console = Console()

@click.group()
@click.option('--env', default='staging', type=click.Choice(['staging', 'prod']))
@click.pass_context
def cli(ctx, env):
    """Deployment management tool."""
    ctx.ensure_object(dict)
    ctx.obj['env'] = env
    ctx.obj['aws'] = boto3.Session(profile_name=env)

@cli.command()
@click.argument('service')
@click.argument('version')
@click.option('--dry-run', is_flag=True)
@click.pass_context
def deploy(ctx, service, version, dry_run):
    """Deploy SERVICE to VERSION."""
    env = ctx.obj['env']

    if env == 'prod' and not click.confirm(f'Deploy {service}:{version} to PRODUCTION?'):
        raise click.Abort()

    console.print(f"[bold green]Deploying {service}:{version} to {env}[/]")

    if not dry_run:
        result = subprocess.run(
            ['kubectl', 'set', 'image', f'deployment/{service}',
             f'{service}=registry.io/{service}:{version}', '-n', env],
            capture_output=True, text=True, check=True
        )
        console.print(f"[green]✓[/] {result.stdout.strip()}")

@cli.command('list')
@click.pass_context
def list_services(ctx):
    """List all deployed services."""
    # Get from Kubernetes
    table = Table("Service", "Version", "Replicas", "Status")
    # ... populate from k8s API ...
    console.print(table)

if __name__ == '__main__':
    cli(obj={})
```
