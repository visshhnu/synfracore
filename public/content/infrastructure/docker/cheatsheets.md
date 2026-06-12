# Docker — Cheatsheet

```bash
# ── IMAGES ───────────────────────────────────────────────────
docker images                              # List local images
docker pull nginx:alpine                   # Pull from registry
docker build -t myapp:1.0 .               # Build from Dockerfile
docker build -t myapp:1.0 -f Dockerfile.prod .
docker build --no-cache -t myapp:1.0 .    # Ignore build cache
docker tag myapp:1.0 registry.io/myapp:1.0
docker push registry.io/myapp:1.0
docker rmi myapp:1.0                       # Remove image
docker image prune                         # Remove dangling images
docker image prune -a                      # Remove all unused
docker save myapp:1.0 | gzip > myapp.tar.gz  # Export
docker load < myapp.tar.gz                 # Import
docker history myapp:1.0                   # Show layers

# ── CONTAINERS ───────────────────────────────────────────────
docker ps                                  # Running containers
docker ps -a                               # All containers
docker run -d -p 80:80 --name nginx nginx:alpine  # Detached
docker run -it --rm ubuntu bash            # Interactive, auto-remove
docker run -e DB_HOST=localhost myapp      # Environment variable
docker run -v /host/path:/container/path myapp  # Bind mount
docker run -v myvolume:/data myapp         # Named volume
docker run --memory 512m --cpus 0.5 myapp # Resource limits
docker run --network mynet myapp           # Custom network
docker start/stop/restart container
docker rm container                        # Remove stopped container
docker rm -f container                     # Force remove running
docker container prune                     # Remove all stopped

# ── EXEC AND LOGS ────────────────────────────────────────────
docker exec -it container bash
docker exec container cat /etc/hosts
docker logs container                      # All logs
docker logs -f container                   # Follow
docker logs --tail 100 -f container        # Last 100 lines + follow
docker logs --since 1h container           # Last hour
docker inspect container                   # Full JSON details
docker inspect container | jq '.[0].NetworkSettings.IPAddress'
docker stats                               # Real-time resource usage
docker top container                       # Processes in container

# ── VOLUMES ──────────────────────────────────────────────────
docker volume create mydata
docker volume ls
docker volume inspect mydata
docker volume rm mydata
docker volume prune                        # Remove unused volumes

# ── NETWORKS ─────────────────────────────────────────────────
docker network create mynet
docker network ls
docker network inspect mynet
docker network connect mynet container
docker network disconnect mynet container
docker network rm mynet

# ── COMPOSE ──────────────────────────────────────────────────
docker compose up -d                       # Start detached
docker compose up --build                  # Rebuild images
docker compose down                        # Stop + remove containers
docker compose down -v                     # Also remove volumes
docker compose ps                          # Status
docker compose logs -f service            # Follow logs
docker compose exec service bash          # Shell into service
docker compose pull                        # Pull latest images
docker compose config                      # Validate compose file

# ── SYSTEM ───────────────────────────────────────────────────
docker system df                           # Disk usage
docker system prune                        # Remove all unused
docker system prune -a --volumes           # Nuclear cleanup
docker info                                # System info
```

## Dockerfile Best Practices

```dockerfile
# Pin versions
FROM node:20.11-alpine3.19

# Layer caching — dependencies before source
COPY package*.json ./
RUN npm ci --only=production
COPY . .

# Non-root user
RUN addgroup -S app && adduser -S app -G app
USER app

# One process per container
CMD ["node", "server.js"]  # Not "npm start" (process tree issues)

# HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost:3000/health || exit 1

# .dockerignore (always include this file)
# node_modules, .git, .env, *.log, coverage/, docs/
```
