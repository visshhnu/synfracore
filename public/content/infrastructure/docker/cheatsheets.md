# Docker — Cheatsheet

## Commands Quick Reference

```bash
# ── CONTAINERS ────────────────────────────────────────────
docker run nginx                         # run container
docker run -d nginx                      # detached (background)
docker run -d -p 8080:80 nginx          # map host:container port
docker run -d -p 8080:80 --name web nginx  # with name
docker run -it ubuntu bash               # interactive terminal
docker run --rm myapp                    # remove on exit
docker run -e DB_HOST=localhost myapp    # environment variable
docker run -v mydata:/data myapp         # mount volume
docker run -v $(pwd):/app myapp          # bind mount
docker run --memory 512m --cpus 0.5 myapp  # resource limits
docker run --network mynet myapp         # custom network
docker run --read-only myapp             # read-only filesystem
docker run -u 1001:1001 myapp            # run as specific user

docker ps                                # running containers
docker ps -a                             # all containers (incl stopped)
docker ps -q                             # only container IDs

docker stop container                    # graceful stop (SIGTERM)
docker start container                   # start stopped container
docker restart container                 # restart
docker kill container                    # force stop (SIGKILL)
docker rm container                      # remove stopped container
docker rm -f container                   # force remove running container
docker rm $(docker ps -aq)              # remove all stopped containers

docker logs container                    # view logs
docker logs -f container                 # follow logs (tail -f)
docker logs --tail 100 container         # last 100 lines
docker logs --since 1h container         # last 1 hour

docker exec -it container bash           # interactive shell
docker exec container ls /app            # run single command
docker exec -u root container bash       # exec as root

docker inspect container                 # full JSON details
docker stats                             # live resource usage
docker stats --no-stream                 # one-time snapshot
docker top container                     # running processes
docker diff container                    # changed files vs image
docker port container                    # port mappings

docker cp file.txt container:/path/      # copy to container
docker cp container:/path/file.txt ./    # copy from container

# ── IMAGES ────────────────────────────────────────────────
docker images                            # list images
docker images -a                         # all (incl intermediate)
docker pull nginx                        # pull from registry
docker pull nginx:alpine                 # specific tag
docker push myrepo/myapp:v1             # push to registry
docker tag myapp:latest myrepo/myapp:v1 # tag image
docker rmi nginx                         # remove image
docker rmi $(docker images -q)          # remove all images
docker history myapp:latest             # show layers
docker inspect myapp:latest             # image details
docker image prune                       # remove dangling images
docker image prune -a                    # remove unused images

# ── BUILD ─────────────────────────────────────────────────
docker build -t myapp:v1 .              # build from Dockerfile
docker build -t myapp:v1 -f MyDockerfile .  # specify Dockerfile
docker build --no-cache -t myapp .      # ignore cache
docker build --build-arg VERSION=1.0 .  # pass build arg
docker build --target builder .         # stop at specific stage

# ── REGISTRY ──────────────────────────────────────────────
docker login                             # login to Docker Hub
docker login registry.example.com       # login to private registry
docker logout
docker search nginx                      # search Docker Hub

# ── VOLUMES ───────────────────────────────────────────────
docker volume create mydata             # create named volume
docker volume ls                        # list volumes
docker volume inspect mydata            # volume details
docker volume rm mydata                 # remove volume
docker volume prune                     # remove unused volumes

# ── NETWORKS ──────────────────────────────────────────────
docker network ls                        # list networks
docker network create mynet              # create bridge network
docker network create --driver overlay mynet  # overlay (swarm)
docker network inspect mynet             # network details
docker network connect mynet container   # add container to network
docker network disconnect mynet container
docker network rm mynet                  # remove network
docker network prune                     # remove unused networks

# ── COMPOSE ───────────────────────────────────────────────
docker compose up                        # start all services
docker compose up -d                     # detached
docker compose up --build               # build before starting
docker compose down                      # stop + remove containers
docker compose down -v                   # also remove volumes
docker compose ps                        # service status
docker compose logs -f service           # follow service logs
docker compose exec service bash         # shell into service
docker compose restart service           # restart one service
docker compose pull                      # pull latest images
docker compose build                     # rebuild images
docker compose scale service=3           # run 3 instances

# ── SYSTEM ────────────────────────────────────────────────
docker system df                         # disk usage breakdown
docker system prune                      # remove unused resources
docker system prune -a                   # also unused images
docker system info                       # docker daemon info
docker version                           # client + server versions
```

