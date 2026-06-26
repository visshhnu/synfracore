# Python for DevOps — Automation, APIs & Cloud SDKs

 return type declaration. Parameters can have **default values**. This is how you show code organisation and reusability in a Berribot coding round.

### Interview Tip
> "I structure all my DevOps scripts with functions — one function per task. Makes scripts testable, reusable, and readable. The `main` block at the bottom calls them in order."

```python
# Basic function
def deploy(app_name, env="dev"):
    print(f"Deploying {app_name} to {env}")
    return f"{app_name}:{env} deployed successfully"

# Call with positional args
result = deploy("telecom-sro", "production")
print(result)

# Call with keyword args (order doesn't matter)
result = deploy(env="staging", app_name="telecom-sd")

# Function with multiple return values (returns a tuple)
def get_deploy_status(app):
    status  = "healthy"
    version = "v2.1.0"
    return status, version

status, version = get_deploy_status("sro")

# Function accepting a list
def get_healthy_servers(servers):
    """Return list of server names where status is 'up'."""
    healthy = []
    for s in servers:
        if s.get("status") == "up":
            healthy.append(s["name"])
    return healthy

# Same with list comprehension
def get_healthy_servers_v2(servers):
    return [s["name"] for s in servers if s.get("status") == "up"]

# *args — accept any number of positional arguments
def notify(*channels):
    for ch in channels:
        print(f"Sending notification to {ch}")
notify("slack", "email", "pagerduty")

# **kwargs — accept any number of keyword arguments
def create_tag(**tags):
    return {k: v for k, v in tags.items()}
tag = create_tag(environment="prod", team="devops", project="telecom")

# Docstring — always add for DevOps scripts
def check_pod_health(namespace, pod_name):
    """
    Check if a pod is in Running state.
    Args:
        namespace (str): Kubernetes namespace
        pod_name  (str): Name of the pod
    Returns:
        bool: True if Running, False otherwise
    """
    # implementation here
    pass
```

### Berribot Questions
**Q: How do you give a function parameter a default value?**
> A: `def deploy(app, env="dev"):` — put the default after `=` in the parameter. If the caller doesn't pass `env`, it defaults to "dev". Default parameters must come after non-default ones.

**Q: What does `*args` mean in Python?**
> A: `*args` lets a function accept any number of positional arguments — they arrive as a tuple. Useful for DevOps functions like `notify("slack", "email")` where the number of channels varies. Similarly `**kwargs` accepts any number of keyword arguments as a dictionary.

**Q: Why should you always write docstrings for DevOps scripts?**
> A: Docstrings document what a function does, its arguments, and return values. In a team environment, other engineers (or your future self) need to understand scripts without reading every line. Also, Python's `help()` function and IDE tools display docstrings — makes collaboration easier.

---

## Topic 4 — OS Commands & File Operations

### Key Concept
The `os`, `subprocess`, and `pathlib` modules let Python run shell commands and work with the file system. **This is the core of DevOps scripting** — Berribot will test this.

### Interview Tip
> "I use subprocess for running kubectl, oc, and helm commands from Python scripts. Always capture output — never use os.system() as it doesn't capture output and is harder to test."

