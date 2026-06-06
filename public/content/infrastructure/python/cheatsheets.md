# Python DevOps Cheat Sheet

## Quick Reference

```python
# File I/O
Path("f.txt").read_text()
Path("f.txt").write_text("data")
json.loads(text) / json.dumps(obj, indent=2)
yaml.safe_load(text) / yaml.dump(obj)

# Shell commands
subprocess.run(["cmd", "arg"], check=True, capture_output=True, text=True)

# HTTP
requests.get(url, headers={}, timeout=30).raise_for_status()
requests.post(url, json=payload).json()

# Environment variables
import os
os.environ.get("API_KEY", "default")
```

## boto3 One-Liners

```python
import boto3

# List S3 buckets
[b["Name"] for b in boto3.client("s3").list_buckets()["Buckets"]]

# Get EC2 instances
boto3.client("ec2").describe_instances()["Reservations"]

# Get SSM parameter
boto3.client("ssm").get_parameter(Name="/app/db-password", WithDecryption=True)["Parameter"]["Value"]

# Send to SQS
boto3.client("sqs").send_message(QueueUrl=url, MessageBody=json.dumps(msg))

# Invoke Lambda
boto3.client("lambda").invoke(FunctionName="my-func", Payload=json.dumps(event))
```

## Useful Patterns

```python
# Read .env file
from dotenv import load_dotenv
load_dotenv()

# Parallel execution
from concurrent.futures import ThreadPoolExecutor
with ThreadPoolExecutor(max_workers=10) as ex:
    results = list(ex.map(process_instance, instance_ids))

# Parse logs
import re
pattern = re.compile(r'(\d+\.\d+\.\d+\.\d+) .* "(\w+) (\S+) HTTP.*" (\d+)')
for line in open("/var/log/nginx/access.log"):
    if m := pattern.match(line):
        ip, method, path, status = m.groups()

# Context manager
from contextlib import contextmanager
@contextmanager
def temp_dir():
    path = Path(tempfile.mkdtemp())
    try:
        yield path
    finally:
        shutil.rmtree(path)
```

## argparse CLI Template

```python
import argparse, sys

def main():
    parser = argparse.ArgumentParser(description="DevOps tool")
    parser.add_argument("command", choices=["deploy", "rollback", "status"])
    parser.add_argument("--env", required=True, choices=["dev", "staging", "prod"])
    parser.add_argument("--version", default="latest")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    if args.command == "deploy":
        deploy(args.env, args.version, args.dry_run)

if __name__ == "__main__":
    main()
```
