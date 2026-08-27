# Docker — The Container Platform

Docker packages your application and all its dependencies into a **container** — a lightweight, portable, isolated unit that runs identically on any machine. No more "it works on my laptop."

:::info What is a Container?
A container is not a virtual machine. It shares the host OS kernel but has its own isolated filesystem, process space, and network. This makes containers start in milliseconds and use 10-100× less memory than VMs.
:::

## How Docker Works

On a single host, the Docker Engine sits between the hardware and any number of isolated containers — each with its own app, base image, and port, but sharing the same underlying kernel:

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "Containers (isolated from each other)", "sublabel": "Container A: Node.js App on node:20-alpine, port 3000 · Container B: Python API on python:3.12-slim, port 8000 · Container C: PostgreSQL on postgres:16-alpine, port 5432", "color": "blue" },
    { "label": "Docker Engine (containerd + runc)", "color": "green" },
    { "label": "Hardware", "sublabel": "CPU · RAM · Disk · Network", "color": "slate" }
  ]
}
```

```conceptgrid
{
  "boxes": [
    { "title": "Container A", "description": "Node.js App — node:20-alpine — port 3000", "color": "blue" },
    { "title": "Container B", "description": "Python API — python:3.12-slim — port 8000", "color": "purple" },
    { "title": "Container C", "description": "PostgreSQL — postgres:16-alpine — port 5432", "color": "green" }
  ]
}
```

## VM vs Container

| | Virtual Machine | Docker Container |
|---|---|---|
| **Start time** | 30 seconds – 5 minutes | Milliseconds |
| **Size** | GB (full OS) | MB (just app + deps) |
| **Isolation** | Full hardware virtualization | OS kernel shared |
| **Performance** | ~10-20% overhead | Near-native |
| **Use case** | Full OS needed | App packaging & scaling |

## The Docker Build Workflow

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Dockerfile", "sublabel": "Instructions", "color": "blue" },
    { "label": "docker build", "sublabel": "Creates Image", "color": "purple" },
    { "label": "docker push", "sublabel": "Registry (DockerHub)", "color": "green" },
    { "label": "docker run", "sublabel": "Running Container", "color": "amber" }
  ]
}
```

## Your First Dockerfile

```dockerfile
# Start from official Node.js image
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy dependency files first (better layer caching)
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to start the app
CMD ["node", "server.js"]
```

## Essential Commands

```bash
# Build an image from Dockerfile in current directory
docker build -t myapp:1.0 .

# Run a container
docker run -d -p 3000:3000 --name my-container myapp:1.0

# List running containers
docker ps

# View logs
docker logs -f my-container

# Stop and remove
docker stop my-container && docker rm my-container

# List images
docker images
```

:::tip Key Concept: Images vs Containers
An **Image** is the blueprint (read-only). A **Container** is a running instance of an image. You can run many containers from one image — like a class and its objects in programming.
:::

## When to Use Docker

- **Consistent environments** — dev, staging, prod all run identical software
- **Microservices** — each service in its own container, independently deployable  
- **CI/CD pipelines** — build once, run anywhere
- **Local development** — spin up databases, Redis, Kafka with one command
- **Kubernetes** — all K8s workloads are containers