```python
import os
import subprocess
import pathlib

# ── subprocess — run shell commands ──────────────────────
# Run command and capture output
result = subprocess.run(
    ["kubectl", "get", "pods", "-n", "telecom-prod"],
    capture_output=True,
    text=True           # decode bytes to string
)
print(result.stdout)    # command output
print(result.stderr)    # error output (if any)
print(result.returncode)  # 0 = success, non-zero = error

# Check success
if result.returncode != 0:
    print(f"Command failed: {result.stderr}")
else:
    print("Pods retrieved successfully")

# Run with shell=True (use for complex shell expressions)
result = subprocess.run(
    "kubectl get pods | grep -v Running",
    shell=True, capture_output=True, text=True
)

# ── os.environ — environment variables ──────────────────
APP_ENV  = os.environ.get("APP_ENV", "dev")       # with default
APP_PORT = os.environ.get("APP_PORT")              # None if missing
TOKEN    = os.environ.get("API_TOKEN")
if not TOKEN:
    raise ValueError("API_TOKEN environment variable not set")

# Set environment variable for child processes
os.environ["KUBECONFIG"] = "/home/vishnu/.kube/config"

# ── File and directory operations ────────────────────────
# Check existence
if os.path.exists("/etc/config/app.yaml"):
    print("Config found")

# Use pathlib (modern, recommended)
config_path = pathlib.Path("/etc/config/app.yaml")
if config_path.exists():
    content = config_path.read_text()

# Create directory (exist_ok prevents error if already exists)
os.makedirs("/tmp/deployment/logs", exist_ok=True)

# List directory contents
for filename in os.listdir("/var/log/app"):
    if filename.endswith(".log"):
        print(f"Log file: {filename}")

# Read a file
with open("/etc/config/app.yaml", "r") as f:
    content = f.read()

# Write a file
with open("/tmp/deploy-report.txt", "w") as f:
    f.write(f"Deployment completed at {os.popen('date').read()}")

# Append to a file (log entries)
with open("/var/log/deploy.log", "a") as f:
    f.write("Deployment succeeded\n")

# ── JSON handling — critical for API responses ───────────
import json

# Parse JSON string
response_text = '{"status": "Running", "restarts": 0}'
data = json.loads(response_text)
print(data["status"])   # Running

# Parse JSON file
with open("config.json", "r") as f:
    config = json.load(f)

# Write JSON
with open("report.json", "w") as f:
    json.dump({"status": "ok", "pods": 50}, f, indent=2)
```

### Berribot Questions
**Q: How do you run a shell command from Python and check if it succeeded?**
```python
result = subprocess.run(["oc", "rollout", "status", "deployment/sro"],
                        capture_output=True, text=True)
if result.returncode == 0:
    print("Rollout successful")
else:
    print(f"Rollout failed: {result.stderr}")
    sys.exit(1)
```

**Q: What is the difference between `subprocess.run()` and `os.system()`?**
> A: `os.system()` runs the command and only returns the exit code — you cannot capture the output. `subprocess.run()` captures both stdout and stderr, gives you the return code, and is much more flexible. In DevOps scripts you almost always need the output, so `subprocess.run()` with `capture_output=True` is the standard choice.

**Q: How do you read environment variables in Python and why is that important for CI/CD?**
> A: `os.environ.get("VAR_NAME", "default")`. In CI/CD, Jenkins injects secrets and config as environment variables — the script reads them at runtime rather than having values hardcoded. This keeps secrets out of code and lets the same script run in dev, test, and prod by just changing the environment variables.

---

## Topic 5 — Error Handling

### Key Concept
`try/except/finally` — handles errors gracefully without crashing the script. **Critical for production DevOps scripts** — a network timeout or API error should not kill an entire deployment pipeline.

```python
import subprocess
import sys

# Basic try/except
try:
    result = subprocess.run(
        ["kubectl", "get", "pods", "-n", "telecom-prod"],
        capture_output=True, text=True, timeout=30
    )
    result.check_returncode()   # raises CalledProcessError if non-zero
    print(result.stdout)
except subprocess.TimeoutExpired:
    print("ERROR: kubectl command timed out after 30 seconds")
    sys.exit(1)
except subprocess.CalledProcessError as e:
    print(f"ERROR: Command failed with code {e.returncode}: {e.stderr}")
    sys.exit(1)
except FileNotFoundError:
    print("ERROR: kubectl not found — is it installed and in PATH?")
    sys.exit(1)
except Exception as e:
    print(f"Unexpected error: {e}")
    raise
finally:
    print("Health check complete")  # always runs

# Custom exceptions
class DeploymentError(Exception):
    """Raised when a deployment fails."""
    pass

def deploy_to_ocp(app, namespace):
    result = subprocess.run(
        ["oc", "rollout", "status", f"deployment/{app}", "-n", namespace],
        capture_output=True, text=True, timeout=300
    )
    if result.returncode != 0:
        raise DeploymentError(f"Deployment of {app} failed: {result.stderr}")
    return True

# context manager (with statement) — auto-close resources
with open("deploy.log", "a") as log:
    log.write("Deployment started\n")
# file auto-closed even if exception occurs
```

