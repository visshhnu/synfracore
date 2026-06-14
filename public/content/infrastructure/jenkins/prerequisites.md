# Jenkins — Prerequisites

## What to Know Before Starting Jenkins

Jenkins is a CI/CD automation server. You're building pipelines that test, build, and deploy code. These foundations prevent confusion.

## Required

### 1. Git — Must Know Well
Jenkins triggers on Git events (push, PR). You must know:
```bash
git clone, git add, git commit, git push
git branch, git checkout, git merge
```
Jenkins reads `Jenkinsfile` from your repository. If Git is unfamiliar, learn it first (2-3 days).

### 2. Basic Linux/Bash
Jenkins pipelines run shell commands. You need to read and write:
```bash
# Commands you'll use in Jenkinsfiles:
sh 'npm install'                   # Run shell command
sh 'docker build -t myapp:${BUILD_NUMBER} .'
sh 'kubectl apply -f deployment.yaml'
echo "Build number: ${env.BUILD_NUMBER}"
```

### 3. Understanding of the Application Being Built
Jenkins builds YOUR application. If you don't understand how to build it manually, Jenkins can't help. Know how to:
- Build a project locally (e.g., `npm run build`, `mvn package`, `go build`)
- Run tests locally (`npm test`, `pytest`, `go test`)
- Build a Docker image (`docker build -t myapp .`)

### 4. Docker Basics
Modern Jenkins uses Docker agents — each pipeline stage runs in a fresh Docker container. You should understand:
- What a Docker image is
- `docker build`, `docker run`, `docker push`
- `docker-compose` basics

## Nice to Have

### Groovy Basics (Not Required, Helpful)
Jenkinsfiles are written in Groovy DSL. You don't need to know Groovy deeply, but understanding variables and conditions helps:
```groovy
def version = "1.0.${BUILD_NUMBER}"
if (env.BRANCH_NAME == 'main') {
    // deploy to production
}
```

### The Application's Testing Framework
Jenkins typically runs tests. Knowing how your app's tests work (Jest, pytest, JUnit) helps you configure test reporting.

### A Cloud Account or Kubernetes Cluster
Jenkins pipelines deploy somewhere. Having an EKS/AKS cluster or EC2 instances to deploy to gives you a complete learning experience.

## Learning Order

```
Git (if needed) ← 3-5 days
      ↓
Docker basics ← 1-2 weeks
      ↓
Jenkins Installation
      ↓
Jenkins Fundamentals (first pipeline)
      ↓
Intermediate (Docker agents, credentials, tests)
      ↓
Advanced (shared libraries, K8s agents, production patterns)
```

## Time Estimate

With the prerequisites:
- Create your first working pipeline: 1-2 days
- Pipeline with tests, Docker build, deploy: 1 week
- Production-grade shared library: 3-4 weeks
