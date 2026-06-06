# Docker Interview Questions & Troubleshooting

## Interview Questions

### Beginner

**What is Docker and what problem does it solve?**
Docker packages an application and all its dependencies (runtime, libraries, config files) into a container that runs consistently on any machine. It solves the classic "works on my machine" problem. Before containers: developers ran apps differently on their laptops vs staging vs production — different OS versions, library versions, environment variables. Docker creates identical environments everywhere.

---

**What is the difference between a Docker image and a container?**
An image is a read-only template — a snapshot of an environment with your application code, runtime, and all dependencies. A container is a running instance of an image. Like an image is a class definition and a container is an object instance. Multiple containers can run from the same image simultaneously, each isolated from the others.

---

**What is a Dockerfile?**
A Dockerfile is a text file with instructions to build a Docker image. Each instruction (`FROM`, `RUN`, `COPY`, `CMD`) creates a layer. Layers are cached — if nothing changes in layers 1-5, rebuilding only runs from the changed layer onward. This makes builds fast.

---

**What is Docker Compose?**
Docker Compose is a tool for defining and running multi-container applications. You define all services, networks, and volumes in a `docker-compose.yml` file and start everything with `docker compose up`. Perfect for local development with a web app, database, and cache all running together.

---

### Intermediate

**Explain Docker networking — bridge, host, none, overlay.**

`bridge` — Default. Docker creates a virtual network bridge. Containers get their own IP, communicate via bridge. Can expose ports to host with `-p`. Containers on same bridge can reach each other by IP or container name (with user-defined networks).

`host` — Container shares the host's network namespace. No isolation. Container ports are directly on the host. Faster (no NAT overhead) but no isolation. Use for performance-critical networking.

`none` — Container has no network. Completely isolated. Use for batch jobs that don't need network.

`overlay` — Multi-host networking for Docker Swarm or Kubernetes. Creates a virtual network spanning multiple Docker hosts.

---

**What is a multi-stage build and why use it?**

```dockerfile
# Stage 1: Build — has all build tools (large image)
FROM node:20 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production — only runtime (small image)
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
CMD ["node", "dist/server.js"]
```

Result: Final image doesn't include build tools, source code, or dev dependencies. Images go from 1GB+ to 100MB. Smaller images = faster pulls, smaller attack surface.

---

**What are Docker volumes and why prefer named volumes over bind mounts?**

Named volumes (`-v mydata:/app/data`) are managed by Docker — stored in Docker's data directory, not a specific host path. Portable across machines. Docker handles permissions. Better for databases and persistent app data.

Bind mounts (`-v /host/path:/container/path`) mount a specific host directory. Great for development (live code reload) but tied to a specific host path. Not portable.

Anonymous volumes (`-v /app/data`) created without a name — Docker gives random name. Good for temporary data that shouldn't persist after `docker rm`.

---

**How does Docker layer caching work?**

Each Dockerfile instruction creates a layer. Docker caches layers. When rebuilding:
- If an instruction and all preceding instructions are unchanged → use cache
- If an instruction changes → that layer AND ALL SUBSEQUENT LAYERS rebuild

This is why you copy `package.json` and run `npm install` BEFORE copying source code:

```dockerfile
# GOOD: package.json rarely changes → node_modules cached
COPY package.json .
RUN npm install       # Cached unless package.json changed
COPY . .             # Source code changes don't invalidate npm install

# BAD: COPY . . invalidates npm install every time code changes
COPY . .
RUN npm install      # Always rebuilds!
```

---

### Advanced

**How do you secure a Docker container in production?**

1. **Non-root user** — `USER 1001` in Dockerfile. Never run as root.
2. **Read-only filesystem** — `--read-only`. Mount specific writable paths with tmpfs.
3. **Drop all capabilities** — `--cap-drop ALL`, only add what's needed (`--cap-add NET_BIND_SERVICE`).
4. **No new privileges** — `--security-opt no-new-privileges:true`
5. **Resource limits** — `--memory=512m --cpus=1`. Prevent container from consuming all host resources.
6. **Minimal base image** — `alpine` or `distroless` instead of `ubuntu`. Smaller attack surface.
7. **Scan images** — Use Trivy or Snyk to scan for CVEs before pushing.
8. **Private registry** — Never pull from public registry in production without scanning.

---

**Explain the difference between ENTRYPOINT and CMD.**

`CMD` — Default command to run. Can be overridden: `docker run myimage custom-command`
`ENTRYPOINT` — Fixed executable. Arguments appended: `docker run myimage --config=/etc/app.conf`

Combined: ENTRYPOINT is the executable, CMD provides default arguments:

```dockerfile
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
# docker run mynginx = nginx -g daemon off;
# docker run mynginx -c /etc/nginx/nginx.conf = nginx -c /etc/nginx/nginx.conf
```

---

## Troubleshooting Guide

### Container Exits Immediately (Exit Code 0 or 1)

```bash
# Check exit code
docker ps -a
docker inspect <container> | grep ExitCode

# Exit 0 — process completed normally (CMD finished)
# Fix: CMD should be a long-running process
# BAD:  CMD echo "hello"          (exits immediately)
# GOOD: CMD ["nginx", "-g", "daemon off;"]  (stays running)

# Exit 1 — application error
docker logs <container>

# Exit 137 — OOMKilled (Out of Memory)
docker inspect <container> | grep OOMKilled
# Fix: increase --memory limit

# Exit 139 — Segfault
# Check application logs for core dump
```

### Permission Denied Errors

```bash
# Check who owns the files
docker exec -it <container> ls -la /app

# Container user vs file owner mismatch
# In Dockerfile:
RUN chown -R 1001:1001 /app
USER 1001

# Or use --user flag
docker run --user 1001 myimage
```

### Container Can't Connect to Database

```bash
# Check they're on the same network
docker network ls
docker network inspect <network>

# Use container name as hostname (user-defined networks only!)
# docker run --network mynet --name db postgres
# Then: psql -h db -U user  (works!)

# Default bridge network: use IP, not container name
docker inspect db | grep IPAddress

# Check firewall / security group if different hosts
```

### Image Pull Failures

```bash
# Check registry auth
docker login registry.example.com
cat ~/.docker/config.json

# For private ECR
aws ecr get-login-password --region us-east-1 \
  | docker login --username AWS --password-stdin \
  123456789.dkr.ecr.us-east-1.amazonaws.com

# Pull specific platform (M1 Mac pulling amd64)
docker pull --platform linux/amd64 myimage
```

### Disk Space Issues

```bash
# See what's taking space
docker system df

# Clean up
docker system prune         # Remove stopped containers, unused images, networks
docker system prune -a      # Also remove unused images (not just dangling)
docker system prune -a -f --volumes  # Nuclear option — everything unused

# Remove old images
docker image prune -a --filter "until=720h"  # Older than 30 days

# In production: set log rotation
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```

### Container Networking Debug

```bash
# Shell into container with network tools
docker run --rm --network <network> nicolaka/netshoot

# From inside: test connectivity
curl -v http://service-name:8080/health
nslookup service-name
traceroute service-name
nc -zv service-name 8080

# Check iptables rules
iptables -L -n -v | grep DOCKER
```
