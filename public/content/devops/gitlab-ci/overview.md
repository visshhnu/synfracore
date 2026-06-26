# GitLab CI/CD

> **All-in-one DevSecOps platform — SCM + CI/CD + Registry + Security scanning**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is GitLab CI/CD?

.gitlab-ci.yml defines your entire CI/CD pipeline and lives in the root of your repo. Stages run sequentially; jobs within a stage run in parallel. Artifacts persist files between stages (e.g., build output → test stage). Cache persists dependencies between pipeline runs (speeds up builds). GitLab Runners execute jobs — shared runners are free on GitLab.com; specific runners are your own VMs or Kubernetes pods.

## Why GitLab CI/CD?

Modern .gitlab-ci.yml uses rules: (not only:/except: which are deprecated). needs: enables Directed Acyclic Graph (DAG) — jobs can depend on specific other jobs, not stages, removing stage bottlenecks. include: pulls in shared pipeline templates from another repo (equivalent to Jenkins Shared Libraries). extends: provides job template inheritance.

---

## Learning Modules

### Module 01 — GitLab CI Fundamentals
*.gitlab-ci.yml structure, stages, jobs*

.gitlab-ci.yml defines your entire CI/CD pipeline and lives in the root of your repo. Stages run sequentially; jobs within a stage run in parallel. Artifacts persist files between stages (e.g., build output → test stage). Cache persists dependencies between pipeline runs (speeds up builds). GitLab Runners execute jobs — shared runners are free on GitLab.com; specific runners are your own VMs or Kubernetes pods.

**Topics covered:**

- Stages and jobs structure — 🟢 Beginner
- Variables and environment injection — 🟢 Beginner
- Artifacts and cache — 🟡 Intermediate
- GitLab Runners (shared vs specific) — 🟡 Intermediate
- Predefined CI/CD variables — 🟡 Intermediate

### Module 02 — Pipeline Design Patterns
*needs, rules, include, extends*

Modern .gitlab-ci.yml uses rules: (not only:/except: which are deprecated). needs: enables Directed Acyclic Graph (DAG) — jobs can depend on specific other jobs, not stages, removing stage bottlenecks. include: pulls in shared pipeline templates from another repo (equivalent to Jenkins Shared Libraries). extends: provides job template inheritance.

**Topics covered:**

- needs: — DAG pipelines (skip stages) — 🟡 Intermediate
- rules: replacing only/except — 🟡 Intermediate
- include: for shared templates — 🟡 Intermediate
- extends: for job inheritance — 🟡 Intermediate
- trigger: for child pipelines — 🔴 Advanced

### Module 03 — GitLab Runners
*Shell, Docker, Kubernetes executors*

Runners have three main executors: Shell (runs directly on runner VM — fast, but environment pollutes between jobs), Docker (each job in a fresh container — clean, most common), Kubernetes (each job is a K8s pod — autoscales to zero, best for production). Tag runners and use tags: in jobs to route specific jobs to specific runners.

**Topics covered:**

- Runner executor types — 🟡 Intermediate
- Kubernetes executor for autoscaling — 🔴 Advanced
- Runner tags for job routing — 🟡 Intermediate
- Runner registration — 🟡 Intermediate

### Module 04 — Security Scanning (DevSecOps)
*SAST, DAST, container scanning built-in*

GitLab has built-in security scanning — one of its biggest advantages over Jenkins. Include GitLab-provided templates to add SAST, container scanning, dependency scanning, and secret detection in minutes. Results appear in the Merge Request security widget and the Security Dashboard. Fails pipeline if critical vulnerabilities found.

**Topics covered:**

- SAST — Static Application Security Testing — 🟡 Intermediate
- Container Scanning with Trivy — 🟡 Intermediate
- Dependency Scanning — 🟡 Intermediate
- Secret Detection — 🟢 Beginner
- Security Dashboard — 🟡 Intermediate

### Module 05 — Complete Production Pipeline
*Full .gitlab-ci.yml example*

A production .gitlab-ci.yml integrates test coverage reporting (visible in MR), security scanning, Docker build with GitLab container registry, and gated production deployments. GitLab environments track what version is deployed where — visible in Operations > Environments.

**Topics covered:**

- Coverage reporting — 🟡 Intermediate
- Environments and deployment tracking — 🟡 Intermediate
- Pipeline efficiency — 🔴 Advanced
- Merge request pipelines — 🟡 Intermediate

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is GitLab CI/CD and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does GitLab CI/CD work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of GitLab CI/CD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in GitLab CI/CD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with GitLab CI/CD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe GitLab CI/CD in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for GitLab CI/CD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does GitLab CI/CD compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain GitLab CI Fundamentals in GitLab CI/CD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Pipeline Design Patterns in GitLab CI/CD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)
- [.gitlab-ci.yml Reference](https://docs.gitlab.com/ee/ci/yaml/)
- [GitLab Security Scanning](https://docs.gitlab.com/ee/user/application_security/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*