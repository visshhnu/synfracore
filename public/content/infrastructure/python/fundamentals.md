# Python Fundamentals for DevOps

## File Operations

```python
import os
import json
import yaml
from pathlib import Path

# Path operations (use pathlib, not os.path)
p = Path("/var/log/nginx")
p.exists()                     # Check existence
p.is_dir()                     # Is directory
p.mkdir(parents=True, exist_ok=True)  # Create with parents

# List files
for f in Path("/var/log").glob("*.log"):
    print(f.name, f.stat().st_size)

# Read / Write
text = Path("config.txt").read_text()
Path("output.txt").write_text("hello")

# JSON
with open("config.json") as f:
    config = json.load(f)

with open("output.json", "w") as f:
    json.dump(data, f, indent=2)

# YAML (pip install pyyaml)
with open("docker-compose.yml") as f:
    compose = yaml.safe_load(f)

with open("k8s-deploy.yaml", "w") as f:
    yaml.dump(manifest, f, default_flow_style=False)
```

## Subprocess — Run Shell Commands

```python
import subprocess

# Simple run
result = subprocess.run(
    ["kubectl", "get", "pods", "-n", "production"],
    capture_output=True,
    text=True,
    check=True        # Raises exception on non-zero exit
)
print(result.stdout)

# With shell (use sparingly)
result = subprocess.run(
    "kubectl get pods | grep Running | wc -l",
    shell=True, capture_output=True, text=True
)
print(f"Running pods: {result.stdout.strip()}")

# Stream output in real time
process = subprocess.Popen(
    ["terraform", "apply", "-auto-approve"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="")
process.wait()
if process.returncode != 0:
    raise Exception(f"Terraform failed: {process.returncode}")
```

## HTTP Requests — APIs & Webhooks

```python
import requests
import json

# GET request
response = requests.get(
    "https://api.github.com/repos/kubernetes/kubernetes",
    headers={"Authorization": f"token {github_token}"},
    timeout=30
)
response.raise_for_status()  # Raise on 4xx/5xx
repo = response.json()
print(f"Stars: {repo['stargazers_count']}")

# POST — Slack webhook notification
def notify_slack(message: str, webhook_url: str):
    payload = {
        "text": message,
        "attachments": [{
            "color": "good",
            "fields": [{"title": "Environment", "value": "Production", "short": True}]
        }]
    }
    response = requests.post(webhook_url, json=payload, timeout=10)
    response.raise_for_status()

# Retry logic with tenacity
from tenacity import retry, stop_after_attempt, wait_exponential

@retry(stop=stop_after_attempt(3), wait=wait_exponential(multiplier=1, min=2, max=10))
def call_api(url: str) -> dict:
    response = requests.get(url, timeout=30)
    response.raise_for_status()
    return response.json()
```

## boto3 — AWS Automation

```python
import boto3
from botocore.exceptions import ClientError

# Session setup
session = boto3.Session(
    region_name="us-east-1",
    profile_name="production"  # uses ~/.aws/credentials
)

# EC2 Operations
ec2 = session.resource("ec2")
ec2_client = session.client("ec2")

# List running instances
instances = ec2.instances.filter(
    Filters=[{"Name": "instance-state-name", "Values": ["running"]}]
)
for instance in instances:
    name = next((t["Value"] for t in instance.tags or [] if t["Key"] == "Name"), "unnamed")
    print(f"{instance.id} | {instance.instance_type} | {name}")

# S3 Operations
s3 = session.client("s3")

# Upload file
s3.upload_file(
    Filename="/tmp/backup.tar.gz",
    Bucket="my-backups",
    Key=f"backups/2024/{backup_name}.tar.gz",
    ExtraArgs={"ServerSideEncryption": "AES256"}
)

# Download
s3.download_file("my-backups", "backups/2024/latest.tar.gz", "/tmp/restore.tar.gz")

# List objects
paginator = s3.get_paginator("list_objects_v2")
for page in paginator.paginate(Bucket="my-bucket", Prefix="logs/"):
    for obj in page.get("Contents", []):
        print(obj["Key"], obj["Size"])

# Error handling
try:
    s3.head_object(Bucket="my-bucket", Key="missing-file.txt")
except ClientError as e:
    if e.response["Error"]["Code"] == "404":
        print("File not found")
    else:
        raise
```

## Click — Build CLI Tools

```python
import click
import boto3

@click.group()
@click.option("--region", default="us-east-1", help="AWS region")
@click.option("--profile", default=None, help="AWS profile")
@click.pass_context
def cli(ctx, region, profile):
    """SynfraCore infrastructure CLI."""
    ctx.ensure_object(dict)
    ctx.obj["session"] = boto3.Session(region_name=region, profile_name=profile)

@cli.command()
@click.argument("env", type=click.Choice(["dev", "staging", "prod"]))
@click.option("--dry-run", is_flag=True, help="Don't actually stop")
@click.pass_context
def stop_instances(ctx, env, dry_run):
    """Stop all EC2 instances in an environment."""
    ec2 = ctx.obj["session"].resource("ec2")
    instances = ec2.instances.filter(
        Filters=[
            {"Name": "tag:Environment", "Values": [env]},
            {"Name": "instance-state-name", "Values": ["running"]}
        ]
    )
    count = 0
    for instance in instances:
        if dry_run:
            click.echo(f"[DRY RUN] Would stop: {instance.id}")
        else:
            instance.stop()
            click.echo(f"Stopped: {instance.id}")
        count += 1
    click.echo(click.style(f"\nTotal: {count} instances", fg="green"))

if __name__ == "__main__":
    cli()

# Usage:
# python tool.py --region us-west-2 stop-instances staging --dry-run
```

## Error Handling & Logging

```python
import logging
import sys
from functools import wraps

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(levelname)-8s | %(name)s | %(message)s",
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler("/var/log/myapp.log"),
    ]
)
logger = logging.getLogger(__name__)

# Decorator for retrying
def retry(times=3, exceptions=(Exception,)):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(times):
                try:
                    return func(*args, **kwargs)
                except exceptions as e:
                    if attempt == times - 1:
                        logger.error(f"{func.__name__} failed after {times} attempts: {e}")
                        raise
                    logger.warning(f"{func.__name__} attempt {attempt+1} failed: {e}. Retrying...")
        return wrapper
    return decorator

@retry(times=3, exceptions=(requests.Timeout, requests.ConnectionError))
def fetch_metrics(endpoint: str) -> dict:
    response = requests.get(endpoint, timeout=5)
    response.raise_for_status()
    return response.json()
```
