# Docker -- Portfolio Projects

Build these 3 projects to prove Docker mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Multi-Stage Flask API

**Level:** Beginner | **Time:** 1 day | **GitHub:** `docker-flask-api`

**What you build:** A Python Flask REST API containerized with a multi-stage Dockerfile that reduces image size from 900MB to under 120MB.

### The Dockerfile
```dockerfile
# Stage 1: Build dependencies
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Production image (no build tools)
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:5000/health || exit 1
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "4", "app:app"]
```

### Interview points
- Multi-stage build saves ~700MB (no compiler, no pip cache in final image)
- Non-root user reduces attack surface
- HEALTHCHECK enables automatic restart in orchestrators
- `--no-cache-dir` prevents layer bloat

### Steps
1. Create Flask app with `/health`, `/users`, `/items` endpoints
2. Write multi-stage Dockerfile (single-stage first, then optimize)
3. Add `.dockerignore` (exclude `__pycache__`, `.git`, `*.pyc`)
4. Build and compare sizes: `docker image ls`
5. Add `docker-compose.yml` with Flask + PostgreSQL + Redis
6. Add GitHub Actions to build and push to Docker Hub
7. Document image size before/after in README

---

## Project 2: Docker Compose Microservices Stack

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `docker-microservices-stack`

**What you build:** A 5-service application using Docker Compose with proper network isolation, secrets management, and health checks.

### Architecture
```
Internet
   |
nginx (port 80) -- API Gateway
   |
   +-- auth-service (internal)
   |       |-- postgres-auth (auth-backend network only)
   |
   +-- product-service (internal)
           |-- redis (cache)
           |-- postgres-products
```

### docker-compose.yml key patterns
```yaml
version: "3.8"
services:
  nginx:
    image: nginx:alpine
    ports: ["80:80"]
    networks: [frontend]
    depends_on:
      auth: {condition: service_healthy}
      products: {condition: service_healthy}

  auth:
    build: ./auth-service
    networks: [frontend, auth-backend]
    secrets: [db_password, jwt_secret]
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 10s
      retries: 3

  postgres-auth:
    image: postgres:16-alpine
    networks: [auth-backend]  # NOT accessible from nginx or product service
    volumes: [auth-db-data:/var/lib/postgresql/data]
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
    secrets: [db_password]

secrets:
  db_password: {file: ./secrets/db_password.txt}
  jwt_secret: {file: ./secrets/jwt_secret.txt}

volumes:
  auth-db-data:

networks:
  frontend:
  auth-backend:
```

### Interview points
- Network isolation: each service only on networks it needs
- Docker secrets vs environment variables for passwords
- `depends_on condition: service_healthy` prevents startup race conditions
- Named volumes persist DB data across container restarts

### Steps
1. Design the architecture diagram first
2. Build each service independently before composing
3. Write docker-compose.yml incrementally (2 services first)
4. Test: `docker compose down -v && docker compose up` should work cleanly
5. Add `docker compose up --scale product-service=3` for load balancing demo
6. Test failure: kill auth-service, verify nginx returns appropriate error
7. Add docker compose watch for development hot-reload

---

## Project 3: CI/CD with Vulnerability Scanning + Image Signing

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `docker-secure-cicd`

**What you build:** A CI/CD pipeline that builds, scans for vulnerabilities (fails pipeline on critical CVEs), signs images, and deploys.

### GitHub Actions workflow
```yaml
name: Secure Docker CI/CD
on: [push]
jobs:
  build-scan-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Build image
        run: docker build -t myapp:${{ github.sha }} .

      - name: Scan with Trivy
        uses: aquasecurity/trivy-action@master
        with:
          image-ref: myapp:${{ github.sha }}
          severity: HIGH,CRITICAL
          exit-code: 1   # Fail pipeline on critical vulnerabilities

      - name: Push to registry
        if: github.ref == "refs/heads/main"
        run: |
          docker push myrepo/myapp:${{ github.sha }}
          docker push myrepo/myapp:latest
```

### Steps
1. Set up GitHub Actions with Docker Hub credentials as secrets
2. Add Trivy with `--exit-code 0` initially, review findings
3. Fix critical vulns (update base image, patch dependencies)
4. Enable `--exit-code 1` -- pipeline now fails on new critical CVEs
5. Add multi-arch build: `docker buildx build --platform linux/amd64,linux/arm64`
6. Add SBOM generation with syft
7. Document security improvements in README

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes architecture diagram and how to run locally
- [ ] GitHub Actions CI passing (green checkmark on repo)
- [ ] Can explain every Dockerfile instruction in an interview
- [ ] Project 2 runs with `docker compose up` and works end-to-end
