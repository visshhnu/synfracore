# Docker Cheat Sheet

## Essential Commands

\`\`\`bash
# Run
docker run -d -p 8080:80 --name web nginx
docker run -it --rm ubuntu bash
docker run -d -e ENV=prod -v data:/data myapp

# Manage  
docker ps -a
docker logs -f container
docker exec -it container bash
docker stats
docker inspect container

# Images
docker build -t name:tag .
docker pull image:tag
docker push registry/image:tag
docker images
docker rmi image

# Cleanup
docker system prune -a      # Remove everything unused
docker container prune      # Remove stopped containers
docker image prune -a       # Remove unused images
docker volume prune         # Remove unused volumes
\`\`\`

## Dockerfile Best Practices

\`\`\`dockerfile
# 1. Use specific base image tags
FROM python:3.11-slim          # NOT python:latest

# 2. Minimize layers
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 3. Use .dockerignore
# .git, node_modules, __pycache__, *.log, .env

# 4. Non-root user
RUN useradd -r -u 1001 appuser
USER appuser

# 5. COPY specific files, not everything
COPY --chown=appuser:appuser src/ /app/src/
\`\`\`

## Multi-stage Build (Production Pattern)

\`\`\`dockerfile
# Stage 1: Build
FROM node:20 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production (much smaller!)
FROM node:20-alpine AS production
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
EXPOSE 3000
CMD ["node", "dist/server.js"]
\`\`\`

## Docker Compose Quick Reference

\`\`\`yaml
version: '3.8'
services:
  app:
    build: .
    ports: ["3000:3000"]
    environment:
      - DB_HOST=db
    depends_on:
      db:
        condition: service_healthy
    restart: unless-stopped

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      retries: 5

volumes:
  pgdata:
\`\`\`

\`\`\`bash
docker compose up -d        # Start all services
docker compose down         # Stop and remove
docker compose logs -f app  # Follow app logs
docker compose ps           # Service status
docker compose exec app bash # Shell into service
\`\`\`