### Berribot Questions
**Q: Why is error handling critical in DevOps scripts?**
> A: In production automation, many things can go wrong — network timeouts, API rate limits, missing files, permission errors. Without `try/except`, any error crashes the entire script silently or with a confusing traceback. Proper error handling lets you: log the specific error, clean up resources in `finally`, exit with a meaningful code (sys.exit(1) tells Jenkins the step failed), and potentially retry transient failures.

**Q: What is the `finally` block and when does it run?**
> A: `finally` runs regardless of whether an exception occurred or not — even if the `try` block succeeded. Use it for cleanup: closing files, releasing locks, sending a notification that the script finished (whether it succeeded or failed). In a deployment script: `finally` block sends a Slack notification with the result.

---

## Topic 6 — Complete DevOps Script (Full Example)

### Key Concept
Berribot may ask you to write a complete script from scratch. This is the template to memorise — `imports → constants → functions → main block`. Every professional Python script follows this structure.

```python
#!/usr/bin/env python3
"""
OCP Pod Health Check Script
Checks all pods in a namespace and reports unhealthy ones.
Usage: python3 health_check.py --namespace telecom-prod
"""

import subprocess
import json
import os
import sys
import argparse
import time
from datetime import datetime

# ── Constants ────────────────────────────────────────────
VERSION     = "1.0.0"
HEALTHY     = ["Running", "Succeeded"]
MAX_RETRIES = 3

# ── Helper functions ─────────────────────────────────────
def get_pods(namespace):
    """Retrieve all pods in a namespace as a list of dicts."""
    result = subprocess.run(
        ["kubectl", "get", "pods", "-n", namespace, "-o", "json"],
        capture_output=True, text=True, timeout=30
    )
    if result.returncode != 0:
        raise RuntimeError(f"Failed to get pods: {result.stderr}")
    return json.loads(result.stdout)["items"]

def check_health(pods):
    """Classify pods into healthy and unhealthy lists."""
    healthy, unhealthy = [], []
    for pod in pods:
        name   = pod["metadata"]["name"]
        phase  = pod["status"].get("phase", "Unknown")
        if phase in HEALTHY:
            healthy.append(name)
        else:
            unhealthy.append({"name": name, "phase": phase})
    return healthy, unhealthy

def send_alert(message, webhook_url=None):
    """Send alert to Slack or print to stdout."""
    webhook_url = webhook_url or os.environ.get("SLACK_WEBHOOK")
    if webhook_url:
        import urllib.request
        data = json.dumps({"text": message}).encode()
        req  = urllib.request.Request(webhook_url, data=data,
                                      headers={"Content-Type": "application/json"})
        urllib.request.urlopen(req)
    else:
        print(f"[ALERT] {message}")

def write_report(namespace, healthy, unhealthy, output_path="/tmp/health-report.json"):
    """Write health check results to a JSON file."""
    report = {
        "timestamp":  datetime.utcnow().isoformat() + "Z",
        "namespace":  namespace,
        "healthy":    len(healthy),
        "unhealthy":  len(unhealthy),
        "failed_pods": unhealthy
    }
    with open(output_path, "w") as f:
        json.dump(report, f, indent=2)
    print(f"Report written to {output_path}")
    return report

# ── Main block ───────────────────────────────────────────
if __name__ == "__main__":
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description="OCP Pod Health Checker")
    parser.add_argument("--namespace", "-n", required=True, help="Kubernetes namespace")
    parser.add_argument("--output",    "-o", default="/tmp/health-report.json")
    args = parser.parse_args()

    print(f"=== Pod Health Check v{VERSION} ===")
    print(f"Namespace : {args.namespace}")
    print(f"Timestamp : {datetime.utcnow().isoformat()}Z")
    print()

    try:
        pods = get_pods(args.namespace)
        healthy, unhealthy = check_health(pods)

        print(f"Total pods : {len(pods)}")
        print(f"Healthy    : {len(healthy)}")
        print(f"Unhealthy  : {len(unhealthy)}")

        if unhealthy:
            print("\nFailed pods:")
            for pod in unhealthy:
                print(f"  - {pod['name']:40s}  {pod['phase']}")
            send_alert(f"ALERT: {len(unhealthy)} unhealthy pods in {args.namespace}: "
                       f"{[p['name'] for p in unhealthy]}")

        write_report(args.namespace, healthy, unhealthy, args.output)

        # Exit with error code if any pods unhealthy — Jenkins detects this
        sys.exit(1 if unhealthy else 0)

    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        sys.exit(1)
```

