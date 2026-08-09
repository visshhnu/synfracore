# Docker — FAQ

## Are containers just lightweight virtual machines?

No, and this is a common misconception worth correcting directly — containers are isolated processes running on the host's existing kernel (using Linux namespaces and cgroups), while a VM virtualizes an entire machine including its own separate kernel. This is exactly why containers start in milliseconds and use a fraction of a VM's resources — there's no separate OS to boot. They solve overlapping but distinct problems, and understanding the actual mechanism (not just "containers are lighter") matters for reasoning correctly about what containers can and can't isolate.

## Why does my Docker build get slower over time even though I haven't changed much in the Dockerfile?

Check the instruction ordering — if application code (which changes frequently) appears before dependency installation (which changes rarely) in the Dockerfile, every code change invalidates the cache for the dependency-installation layer too, forcing a full reinstall on every build. Reordering so infrequently-changing instructions come first maximizes cache reuse and is usually the direct fix for this specific symptom.

## Do I always need a multi-stage build, even for a simple application?

Not strictly always, but it's the production standard for good reason — a multi-stage build keeps the build toolchain and intermediate artifacts out of the final runtime image, reducing both size and attack surface. For a genuinely simple, low-stakes internal tool, a single-stage build might be acceptable; for anything shipped to production or exposed externally, the multi-stage pattern is worth the small added Dockerfile complexity.

## Is it really necessary to run containers as non-root, or is that overly cautious for an internal application?

It's worth treating as a default posture rather than something reserved for external-facing or high-risk applications specifically — a compromised container process running as root has meaningfully more capability to affect the host or attempt an escape than one running as a restricted user, regardless of whether the application itself is "internal." The cost of setting a non-root `USER` is low; the security benefit applies broadly, not just to obviously high-risk services.

## Why did my multi-container app start failing intermittently after I added a database dependency?

This is a classic startup-race-condition symptom — `depends_on` alone only guarantees the dependency's *container* has started, not that the service inside it (like a database) is actually ready to accept connections. Add a health check to the database service and use `depends_on: condition: service_healthy` on the dependent service, rather than a plain `depends_on`, to actually wait for readiness rather than just container-start.

## My container exits immediately after `docker run` with no error. Is this a bug?

Almost certainly not a Docker bug — a container's lifecycle is tied directly to its main process (`CMD`/`ENTRYPOINT`); if that process isn't a genuinely long-running foreground process (a script that runs and exits, for instance, rather than a server that keeps listening), the container exits the moment that process completes. Check what your `CMD`/`ENTRYPOINT` is actually running and confirm it's meant to run continuously, not complete and exit.

## Why does my Docker host keep running out of disk space?

Almost always dangling images, unused volumes, and accumulated build cache — none of which are cleaned up automatically by Docker by default. This accumulates silently through completely normal, routine usage, not through any unusual misuse. `docker system prune` (with the appropriate flags for images/volumes) is the direct fix, and scheduling this regularly (rather than only running it reactively after hitting a disk-space crisis) prevents the recurring problem.

## Is tagging every image with the commit SHA overkill if I'm already tagging with `latest`?

No — `latest` alone gives you no way to know exactly which build or commit is currently deployed at any given moment, since it's just a floating pointer that gets reassigned on every new push. Tagging with the commit SHA (alongside `latest`, not necessarily instead of it) gives an unambiguous, traceable link between a specific running container and the exact source code that produced it — genuinely useful, not redundant, especially when debugging a production issue and needing to know precisely what's running.
