# Harbor / Nexus / Artifactory — Installation Guide

## Install Harbor — Docker Compose (Single-Host Evaluation)

The fastest path to a working Harbor instance for learning:

```bash
wget https://github.com/goharbor/harbor/releases/latest/download/harbor-offline-installer.tgz
tar xzvf harbor-offline-installer.tgz
cd harbor

# Configure hostname and (for real use) TLS certs in harbor.yml first
cp harbor.yml.tmpl harbor.yml
# Edit harbor.yml: set hostname to your host's actual address

./install.sh

# Verify containers are running
docker compose ps
```

## Install Harbor — Kubernetes (Helm, Production Path)

```bash
helm repo add harbor https://helm.goharbor.io
helm repo update

helm install harbor harbor/harbor \
  --namespace harbor --create-namespace \
  --set expose.type=ingress \
  --set expose.ingress.hosts.core=harbor.company.com \
  --set externalURL=https://harbor.company.com \
  --set harborAdminPassword=<CHANGE_ME>

kubectl get pods -n harbor
```

## Log In and Create Your First Project

```bash
# Docker login against the new Harbor instance
docker login harbor.company.com -u admin -p <HARBOR_ADMIN_PASSWORD>

# Via the Web UI: Projects > New Project — or via API:
curl -u admin:<PASSWORD> -X POST https://harbor.company.com/api/v2.0/projects \
  -H "Content-Type: application/json" \
  -d '{"project_name": "my-team", "public": false}'
```

## Push and Scan a Test Image

```bash
docker tag alpine:latest harbor.company.com/my-team/alpine:latest
docker push harbor.company.com/my-team/alpine:latest

# Trigger a scan via the API (also happens automatically if scan-on-push
# is enabled in the project's configuration)
curl -u admin:<PASSWORD> -X POST \
  https://harbor.company.com/api/v2.0/projects/my-team/repositories/alpine/artifacts/latest/scan
```

## Verify Everything Works

```bash
# 1. Confirm all Harbor components are healthy
docker compose ps          # Docker Compose install
kubectl get pods -n harbor # Kubernetes install

# 2. Confirm push/pull works
docker pull harbor.company.com/my-team/alpine:latest

# 3. Confirm scanning ran and produced results
curl -u admin:<PASSWORD> \
  https://harbor.company.com/api/v2.0/projects/my-team/repositories/alpine/artifacts/latest \
  -H "Accept: application/json" | grep -i vulnerabilit
```

## Common Installation Issues

**Docker Compose install: `install.sh` fails with a TLS/certificate error**
Confirm `harbor.yml`'s hostname matches how you're actually accessing Harbor — a mismatch between the configured hostname and the real access URL is a common early misconfiguration, not just a certificate problem.

**Helm install succeeds but the ingress is unreachable**
```bash
kubectl get ingress -n harbor
# Confirm expose.ingress.hosts.core matches a hostname that actually
# resolves to your ingress controller, and that the ingress controller
# itself is functioning independently of Harbor
```

**`docker push` fails with "unauthorized" after a successful `docker login`**
```bash
# Confirm you're pushing to a project that actually exists and that
# your user has push (Developer role or higher) access to it —
# successful login only confirms authentication, not project-level
# authorization
```

**Scanning shows "Not Scanned" indefinitely**
```bash
kubectl logs -n harbor -l component=trivy
# Confirm the Trivy scanner component itself is healthy — a scan
# request can be silently dropped if the scanner pod is unavailable
```

## What's Installed

After a successful Helm-based installation:
- **harbor-core** — the main API and business logic
- **harbor-registry** — the actual OCI-compliant image storage backend
- **harbor-trivy** — the built-in vulnerability scanner
- **harbor-portal** — the Web UI
- **harbor-jobservice** — background jobs (replication, scanning, garbage collection)

## Next Steps

Go to the **Fundamentals** section to learn Harbor's Projects, RBAC, and scan-and-block policies.
