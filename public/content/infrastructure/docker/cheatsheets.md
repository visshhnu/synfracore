# Docker Cheatsheet

## Most Used Commands

```bash
# Images
docker build -t myapp:v1.0 .
docker build -t myapp:v1.0 --target production .    # multi-stage
docker pull nginx:alpine
docker push registry.example.com/myapp:v1.0
docker images
docker rmi myapp:v1.0
docker image prune -a                               # remove all unused

# Containers
docker run -d -p 8080:80 --name webserver nginx
docker run -it --rm ubuntu:22.04 bash               # ephemeral
docker run -e DB_HOST=localhost -v $(pwd):/app myapp
docker ps                                            # running
docker ps -a                                         # all including stopped
docker stop webserver
docker rm webserver
docker logs -f webserver
docker exec -it webserver bash
docker stats                                         # live resource usage

# Registry
docker login registry.example.com
docker tag myapp:v1.0 registry.example.com/myapp:v1.0
docker push registry.example.com/myapp:v1.0

# Inspect and debug
docker inspect webserver
docker inspect --format='{{.State.Status}}' webserver
docker diff webserver                                # filesystem changes
docker cp webserver:/etc/nginx/nginx.conf ./

# Cleanup
docker system prune -af --volumes                    # remove everything unused
docker volume prune
docker network prune
```

## Dockerfile Best Practices

```dockerfile
FROM node:20-alpine AS base
WORKDIR /app

# Dependencies layer (cache-friendly - only invalidates when package.json changes)
FROM base AS deps
COPY package*.json ./
RUN npm ci --only=production

# Build layer
FROM base AS builder
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production image - smallest possible
FROM node:20-alpine AS production
RUN addgroup -g 1001 -S nodejs && adduser -S app -u 1001
WORKDIR /app
COPY --from=deps --chown=app:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=app:nodejs /app/dist ./dist
USER app                          # Never run as root
EXPOSE 3000
HEALTHCHECK --interval=30s CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "dist/server.js"]
```

## Docker Compose Quick Reference

```yaml
version: '3.9'
services:
  app:
    build: .
    ports: ["3000:3000"]
    environment:
      NODE_ENV: production
    env_file: .env                # Load from file
    depends_on:
      db: {condition: service_healthy}
    restart: unless-stopped
    networks: [app-net]
    volumes:
      - ./logs:/app/logs          # bind mount
      - app_data:/app/data        # named volume

  db:
    image: postgres:16-alpine
    volumes:
      - pgdata:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
      interval: 5s
      retries: 5
    networks: [app-net]

networks:
  app-net:
    driver: bridge

volumes:
  pgdata:
  app_data:
```

```bash
# Compose commands
docker compose up -d              # start detached
docker compose up --build         # rebuild images
docker compose down               # stop and remove containers
docker compose down -v            # also remove volumes
docker compose logs -f app        # follow logs
docker compose ps                 # status
docker compose exec app sh        # exec into running container
docker compose scale app=3        # scale service (without swarm)
```
