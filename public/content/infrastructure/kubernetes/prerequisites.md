# Kubernetes — Prerequisites

## Kubernetes is NOT Beginner-Friendly

Unlike Docker, Kubernetes has a steep learning curve. Come in with these skills and you'll have a much better experience.

## Required (You Will Struggle Without These)

### 1. Docker — Must Know Well
Kubernetes orchestrates containers. If you're fuzzy on what containers are, do Docker first.

You should know:
- What an image vs container is
- How to write a Dockerfile
- How `docker run`, `docker compose up` work
- What ports and volumes mean

**Time to get ready:** 1-2 weeks with Docker → Fundamentals + a Docker project

### 2. Linux Command Line — Comfortable Level
```bash
# You should do these without thinking
cd, ls, cat, grep, ssh, curl
chmod, chown, ps aux, kill
systemctl, journalctl
```

### 3. Basic Networking
- IP addresses and subnets (10.0.0.0/16 — what does /16 mean?)
- What is a load balancer?
- DNS — how domain names resolve to IPs
- TCP ports — what does "port 443" mean?
- HTTP vs HTTPS

### 4. YAML Syntax
All Kubernetes configuration is YAML. You need to read and write it fluently.
```yaml
# YAML basics you must know:
apiVersion: apps/v1     # string value
kind: Deployment        # indentation = hierarchy (2 spaces, always)
metadata:
  name: my-app          # nested key
  labels:               # dictionary
    app: my-app
spec:
  replicas: 3           # integer
  containers:           # list
    - name: api         # list item starts with -
      image: nginx:1.25
      ports:
        - containerPort: 80
```

## Nice to Have

### Cloud Provider Basics
Most Kubernetes in production runs on EKS (AWS), GKE (GCP), or AKS (Azure). Understanding cloud concepts (VPC, load balancers, IAM) helps when you get to production clusters.

### A Programming Language (Python or Go)
Not required to use Kubernetes, but helps when writing scripts that interact with the K8s API, reading source code, and writing Kubernetes Operators later.

## Learning Order

```
Linux basics (1 week)
       ↓
Docker fundamentals (2 weeks)
       ↓
Docker Compose (3-5 days)
       ↓
Kubernetes Fundamentals ← YOU ARE HERE
       ↓
Helm (2-3 days)
       ↓
CI/CD + GitOps (ArgoCD)
```

## Time Estimate With Prerequisites

- Kubernetes Fundamentals: 2-3 weeks
- Intermediate + CKA prep: 4-6 weeks
- CKA certified: 2-3 months total from zero Docker

## Start Here

Go to **Installation** to set up a local Kubernetes cluster with minikube or kind.