### Berribot Questions
**Q: What does `if __name__ == "__main__":` mean?**
> A: It means "only run this block if this file is executed directly, not when imported as a module." It's the standard entry point for Python scripts. When Jenkins runs `python3 health_check.py`, `__name__` equals `"__main__"` and the block executes. When another script imports it (`import health_check`), the block is skipped — allowing the functions to be reused without triggering execution.

**Q: What does `sys.exit(1)` do and why is it important in CI/CD?**
> A: `sys.exit(1)` exits the Python script with exit code 1 (failure). Jenkins, shell scripts, and Ansible check the exit code of every command — exit code 0 = success, non-zero = failure. Without `sys.exit(1)`, a Python script that detects a problem but exits normally (code 0) would mislead the pipeline into thinking everything is fine.

**Q: How would you parse command-line arguments in a Python script?**
> A: Use `argparse` — Python's built-in CLI argument parser. `parser.add_argument("--namespace", required=True)` defines a required argument. `args = parser.parse_args()` reads them. Gives automatic `--help` documentation and validation. This is the professional way — not `sys.argv[1]` which is fragile.

---

## Topic 7 — REST APIs in Python

### Key Concept
DevOps engineers frequently call REST APIs — Kubernetes API, cloud provider APIs, monitoring APIs. Python's `requests` library (or `urllib` built-in) handles this. Berribot may test this for cloud integration scripts.

```python
import requests
import json
import os

# GET request — retrieve data
response = requests.get(
    "https://api.example.com/v1/deployments",
    headers={"Authorization": f"Bearer {os.environ['API_TOKEN']}"},
    timeout=10
)
response.raise_for_status()   # raises HTTPError for 4xx/5xx
data = response.json()        # parse JSON response

# POST request — create resource
payload = {
    "name": "telecom-sro",
    "image": "nexus.internal/sro:v2.1.0",
    "replicas": 3
}
response = requests.post(
    "https://api.example.com/v1/deployments",
    json=payload,             # auto-serialises dict to JSON + sets Content-Type
    headers={"Authorization": f"Bearer {os.environ['API_TOKEN']}"},
    timeout=30
)
response.raise_for_status()
created = response.json()
print(f"Created deployment: {created['id']}")

# Error handling for API calls
def call_api(url, method="GET", payload=None):
    """Generic API caller with error handling."""
    token = os.environ.get("API_TOKEN")
    headers = {"Authorization": f"Bearer {token}", "Content-Type": "application/json"}
    try:
        if method == "GET":
            resp = requests.get(url, headers=headers, timeout=10)
        elif method == "POST":
            resp = requests.post(url, json=payload, headers=headers, timeout=30)
        resp.raise_for_status()
        return resp.json()
    except requests.exceptions.Timeout:
        print(f"API call to {url} timed out")
        return None
    except requests.exceptions.HTTPError as e:
        print(f"HTTP error {e.response.status_code}: {e.response.text}")
        return None
    except requests.exceptions.ConnectionError:
        print(f"Cannot connect to {url}")
        return None
```

### Berribot Questions
**Q: How do you handle API authentication in Python scripts?**
> A: Read the token from environment variables: `os.environ.get("API_TOKEN")` — never hardcode. Pass it in the Authorization header: `headers={"Authorization": f"Bearer {token}"}`. This follows the same principle as Jenkins `withCredentials{}` — secrets injected at runtime, not stored in code.

