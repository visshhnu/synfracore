# Python for DevOps — Interview Questions

## Beginner Questions

**What makes Python good for DevOps automation?**
Python is the scripting language of DevOps for several reasons: extensive library ecosystem (boto3 for AWS, kubernetes client, paramiko for SSH, requests for HTTP), readable syntax that non-developers can understand, cross-platform, pre-installed on most Linux systems, powerful for data processing (parsing logs, JSON/YAML), and it's the language Ansible modules are written in. When shell scripts get complex (>20 lines with error handling), Python is almost always the better choice.

---

**What is the difference between `os` and `subprocess` for running shell commands?**
`os.system()` runs a command and returns the exit code only — you can't capture output. `subprocess` is the modern approach giving full control: capture stdout/stderr, get exit code, set environment variables, stream output, and more. Always use `subprocess.run()` (Python 3.5+):

```python
import subprocess

# Basic run
result = subprocess.run(["kubectl", "get", "pods"], capture_output=True, text=True, check=True)
print(result.stdout)

# check=True raises CalledProcessError if exit code != 0
# capture_output=True captures stdout and stderr
# text=True returns strings instead of bytes
```

---

**How do you read and write YAML files in Python?**

```python
import yaml

# Read
with open("deployment.yaml") as f:
    config = yaml.safe_load(f)   # safe_load prevents code execution
    
# Multiple documents in one file
with open("multi.yaml") as f:
    docs = list(yaml.safe_load_all(f))

# Write
data = {"replicas": 3, "image": "myapp:1.0"}
with open("output.yaml", "w") as f:
    yaml.dump(data, f, default_flow_style=False)
```

---

## Intermediate Questions

**How do you handle errors properly in Python automation scripts?**

```python
import logging
import sys
from pathlib import Path

# Configure logging first
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler("/var/log/myautomation.log"),
    ]
)
logger = logging.getLogger(__name__)

# Specific exception handling
import boto3
from botocore.exceptions import ClientError, NoCredentialsError

def get_secret(secret_name: str) -> str:
    client = boto3.client("secretsmanager")
    try:
        response = client.get_secret_value(SecretId=secret_name)
        return response["SecretString"]
    except client.exceptions.ResourceNotFoundException:
        logger.error(f"Secret {secret_name} not found")
        raise
    except NoCredentialsError:
        logger.error("AWS credentials not configured")
        sys.exit(1)
    except ClientError as e:
        logger.error(f"AWS error: {e.response['Error']['Code']}")
        raise
```

---

**Write a Python script that checks the health of multiple services.**

```python
import requests
import concurrent.futures
from dataclasses import dataclass
from typing import List

@dataclass
class ServiceHealth:
    name: str
    url: str
    status: str
    status_code: int | None
    response_time_ms: float | None
    error: str | None = None

def check_service(name: str, url: str, timeout: int = 5) -> ServiceHealth:
    import time
    start = time.time()
    try:
        response = requests.get(url, timeout=timeout)
        elapsed = (time.time() - start) * 1000
        status = "healthy" if response.status_code == 200 else "degraded"
        return ServiceHealth(name, url, status, response.status_code, elapsed)
    except requests.Timeout:
        return ServiceHealth(name, url, "unhealthy", None, None, "Timeout")
    except requests.ConnectionError:
        return ServiceHealth(name, url, "unhealthy", None, None, "Connection refused")
    except Exception as e:
        return ServiceHealth(name, url, "unhealthy", None, None, str(e))

def check_all_services(services: dict) -> List[ServiceHealth]:
    with concurrent.futures.ThreadPoolExecutor(max_workers=10) as executor:
        futures = {
            executor.submit(check_service, name, url): name
            for name, url in services.items()
        }
        results = []
        for future in concurrent.futures.as_completed(futures):
            results.append(future.result())
    return results

if __name__ == "__main__":
    services = {
        "API Gateway":    "https://api.myapp.com/health",
        "Auth Service":   "https://auth.myapp.com/health",
        "Payment API":    "https://payments.myapp.com/health",
        "Database Proxy": "https://db-proxy.internal/health",
    }

    results = check_all_services(services)

    unhealthy = [r for r in results if r.status == "unhealthy"]
    for r in results:
        icon = "✅" if r.status == "healthy" else "❌"
        print(f"{icon} {r.name}: {r.status} ({r.response_time_ms:.0f}ms)")

    if unhealthy:
        print(f"\n{len(unhealthy)} services unhealthy!")
        sys.exit(1)
```

---

**How would you write a script to rotate AWS IAM access keys?**

