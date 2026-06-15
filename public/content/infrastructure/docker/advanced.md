# Docker — Advanced

## Volumes and Persistent Data

Containers are **ephemeral and immutable** — when a container is removed, all data inside it is gone. Volumes solve this.

**Key principle from the notes:**
> Containers are usually immutable and ephemeral — just fancy buzzwords for unchanging and temporary or disposable. Containers are Ephemeral and once a container is removed, it is gone.

The fundamental goal: **separate container lifecycle from data lifecycle**.

### Three Storage Options

```
1. Volumes     — managed by Docker, stored in /var/lib/docker/volumes/
2. Bind Mounts — maps a host directory directly into the container
3. tmpfs       — stored in host memory only (Linux only)
```

### Docker Volumes

```bash
# Create a named volume
docker volume create mydata

# List volumes
docker volume ls

# Inspect a volume
docker volume inspect mydata
# Shows Mountpoint: /var/lib/docker/volumes/mydata/_data

# Mount volume when running container
docker run -it -v mydata:/data --name container1 ubuntu bash
# Inside container: ls — you'll see a 'data' directory

# Mount same volume in another container (share data)
docker run -it -v mydata:/data --name container2 ubuntu bash
# Both containers read/write the same data

# Remove volume (only works if no container is using it)
docker volume rm mydata

# Remove all unused volumes
docker volume prune
```

**Facts about volumes (from the notes):**
- A data volume is a specially designed directory in the container
- It is initialized when the container is created
- By default, it is NOT deleted when the container is stopped
- It is NOT even garbage collected when there is no container referencing the volume
- Data volumes can be independently updated
- Data volumes can be shared across containers

### Bind Mounts

```bash
# Mount a host directory into the container
docker run -it -v /home/user/myapp:/app ubuntu bash
# /home/user/myapp on host = /app inside container
# Changes visible immediately in both directions

# Read-only bind mount
docker run -v /etc/nginx:/etc/nginx:ro nginx

# Mount current directory
docker run -v $(pwd):/workspace -w /workspace python:3.11 python app.py

# Mounting a single file
docker run -v $(pwd)/config.yml:/app/config.yml myapp
```

### Volume in Docker Compose

```yaml
version: "3.8"
services:
  db:
    image: postgres:15
    volumes:
      - pgdata:/var/lib/postgresql/data    # named volume
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql  # bind mount

  app:
    image: myapp:latest
    volumes:
      - ./src:/app/src          # bind mount for development (hot reload)
      - logs:/app/logs          # named volume for logs

volumes:
  pgdata:    # declare named volumes
  logs:
```

## Docker Networking

```bash
# List networks
docker network ls
# NETWORK ID     NAME      DRIVER    SCOPE
# abc123         bridge    bridge    local    ← default for containers
# def456         host      host      local    ← shares host network
# ghi789         none      null      local    ← no networking

# Create custom network
docker network create mynetwork
docker network create --driver bridge --subnet 172.20.0.0/16 mynetwork

# Run containers on custom network
docker run -d --name web --network mynetwork nginx
docker run -d --name db  --network mynetwork postgres

# Containers on same network can reach each other by name:
# web container: ping db      ← works! DNS resolution by name
# default bridge: can't resolve by name

# Connect existing container to network
docker network connect mynetwork container1

# Disconnect
docker network disconnect mynetwork container1

# Inspect network (see connected containers)
docker network inspect mynetwork

# Remove network
docker network rm mynetwork
```

### Network Drivers

| Driver | Description | Use case |
|---|---|---|
| bridge | Software bridge on host | Default, single host |
| host | Remove network isolation, use host directly | Maximum performance |
| overlay | Multi-host networking | Docker Swarm |
| none | Disable networking | Maximum isolation |

## Docker Compose — Production Patterns

```yaml
# docker-compose.yml
version: "3.8"

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - certbot-etc:/etc/letsencrypt
    depends_on:
      - app
    restart: unless-stopped

  app:
    build:
      context: .
      dockerfile: Dockerfile
      args:
        - VERSION=1.0.0
    environment:
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_NAME=myapp
      - DB_USER=appuser
      - DB_PASSWORD=${DB_PASSWORD}      # from .env file
    env_file:
      - .env
    depends_on:
      postgres:
        condition: service_healthy     # wait until postgres is healthy
    restart: unless-stopped
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M

  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser -d myapp"]
      interval: 10s
      timeout: 5s
      retries: 5
    restart: unless-stopped

  redis:
    image: redis:7-alpine
    command: redis-server --requirepass ${REDIS_PASSWORD}
    volumes:
      - redisdata:/data
    restart: unless-stopped

volumes:
  pgdata:
  redisdata:
  certbot-etc:

networks:
  default:
    name: myapp-network
```