**Q: What does `response.raise_for_status()` do?**
> A: It checks if the HTTP response was successful (2xx). If the server returned 4xx (client error) or 5xx (server error), it raises an `HTTPError` exception. Without it, a `requests.get()` call succeeds even if the server returned a 404 — the script would continue processing an empty or error response. Always call it immediately after the request.

---

## Topic 8 — Python + Boto3 (AWS) and Azure SDK

### Key Concept
Cloud SDKs let Python scripts interact with AWS and Azure programmatically — list EC2 instances, manage S3, check EKS status. Shows cloud + Python integration depth.

```python
# ── AWS — boto3 ──────────────────────────────────────────
import boto3

# EC2 — list running instances
ec2 = boto3.client("ec2", region_name="us-east-1")
response = ec2.describe_instances(
    Filters=[{"Name": "instance-state-name", "Values": ["running"]}]
)
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        print(f"Instance: {instance['InstanceId']} — {instance['InstanceType']}")

# S3 — upload a file
s3 = boto3.client("s3")
s3.upload_file("deploy-report.json", "my-bucket", "reports/deploy-report.json")

# S3 — list objects
paginator = s3.get_paginator("list_objects_v2")
for page in paginator.paginate(Bucket="my-bucket", Prefix="reports/"):
    for obj in page.get("Contents", []):
        print(obj["Key"])

# ── Azure — azure-identity + azure-mgmt ──────────────────
from azure.identity import DefaultAzureCredential
from azure.mgmt.containerservice import ContainerServiceClient

credential = DefaultAzureCredential()  # uses Managed Identity in AKS
aks_client  = ContainerServiceClient(credential, subscription_id)
cluster     = aks_client.managed_clusters.get(resource_group, cluster_name)
print(f"AKS cluster state: {cluster.provisioning_state}")
```

### Berribot Questions
**Q: What is boto3 and how do you authenticate to AWS using it?**
> A: boto3 is the official AWS SDK for Python. Authentication is handled by the AWS credentials chain — in CI/CD on EC2/EKS, it uses the IAM Role attached to the instance automatically (no keys needed). Locally it reads `~/.aws/credentials`. Best practice: always use IAM Roles, never hardcode `aws_access_key_id` in scripts.

---

## Quick Reference — Python Syntax Cheatsheet

| Concept | Syntax |
|---|---|
| Variable | `name = "value"` |
| F-string | `f"Hello {name}"` |
| List | `items = ["a", "b", "c"]` |
| Dict | `d = {"key": "value"}` |
| Safe dict read | `d.get("key", "default")` |
| For loop | `for item in items:` |
| While loop | `while condition:` |
| Function | `def fn(arg, opt="default"):` |
| Return | `return value` |
| Import | `import os` / `from os import path` |
| Run command | `subprocess.run(["cmd", "arg"], capture_output=True, text=True)` |
| Env var | `os.environ.get("VAR", "default")` |
| Try/except | `try: ... except Exception as e: ...` |
| Read file | `with open("f.txt") as f: content = f.read()` |
| Write file | `with open("f.txt", "w") as f: f.write(text)` |
| Parse JSON | `data = json.loads(text)` |
| HTTP GET | `requests.get(url, headers={...})` |
| Exit with error | `sys.exit(1)` |
| Main block | `if __name__ == "__main__":` |

---

## Interview Answer Framework for Python Questions

When Berribot asks a Python question, structure your answer like this:

1. **State the concept** — "In Python, subprocess.run() lets you execute shell commands..."
2. **Give the syntax** — write the key lines from memory
3. **Connect to your work** — "At HPE I used this to run kubectl commands from our health check scripts that ran as post-deploy verification steps in Jenkins"
4. **Mention the best practice** — "We always used `capture_output=True` rather than `os.system()` so we could check the return code and log the output"

---

*End of Python DevOps Study Guide | B. Vishnu | Wipro Berribot Prep*


