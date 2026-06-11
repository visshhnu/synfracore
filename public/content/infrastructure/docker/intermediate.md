# Docker — Intermediate

## Multi-Stage Builds

```dockerfile
# Build stage — full toolchain
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

# Production stage — minimal image
FROM node:20-alpine AS production
RUN addgroup -g 1001 -S nodejs && adduser -S nextjs -u 1001
WORKDIR /app

# Copy only what's needed from builder
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
COPY --from=builder --chown=nextjs:nodejs /app/public ./public

USER nextjs
EXPOSE 3000
CMD ["node", "server.js"]

# Result: 250MB → 85MB
# No dev dependencies, no source code, no build tools in final image
```

## Docker Compose for Development

```yaml
# docker-compose.yml
version: '3.9'

services:
  app:
    build:
      context: .
      target: development
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules  # Named volume prevents host override
    environment:
      NODE_ENV: development
      DATABASE_URL: postgresql://user:pass@postgres:5432/myapp
    depends_on:
      postgres:
        condition: service_healthy
    restart: unless-stopped

  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: myapp
    volumes:
      - pgdata:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user"]
      interval: 5s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    command: redis-server --appendonly yes
    volumes:
      - redisdata:/data

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    depends_on: [app]

volumes:
  pgdata:
  redisdata:
```

## Container Networking

```bash
# Container communication:
# Containers on same network resolve each other by service name
# app → postgres:5432 works because they're on same docker-compose network

# Custom networks
docker network create --driver bridge app-network
docker run --network app-network --name db postgres:16
docker run --network app-network --name app \
  -e DB_HOST=db myapp:latest

# Inspect network
docker network inspect app-network

# Port mapping
# -p 8080:3000 = host:container
# -p 127.0.0.1:8080:3000 = bind to localhost only (more secure)
```

## Security Best Practices

```dockerfile
# 1. Non-root user
RUN addgroup --system app && adduser --system --group app
USER app

# 2. Read-only filesystem
# docker run --read-only --tmpfs /tmp myapp

# 3. Drop capabilities
# docker run --cap-drop ALL --cap-add NET_BIND_SERVICE myapp

# 4. No secrets in image
# BAD:  ENV API_KEY=secret123
# GOOD: Use Docker secrets or environment injection at runtime

# 5. Scan images
docker scout cves myapp:latest
# or: trivy image myapp:latest

# 6. Use specific digest instead of tag
FROM node:20.11.0-alpine@sha256:abc123...  # Immutable, can't be changed
```

## Health Checks

```dockerfile
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Or for non-HTTP services:
HEALTHCHECK CMD pg_isready -U postgres || exit 1
```

```bash
# Check health status
docker inspect --format='{{.State.Health.Status}}' container_name

# View health check logs
docker inspect --format='{{json .State.Health}}' container_name | jq
```
