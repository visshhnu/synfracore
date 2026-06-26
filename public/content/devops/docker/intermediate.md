# Docker — Advanced Patterns & Production



## Multi-stage Builds & Security

# Docker Complete Guide

DevOps › Docker
**Docker**

Beginner
Engineer
Production
Architect
Build, ship, run containers — from basics to production hardening


**What you will learn:** What Docker is → Dockerfile best practices → Multi-stage builds → All commands → Troubleshooting (OOMKilled, restart loops, exit codes) → Security hardening → Trivy scanning → Docker Compose → CI/CD integration → 10 senior interview Q&As




[What is Docker](#sec-what)
[Dockerfile](#sec-dockerfile)
[Commands](#sec-commands)
[Troubleshoot](#sec-troubleshoot)
[Security](#sec-security)
[Registry](#sec-registry)
[Compose](#sec-compose)
[CI/CD](#sec-cicd)
[Interview Q&A](#sec-interview)
[Roadmap](#sec-roadmap)








## 🐳 What is Docker?
›





Docker is a platform for building, shipping, and running applications in containers. A container is a lightweight, isolated process that packages the application with everything it needs — code, runtime, libraries, config. The key insight: **works on my machine = works everywhere**. Before Docker, "it works on my machine" was the most common phrase in engineering. Docker killed that problem.


#### Container vs Virtual Machine

|  | Container | Virtual Machine |
|---|---|---|
| Startup time | Milliseconds | Minutes |
| Size | MB | GB |
| Isolation | Process-level (kernel shared) | Full OS isolation |
| Performance | Near-native | 5-15% overhead |
| Use case | Microservices, CI/CD | Full OS isolation needed |


#### Core Docker Concepts


- **Image** — read-only template with layers. Built from Dockerfile. Stored in registry.

- **Container** — running instance of an image. Ephemeral by default (data lost on stop).

- **Dockerfile** — instructions to build an image. Each instruction = one layer.

- **Registry** — stores images. Docker Hub (public), ECR/ACR/Harbor (private).

- **Layer cache** — unchanged layers are reused. Order of instructions matters for build speed.


Docker basicsCopy


```

```







## 📄 Dockerfile — Best Practices
›





The Dockerfile is the most important Docker artifact. A bad Dockerfile creates large, slow, insecure images. A good Dockerfile creates small, fast, secure images. Interviewers always ask about Dockerfile best practices — this is where junior and senior engineers differ.


#### The Most Common Mistake — Wrong Layer Order

Docker caches layers. If layer N changes, all layers N+1 onwards are rebuilt. Dependencies change rarely. Code changes every commit. Always copy dependencies before code.


BAD vs GOOD DockerfileCopy


```

```


#### Multi-Stage Builds — Production Standard

Multi-stage builds use multiple FROM instructions. The final image only contains what the last stage copies. Result: a 1.2GB build image becomes a 50MB production image.


Multi-stage build — production gradeCopy


```

```


#### .dockerignore — Always Create This


.dockerignoreCopy


```

```







## 🖥️ Docker Commands — Complete Reference
›






Images — build, pull, push, inspectCopy


```

```


Containers — run, exec, logs, inspectCopy


```

```


Networking and volumesCopy


```

```







## 🔍 Troubleshooting — Real Production Issues
›





#### Exit Codes — What They Mean

| Exit Code | Meaning | What to do |
|---|---|---|
| 0 | Clean exit — app stopped itself | Check if this was expected |
| 1 | Application error / unhandled exception | Check application logs |
| 137 | OOMKilled — memory limit exceeded (kill -9) | Increase memory limit or fix memory leak |
| 139 | Segmentation fault — app crashed | Check for null pointer, buffer overflow |
| 143 | SIGTERM received — graceful shutdown | Normal — container stopped gracefully |
| 125 | Docker daemon error | Check docker daemon logs |
| 126 | Command not executable (permission) | Check file permissions in container |
| 127 | Command not found | Check CMD/ENTRYPOINT, image contents |


Troubleshooting container issuesCopy


```

```


#### Container keeps restarting — systematic approach


Debug restart loopCopy


```

```







## 🔒 D
