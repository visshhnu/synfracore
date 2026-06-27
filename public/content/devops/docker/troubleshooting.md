# Docker Troubleshooting Guide

## Issue 1: Container exits immediately after start

**Symptom:** `docker run myapp` → container starts and immediately exits with code 0 or 1.

**Root Cause:** The main process in the container completed or crashed. Docker containers run as long as PID 1 is running.

**Debug steps:**
```bash
docker logs <container-id>
docker logs <container-id> --tail 50
docker run -it myapp /bin/sh   # override entrypoint to inspect
docker inspect <container-id> | grep ExitCode
```

**Fix patterns:**
- App crashes on startup → check environment variables, missing config
- No foreground process → ensure CMD/ENTRYPOINT runs in foreground (no `&`)
- Wrong entrypoint → `docker run --entrypoint /bin/bash myapp`

---

## Issue 2: Permission denied inside container

**Symptom:** `Permission denied` errors accessing files or directories.

**Root Cause:** Container runs as root but mounts have restrictive permissions, OR container runs as non-root user without access.

**Debug steps:**
```bash
docker exec -it <container> id      # what user is running?
docker exec -it <container> ls -la /path/to/dir
docker inspect <container> | grep User
```

**Fix patterns:**
```dockerfile
# Fix 1: Run as explicit user with correct UID
RUN useradd -r -u 1001 appuser
USER appuser

# Fix 2: Fix file permissions in Dockerfile
RUN chown -R appuser:appuser /app

# Fix 3: Override at runtime
docker run --user root myapp
```

---

## Issue 3: Image build fails - layer cache issues

**Symptom:** `RUN npm install` or `RUN pip install` fails in CI but works locally.

**Root Cause:** Stale cache, network issues in CI, or non-deterministic dependency versions.

**Debug steps:**
```bash
docker build --no-cache -t myapp .   # rebuild without cache
docker build --progress=plain .       # verbose output
```

**Fix patterns:**
```dockerfile
# Pin base image digest to avoid floating tags
FROM node:20@sha256:abc123...

# Pin dependency versions
COPY package-lock.json ./
RUN npm ci   # uses lockfile, not npm install
```

---

## Issue 4: Container can't connect to host or other containers

**Symptom:** `Connection refused` or `Cannot connect to host.docker.internal`.

**Root Cause:** Wrong network mode, container isolation, or firewall rules.

**Debug steps:**
```bash
docker network ls
docker inspect <container> | grep NetworkMode
docker run --net=host myapp   # test with host networking
docker exec -it <container> ping host.docker.internal
docker exec -it <container> curl http://other-container:8080
```

**Fix patterns:**
```bash
# Connect containers via custom network
docker network create mynet
docker run --network mynet --name db postgres
docker run --network mynet --name app myapp

# From host to container
docker run -p 8080:80 myapp  # map port explicitly

# From container to host (Mac/Windows)
http://host.docker.internal:8080  # special hostname
# On Linux:
docker run --add-host host.docker.internal:host-gateway myapp
```

---

## Issue 5: Disk space full — Docker taking too much space

**Symptom:** `no space left on device` during build or pull.

**Root Cause:** Accumulated dangling images, stopped containers, unused volumes.

**Diagnosis:**
```bash
docker system df                    # overall disk usage
docker images -f dangling=true      # dangling layers
docker ps -a -f status=exited       # stopped containers
```

**Fix patterns:**
```bash
# Remove specific types
docker image prune -f               # remove dangling images
docker container prune -f           # remove stopped containers
docker volume prune -f              # remove unused volumes

# Nuclear option (removes everything unused)
docker system prune -a -f --volumes

# Prevent in CI: add to pipeline
docker system prune -f --volumes
```

---

## Prevention Tips
- Always use `.dockerignore` to exclude `node_modules`, `.git`, build artifacts
- Use multi-stage builds to keep final image small
- Pin base image versions: `FROM node:20.11-alpine3.19` not `FROM node:latest`
- Set resource limits: `docker run --memory=512m --cpus=0.5`
- Use `--restart=unless-stopped` for production containers
- Regularly run `docker system prune` in CI to prevent disk accumulation
