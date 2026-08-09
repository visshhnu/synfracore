# Docker — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept

```
Containers = isolated PROCESSES using Linux namespaces (PID, net, mnt)
  + cgroups (resource limits) — NOT VMs, share the host kernel.
  This is WHY containers start in milliseconds vs. VMs' full boot.
Docker daemon — runs/manages containers. Docker Hub — default
  public registry.
Real value: PORTABILITY (works identically laptop -> CI -> prod),
  not just resource efficiency — solves "works on my machine."
```

## Dockerfile Best Practices

```
Instruction order: LEAST to MOST frequently changing — dependency
  install BEFORE application code (code changes far more often,
  so putting it last maximizes cache hits on the layers above it)
Multi-stage builds — full toolchain in build stage, copy ONLY the
  compiled artifact into a minimal runtime stage
Non-root USER — default, not optional — limits blast radius of a
  compromised container process
.dockerignore — always create (excludes .git, __pycache__, node_modules
  etc. from build context — smaller context = faster builds)
```

## Compose — Local Multi-Container Dev

```
docker-compose.yml — declarative multi-service definition
.env files — local secrets/config, NOT hardcoded into compose file
depends_on: condition: service_healthy — prevents startup race
  conditions (a common real bug without this)
```

## Common Failure Modes (verified from this guide's Troubleshooting)

```
Container exits immediately  -> usually the main process itself exited
  (not a crash) — check CMD/ENTRYPOINT is a long-running foreground process
Permission denied inside container -> USER mismatch between host-mounted
  volume ownership and container's non-root user
Build fails on layer cache    -> a change earlier in the Dockerfile
  invalidates every layer after it — reorder for max cache reuse
Container can't reach host/other containers -> network mode / DNS
  resolution within the compose network, not the host's network
Disk space full               -> dangling images/volumes/build cache
  accumulate silently — docker system prune is the direct fix
```

## Security Hardening Checklist

```
1. Non-root USER (default posture, not exception)
2. Multi-stage builds — no build toolchain in the final runtime image
3. Image scanning (Trivy or equivalent) — BEFORE push, not after
4. Minimal base image (alpine/distroless) — smaller attack surface
5. .dockerignore — prevents secrets/credentials from ever entering
   the build context accidentally
```

## CI/CD Integration Pattern

```
build -> scan (fail on critical CVE) -> push -> deploy
Tag with commit SHA, not just "latest" — "latest" alone breaks
  the ability to know exactly what's running at any given time
```

## Versioning Note

Docker Engine/CLI version-specific flag behavior and Docker Hub's current rate-limit policy `(needs verification — recheck against current source)` — these are genuinely volatile and change over time; don't cite specific numbers from memory without checking current documentation.
