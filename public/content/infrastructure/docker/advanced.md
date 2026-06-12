# Docker — Advanced

## BuildKit and Advanced Builds

```dockerfile
# syntax=docker/dockerfile:1
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
# Mount cache — npm cache persists between builds (huge speedup)
RUN --mount=type=cache,target=/root/.npm \
    npm ci --only=production

FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# Mount secrets — available during build, NOT in final image
RUN --mount=type=secret,id=npm_token \
    NPM_TOKEN=$(cat /run/secrets/npm_token) \
    npm run build

FROM node:20-alpine AS production
RUN addgroup -S app && adduser -S app -G app
WORKDIR /app
COPY --from=builder --chown=app:app /app/.next/standalone ./
COPY --from=builder --chown=app:app /app/public ./public
USER app
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s \
    CMD wget -qO- http://localhost:3000/api/health || exit 1
CMD ["node", "server.js"]
```

```bash
# Build with secret (never stored in image layers)
docker build \
    --secret id=npm_token,src=$HOME/.npmrc \
    --cache-from type=registry,ref=registry.io/myapp:buildcache \
    --cache-to type=registry,ref=registry.io/myapp:buildcache,mode=max \
    -t myapp:latest .
```

## Multi-Platform Builds

```bash
# Build for AMD64 and ARM64 (Apple Silicon, AWS Graviton)
docker buildx create --name multiplatform --use
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    -t registry.io/myapp:latest .

# Verify image manifests
docker buildx imagetools inspect registry.io/myapp:latest
```

## Docker Swarm (Production Orchestration)

```yaml
# docker-compose.prod.yml
version: '3.9'
services:
  app:
    image: registry.io/myapp:${TAG:-latest}
    deploy:
      replicas: 3
      update_config:
        parallelism: 1          # Update 1 replica at a time
        delay: 10s
        failure_action: rollback
        order: start-first      # Start new before stopping old
      rollback_config:
        parallelism: 1
        order: stop-first
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
    secrets:
      - db_password
    networks:
      - app-net
    healthcheck:
      test: ["CMD", "wget", "-qO-", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 30s

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    configs:
      - source: nginx_config
        target: /etc/nginx/conf.d/default.conf
    deploy:
      replicas: 2
      placement:
        constraints:
          - node.role == manager
    networks:
      - app-net

secrets:
  db_password:
    external: true     # Created with: docker secret create db_password -

configs:
  nginx_config:
    external: true

networks:
  app-net:
    driver: overlay
    attachable: true
```

## Container Security Scanning

```bash
# Scan image for CVEs
docker scout cves myapp:latest
docker scout recommendations myapp:latest

# Trivy (comprehensive scanner)
trivy image myapp:latest
trivy image --severity HIGH,CRITICAL myapp:latest
trivy image --format json myapp:latest > scan-results.json

# Check for secrets in image layers
trufflehog docker --image myapp:latest

# Enforce security in Dockerfile
# Lint with hadolint
hadolint Dockerfile
# Common issues:
# - Using :latest tag
# - Not specifying versions
# - Running as root
# - Unnecessary packages installed
```

## Performance Optimization

```bash
# Analyze image layers and sizes
docker history myapp:latest
docker image inspect myapp:latest | jq '.[0].Size' | numfmt --to=iec

# Dive — interactive layer explorer
dive myapp:latest

# Reduce image size tips:
# 1. Multi-stage builds (compile in one, run in another)
# 2. Use -alpine or -slim base images
# 3. Chain RUN commands to reduce layers:
#    RUN apt-get update && \
#        apt-get install -y --no-install-recommends curl && \
#        rm -rf /var/lib/apt/lists/*
# 4. .dockerignore to exclude unnecessary files
# 5. Remove build dependencies after use

# .dockerignore
cat > .dockerignore << 'IGNORE'
.git
.gitignore
node_modules
npm-debug.log
.env*
*.test.js
coverage/
.nyc_output
docs/
IGNORE

# Resource limits in production
docker run \
    --memory="512m" \
    --memory-swap="512m" \
    --cpus="0.5" \
    --pids-limit=100 \
    --read-only \
    --tmpfs /tmp \
    --security-opt no-new-privileges:true \
    --cap-drop ALL \
    --cap-add NET_BIND_SERVICE \
    myapp:latest
```
