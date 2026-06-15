# Docker — Intermediate

## Dockerfile — Building Your Own Images

A Dockerfile is a text file with instructions to build a Docker image. Each instruction creates a new layer in the image.

### Dockerfile Instructions

```dockerfile
# ── CORE INSTRUCTIONS ─────────────────────────────────────

# FROM — base image (always first instruction)
FROM python:3.11-slim
FROM centos:8
FROM ubuntu:22.04

# LABEL — metadata (replaces deprecated MAINTAINER)
LABEL maintainer="yourname@company.com"
LABEL version="1.0"
LABEL description="My application"

# WORKDIR — set working directory for subsequent instructions
WORKDIR /opt/tomcat
# All RUN, CMD, COPY, ENTRYPOINT, ADD use this as base

# RUN — execute commands during build (creates new layer)
RUN apt-get update && apt-get install -y nginx
RUN pip3 install flask requests boto3
RUN mkdir -p /var/log/myapp

# COPY — copy files from host to image
COPY requirements.txt .
COPY ./src /app/src
COPY config.yml /etc/myapp/

# ADD — like COPY but also handles URLs and tar extraction
ADD https://example.com/file.tar.gz /opt/
ADD local-archive.tar.gz /opt/  # auto-extracts!

# ENV — set environment variables
ENV APP_HOME=/app
ENV DB_HOST=localhost
ENV PYTHONUNBUFFERED=1

# EXPOSE — document which port the app listens on (doesn't publish!)
EXPOSE 8080
EXPOSE 8080/tcp
EXPOSE 5432

# VOLUME — create a mount point for persistent data
VOLUME /data
VOLUME /var/log/myapp

# USER — run subsequent instructions as this user (security best practice)
RUN useradd -r -s /bin/false appuser
USER appuser

# CMD — default command when container starts (can be overridden)
CMD ["python3", "app.py"]
CMD ["nginx", "-g", "daemon off;"]
CMD ["/bin/bash"]

# ENTRYPOINT — always runs (CMD becomes arguments to ENTRYPOINT)
ENTRYPOINT ["python3", "app.py"]
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]

# ARG — build-time variable (not available in running container)
ARG VERSION=1.0
ARG BUILD_DATE

# HEALTHCHECK — how Docker checks if container is healthy
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1
```

### Real Dockerfile: Tomcat on CentOS

Exact Dockerfile from the notes — deploying Tomcat 9 on CentOS:

```dockerfile
FROM centos

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
RUN tar -xvzf apache-tomcat-9.0.62.tar.gz
RUN mv apache-tomcat-9.0.62/* /opt/tomcat

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java

CMD /bin/bash

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
```

```bash
# Build the image
docker build -t mytomcat .

# Run it
docker run -d -p 8080:8080 mytomcat

# Verify Tomcat is running
curl http://localhost:8080
```

### Real Dockerfile: Python Flask App

```dockerfile
FROM python:3.11-slim

WORKDIR /app

# Copy requirements first — better layer caching
# If requirements.txt doesn't change, this layer is cached
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create non-root user for security
RUN useradd -r -s /bin/false appuser
USER appuser

EXPOSE 5000
CMD ["python3", "app.py"]
```

## Docker Image Layers

An image is made of stacked layers — like an onion (Duckietown):

```
docker images family tree:
┌─────────────────────────────┐
│    afdaniele/tensorflow      │  ← final image (your customization)
├─────────────────────────────┤
│    intermediate layers       │  ← pip install tensorflow, etc.
├─────────────────────────────┤
│    python:3.6               │  ← base image (innermost layer)
└─────────────────────────────┘
```

Dockerfile that creates this layered structure:
```dockerfile
FROM python:3.6

MAINTAINER Andrea F. Daniele <afdaniele@ttic.edu>

RUN pip3 install tensorflow

VOLUME /tflog

EXPOSE 6006/tcp

CMD ["python3", "-m", "tensorflow.tensorboard", "--logdir=/tflog"]
```

**Why layers matter:**
- Docker caches each layer — rebuilds skip unchanged layers
- Multiple images share common layers (saves disk space)
- Each `RUN` instruction = one layer — combine `RUN` commands to reduce layers

```dockerfile
# Bad: 3 layers, more cache misses
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get clean

# Good: 1 layer, clean cache in same layer
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```

## Docker Registry

Docker Registry is a storage and distribution system for Docker images. Two fundamental operations: **push** and **pull**.

```
                    docker push
Your machine ──────────────────→ Docker Hub
                ←──────────────── Server 1 (docker pull)
                ←──────────────── Server 2 (docker pull)
```

