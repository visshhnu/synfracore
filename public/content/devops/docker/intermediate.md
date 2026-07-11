# Docker — Intermediate

## Dockerfile Best Practices, Beyond the Basics

A bad Dockerfile creates large, slow, insecure images. A good one creates small, fast, secure images — this is where junior and senior engineers visibly differ, and it's a near-universal interview topic.

**The most common mistake — wrong layer order.** Docker caches layers; if layer N changes, every layer after it rebuilds. Dependencies change rarely, code changes every commit — always copy dependencies before code.

```dockerfile
# BAD — code copied before dependencies, cache invalidated on every commit
FROM node:20-slim
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "server.js"]

# GOOD — dependencies cached separately from code
FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
CMD ["node", "server.js"]
```
In the GOOD version, `npm install` only reruns when `package.json` actually changes — a code-only commit reuses the cached dependency layer entirely, turning a multi-minute rebuild into a few seconds.

## Multi-Stage Builds — Production Standard

Multi-stage builds use multiple `FROM` instructions; the final image only contains what the last stage explicitly copies. A 1.2GB build image can become a 50MB production image this way.

```dockerfile
# Stage 1: build (has compilers, full toolchain — never shipped)
FROM golang:1.22 AS builder
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /app ./cmd/server

# Stage 2: runtime (minimal, only the compiled binary)
FROM gcr.io/distroless/static-debian12
COPY --from=builder /app /app
USER nonroot:nonroot
ENTRYPOINT ["/app"]
```

## .dockerignore — Always Create This

```
.git
node_modules
*.log
.env
dist/
__pycache__/
```
Without a `.dockerignore`, `COPY . .` sends the entire directory — including `.git` history, local `node_modules`, and secrets in `.env` — into the build context, slowing builds and risking secrets baked into image layers.

## Docker Commands — Complete Reference

```bash
# Images
docker build -t myapp:1.0 .
docker pull nginx:latest
docker push myregistry.io/myapp:1.0
docker inspect myapp:1.0
docker image prune -a          # remove all unused images

# Containers
docker run -d --name web -p 8080:80 nginx
docker exec -it web bash
docker logs -f web
docker inspect web

# Networking and volumes
docker network create app-net
docker run -d --network app-net --name db postgres:16
docker volume create pgdata
docker run -d -v pgdata:/var/lib/postgresql/data postgres:16
```

## Troubleshooting — Real Production Issues

**Exit codes — what they mean:**

| Exit Code | Meaning | What to do |
|---|---|---|
| 0 | Clean exit — app stopped itself | Check if this was expected |
| 1 | Application error / unhandled exception | Check application logs |
| 137 | OOMKilled — memory limit exceeded (`kill -9`) | Increase memory limit or fix a memory leak |
| 139 | Segmentation fault — app crashed | Check for a null pointer or buffer overflow |
| 143 | SIGTERM received — graceful shutdown | Normal — container stopped gracefully |
| 125 | Docker daemon error | Check the Docker daemon logs |
| 126 | Command not executable (permission) | Check file permissions inside the container |
| 127 | Command not found | Check `CMD`/`ENTRYPOINT` and image contents |

```bash
# A container keeps restarting — systematic debug order
docker ps -a                              # confirm exit code
docker logs <container> --tail 50         # last output before it died
docker inspect <container> --format='{{.State.OOMKilled}}'  # was it OOM?
docker run --rm -it <image> sh            # run interactively to reproduce
```

## Security — Container Hardening

```dockerfile
FROM python:3.11-slim
RUN useradd -u 1001 -m appuser
WORKDIR /app
COPY --chown=appuser:appuser . .
RUN pip install --no-cache-dir -r requirements.txt
USER 1001                        # never run as root in production
EXPOSE 8080
CMD ["python", "app.py"]
```
```yaml
# Kubernetes-level enforcement, on top of the image itself
securityContext:
  runAsNonRoot: true
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false
```
```bash
# Trivy — scan an image for known CVEs before pushing to a registry
trivy image --exit-code 1 --severity CRITICAL,HIGH myapp:1.0
```

## Docker Compose — Local Multi-Container Development

```yaml
# docker-compose.yml
services:
  web:
    build: .
    ports: ["8080:8080"]
    environment:
      DATABASE_URL: postgres://user:pass@db:5432/appdb
    depends_on: [db]
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: pass
    volumes: ["pgdata:/var/lib/postgresql/data"]
volumes:
  pgdata:
```
```bash
docker compose up -d
docker compose logs -f web
docker compose down -v   # -v also removes named volumes
```

## CI/CD Integration

```yaml
# GitHub Actions — build, scan, and push on every merge to main
- name: Build image
  run: docker build -t myregistry.io/myapp:${{ github.sha }} .
- name: Scan for vulnerabilities
  run: trivy image --exit-code 1 --severity CRITICAL myregistry.io/myapp:${{ github.sha }}
- name: Push
  run: docker push myregistry.io/myapp:${{ github.sha }}
```
Scanning *before* pushing — not after — means a critical vulnerability blocks the image from ever reaching the registry, rather than being caught later by a separate, disconnected scanning job after it's already deployable.
