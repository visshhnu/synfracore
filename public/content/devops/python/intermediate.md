# Python for DevOps — REST APIs & Cloud SDKs

## `requests`: the primary HTTP tool

```python
import requests

resp = requests.get(
    "https://api.example.com/v1/status",
    headers={"Authorization": f"Bearer {token}"},
    timeout=10,
)
resp.raise_for_status()   # raises on 4xx/5xx instead of silently continuing with bad data
data = resp.json()
```

`raise_for_status()` matters more than it looks — without it, a failed request (a 401, a 500) silently continues into `.json()`, which either errors confusingly on an HTML error page or, worse, succeeds on an unexpected error-response shape and produces subtly wrong downstream behavior.

## Authentication patterns: Bearer tokens and API keys

```python
# Bearer token (common for cloud APIs)
headers = {"Authorization": f"Bearer {token}"}

# API key in header (varies by provider)
headers = {"X-API-Key": api_key}

# Never hardcode either — pull from environment or a secrets manager
import os
token = os.environ["API_TOKEN"]
```

## The Kubernetes Python client — `kubectl`'s underlying API, in code

```python
from kubernetes import client, config

config.load_kube_config()   # or config.load_incluster_config() when running inside a cluster
v1 = client.CoreV1Api()

pods = v1.list_namespaced_pod(namespace="production")
for pod in pods.items:
    print(pod.metadata.name, pod.status.phase)
```

`kubectl` itself is a client over the same REST API this library talks to directly — useful to know precisely, since it means anything you can do with `kubectl`, you can automate directly in Python without shelling out to `kubectl` as a subprocess (which is slower, harder to parse reliably, and more fragile across `kubectl` version differences).

## Handling pagination — a common real API gotcha

```python
def list_all_pods(v1_client, namespace):
    pods = []
    continue_token = None
    while True:
        resp = v1_client.list_namespaced_pod(namespace=namespace, limit=100, _continue=continue_token)
        pods.extend(resp.items)
        continue_token = resp.metadata._continue
        if not continue_token:
            break
    return pods
```

A script that only reads the first page of a paginated API response silently misses data once the real result set grows past the page size — this is a common, quiet bug that only surfaces once a cluster/account grows large enough to hit pagination, well after the script was written and "tested."

## `boto3` (AWS) and `azure-sdk` — cloud provider SDKs

```python
import boto3

ec2 = boto3.client("ec2", region_name="us-east-1")
instances = ec2.describe_instances(Filters=[{"Name": "tag:Environment", "Values": ["production"]}])

for reservation in instances["Reservations"]:
    for instance in reservation["Instances"]:
        print(instance["InstanceId"], instance["State"]["Name"])
```

`boto3` returns raw dicts (not typed objects) for most calls — reinforcing why dict-comfort (Fundamentals) is foundational rather than incidental. Rate limiting is real and needs explicit handling: `boto3` has built-in retry/backoff for throttling errors on many calls, but for high-volume scripts, explicitly configuring retry behavior (`boto3.client("ec2", config=Config(retries={"max_attempts": 5, "mode": "adaptive"}))`) is worth doing deliberately rather than relying on defaults you haven't actually checked.

## Building a genuinely useful automation script: a health-check example

```python
import requests, sys

def check_service(url: str, timeout: int = 5) -> bool:
    try:
        resp = requests.get(url, timeout=timeout)
        return resp.status_code == 200
    except requests.RequestException:
        return False

services = {"api": "https://api.internal/health", "web": "https://web.internal/health"}
failed = [name for name, url in services.items() if not check_service(url)]

if failed:
    print(f"FAILED: {', '.join(failed)}")
    sys.exit(1)   # non-zero exit code — the actual signal a CI/monitoring system checks
print("All services healthy")
```

The `sys.exit(1)` on failure matters as much as the check logic itself — a script that detects a real problem but exits 0 anyway gives whatever's calling it (a cron job, a CI step, a monitoring system) no way to know something's actually wrong.
