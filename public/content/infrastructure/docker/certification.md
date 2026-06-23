# Docker Certification Guide

## Certifications Available

**Docker Certified Associate (DCA)** — retired 2023. Focus has shifted to Kubernetes.

Best current options for container professionals:
| Cert | Focus | Best For |
|------|-------|---------|
| **CKA/CKAD** (CNCF) | Kubernetes (runs Docker containers) | DevOps/Platform engineers |
| **AWS DevOps Pro** | Containers on AWS (ECS/EKS) | AWS professionals |
| **AZ-204** | Containers on Azure | Azure developers |

Docker knowledge is now tested *within* Kubernetes and cloud certifications.

---

## Core Docker Knowledge (Tested in K8s/Cloud Certs)

```dockerfile
# Dockerfile best practices (tested in CKAD and AWS certs)
FROM node:20-alpine              # Use specific version + minimal base
WORKDIR /app
COPY package*.json ./            # Copy dependency files first (cache layer)
RUN npm ci --only=production     # Install dependencies
COPY . .                         # Copy source (after deps — cache-friendly)
USER node                        # Non-root user (security!)
EXPOSE 3000
CMD ["node", "server.js"]

# Multi-stage build (reduce image size)
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM node:20-alpine AS production
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
CMD ["node", "dist/server.js"]
```

---

## Must-Know Docker Commands

```bash
# Images
docker build -t myapp:1.0 .
docker build --target production -t myapp:prod .   # Multi-stage target
docker image ls
docker image prune -a                               # Remove unused images
docker inspect myapp:1.0

# Containers
docker run -d -p 8080:3000 --name myapp myapp:1.0
docker run --rm -it ubuntu bash                     # Interactive, auto-remove
docker run -v $(pwd):/app -e NODE_ENV=dev myapp    # Volume + env var
docker ps -a
docker logs myapp -f --tail 100
docker exec -it myapp /bin/sh
docker stats                                        # Live resource usage
docker stop myapp && docker rm myapp

# Registry
docker login
docker tag myapp:1.0 myregistry.io/myapp:1.0
docker push myregistry.io/myapp:1.0
docker pull myregistry.io/myapp:1.0

# Compose
docker compose up -d
docker compose logs -f
docker compose down -v                              # Remove volumes too
docker compose ps

# Networking
docker network create mynet
docker run --network mynet myapp
docker network inspect mynet

# Volumes
docker volume create mydata
docker run -v mydata:/data myapp
docker volume inspect mydata
docker volume prune
```

---

## Security Best Practices (Tested in CKS/AWS Security)

```
IMAGE SECURITY:
  ✓ Use minimal base images (alpine, distroless)
  ✓ Specific image tags — never :latest in production
  ✓ Scan images: trivy image myapp:1.0 | docker scout cves myapp
  ✓ Non-root USER in Dockerfile
  ✓ Read-only filesystem: --read-only flag

RUNTIME SECURITY:
  ✓ Drop capabilities: --cap-drop ALL --cap-add NET_BIND_SERVICE
  ✓ No privileged: never --privileged in production
  ✓ Limit resources: --memory 512m --cpus 0.5
  ✓ Security profiles: --security-opt seccomp=profile.json

SUPPLY CHAIN:
  ✓ Content trust: DOCKER_CONTENT_TRUST=1
  ✓ Private registry with authentication
  ✓ Scan in CI pipeline before push
```

---

## Study Path

**For DevOps/Platform roles**: CKA → CKAD → CKS (Docker is a prerequisite, not a goal)

**Week 1**: Docker fundamentals (Dockerfile, compose, networking, volumes)
**Week 2**: Container security (image scanning, non-root, capabilities)
**Week 3-onwards**: Move to CKA/CKAD curriculum

## Revision Notes
```
Docker DCA retired 2023 — get CKA/CKAD instead
Docker skills tested IN Kubernetes and cloud provider exams

KEY DOCKERFILE RULES:
  Specific base image version | Non-root USER | .dockerignore
  Multi-stage builds | Copy deps first (cache) | EXPOSE documents port

MUST KNOW: build/run/push/pull/exec/logs/stats/compose
Security: trivy scan | non-root | read-only | drop capabilities
Networking: bridge (default) | host | none | custom named networks
Volumes: named volumes (persistent) | bind mounts (dev) | tmpfs (temp)
```
