# Python for DevOps — Complete Study Guide
**Wipro Berribot Interview Prep | B. Vishnu**
> Level: Zero to Interview-Ready | Focus: DevOps automation scripting

---

## Why Python Matters for DevOps

Python is the #1 scripting language for DevOps automation. Berribot tests it because:
- Infrastructure automation scripts (server checks, deployments)
- REST API integrations (call Kubernetes API, cloud APIs)
- CI/CD pipeline helper scripts
- Log parsing and alerting
- Cloud SDK automation (boto3 for AWS, azure-sdk for Azure)

You do NOT need to be a Python developer. You need to write clean automation scripts confidently.

---

## Topic 1 — Variables, Data Types & F-Strings

### Key Concept
Python has **no type declarations**. Variables are created by assignment. The most important data types for DevOps are: `str`, `int`, `bool`, `list`, `dict`.

### Interview Tip
> "In DevOps scripts I use dictionaries heavily — they map directly to JSON API responses from Kubernetes, AWS, and Azure APIs."

```python
# Variables — no keyword needed
name       = "Vishnu"
years      = 11
is_devops  = True
pi         = 3.14

# F-strings — most common in DevOps scripts (Python 3.6+)
env        = "production"
print(f"Deploying to {env} — engineer: {name}")

# List — ordered, mutable collection
tools = ["Jenkins", "OpenShift", "Terraform", "Ansible"]
print(tools[0])      # Jenkins
print(tools[-1])     # Ansible (last item)
print(tools[1:3])    # ['OpenShift', 'Terraform'] (slice)
tools.append("ArgoCD")
tools.remove("Ansible")

# Dictionary — key-value store (like JSON)
server = {
    "host":   "10.0.0.1",
    "port":   8080,
    "env":    "prod",
    "active": True
}
print(server["env"])              # prod
print(server.get("region", "N/A")) # safe get with default

# Nested dictionary — common in K8s/cloud API responses
pod = {
    "metadata": {"name": "web-01", "namespace": "telecom-prod"},
    "status":   {"phase": "Running"}
}
print(pod["metadata"]["name"])    # web-01
print(pod["status"]["phase"])     # Running
```

### Berribot Questions
**Q: What is the difference between a list and a dictionary in Python?**
> A: A list is an ordered collection accessed by index (`tools[0]`). A dictionary is a key-value store accessed by key (`server["host"]`). In DevOps, lists store sequences of servers or tasks; dictionaries store structured config data — they map directly to JSON API responses from Kubernetes and cloud providers.

**Q: What is an f-string and why do you use it?**
> A: An f-string (formatted string literal) lets you embed variables directly in a string: `f"Deploying {app} to {env}"`. It's the modern Python 3.6+ way — cleaner than `%` formatting or `.format()`. I use it in all my DevOps scripts for log messages and notifications.

**Q: How do you safely read a value from a dictionary that might not exist?**
> A: Use `.get()` with a default: `server.get("region", "unknown")` — returns "unknown" if "region" key doesn't exist, rather than raising a `KeyError`. Critical in scripts that parse API responses where not all fields are guaranteed.

---

## Topic 2 — Conditions and Loops

### Key Concept
Python uses `if/elif/else` for conditions and `for`/`while` for loops. **Indentation defines the block** — no curly braces. This is the most common thing Berribot tests in coding rounds.

### Interview Tip
> "I use for loops to iterate over server lists and API response arrays. While loops for retry logic with exponential backoff."

```python
# if / elif / else
env = "production"
if env == "production":
    print("HIGH ALERT — prod deployment")
elif env == "staging":
    print("Staging — validate before promoting")
elif env == "dev":
    print("Dev — auto-deploy on merge")
else:
    print(f"Unknown environment: {env}")

# One-liner conditional (ternary)
status = "UP" if env == "production" else "STANDBY"

# for loop — iterate list
servers = ["web-01", "web-02", "db-01"]
for server in servers:
    print(f"Checking health: {server}")

# for loop — iterate dictionary
config = {"host": "10.0.0.1", "port": 8080, "env": "prod"}
for key, value in config.items():
    print(f"  {key}: {value}")

# range() — repeat N times
for i in range(3):
    print(f"Retry attempt {i + 1} of 3")

# while loop — retry with counter
retries = 0
max_retries = 3
while retries < max_retries:
    print(f"Deploying... attempt {retries + 1}")
    retries += 1
    # in real script: break on success

# List comprehension — build list from loop (Pythonic)
running_pods = [p for p in pods if p["status"] == "Running"]
failed_pods  = [p["name"] for p in pods if p["status"] != "Running"]

# enumerate — loop with index
for i, tool in enumerate(tools, start=1):
    print(f"{i}. {tool}")
```

### Berribot Questions
**Q: Write a for loop that checks each server in a list and prints if it is down.**
```python
servers = [
    {"name": "web-01", "status": "up"},
    {"name": "web-02", "status": "down"},
    {"name": "db-01",  "status": "up"},
]
for server in servers:
    if server["status"] != "up":
        print(f"ALERT: {server['name']} is DOWN")
```

**Q: What is a list comprehension and when would you use it?**
> A: A list comprehension builds a new list from an existing one in a single line: `[p for p in pods if p["status"] == "Running"]`. I use it to filter API response arrays — e.g. get all running pods, get all failed deployments. It's more readable and faster than a manual for loop with `.append()`.

**Q: How do you implement retry logic in Python?**
```python
import time
retries, max_retries = 0, 3
while retries < max_retries:
    try:
        result = deploy()   # function that might fail
        break               # success — exit loop
    except Exception as e:
        retries += 1
        print(f"Attempt {retries} failed: {e}")
        time.sleep(2 ** retries)  # exponential backoff: 2, 4, 8 sec
if retries == max_retries:
    print("All retries exhausted — deployment failed")
```

---

## Topic 3 — Functions

### Key Concept
Functions use `def`. No
