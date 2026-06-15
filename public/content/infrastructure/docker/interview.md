# Docker — Interview Questions

Real questions from DevOps interviews, drawn from 5 years of notes and production experience.

---

## Core Concepts

**What is Docker and how does it differ from a Virtual Machine?**
Docker uses OS-level containerization — containers share the host OS kernel, so they start in milliseconds and use far fewer resources. A VM runs a full OS with its own kernel on a hypervisor — takes minutes to start, uses gigabytes of RAM just for the OS. Containers are isolated using Linux namespaces (process, network, filesystem) and cgroups (CPU, memory limits). The trade-off: VMs give stronger isolation (different kernels, hardware emulation), containers give speed and density. In practice, most cloud workloads use containers inside VMs (best of both).

**What is the difference between a Docker image and a container?**
Image is a read-only template — a snapshot of a filesystem with your app and all its dependencies. It's built once and stored in a registry. Container is a running instance of an image — it adds a writable layer on top of the image's read-only layers. You can run many containers from one image. Analogy: image is a class definition, container is an object (instance).

**What is a Dockerfile and what are its main instructions?**
A Dockerfile is a text file with instructions to build a Docker image. Key instructions: `FROM` (base image), `RUN` (execute command during build, creates new layer), `COPY` (copy files into image), `WORKDIR` (set working directory), `ENV` (environment variable), `EXPOSE` (document port), `VOLUME` (create mount point), `USER` (run as non-root), `CMD` (default command when container starts), `ENTRYPOINT` (always-run command, CMD becomes its arguments).

**What is the difference between CMD and ENTRYPOINT?**
`CMD` sets the default command — it can be completely overridden at runtime: `docker run myimage bash` ignores CMD. `ENTRYPOINT` always runs — `docker run myimage bash` passes "bash" as an argument to ENTRYPOINT. Common pattern: `ENTRYPOINT ["python3", "app.py"]` with no CMD for a service. Or `ENTRYPOINT ["python3"]` with `CMD ["app.py"]` so you can override just the script but keep the interpreter.

---

## Images and Layers

**How does Docker layer caching work?**
Each Dockerfile instruction creates a new layer. Docker caches layers and reuses them if the instruction and all previous instructions haven't changed. If you change line 5, layers 5+ are rebuilt. This is why you should: (1) put frequently changing instructions last (like `COPY . .`), (2) put rarely changing instructions first (like `RUN apt-get install`). Copy `requirements.txt` and `RUN pip install` BEFORE `COPY . .` — dependencies are installed from cache even when code changes.

**What are dangling images?**
Images with no tag and no container using them — shown as `<none>:<none>` in `docker images`. Created when you rebuild with the same tag — old image loses its tag. Remove with `docker image prune` or `docker rmi $(docker images -f "dangling=true" -q)`.

**What is a multi-stage build and why use it?**
Multi-stage build uses multiple `FROM` statements in one Dockerfile. Each stage can `COPY --from=previous-stage` files. The final image only contains what you explicitly copy into it. Example: Stage 1 uses a Maven image to compile Java (700MB). Stage 2 uses a JRE image (100MB) and copies only the JAR. Final image is 100MB, not 700MB. The build tools and source code are discarded.

---

## Volumes and Networking

**What is the difference between a volume and a bind mount?**
Volume: Docker manages the storage location (`/var/lib/docker/volumes/`). Created with `docker volume create`. Not dependent on host directory structure. Portable, backed up, migrated more easily. Bind mount: a host directory mapped directly into the container (`-v /host/path:/container/path`). You control the location. Files are immediately visible on host — good for development (hot reload). Volumes are recommended for production; bind mounts for development.

**Why are containers immutable and why does that matter?**
Containers should not be modified while running. If you need a change, rebuild the image and replace the container. This is the "immutable infrastructure" principle. Benefits: (1) predictable — the container in production is identical to what was tested, (2) rollback is easy — just run the previous image, (3) no configuration drift — you can't have servers that diverged from the desired state over time.

**What is the Docker bridge network and how do containers communicate?**
The default bridge network (`docker0`) connects all containers without `--network` specified. They can communicate by IP but NOT by name. A custom bridge network (`docker network create mynet`) enables DNS-based name resolution — `container1` can reach `container2` just by typing `ping container2`. Always use custom networks in production. Same network = can communicate. Different networks = isolated.

---

## Production and CI/CD

**How do you pass secrets to a Docker container safely?**
Never bake secrets into the image (they appear in `docker history`). Options: (1) Environment variables at runtime: `docker run -e DB_PASSWORD=xxx myapp` — visible in process list, avoid for sensitive secrets. (2) Docker secrets (Swarm): encrypted, only available to specific services. (3) Kubernetes Secrets: base64-encoded, stored in etcd, mounted as files or env vars. (4) External: Vault, AWS Secrets Manager, read at runtime from API. Best practice: use a secrets manager, inject at runtime, never in the image.

**What is the difference between `docker stop` and `docker kill`?**
`docker stop` sends SIGTERM (graceful shutdown) and waits 10 seconds, then sends SIGKILL. The application can catch SIGTERM and clean up (close connections, flush buffers). `docker kill` sends SIGKILL immediately — no cleanup possible. Always prefer `docker stop`. Use `docker kill` only when `stop` doesn't work.

**How do you update a container with zero downtime?**
In Docker Swarm: `docker service update --image newimage:tag myservice` with `--update-parallelism 1 --update-delay 10s` for rolling updates. In Kubernetes: `kubectl set image deployment/myapp container=newimage:tag` triggers a rolling update by default. Behind a load balancer: update containers one at a time, health check passes before moving to next.

**What is Docker Scout / Trivy used for?**
Image vulnerability scanning. After building an image, scan it before pushing: `trivy image myapp:latest`. Reports CVEs (Common Vulnerabilities and Exposures) in the OS packages and language libraries. Shows severity (CRITICAL, HIGH, MEDIUM, LOW). Integrate into CI/CD pipeline: fail the build if any CRITICAL vulnerabilities found. Keeps your production images free from known exploits.

---

## Quick-Fire

**How do you see why a container crashed?** `docker logs container_name` or for a stopped container: `docker logs container_name` still works. Check exit code: `docker inspect container_name | grep -i exitcode`.

**How do you run a command in a running container?** `docker exec -it container_name bash` (interactive) or `docker exec container_name ls /app` (non-interactive).

**How do you copy files to/from a container?** `docker cp local_file.txt container:/path/` and `docker cp container:/path/file.txt ./local/`

**What does `--rm` flag do?** `docker run --rm myapp` — automatically removes the container when it exits. Good for one-off tasks and CI jobs to avoid container accumulation.

**How do you limit container memory?** `docker run --memory 512m --memory-swap 512m myapp` — sets hard memory limit and disables swap. Container gets OOMKilled if it exceeds the limit.
