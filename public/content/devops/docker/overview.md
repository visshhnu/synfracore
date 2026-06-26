# Docker

> **Build, ship, run containers anywhere**

**Category:** Containers  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Docker?

Containers are isolated processes using Linux namespaces (PID, net, mnt, etc.) and cgroups (resource limits). Not VMs — they share the host kernel. Docker daemon runs containers. Docker Hub is the default registry.

## Why Docker?

Order Dockerfile instructions from least to most frequently changing (maximize cache hits). Multi-stage builds reduce final image size — build in one stage, copy artifacts to minimal runtime image. Never run as root in containers.

---

## Learning Modules

### Module 01 — Container Fundamentals
*VMs vs containers, namespaces, cgroups*

Containers are isolated processes using Linux namespaces (PID, net, mnt, etc.) and cgroups (resource limits). Not VMs — they share the host kernel. Docker daemon runs containers. Docker Hub is the default registry.

**Topics covered:**

- Why containers — 🟢 Beginner
- Linux namespaces and cgroups — 🟡 Intermediate
- Docker architecture (daemon, CLI, registry) — 🟢 Beginner

### Module 02 — Dockerfile Best Practices
*Layers, multi-stage, security*

Order Dockerfile instructions from least to most frequently changing (maximize cache hits). Multi-stage builds reduce final image size — build in one stage, copy artifacts to minimal runtime image. Never run as root in containers.

**Topics covered:**

- Dockerfile instructions — 🟢 Beginner
- Layer caching strategy — 🟡 Intermediate
- Multi-stage builds — 🟡 Intermediate
- Non-root user and security — 🟡 Intermediate
- Image scanning — 🔴 Advanced

### Module 03 — Docker Compose
*Multi-container local development*

Docker Compose defines multi-container applications. Perfect for local development environments. Define services, their images, environment vars, volumes, and network connections. Use .env files for local secrets.

**Topics covered:**

- docker-compose.yml structure — 🟢 Beginner
- Services, networks, volumes — 🟡 Intermediate
- Environment variables and secrets — 🟡 Intermediate

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Docker and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Docker work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Docker?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Docker?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Docker?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Docker in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Docker?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Docker compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Container Fundamentals in Docker."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Dockerfile Best Practices in Docker."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*