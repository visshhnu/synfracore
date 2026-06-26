# GitLab CI Complete Guide

CI/CD › GitLab CI
**GitLab CI**
BeginnerEngineerProductionArchitectGitLab-native CI/CD — pipelines, runners, environments, secrets
[What is GitLab CI](#sec-what)[Pipeline Syntax](#sec-syntax)[Advanced](#sec-advanced)[Runners](#sec-runners)[Secrets](#sec-secrets)[Interview Q&A](#sec-interview)


## ⚡ What is GitLab CI?›


#### GitLab CI in the CI/CD landscape

|  | GitLab CI | Jenkins | GitHub Actions |
|---|---|---|---|
| Where config lives | .gitlab-ci.yml in repo | Jenkinsfile in repo or UI | .github/workflows/*.yml |
| Infrastructure | GitLab-hosted or self-hosted runners | Self-managed servers + agents | GitHub-hosted runners |
| Registry | Built-in container registry | External | GHCR (GitHub packages) |
| Best for | GitLab users, integrated DevOps platform | Complex enterprise pipelines | GitHub repos, open source |


GitLab CI basics + validate yamlCopy

```

```


## 📄 Pipeline Syntax›


#### Pipeline structure

Every pipeline has **stages** (ordered groups), **jobs** (unit of work inside a stage), **artifacts** (files passed between jobs), and **cache** (persisted between pipeline runs). Jobs in the same stage run in parallel.


Complete .gitlab-ci.yml with all job typesCopy

```

```


## 🔧 Advanced — Rules, Needs, Cache, Include›


Rules, needs, cache, include, environmentsCopy

```

```


## 🖥️ Runners›


#### Shared vs Self-hosted Runners

| Type | Pros | Cons |
|---|---|---|
| Shared (GitLab.com) | Zero setup, 400 min/month free | Limited minutes, public runner (security concern for sensitive code) |
| Self-hosted (shell) | No minute limits, fast (no startup) | Build pollution between jobs |
| Self-hosted (Docker) | Clean environment per job, reproducible | Docker pull on every job (use cache) |
| Self-hosted (Kubernetes) | Scales to zero, unlimited parallel jobs | Pod startup time (10-30 sec) |


Register runner + Kubernetes executorCopy

```

```


## 🔒 Variables & Secrets›


Predefined variables + secrets managementCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


GITLAB CI · ENGINEER
What is GitLab CI and how does it differ from Jenkins?
GitLab CI is CI/CD built directly into the GitLab platform. The pipeline is defined in a .gitlab-ci.yml file in the repository root. When you push code, GitLab automatically reads this file and runs the pipeline. No separate server, no plugins to manage. Key differences from Jenkins: GitLab CI configuration is in the repo itself — pipeline as code from day one. Jenkins requires a separate server, plugin management, and manual Jenkinsfile setup. GitLab CI has built-in container registry, artifact storage, and environment tracking. GitLab CI runners are simpler to scale on Kubernetes than Jenkins agents. Jenkins has more mature shared library ecosystem and more plugin options for complex enterprise workflows. When to choose GitLab CI: team is already using GitLab for code, issues, and merge requests — the integrated experience (code change directly shows pipeline status in MR) is valuable. When to choose Jenkins: very complex pipeline logic requiring Groovy, existing enterprise Jenkins infrastructure, or working across multiple source control systems.

GITLAB CI · ENGINEER
What is the difference between artifacts and cache in GitLab CI?
Artifacts are files produced by a job that need to be passed to later jobs in the same pipeline. They are uploaded to GitLab server and downloaded by dependent jobs. Example: a build job compiles a JAR file, the deploy job needs that JAR. The build job declares it as an artifact, the deploy job automatica
