# Docker

> **Build, ship, run containers anywhere**

**Category:** Containers
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need basic Linux command-line comfort (`cd`, `ls`, `cat`, running a command with `sudo`) and a rough idea of what a "port" is (e.g. that web servers usually listen on port 80). You do **not** need prior programming experience, prior container experience, or any knowledge of virtual machines — this page assumes none of that. See the **Prerequisites** tab for the full detail and time estimate.

---

## What is Docker?

Containers are isolated processes using Linux namespaces (PID, net, mnt, etc.) and cgroups (resource limits) — not VMs, since they share the host kernel rather than virtualizing an entire OS. This is exactly why containers start in milliseconds and use a fraction of a VM's memory: there's no separate kernel to boot. The Docker daemon runs and manages containers; Docker Hub is the default public registry for storing and pulling images.

On a single host, the Docker Engine sits between the hardware and any number of isolated containers — each with its own app and dependencies, but sharing the same underlying kernel:

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "Containers (isolated from each other)", "sublabel": "Each with its own app, libraries, and process space", "color": "blue" },
    { "label": "Docker Engine (containerd + runc)", "color": "green" },
    { "label": "Hardware", "sublabel": "CPU · RAM · Disk · Network", "color": "slate" }
  ]
}
```

## Why Docker?

Before containers, "works on my machine" was a constant real problem — an app that ran fine on a developer's laptop could fail in staging or production because of subtle environment differences (a different library version, a missing system dependency, a different OS). Docker packages an application and everything it needs to run — code, runtime, libraries, system tools — into one portable image that behaves identically wherever it runs: a laptop, a CI runner, or a production cluster. That portability, not just resource efficiency, is the actual reason Docker became the default way to ship software.

---

## Learning Modules

### Module 01 — Container Fundamentals
*VMs vs containers, namespaces, cgroups*

**Topics covered:**

- Why containers — 🟢 Beginner
- Linux namespaces and cgroups — 🟡 Intermediate
- Docker architecture (daemon, CLI, registry) — 🟢 Beginner

### Module 02 — Dockerfile Best Practices
*Layers, multi-stage, security*

Order Dockerfile instructions from least to most frequently changing, to maximize cache hits — dependency installation before application code, since code changes far more often than dependencies. Multi-stage builds reduce final image size by building in one stage (with the full toolchain) and copying only the compiled artifact into a minimal runtime stage. Containers should never run as root by default — a non-root `USER` limits what a compromised container process can actually do.

**The build-to-run workflow, end to end:**

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

**Topics covered:**

- Dockerfile instructions — 🟢 Beginner
- Layer caching strategy — 🟡 Intermediate
- Multi-stage builds — 🟡 Intermediate
- Non-root user and security — 🟡 Intermediate
- Image scanning — 🔴 Advanced

### Module 03 — Docker Compose
*Multi-container local development*

Docker Compose defines multi-container applications declaratively — perfect for local development environments that need several services running together (an app, a database, a cache). Define services, their images, environment variables, volumes, and network connections in one `docker-compose.yml`; `.env` files hold local secrets/config without hardcoding them into the compose file itself.

**Topics covered:**

- docker-compose.yml structure — 🟢 Beginner
- Services, networks, volumes — 🟡 Intermediate
- Environment variables and secrets — 🟡 Intermediate

---

## Production Example

```bash
# Production Runbook — "the image is 1.2GB and CI is timing out pulling it"

# Step 1: See exactly what's taking up space in the image
docker history myapp:latest --no-trunc
# Look for unexpectedly large layers -- often a copied node_modules/
# or apt cache that was never cleaned up in the same RUN instruction

# Step 2: Confirm what's actually shipped vs what's just build tooling
docker run --rm myapp:latest du -sh /app 2>/dev/null
# If /app itself is small but the image is huge, the build stage's
# tools/dependencies are leaking into the final image -- a multi-stage
# build fix, not an application code fix

# Step 3: Rebuild as multi-stage, minimal runtime base
# FROM node:20 AS builder          <- full toolchain here
# ... build steps ...
# FROM node:20-slim                <- runtime stage, nothing extra
# COPY --from=builder /app/dist ./dist

# Step 4: Verify the fix actually worked
docker images myapp --format "{{.Repository}}:{{.Tag}}  {{.Size}}"
docker history myapp:latest --no-trunc  # confirm no leftover build-tool layers

# Step 5: Clean up CI runner disk as a standing practice, not just a one-time fix
docker system df                 # see what's actually consuming space
docker builder prune -f          # build cache specifically (often the biggest consumer)
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Docker and why would you use it in production?**

**A:** **Problem:** "works on my machine" — environment drift between dev, staging, and production causes real, hard-to-reproduce failures. **Solution:** Docker packages an application with everything it needs (runtime, libraries, system dependencies) into one portable image that behaves identically everywhere it runs. **Result:** deployments become predictable — the exact artifact tested in CI is the exact artifact running in production, not a rebuild from source on a different machine.

---

**Q2. How does Docker work internally? Explain the architecture.**