```bash
# Docker Hub workflow
docker login                          # login to Docker Hub

# Tag image with your username/repo:tag
docker tag mytomcat saifshah/regapp:v1
docker tag mytomcat saifshah/regapp:latest

# Push to Docker Hub
docker push saifshah/regapp:v1
docker push saifshah/regapp:latest

# Pull from Docker Hub (any machine)
docker pull saifshah/regapp:v1
docker run -d -p 8080:8080 saifshah/regapp:v1

# Real output from notes — images after build and tag:
# regapp         v1       15574dfecf93   7 hours ago   510MB
# saifshah/regapp latest  15574dfecf93   7 hours ago   510MB
# tomcat         latest   6a1271dfce51  43 hours ago   680MB
# centos         latest   5d0da3dc9764  8 months ago   231MB
```

### Private Registry (Harbor or AWS ECR)

```bash
# AWS ECR (Elastic Container Registry)
aws ecr create-repository --repository-name myapp --region ap-south-1

# Login to ECR
aws ecr get-login-password --region ap-south-1 | \
  docker login --username AWS --password-stdin \
  123456789.dkr.ecr.ap-south-1.amazonaws.com

# Tag and push
docker tag myapp:latest 123456789.dkr.ecr.ap-south-1.amazonaws.com/myapp:latest
docker push 123456789.dkr.ecr.ap-south-1.amazonaws.com/myapp:latest
```

## Multi-Stage Builds

Build in one stage, copy only the artifact to a smaller final image:

```dockerfile
# Stage 1: Build (large image with build tools)
FROM maven:3.8-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run (small image, only runtime)
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=builder /app/target/myapp-1.0.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

# Result: Final image is 200MB instead of 700MB
# The builder stage with Maven is discarded
```

## Jenkins + Docker CI/CD Pipeline

From the notes — complete CI/CD flow with Docker:

```
Developer pushes code
      ↓
Jenkins pulls code (Git)
      ↓
Maven builds WAR file (webapp/target/*.war)
      ↓
Jenkins copies WAR to Docker host via SSH
      ↓
Ansible playbook runs on Docker host:
  - Builds Docker image (FROM centos + WAR)
  - Tags image (saifshah/regapp:latest)
  - Pushes to Docker Hub
      ↓
Deploy to Kubernetes (EKS):
  - kubectl apply -f kube_deploy.yml
  - kubectl apply -f kube_service.yml
      ↓
Application running on EKS cluster
```

```bash
# Verify deployment on EKS bootstrap server
[root@EKS_Bootstrap_Server ~]# kubectl get all

NAME                                           READY  STATUS   RESTARTS  AGE
pod/saifshah-regapp-67dc7d6554-m4ck9          1/1    Running  0         27s
pod/saifshah-regapp-67dc7d6554-rr58w          1/1    Running  0         27s
pod/saifshah-regapp-67dc7d6554-x24cx          1/1    Running  0         27s

NAME                    TYPE          CLUSTER-IP      EXTERNAL-IP                   PORT(S)
service/kubernetes      ClusterIP     10.100.0.1      <none>                        443/TCP
service/saifshah-service LoadBalancer 10.100.156.66  a5cc757300061...amazonaws.com  8080:30620/TCP

NAME                              READY  UP-TO-DATE  AVAILABLE  AGE
deployment.apps/saifshah-regapp   3/3    3           3          27s
```

## .dockerignore — Exclude Files from Build Context

Like `.gitignore` for Docker builds. Reduces build context size:

```
# .dockerignore
node_modules/
.git/
.gitignore
*.md
__pycache__/
*.pyc
.env
.DS_Store
dist/
build/
*.log
tests/
```

```bash
# Without .dockerignore: sending 500MB build context
# With .dockerignore: sending 2MB build context
# Faster builds, smaller attack surface
```

## Docker Build Best Practices

```dockerfile
# 1. Use specific image tags (not 'latest' in production)
FROM python:3.11.4-slim     # specific version
# NOT: FROM python:latest   # unpredictable, breaks builds

# 2. Minimize layers — combine RUN commands
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 3. Order instructions from least to most frequently changing
# (maximizes layer cache hits)
FROM node:18-alpine
WORKDIR /app
COPY package.json .          # changes rarely
RUN npm install              # cached if package.json unchanged
COPY . .                     # changes often — last

# 4. Use non-root user
RUN groupadd -r app && useradd -r -g app app
USER app

# 5. Use COPY not ADD (unless you need URL/tar extraction)
COPY config.yml /app/        # explicit
# ADD config.yml /app/       # implicit tar extraction (surprising)

# 6. Set HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget -qO- http://localhost:8080/health || exit 1
```