```python
import boto3
import json
from datetime import datetime, timezone, timedelta

def rotate_old_access_keys(max_age_days: int = 90):
    iam = boto3.client("iam")
    
    # List all users
    users = []
    paginator = iam.get_paginator("list_users")
    for page in paginator.paginate():
        users.extend(page["Users"])
    
    for user in users:
        username = user["UserName"]
        
        # Get access keys for this user
        keys = iam.list_access_keys(UserName=username)["AccessKeyMetadata"]
        
        for key in keys:
            age = datetime.now(timezone.utc) - key["CreateDate"]
            
            if age > timedelta(days=max_age_days):
                print(f"Key {key['AccessKeyId']} for {username} is {age.days} days old")
                
                # Create new key first
                new_key = iam.create_access_key(UserName=username)["AccessKey"]
                print(f"Created new key: {new_key['AccessKeyId']}")
                
                # Deactivate old key (don't delete immediately — allow time to update apps)
                iam.update_access_key(
                    UserName=username,
                    AccessKeyId=key["AccessKeyId"],
                    Status="Inactive"
                )
                print(f"Deactivated old key: {key['AccessKeyId']}")
                
                # Log rotation (store new credentials securely)
                print(json.dumps({
                    "user": username,
                    "old_key": key["AccessKeyId"],
                    "new_key": new_key["AccessKeyId"],
                    "rotated_at": datetime.now().isoformat()
                }))

if __name__ == "__main__":
    rotate_old_access_keys(max_age_days=90)
```

---

## Advanced Questions

**How do you write a Python Kubernetes operator?**

```python
import kopf
import kubernetes
from kubernetes import client

# Kopf framework for Kubernetes operators
# pip install kopf kubernetes

@kopf.on.create("mycompany.io", "v1", "myresources")
def on_create(spec, name, namespace, logger, **kwargs):
    """Called when a MyResource CR is created."""
    
    replicas = spec.get("replicas", 1)
    image = spec.get("image", "nginx")
    
    # Create a Deployment for this custom resource
    apps_v1 = client.AppsV1Api()
    deployment = client.V1Deployment(
        metadata=client.V1ObjectMeta(
            name=name,
            namespace=namespace,
            labels={"managed-by": "my-operator"}
        ),
        spec=client.V1DeploymentSpec(
            replicas=replicas,
            selector=client.V1LabelSelector(
                match_labels={"app": name}
            ),
            template=client.V1PodTemplateSpec(
                metadata=client.V1ObjectMeta(labels={"app": name}),
                spec=client.V1PodSpec(
                    containers=[client.V1Container(name=name, image=image)]
                )
            )
        )
    )
    
    apps_v1.create_namespaced_deployment(namespace=namespace, body=deployment)
    logger.info(f"Created deployment for {name} with {replicas} replicas")
    
    return {"deployment": name, "replicas": replicas}

@kopf.on.update("mycompany.io", "v1", "myresources")
def on_update(spec, name, namespace, diff, logger, **kwargs):
    """Called when a MyResource CR is updated."""
    apps_v1 = client.AppsV1Api()
    
    for field, old_val, new_val in diff:
        if field == ("spec", "replicas"):
            # Scale the deployment
            apps_v1.patch_namespaced_deployment_scale(
                name=name,
                namespace=namespace,
                body={"spec": {"replicas": new_val}}
            )
            logger.info(f"Scaled {name} from {old_val} to {new_val}")
```

---

**Design pattern: Context manager for infrastructure operations.**

```python
from contextlib import contextmanager
import boto3

@contextmanager
def maintenance_window(instance_id: str, region: str = "us-east-1"):
    """Context manager that removes instance from load balancer during maintenance."""
    ec2 = boto3.client("ec2", region_name=region)
    elb = boto3.client("elbv2", region_name=region)
    
    # Get target group
    tg_arn = get_target_group_arn(instance_id)
    
    print(f"Removing {instance_id} from load balancer")
    elb.deregister_targets(
        TargetGroupArn=tg_arn,
        Targets=[{"Id": instance_id}]
    )
    
    try:
        yield instance_id     # Do the maintenance work here
    except Exception as e:
        print(f"Maintenance failed: {e}")
        raise
    finally:
        # Always re-add to load balancer, even if maintenance fails
        print(f"Re-adding {instance_id} to load balancer")
        elb.register_targets(
            TargetGroupArn=tg_arn,
            Targets=[{"Id": instance_id}]
        )

# Usage
with maintenance_window("i-1234567890") as instance:
    # Instance is out of load balancer
    run_patch_update(instance)
    run_smoke_test(instance)
# Instance is automatically re-added even if an exception occurred
```

---

**How do you unit test infrastructure code?**

```python
import pytest
from unittest.mock import MagicMock, patch
from my_scripts.ec2_manager import stop_instances_by_tag

def test_stop_instances_by_tag():
    # Mock AWS calls — never hit real AWS in unit tests!
    with patch("boto3.resource") as mock_boto:
        mock_ec2 = MagicMock()
        mock_boto.return_value = mock_ec2
        
        # Create mock instances
        mock_instance = MagicMock()
        mock_instance.id = "i-12345"
        mock_instance.state = {"Name": "running"}
        mock_instance.tags = [{"Key": "Environment", "Value": "staging"}]
        
        mock_ec2.instances.filter.return_value = [mock_instance]
        
        # Call the function
        stopped = stop_instances_by_tag("Environment", "staging")
        
        # Assert
        mock_instance.stop.assert_called_once()
        assert "i-12345" in stopped

def test_stop_instances_skips_production():
    # Ensure we never stop production instances
    with pytest.raises(ValueError, match="Cannot stop production"):
        stop_instances_by_tag("Environment", "production")
```
