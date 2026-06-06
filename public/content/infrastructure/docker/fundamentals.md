# Docker Fundamentals

## Installation

\`\`\`bash
# Ubuntu - official method
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker   # Apply group without logout

# Verify
docker --version
docker run hello-world
\`\`\`

## Essential Commands

\`\`\`bash
# Images
docker pull nginx              # Pull from Docker Hub
docker pull nginx:1.25         # Specific version
docker images                  # List local images
docker rmi nginx               # Remove image
docker image prune             # Remove unused images

# Containers — Run
docker run nginx               # Run (foreground, blocks terminal)
docker run -d nginx            # Detached (background)
docker run -d -p 8080:80 nginx # Map host:container port
docker run -d --name mynginx nginx  # Named container
docker run --rm nginx          # Auto-remove when stopped
docker run -it ubuntu bash     # Interactive terminal
docker run -e DB_HOST=localhost myapp  # Environment variable

# Containers — Manage
docker ps                      # Running containers
docker ps -a                   # All containers (including stopped)
docker stop mynginx            # Graceful stop (SIGTERM)
docker kill mynginx            # Force stop (SIGKILL)
docker start mynginx           # Start stopped container
docker restart mynginx
docker rm mynginx              # Remove stopped container
docker rm -f mynginx           # Force remove running container

# Inspect
docker logs mynginx            # Container logs
docker logs -f mynginx         # Follow logs
docker logs --tail 100 mynginx # Last 100 lines
docker exec -it mynginx bash   # Shell into running container
docker exec mynginx nginx -t   # Run command in container
docker inspect mynginx         # Full container details (JSON)
docker stats                   # Live resource usage
docker top mynginx             # Processes in container
\`\`\`

## Writing Dockerfiles

\`\`\`dockerfile
# Example: Node.js application

# Base image - always use specific versions in production
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files first (layer caching optimization)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Create non-root user (security best practice)
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeuser -u 1001
USER nodeuser

# Document which port the app uses (informational)
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Command to run
CMD ["node", "server.js"]
\`\`\`

\`\`\`bash
# Build the image
docker build -t myapp:1.0 .
docker build -t myapp:latest -f Dockerfile.prod .

# Tag and push
docker tag myapp:1.0 myregistry.io/myapp:1.0
docker push myregistry.io/myapp:1.0
\`\`\`

## Docker Volumes

\`\`\`bash
# Named volumes (managed by Docker, best for databases)
docker volume create dbdata
docker run -d -v dbdata:/var/lib/mysql mysql:8

# Bind mounts (host path, best for development)
docker run -d -v /host/path:/container/path nginx
docker run -d -v $(pwd):/app node:20 npm run dev

# tmpfs (in-memory, for sensitive data)
docker run -d --tmpfs /tmp:noexec,size=100m myapp

# Volume commands
docker volume ls
docker volume inspect dbdata
docker volume rm dbdata
docker volume prune         # Remove unused volumes
\`\`\`

## Docker Networks

\`\`\`bash
# Network types
# bridge  - default, containers communicate via IP
# host    - container uses host network (no isolation)
# none    - no network
# overlay - multi-host (Swarm/Kubernetes)

# Create custom network
docker network create mynet
docker network create --driver bridge --subnet 172.20.0.0/16 mynet

# Connect containers
docker run -d --network mynet --name app myapp
docker run -d --network mynet --name db mysql:8
# Now 'app' can reach 'db' by hostname 'db'!

# Commands
docker network ls
docker network inspect mynet
docker network connect mynet existing-container
docker network disconnect mynet existing-container
\`\`\`