# Docker — The Container Platform

Docker packages your application and all its dependencies into a **container** — a lightweight, portable, isolated unit that runs identically on any machine. No more "it works on my laptop."

:::info What is a Container?
A container is not a virtual machine. It shares the host OS kernel but has its own isolated filesystem, process space, and network. This makes containers start in milliseconds and use 10-100× less memory than VMs.
:::

## How Docker Works

```svg
<svg viewBox="0 0 720 340" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <defs>
    <linearGradient id="blueGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#2563EB;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#7C3AED;stop-opacity:1"/>
    </linearGradient>
  </defs>

  <!-- Host Machine -->
  <rect x="10" y="10" width="700" height="320" rx="14" fill="none" stroke="#374151" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="30" y="34" font-size="12" fill="#6B7280" font-weight="600">HOST MACHINE (Linux / macOS / Windows)</text>

  <!-- Hardware layer -->
  <rect x="30" y="280" width="660" height="36" rx="8" fill="#1F2937"/>
  <text x="360" y="303" font-size="12" fill="#9CA3AF" text-anchor="middle" font-weight="600">Hardware (CPU · RAM · Disk · Network)</text>

  <!-- Docker Engine -->
  <rect x="30" y="230" width="660" height="38" rx="8" fill="#064E3B"/>
  <text x="360" y="254" font-size="13" fill="#34D399" text-anchor="middle" font-weight="700">Docker Engine (containerd + runc)</text>

  <!-- Containers -->
  <rect x="44" y="80" width="195" height="136" rx="10" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1.5"/>
  <text x="141" y="104" font-size="12" fill="#93C5FD" text-anchor="middle" font-weight="700">Container A</text>
  <rect x="60" y="112" width="163" height="24" rx="6" fill="#1D4ED8" opacity="0.5"/>
  <text x="141" y="129" font-size="11" fill="#BFDBFE" text-anchor="middle">Node.js App</text>
  <rect x="60" y="142" width="163" height="24" rx="6" fill="#1D4ED8" opacity="0.4"/>
  <text x="141" y="159" font-size="11" fill="#BFDBFE" text-anchor="middle">node:20-alpine</text>
  <rect x="60" y="172" width="163" height="24" rx="6" fill="#1D4ED8" opacity="0.3"/>
  <text x="141" y="189" font-size="11" fill="#93C5FD" text-anchor="middle">Port 3000</text>

  <rect x="263" y="80" width="195" height="136" rx="10" fill="#1E3A5F" stroke="#8B5CF6" stroke-width="1.5"/>
  <text x="360" y="104" font-size="12" fill="#C4B5FD" text-anchor="middle" font-weight="700">Container B</text>
  <rect x="279" y="112" width="163" height="24" rx="6" fill="#5B21B6" opacity="0.5"/>
  <text x="360" y="129" font-size="11" fill="#DDD6FE" text-anchor="middle">Python API</text>
  <rect x="279" y="142" width="163" height="24" rx="6" fill="#5B21B6" opacity="0.4"/>
  <text x="360" y="159" font-size="11" fill="#DDD6FE" text-anchor="middle">python:3.12-slim</text>
  <rect x="279" y="172" width="163" height="24" rx="6" fill="#5B21B6" opacity="0.3"/>
  <text x="360" y="189" font-size="11" fill="#C4B5FD" text-anchor="middle">Port 8000</text>

  <rect x="482" y="80" width="195" height="136" rx="10" fill="#1E3A5F" stroke="#10B981" stroke-width="1.5"/>
  <text x="579" y="104" font-size="12" fill="#6EE7B7" text-anchor="middle" font-weight="700">Container C</text>
  <rect x="498" y="112" width="163" height="24" rx="6" fill="#065F46" opacity="0.5"/>
  <text x="579" y="129" font-size="11" fill="#A7F3D0" text-anchor="middle">PostgreSQL</text>
  <rect x="498" y="142" width="163" height="24" rx="6" fill="#065F46" opacity="0.4"/>
  <text x="579" y="159" font-size="11" fill="#A7F3D0" text-anchor="middle">postgres:16-alpine</text>
  <rect x="498" y="172" width="163" height="24" rx="6" fill="#065F46" opacity="0.3"/>
  <text x="579" y="189" font-size="11" fill="#6EE7B7" text-anchor="middle">Port 5432</text>

  <!-- Isolated labels -->
  <text x="141" y="230" font-size="10" fill="#60A5FA" text-anchor="middle">isolated</text>
  <text x="360" y="230" font-size="10" fill="#A78BFA" text-anchor="middle">isolated</text>
  <text x="579" y="230" font-size="10" fill="#34D399" text-anchor="middle">isolated</text>
</svg>
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

```svg
<svg viewBox="0 0 720 120" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Steps -->
  <rect x="10"  y="30" width="130" height="60" rx="10" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1.5"/>
  <text x="75"  y="56" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">Dockerfile</text>
  <text x="75"  y="74" font-size="10" fill="#60A5FA" text-anchor="middle">Instructions</text>

  <text x="165" y="65" font-size="20" fill="#3B82F6" text-anchor="middle">→</text>

  <rect x="190" y="30" width="130" height="60" rx="10" fill="#1E3A5F" stroke="#8B5CF6" stroke-width="1.5"/>
  <text x="255" y="56" font-size="11" fill="#C4B5FD" text-anchor="middle" font-weight="700">docker build</text>
  <text x="255" y="74" font-size="10" fill="#A78BFA" text-anchor="middle">Creates Image</text>

  <text x="345" y="65" font-size="20" fill="#8B5CF6" text-anchor="middle">→</text>

  <rect x="370" y="30" width="130" height="60" rx="10" fill="#1E3A5F" stroke="#10B981" stroke-width="1.5"/>
  <text x="435" y="56" font-size="11" fill="#6EE7B7" text-anchor="middle" font-weight="700">docker push</text>
  <text x="435" y="74" font-size="10" fill="#34D399" text-anchor="middle">Registry (DockerHub)</text>

  <text x="525" y="65" font-size="20" fill="#10B981" text-anchor="middle">→</text>

  <rect x="550" y="30" width="130" height="60" rx="10" fill="#1E3A5F" stroke="#F59E0B" stroke-width="1.5"/>
  <text x="615" y="56" font-size="11" fill="#FDE68A" text-anchor="middle" font-weight="700">docker run</text>
  <text x="615" y="74" font-size="10" fill="#FCD34D" text-anchor="middle">Running Container</text>
</svg>
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
