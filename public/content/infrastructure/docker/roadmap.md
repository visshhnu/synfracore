# Docker — Learning Roadmap

## Time to Job-Ready: 4 weeks (2 hours/day)

**Goal:** Containerize any application, write production Dockerfiles, and orchestrate multi-service apps.

## Phase 1 — Container Basics (Week 1)
- Install Docker Desktop (Mac/Windows) or Docker Engine (Linux)
- Understand: image vs container, daemon vs client, registry vs repository
- Core commands: `docker pull`, `docker run`, `docker ps`, `docker logs`, `docker exec`
- Port mapping (`-p`), volume mounts (`-v`), environment variables (`-e`)
- `docker stop`, `docker rm`, `docker rmi` — container lifecycle

## Phase 2 — Building Images (Week 2)
- Write Dockerfiles: `FROM`, `RUN`, `COPY`, `WORKDIR`, `EXPOSE`, `CMD`, `ENTRYPOINT`
- Multi-stage builds — reduce image size from 900MB to 120MB
- Layer caching — order instructions for fastest rebuilds
- `.dockerignore` — exclude unnecessary files
- Push to Docker Hub: `docker tag`, `docker push`

## Phase 3 — Docker Compose (Week 3)
- Write `docker-compose.yml`: services, networks, volumes
- Multi-container apps: web app + database + Redis cache
- Health checks and `depends_on` conditions
- Named volumes for data persistence
- `docker compose up/down/logs/ps/exec/scale`

## Phase 4 — Production Patterns (Week 4)
- Security: non-root user, read-only filesystem, no secrets in images
- Docker secrets and environment file management
- Resource limits: `--memory`, `--cpus`
- Networking: bridge, host, overlay modes
- Container scanning with Trivy: `trivy image myapp:latest`
- Multi-architecture builds: `docker buildx`

## Certifications
- **Docker Certified Associate (DCA)** — the main Docker certification

## Jobs After Docker Mastery
DevOps Engineer · Platform Engineer · Backend Developer · Cloud Engineer

## Resources
- **Docker official docs** — docs.docker.com (best reference)
- **Play with Docker** — labs.play-with-docker.com (free browser-based lab)
- **Docker Deep Dive** by Nigel Poulton (concise book, ~200 pages)
