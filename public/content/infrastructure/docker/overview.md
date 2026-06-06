# Docker — Container Platform

Docker revolutionized how we build, ship, and run applications. Understanding Docker deeply is non-negotiable for any DevOps or Cloud engineer.

## What is Docker?

Docker is a platform for developing, shipping, and running applications in **containers**. A container is a lightweight, isolated environment that packages an application with all its dependencies — code, runtime, libraries, config — into a single unit that runs consistently anywhere.

## Containers vs. Virtual Machines

\`\`\`
Virtual Machines:              Containers:
┌─────────────────────┐       ┌─────────────────────┐
│   App A   │  App B  │       │   App A   │  App B  │
│  Libs A   │ Libs B  │       │  Libs A   │ Libs B  │
│ Guest OS  │Guest OS │       ├───────────┴─────────┤
│    VM     │   VM    │       │    Container Engine  │
├─────────────────────┤       ├─────────────────────┤
│     Hypervisor      │       │      Host OS        │
├─────────────────────┤       ├─────────────────────┤
│      Hardware       │       │      Hardware       │
└─────────────────────┘       └─────────────────────┘
Size: GBs, Boot: minutes     Size: MBs, Boot: seconds
\`\`\`

Containers share the host OS kernel — no hypervisor needed. This makes them much faster and lighter.

## Core Docker Concepts

**Image** — A read-only template containing your application and its environment. Built from a Dockerfile. Images are layered — each instruction adds a layer. Stored in registries (Docker Hub, ECR, GCR).

**Container** — A running instance of an image. You can run multiple containers from the same image. Containers have a thin writable layer on top of the image layers.

**Registry** — A storage system for Docker images. Docker Hub (public), AWS ECR, GitHub Container Registry, self-hosted Harbor.

**Dockerfile** — A text file with instructions to build an image. Each instruction creates a layer.

**Docker Compose** — Tool for defining and running multi-container applications using a YAML file.

## Why Docker Matters for DevOps

- **"Works on my machine" solved** — Container includes everything needed
- **Consistent environments** — dev = staging = production
- **Fast deployments** — Pull and run in seconds
- **Microservices** — Each service in its own container
- **Kubernetes** — K8s orchestrates Docker containers
- **CI/CD** — Build once, deploy everywhere

## Architecture

\`\`\`
Docker Client  ──→  Docker Daemon (dockerd)
 (docker CLI)        │
                     ├── Images
                     ├── Containers  
                     ├── Networks
                     └── Volumes
                     
Docker Daemon  ──→  containerd  ──→  runc (OCI runtime)
\`\`\`