## Dockerfile Quick Reference

```dockerfile
FROM image:tag                    # base image
LABEL key="value"                 # metadata
WORKDIR /path                     # set working directory
RUN command                       # execute during build
COPY src dest                     # copy files
ADD src dest                      # copy + handle URLs/tar
ENV KEY=value                     # environment variable
ARG NAME=default                  # build-time variable
EXPOSE 8080                       # document port
VOLUME /data                      # create mount point
USER username                     # switch user
CMD ["cmd", "arg"]                # default command
ENTRYPOINT ["cmd", "arg"]         # always-run command
HEALTHCHECK --interval=30s CMD... # health check
```

## Docker Compose File Structure

```yaml
version: "3.8"
services:
  name:
    image: image:tag              # use existing image
    build: .                      # or build from Dockerfile
    build:
      context: ./dir
      dockerfile: Dockerfile.prod
      args:
        - VERSION=1.0
    ports:
      - "host:container"
    environment:
      - KEY=value
    env_file: .env
    volumes:
      - named:/container/path
      - ./host:/container/path
    networks:
      - mynet
    depends_on:
      - other_service
    restart: unless-stopped       # no, always, on-failure
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost/health"]
      interval: 30s
      timeout: 10s
      retries: 3
    command: ["override", "cmd"]
    entrypoint: ["override"]
    user: "1001:1001"
    read_only: true

volumes:
  named:                          # named volume declaration

networks:
  mynet:
    driver: bridge
```

## Real Dockerfile Examples

```dockerfile
# Python Flask App
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN useradd -r appuser && chown -R appuser /app
USER appuser
EXPOSE 5000
HEALTHCHECK CMD curl -f http://localhost:5000/health || exit 1
CMD ["python3", "app.py"]

# Node.js App (multi-stage)
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/server.js"]

# Java Spring Boot (multi-stage)
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

# Nginx static site
FROM nginx:alpine
COPY ./dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## .dockerignore Template

```
# Version control
.git/
.gitignore

# Dependencies (reinstalled in container)
node_modules/
vendor/
__pycache__/
*.pyc
*.pyo
.venv/
venv/

# Build outputs
dist/
build/
target/
*.jar
!app.jar

# IDE files
.idea/
.vscode/
*.swp

# OS files
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Secrets (never include these!)
.env
*.pem
*.key
secrets/

# Tests
tests/
test/
*.test.js
*_test.go
```

## Image Layer Strategy — Order Matters

```dockerfile
# WORST: rebuild everything on any change
COPY . .
RUN pip install -r requirements.txt

# BEST: cache dependencies separately
COPY requirements.txt .      # changes rarely → cached
RUN pip install -r requirements.txt   # cached if requirements.txt unchanged
COPY . .                     # changes often → rebuild only app copy

# For Node.js
COPY package.json package-lock.json ./
RUN npm ci                   # cached until package.json changes
COPY . .                     # app code changes frequently
```

## Production Checklist

```
✅ Non-root user (USER instruction)
✅ Specific image tag (not :latest)
✅ Multi-stage build (minimize image size)
✅ .dockerignore (exclude unnecessary files)
✅ HEALTHCHECK defined
✅ No secrets in image (use runtime env vars or secrets manager)
✅ Resource limits set (--memory, --cpus)
✅ Image scanned for vulnerabilities (trivy, docker scout)
✅ Read-only filesystem where possible
✅ Minimal base image (alpine, distroless, slim)
✅ Combine RUN commands to reduce layers
✅ Dependencies layer before code layer (cache optimization)
```