# Python for DevOps

DevOps › Python for DevOps
🐍**Python for DevOps**
BeginnerIntermediateAdvancedAutomation scripts — subprocess, APIs, boto3, Kubernetes SDK, production patterns
[Why Python?](#sec-why)[subprocess](#sec-subprocess)[HTTP APIs](#sec-api)[YAML & JSON](#sec-yaml)[boto3 & Azure](#sec-cloud)[Kubernetes SDK](#sec-k8s)[Production Patterns](#sec-patterns)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## 🐍 Why Python for DevOps?›


#### Python is the glue that holds the DevOps world together

Every major DevOps tool — AWS, Kubernetes, Jenkins, GitHub, Terraform — exposes either a Python SDK or a REST API. Shell scripts are great for simple tasks but break down fast when you need to parse JSON, handle errors gracefully, retry on failure, or make HTTP calls. Python handles all of this cleanly.


#### What Python actually does in DevOps

| Task | Without Python | With Python |
|---|---|---|
| Check deployment health | Manual kubectl + grep in Bash | Python polls K8s API, retries, alerts Slack on fail |
| Upload build artifact | AWS CLI in shell script | boto3 with retry, versioning, metadata |
| Trigger downstream jobs | Jenkins UI click | Python calls Jenkins REST API from pipeline |
| Parse Terraform output | jq in shell (complex) | json.loads() in 2 lines |
| Post-deploy smoke test | curl in loop | Python with retry, timeout, proper error handling |
| Scale down dev at night | Manual | Cron calls Python → K8s SDK → scales to 0 |


**💡 Key Insight**You don't need to be a Python developer. You need to write clean automation scripts confidently. Knowing subprocess, requests, boto3, and the kubernetes SDK covers 90% of DevOps Python use cases.


Python for DevOps — overview and essential librariesCopy

```

```


## ⚙️ subprocess — Run Shell Commands›


#### The most used Python module in DevOps

`subprocess.run()` lets you run any shell command and capture the output. This is how Python scripts wrap kubectl, helm, terraform, docker — any CLI tool you use.


**🧠 Memory Tip — subprocess vs os.system**os.system() runs the command but you cannot read the output. subprocess.run() with capture_output=True gives you stdout, stderr, and return code. Always use subprocess.run().

#### The pattern you use every time

```
result = subprocess.run(["cmd", "arg1", "arg2"], capture_output=True, text=True, timeout=30)
if result.returncode != 0:
print(result.stderr)  # Show what went wrong
sys.exit(1)
print(result.stdout)      # Use the output
```


subprocess — kubectl, terraform, docker, helmCopy

```

```


## 🌐 HTTP APIs — Talking to DevOps Tools›


#### Every DevOps tool has a REST API

Jenkins, GitHub, Kubernetes, PagerDuty, Slack — they all expose HTTP endpoints. Python's `requests` library lets you call them in a few lines. This is how you build integrations between tools that have no native connection.


**Real Use Case — HPE**After a Helm deployment to OpenShift, a Python script called the Jenkins API to retrieve the build number, called the GitHub API to create a release tag, and posted to Slack with the deployment summary — all in one 50-line script replacing what previously required three manual steps by three different people.


Jenkins, GitHub, Kubernetes, Slack, PagerDuty APIsCopy

```

```


## 📄 YAML & JSON — The Infrastructure Language›


#### All infrastructure is defined in YAML or JSON

Kubernetes manifests, Helm values, Ansible playbooks, GitHub Actions workflows — everything is YAML. Python reads and writes YAML in a few lines. This is how you build dynamic config generation, environment promotion scripts, and manifest patching tools.


**⚠️ Watch out**Always use yaml.safe_load() — never yaml.load(). The load() function can execute arbitrary code if given malicious input. safe_load() only loads data structures.


## ☁️ Cloud SDKs — boto3 & Azure›


#### AWS boto3 — the most important DevOps library

boto3 lets Python control every AWS service. EC2, S3, EKS, CloudWatch, SSM — all available as Python objec
