# Docker Interview Questions

## Core Concepts

**Q: What is Docker? Difference between containers and VMs?**

Docker is a containerisation platform that packages applications with their dependencies into isolated, portable containers.

| | Containers | Virtual Machines |
|---|---|---|
| Size | MBs | GBs |
| Startup | Seconds | Minutes |
| OS | Shares host kernel | Full OS per VM |
| Isolation | Process-level (namespaces) | Full hardware virtualisation |
| Density | 100s on one host | 10s on one host |
| Use case | Microservices, CI/CD | Full isolation, different kernels |

Containers use **Linux namespaces** (pid, net, mnt, uts, ipc, user) for isolation and **cgroups** for resource limits.

---

**Q: Explain Dockerfile — key instructions.**

```dockerfile
FROM ubuntu:22.04                          # Base image (always first)
LABEL maintainer="team@company.com"        # Metadata

ARG NODE_VERSION=18                        # Build-time variable
ENV APP_ENV=production                     # Runtime environment variable

WORKDIR /app                               # Sets working directory

COPY package*.json ./                      # Copy files (uses cache well)
RUN npm ci --only=production               # Execute command (creates layer)

COPY . .                                   # Copy remaining source

EXPOSE 3000                                # Document port (doesn't publish)

HEALTHCHECK --interval=30s --timeout=3s   CMD curl -f http://localhost:3000/health || exit 1

USER node                                  # Run as non-root (security!)
CMD ["node", "server.js"]                  # Default command (overridable)
# ENTRYPOINT ["node"]                      # Fixed executable (CMD becomes args)
```

**CMD vs ENTRYPOINT:**
- `CMD`: default command, easily overridden with `docker run image <new-command>`
- `ENTRYPOINT`: fixed executable, CMD becomes default arguments
- Together: `ENTRYPOINT ["node"]` + `CMD ["server.js"]` → runs `node server.js`, can override just the script

---

**Q: How do you optimise Docker images?**

1. **Multi-stage builds** — biggest impact:
```dockerfile
# Build stage
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage — only final artifacts
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
CMD ["node", "dist/server.js"]
# Result: 1.2GB → 120MB
```

2. **Use slim/alpine base images**: `node:18-alpine` vs `node:18` saves ~800MB
3. **Order layers by change frequency**: `COPY package.json` before `COPY .` — npm install layer cached unless package.json changes
4. **`.dockerignore`**: Exclude `node_modules`, `.git`, `*.log`, `tests/`
5. **Combine RUN commands**: `RUN apt-get update && apt-get install -y pkg1 pkg2 && rm -rf /var/lib/apt/lists/*`
6. **Don't run as root**: `USER node`

---

**Q: What is Docker Compose? When would you use it vs Kubernetes?**

Docker Compose defines and runs multi-container applications with a single `docker-compose.yml`:

```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: postgres://user:pass@db:5432/mydb
    depends_on:
      db:
        condition: service_healthy
    volumes:
      - ./logs:/app/logs

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: pass
      POSTGRES_USER: user
      POSTGRES_DB: mydb
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user"]
      interval: 5s

volumes:
  postgres_data:
```

**Docker Compose vs Kubernetes:**
Use Compose for: local development, simple deployments, small teams, single-host.
Use Kubernetes for: production, multi-node, auto-scaling, high availability, complex networking.

---

**Q: Explain Docker networking.**

**Network drivers:**
- `bridge` (default): Isolated network, containers communicate by name, NAT to host
- `host`: Container shares host network stack (no isolation, best performance)
- `none`: No networking
- `overlay`: Multi-host networking (Docker Swarm / across hosts)

```bash
# Create custom network
docker network create --driver bridge app-network

# Run containers on same network (can communicate by name)
docker run --network app-network --name db postgres
docker run --network app-network --name app myapp
# app container can reach db: POSTGRES_HOST=db
```

**Port mapping**: `docker run -p 8080:3000` → host port 8080 maps to container port 3000.

