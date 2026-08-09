# Docker — PYQ (Previously Asked / Practice Questions)

**Framing note:** Docker's certifications (Docker Certified Associate, administered via Docker's official training partners) are proctored and confidential — no public past-paper archive exists. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Docker behavior rather than invented "leaked" content.

---

### 1. (Domain: Container Fundamentals) Why do containers start in milliseconds while a VM typically takes tens of seconds, and what's the actual architectural difference behind this?

**Answer:** Containers are isolated processes using Linux namespaces and cgroups, sharing the host kernel directly — there's no separate operating system kernel to boot. A VM virtualizes an entire machine, including its own kernel, which needs to fully boot before anything inside it can run. Containers skip that boot process entirely because they're not booting a new OS at all, just starting an isolated process on the kernel that's already running.

---

### 2. (Domain: Dockerfile Best Practices) Why does instruction order in a Dockerfile matter for build speed, and what's the correct general ordering principle?

**Answer:** Docker caches each layer, and a change at any layer invalidates every layer after it in the build. Ordering instructions from least to most frequently changing — dependency installation before application code — maximizes cache hits, since dependencies change far less often than application code; a code-only change then only invalidates the layers from that point forward, not the dependency-installation layers above it.

---

### 3. (Domain: Multi-Stage Builds) What specifically does a multi-stage build remove from the final image that a single-stage build wouldn't?

**Answer:** The build toolchain and any intermediate build artifacts — a multi-stage build compiles or builds the application in one stage (with the full compiler/toolchain present), then copies only the final compiled artifact into a separate, minimal runtime stage. The final image never contains the compiler, build dependencies, or intermediate files, which reduces both image size and attack surface compared to shipping the same image used to build the application.

---

### 4. (Domain: Security) Why does this guide treat running containers as a non-root user as a default posture rather than an optional hardening step?

**Answer:** Because a compromised container process running as root has significantly more capability to affect the host or escape containment than one running as a restricted, non-root user — the non-root `USER` directive limits what a compromised process can actually do, functioning as a real, meaningful blast-radius reduction rather than a nice-to-have. Treating it as default-on (rather than opt-in) reflects that most containers have no genuine need for root privileges to begin with.

---

### 5. (Domain: Compose) A multi-service `docker-compose.yml` has a web service that depends on a database, but the web service fails intermittently on startup with connection errors. What's the likely missing configuration?

**Answer:** `depends_on` with `condition: service_healthy` — a plain `depends_on` without a health condition only guarantees the database *container* has started, not that the database is actually ready to accept connections yet. Without the health-check condition, the web service can start and attempt to connect before the database has finished its own startup process, causing exactly this intermittent race condition.

---

### 6. (Domain: Troubleshooting) A container exits immediately after `docker run`, with no obvious crash or error. What's the most common actual cause?

**Answer:** The main process itself (the `CMD`/`ENTRYPOINT`) exited on its own, rather than the container crashing — a container's lifecycle is tied directly to its main process; if that process runs to completion and exits (common when it's not actually a long-running foreground process, or when a script finishes and returns), the container exits too. This is expected Docker behavior, not a bug, and the fix is ensuring the intended long-running process is genuinely what's specified in `CMD`/`ENTRYPOINT`.

---

### 7. (Domain: Troubleshooting) A container gets "permission denied" errors when writing to a host-mounted volume, even though the application code looks correct. What's the likely cause?

**Answer:** A UID/GID mismatch between the container's non-root user and the host directory's actual file ownership — the container process (running as a specific, non-root UID) doesn't have write permission on the host-mounted directory, which was likely created with different ownership. This is a common, non-obvious interaction specifically introduced by the security best practice of running as non-root — the fix usually involves aligning UIDs or adjusting host directory permissions deliberately, not disabling the non-root user.

---

### 8. (Domain: Disk Management) Why does a Docker host gradually run out of disk space even when the team isn't intentionally storing large amounts of data in containers?

**Answer:** Dangling images (untagged, orphaned from rebuilds), unused volumes, and build cache all accumulate silently over time as normal, routine Docker usage — none of these are automatically cleaned up by default. `docker system prune` (with appropriate flags for volumes/images) is the direct fix, but the underlying cause is genuinely routine usage accumulating cruft, not a misuse pattern or unusually large intentional data storage.

---

### 9. (Domain: CI/CD Integration) Why is tagging an image only as `latest` in a CI/CD pipeline considered a real anti-pattern, not just a stylistic preference?

**Answer:** `latest` alone provides no way to know exactly what specific build/commit is currently running or was previously deployed — if two different commits both get tagged `latest` at different times, there's no way to distinguish which one is actually running in a given environment without separate tracking. Tagging with the commit SHA (in addition to or instead of `latest`) gives an unambiguous, traceable link between a running container and the exact source code that produced it.

---

### 10. (Domain: Image Scanning) Why does this guide recommend scanning images for vulnerabilities before push, rather than relying on scanning at the registry after push?

**Answer:** Scanning before push catches a critical vulnerability while the image is still local and hasn't yet been made available for anyone (or any deployment pipeline) to pull — a pipeline that fails at the scan-before-push step never produces a pullable vulnerable image at all. Scanning only after push (registry-side) means a window exists where a vulnerable image is already available to be pulled, even if it's later flagged — catching the issue earlier in the pipeline closes that exposure window entirely.
