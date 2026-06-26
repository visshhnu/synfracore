# Docker Quick Reference

```bash
# Build
docker build -t myapp:v1.0 .
docker build -t myapp:v1.0 --no-cache .
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:v1.0 --push .

# Run
docker run -d -p 8080:80 --name myapp myapp:v1.0
docker run -it --rm ubuntu:22.04 /bin/bash
docker run -e DB_HOST=localhost -v /data:/data myapp:v1.0

# Inspect
docker ps -a
docker images
docker logs myapp -f
docker exec -it myapp /bin/bash
docker inspect myapp
docker stats

# Registry
docker login registry.example.com
docker tag myapp:v1.0 registry.example.com/myapp:v1.0
docker push registry.example.com/myapp:v1.0
docker pull registry.example.com/myapp:v1.0

# Cleanup
docker system prune -f
docker image prune -a
docker volume prune

# Multi-stage Dockerfile example
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-slim AS runtime
RUN useradd -r -u 1001 appuser
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER appuser
EXPOSE 3000
CMD ["node", "dist/server.js"]
```
