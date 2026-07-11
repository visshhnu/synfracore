# Python for DevOps — Fundamentals

## Why dictionaries are the most important data type here

Almost every API a DevOps engineer touches — Kubernetes, AWS, Azure, GCP — returns JSON, and Python's `dict` maps onto JSON directly and naturally. Getting genuinely comfortable with nested dict access and dict comprehensions pays off across virtually every real automation script you'll write:

```python
pod = {"metadata": {"name": "web-1", "labels": {"app": "web"}}, "status": {"phase": "Running"}}

name = pod["metadata"]["name"]                    # nested access
is_running = pod["status"]["phase"] == "Running"

# dict comprehension — extract a specific field from a list of API objects
pod_names = [p["metadata"]["name"] for p in pods_response["items"]]
running_pods = {p["metadata"]["name"]: p["status"]["phase"] for p in pods_response["items"] if p["status"]["phase"] == "Running"}
```

Using `.get()` with a default, rather than direct key access, avoids a common real crash source: an API response field that's usually present but occasionally missing.

```python
namespace = pod.get("metadata", {}).get("namespace", "default")
```

## `f-strings`: the standard way to build strings from data

```python
service_name = "payment-api"
replicas = 3
print(f"Scaling {service_name} to {replicas} replicas")
print(f"Memory usage: {mem_bytes / 1024 / 1024:.1f} MB")   # inline formatting
```
f-strings are both more readable and faster than older `%`-formatting or `.format()` calls — the default choice for any string construction in modern Python DevOps code.

## Functions and error handling — scripts that don't crash on the first hiccup

```python
import time

def get_pod_status(api_client, name, namespace, max_retries=3):
    for attempt in range(max_retries):
        try:
            return api_client.read_namespaced_pod(name, namespace).status.phase
        except ApiException as e:
            if e.status == 404:
                raise  # don't retry a genuine "doesn't exist" — retrying won't fix that
            if attempt == max_retries - 1:
                raise
            time.sleep(2 ** attempt)  # exponential backoff
```

**Automation scripts must handle failures gracefully — this is not optional polish.** A script that crashes on the first transient network blip, with no retry logic, is a script that will page someone at 2am for a problem that would have resolved itself on the second attempt. Catching specific exception types (not a bare `except:`) matters too — a bare except silently swallows genuinely unexpected errors (a typo, a logic bug) alongside the transient ones you actually meant to retry past.

## `subprocess`: running shell commands from Python, correctly

```python
import subprocess

result = subprocess.run(
    ["kubectl", "get", "pods", "-n", "production", "-o", "json"],
    capture_output=True, text=True, timeout=30
)
if result.returncode != 0:
    raise RuntimeError(f"kubectl failed: {result.stderr}")
```

Pass the command as a **list of arguments**, not a single shell string — this avoids shell injection risk entirely (no shell is even invoked to interpret special characters) and sidesteps a whole class of quoting bugs. Always set a `timeout` — an automation script waiting indefinitely on a hung subprocess is a common, real cause of stuck pipelines.

## `pathlib` over `os.path`

```python
from pathlib import Path

config_dir = Path("/etc/myapp")
config_file = config_dir / "config.yaml"     # path joining via `/`, not string concatenation
if config_file.exists():
    content = config_file.read_text()
```
`pathlib`'s object-oriented API is more readable and less error-prone than manually joining path strings with `os.path.join` — the modern default for any new Python code touching the filesystem.

## Parsing structured data directly — never regex on JSON/YAML

```python
import json, yaml

data = json.loads(response_text)
config = yaml.safe_load(open("config.yaml"))   # safe_load, not load — avoids arbitrary code execution risk
```
Reaching for regex to extract a field from JSON or YAML is a common beginner mistake — both formats have mature, standard-library-adjacent parsers that handle edge cases (escaped characters, nested structures) regex will not. Use `yaml.safe_load`, not the bare `yaml.load`, unless you specifically need to deserialize arbitrary Python objects (which introduces a real code-execution risk if the YAML source isn't fully trusted).