**A:** **Problem:** understanding what actually isolates a container (and what doesn't) matters for both debugging and security reasoning. **Solution:** containers are regular Linux processes, isolated using kernel namespaces (PID, network, mount, etc. — each container sees its own process tree, network stack, filesystem) and constrained using cgroups (CPU/memory limits). The Docker daemon manages images, containers, networks, and volumes; the CLI talks to the daemon over its API. **Result:** this is exactly why containers share the host kernel (unlike a VM, which virtualizes hardware and runs its own kernel) — faster startup, lower overhead, but a real security implication: a kernel-level compromise can affect every container on that host.

---

**Q3. What are the main components of Docker?**

**A:** **Problem:** "Docker" names several distinct pieces that are useful to separate when reasoning about a system. **Solution:** the Docker daemon (`dockerd`) does the actual work; the CLI (`docker`) is a client that talks to the daemon's API; images are the read-only build artifacts; containers are running instances of images; registries (Docker Hub, ECR, a private registry) store and distribute images; volumes and networks are Docker-managed resources containers attach to. **Result:** knowing this separation is what makes something like "why does `docker run` still work if the CLI crashes mid-command" make sense — the daemon, not the CLI, owns the running container.

---

**Q4. How do you handle failures in Docker — a container that keeps crashing or restarting?**

**A:** **Problem:** a crashing container gives limited signal by default — it's gone by the time you notice. **Solution:** `docker logs <container>` for the last output before exit, `docker inspect --format='{{.State.ExitCode}}'` to check the exit code (137 = SIGKILL, often OOM — confirm with `--format='{{.State.OOMKilled}}'`), and `docker run --restart=on-failure` in production so transient failures self-heal without manual intervention. **Result:** most crash loops resolve to one of a small set of causes — OOM, a missing environment variable/config, or a failed health check — and the exit code plus logs almost always point directly at which one.

---

**Q5. What is your production experience with Docker?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (an image bloat problem, a broken build cache, a container that wouldn't stop cleanly), your actual diagnostic steps, and what fixed it. Interviewers are listening for whether you've actually operated containers under real constraints, not just written a Dockerfile once.

---

**Q6. How do you monitor and observe Docker in production?**

**A:** **Problem:** a container can be silently unhealthy (accepting connections but not actually serving correctly) without ever crashing. **Solution:** `HEALTHCHECK` in the Dockerfile (or an orchestrator-level liveness/readiness probe) actively verifies the app is working, not just that the process is alive; `docker stats` for live resource usage; centralized log shipping (rather than relying on `docker logs` on individual hosts) for anything beyond a single-host setup. **Result:** the gap between "process is running" and "application is actually healthy" is exactly what health checks are designed to close — a container can pass the first check and fail the second indefinitely without one.

---

**Q7. What are the security considerations for Docker?**

**A:** **Problem:** a container is not a full security boundary the way a VM is — it shares the host kernel. **Solution:** run as a non-root user (`USER` in the Dockerfile), never bake secrets into `ENV`/`ARG` (they persist in layer history), pin base images to a specific version or digest rather than a moving tag, scan images for known **CVEs** (Common Vulnerabilities and Exposures — publicly catalogued, known security flaws in software, each with an ID like `CVE-2024-12345`) before deploying, and avoid `--privileged` unless genuinely required. **Result:** these are the same defense-in-depth principles that show up across this platform's Security material, applied specifically at the container layer.

---

**Q8. How does Docker compare to alternatives like Podman or plain VMs?**

**A:** This usually means a specific comparison. Docker vs. Podman: functionally similar CLI and image format (both OCI-compliant), but Podman is daemonless (no long-running root process) and supports rootless containers more natively — relevant in security-conscious environments. Docker vs. VMs: containers share the host kernel (faster, lighter, less isolated); VMs virtualize hardware and run a full separate kernel each (slower, heavier, stronger isolation boundary). State the specific tradeoff being asked about and when you'd actually pick one over the other, rather than reciting a generic list.

---

**Q9. Explain Container Fundamentals — namespaces and cgroups, concretely.**

**A:** Namespaces provide isolation — a PID namespace means a container's process 1 has no visibility into the host's or other containers' processes; a network namespace gives it its own network stack (interfaces, routes, ports) independent of the host's. Cgroups provide resource limits — CPU shares, memory caps — enforced by the kernel, which is exactly the mechanism **Kubernetes** (a separate tool, covered in its own course on this platform, for running many containers across many machines automatically) builds on when it enforces a Pod's `resources.limits`. Together, namespaces answer "what can this process see," cgroups answer "how much can this process use."

---

**Q10. Explain Dockerfile Best Practices — what actually goes wrong without them?**

**A:** Without deliberate instruction ordering, a one-line code change can invalidate the entire dependency-install layer, turning a 5-second rebuild into a multi-minute one. Without multi-stage builds, compilers and build tools ship in the production image, inflating size and attack surface for no runtime benefit. Without a non-root `USER`, a compromised container process runs as root — a real, avoidable privilege-escalation risk. Each of these is a concrete, observable cost, not just a style preference.

---

## Official Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