---

**Q: What are Docker volumes? Types?**

Volumes persist data beyond container lifecycle.

**Types:**
1. **Named volumes** (preferred): `docker run -v mydata:/app/data` — managed by Docker, survives container deletion, easy to share
2. **Bind mounts**: `docker run -v /host/path:/container/path` — mounts host directory, good for development (live code reload)
3. **tmpfs mounts**: In-memory only, not persisted (sensitive data)

```bash
docker volume create mydata
docker volume ls
docker volume inspect mydata
docker volume rm mydata

# Backup a volume
docker run --rm -v mydata:/data -v $(pwd):/backup ubuntu tar czf /backup/backup.tar.gz /data
```

---

**Q: How do you secure Docker containers?**

1. **Don't run as root**: `USER nonroot` in Dockerfile
2. **Read-only filesystem**: `docker run --read-only --tmpfs /tmp`
3. **No privileged mode**: Avoid `--privileged` (gives almost root access)
4. **Limit capabilities**: `--cap-drop ALL --cap-add NET_BIND_SERVICE`
5. **Resource limits**: `--memory 512m --cpus 0.5`
6. **Scan images**: Trivy, Snyk, Docker Scout
7. **Use trusted base images**: Official images, minimal base
8. **Secrets management**: Don't use ENV for secrets in production — use Docker secrets or external vault
9. **Network isolation**: Only expose necessary ports
10. **Sign images**: Docker Content Trust (DCT)

---

**Q: What happens when you run `docker run`?**

1. Docker CLI sends request to Docker daemon (dockerd)
2. Daemon checks local image cache — if not found, pulls from registry
3. Daemon creates container filesystem (UnionFS layers: image layers read-only + writable layer on top)
4. Daemon creates network namespace, assigns IP
5. Daemon sets up cgroups for resource limits
6. Daemon runs the entrypoint/command process (PID 1 in container)

**Union filesystem (overlayFS)**: Image layers are read-only. Each container gets a thin writable layer on top. Changes only written to writable layer. Multiple containers share same image layers (efficient).

---

**Q: How do you debug a running container?**

```bash
# Execute command in running container
docker exec -it container_name /bin/sh

# View logs
docker logs container_name -f --tail=100

# Inspect container configuration
docker inspect container_name

# View resource usage
docker stats container_name

# Copy files from/to container
docker cp container_name:/app/error.log ./error.log

# View processes inside container
docker top container_name

# Attach to container's stdin/stdout
docker attach container_name

# Override entrypoint for debug (bypass application startup)
docker run --entrypoint /bin/sh -it myimage
```

## Revision Notes
```
CONTAINER vs VM: Shares kernel (lighter, faster) vs full OS (heavier, more isolated)
NAMESPACES: pid, net, mnt, uts, ipc, user (isolation)
CGROUPS: resource limits (CPU, memory, I/O)

DOCKERFILE KEY INSTRUCTIONS:
FROM: base image | WORKDIR: working dir | COPY: copy files
RUN: execute (creates layer) | ENV: runtime env var | ARG: build-time var
EXPOSE: document port | CMD: default command | ENTRYPOINT: fixed executable
USER: run as user (security) | HEALTHCHECK: health probe

IMAGE OPTIMISATION:
Multi-stage builds (biggest impact) | Alpine base images
Layer ordering (change frequency) | .dockerignore | Combine RUN commands

NETWORKING:
bridge (default, isolated) | host (no isolation, max performance) | overlay (multi-host)
Port mapping: -p hostPort:containerPort

VOLUMES:
Named: -v name:/path (managed by Docker, persistent)
Bind: -v /host:/container (host directory, dev use)
tmpfs: in-memory, not persistent

SECURITY:
Non-root USER | --read-only | --cap-drop ALL | Resource limits | Image scanning
No privileged | External secrets (not ENV) | Sign images (DCT)

DEBUG:
exec -it → logs -f → inspect → stats → docker cp
```