```bash
# Compose commands
docker compose up -d              # start all services
docker compose down               # stop + remove containers
docker compose down -v            # also remove volumes (destroys data!)
docker compose restart app        # restart single service
docker compose scale app=3        # run 3 instances of app
docker compose logs -f app        # follow logs
docker compose exec app bash      # shell into running container
docker compose ps                 # status of all services
docker compose pull               # pull latest images
docker compose build --no-cache   # rebuild images
```

## Container Security

```dockerfile
# 1. Never run as root
RUN useradd -r -u 1001 -s /bin/false appuser
USER appuser

# 2. Read-only filesystem
# docker run --read-only myapp
# Use tmpfs for directories that need writes:
# docker run --read-only --tmpfs /tmp myapp

# 3. Minimal base image
FROM scratch            # literally empty
FROM distroless/python  # no shell, no package manager — attack surface ≈ 0
FROM alpine:3.18        # tiny Linux (~5MB) with busybox

# 4. No secrets in Dockerfile
# BAD:
ENV DB_PASSWORD=mysecret     # visible in docker inspect and docker history
# GOOD: pass at runtime:
# docker run -e DB_PASSWORD=mysecret myapp
# Or use Docker secrets (Swarm) or K8s secrets
```

```bash
# Scan image for vulnerabilities
docker scout cves myapp:latest        # Docker Scout (built-in)
trivy image myapp:latest              # Trivy (popular open-source)
grype myapp:latest                    # Grype (Anchore)

# Check what's running as root
docker run --rm -it myapp whoami

# Run with dropped capabilities
docker run --cap-drop ALL --cap-add NET_BIND_SERVICE myapp

# Read-only filesystem + tmpfs for /tmp
docker run --read-only --tmpfs /tmp:rw,noexec,nosuid,size=65536k myapp
```

## Docker Swarm — Container Orchestration

```bash
# Initialize swarm (on manager node)
docker swarm init --advertise-addr 192.168.1.10

# Add worker nodes (use token from swarm init output)
docker swarm join --token SWMTKN-1-xxx 192.168.1.10:2377

# Deploy a service
docker service create --name webapp --replicas 3 -p 80:80 nginx

# Scale up
docker service scale webapp=5

# Update service (rolling update)
docker service update --image nginx:alpine webapp

# See service status
docker service ls
docker service ps webapp

# Rolling update config
docker service update \
    --update-parallelism 1 \   # update 1 replica at a time
    --update-delay 10s \       # wait 10s between updates
    --rollback-order stop-first \
    webapp
```

## Docker in CI/CD Pipeline (Jenkins)

Complete pipeline from the notes — build, push, deploy:

```groovy
// Jenkinsfile
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/org/regapp.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t saifshah/regapp:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        docker login -u $DOCKER_USER -p $DOCKER_PASS
                        docker push saifshah/regapp:latest
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kube_deploy.yml'
                sh 'kubectl apply -f kube_service.yml'
                sh 'kubectl rollout status deployment/saifshah-regapp'
            }
        }
    }

    post {
        success { echo 'Deployment successful!' }
        failure { echo 'Deployment failed!' }
    }
}
```

**Kubernetes manifests used in the pipeline:**

```yaml
# kube_deploy.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: saifshah-regapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: saifshah-regapp
  template:
    metadata:
      labels:
        app: saifshah-regapp
    spec:
      containers:
      - name: regapp
        image: saifshah/regapp:latest
        ports:
        - containerPort: 8080

---
# kube_service.yml
apiVersion: v1
kind: Service
metadata:
  name: saifshah-service
spec:
  selector:
    app: saifshah-regapp
  ports:
  - name: nginxport
    port: 80
    targetPort: 80
  type: LoadBalancer
```

## Troubleshooting Docker

```bash
# Container keeps restarting
docker logs container_name            # see crash reason
docker logs --tail 100 container_name # last 100 lines
docker inspect container_name         # full details including exit code

# Container won't start — run interactively
docker run -it --entrypoint bash myapp   # override entrypoint
docker run -it myapp sh                  # try sh if bash not available

# Port already in use
ss -tulnp | grep :8080
docker ps | grep 8080

# Disk space issues
docker system df                      # see disk usage breakdown
docker system prune                   # remove unused: containers, networks, images, build cache
docker system prune -a                # also remove unused images (not just dangling)
docker volume prune                   # remove unused volumes

# Container networking issues
docker exec container1 ping container2       # test connectivity
docker exec container1 nslookup container2  # test DNS
docker network inspect mynetwork            # see container IPs

# Build cache issues
docker build --no-cache -t myapp .          # ignore all cache
docker builder prune                        # clear build cache

# See full image history (layers)
docker history myapp:latest

# Check what changed in a container vs its image
docker diff container_name
# A = Added, C = Changed, D = Deleted

# Resource usage
docker stats                                # live CPU/memory usage
docker stats --no-stream                    # snapshot (no live update)
```
