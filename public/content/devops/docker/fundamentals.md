# Docker — Fundamentals

## Images vs. containers — the distinction that trips up beginners

An image is a read-only template — a snapshot of a filesystem plus metadata (default command, exposed ports, environment variables) — built once from a Dockerfile. A container is a running (or stopped) instance of an image, with its own writable layer on top. The relationship is the same as a class and an object: one image can spawn any number of independent containers, each with their own runtime state, none of which mutate the underlying image.

```bash
docker images          # list images (the templates)
docker ps -a           # list containers (running or stopped instances)
docker run nginx       # creates and starts a NEW container from the nginx image
docker run nginx       # running this again creates a SECOND, independent container
```

## Writing a Dockerfile — the instructions that actually matter

```dockerfile
FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

Each instruction (`FROM`, `RUN`, `COPY`) creates a new, cached layer. **Layer ordering is a real performance decision, not arbitrary**: `COPY package*.json ./` and `RUN npm ci` happen *before* `COPY . .` deliberately — dependency installation is expensive and rarely changes, while application code changes constantly. Docker's build cache reuses a layer if its inputs haven't changed, so ordering slow-changing steps first means a code-only change re-triggers only the fast final `COPY` and `CMD` layers, not a full dependency reinstall.

## `CMD` vs `ENTRYPOINT` — a genuinely common point of confusion

`CMD` provides a default command, fully overridable by whatever's passed at `docker run` (`docker run myimage echo hi` replaces the `CMD` entirely). `ENTRYPOINT` sets the command that always runs — arguments passed at `docker run` are appended to it, not replacing it. Combining both is a common real pattern: `ENTRYPOINT ["python", "app.py"]` with `CMD ["--verbose"]` as a default, overridable argument — the entrypoint (what always runs) stays fixed, while the default flags can be swapped per invocation.

## Volumes vs. bind mounts — both persist data, for different reasons

A **volume** is storage managed entirely by Docker, stored in Docker's own managed area on the host — the correct choice for data a container needs to persist across restarts/recreations (a database's data directory) without caring exactly where on the host filesystem it physically lives. A **bind mount** maps a specific host path directly into the container — the correct choice when you need to actually see/edit the files from the host (mounting your source code directory into a container during local development, so edits show up without rebuilding the image).

```conceptgrid
{
  "boxes": [
    { "title": "Volume", "description": "Docker-managed storage. Best for data that must persist without caring where it physically lives (a database's data dir)", "color": "blue" },
    { "title": "Bind Mount", "description": "Maps a specific host path into the container. Best when you need to see/edit files from the host (local dev)", "color": "green" }
  ]
}
```

```bash
docker run -v mydata:/var/lib/postgresql/data postgres     # named volume
docker run -v $(pwd)/src:/app/src myapp                    # bind mount
```

## Networking basics: how containers actually reach each other

By default, containers on the same user-defined Docker network can reach each other by container name — Docker's embedded DNS resolves it, no manual IP tracking needed:

```bash
docker network create mynet
docker run --network mynet --name db postgres
docker run --network mynet myapp   # myapp can reach postgres at hostname "db"
```

The default `bridge` network (used if you don't create one explicitly) does *not* provide this name-based resolution between containers — this is exactly why Docker Compose creates a dedicated network for your services automatically, and why containers run without `--network` sometimes can't reach each other by name the way tutorials assume.

## Why "it works in the container but the port isn't reachable" is almost always a publishing issue

A container's `EXPOSE`'d port is documentation/metadata — it does *not*, by itself, make the port reachable from the host. `-p host_port:container_port` (or Compose's `ports:` mapping) is what actually publishes a port to the host. Confusing `EXPOSE` with actually publishing a port is a common, specific source of "my app is running but I can't connect to it" confusion for people new to Docker.
