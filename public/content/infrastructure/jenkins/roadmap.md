# Jenkins — Learning Roadmap

## Time to Job-Ready: 5 weeks (2 hours/day)

**Goal:** Build end-to-end CI/CD pipelines that automatically test, build, and deploy applications.

## Phase 1 — Setup & First Pipeline (Week 1)
- Install Jenkins: Docker (`docker run -p 8080:8080 jenkins/jenkins:lts`) or Linux package
- Initial setup: unlock, install suggested plugins, create admin user
- Install key plugins: Docker, Git, Pipeline, Blue Ocean, Credentials
- Create first freestyle job: connect to GitHub, run a shell command
- Understand: executors, agents, workspace, build queue

## Phase 2 — Declarative Pipelines (Week 2-3)
- Jenkinsfile: `pipeline`, `agent`, `stages`, `stage`, `steps`, `post`
- Environment variables and credentials binding (`withCredentials`)
- Docker agent: run each stage in a fresh container
- Parallel stages: run tests faster
- `when` conditions: only deploy from `main` branch
- `post` actions: `always`, `success`, `failure` notifications

## Phase 3 — Production Patterns (Week 4)
- Shared Libraries: DRY pipelines across 50+ repos
- Multibranch Pipeline: auto-detect branches and PRs
- Blue Ocean: visual pipeline editor and viewer
- Webhook triggers: build on every GitHub push in seconds
- Deployment strategies: rolling, blue-green via kubectl
- Notifications: Slack, email, JIRA status updates

## Phase 4 — Scale & Security (Week 5)
- Jenkins on Kubernetes: Kubernetes plugin, dynamic agents
- Configuration as Code (JCasC): version control Jenkins config
- Security: RBAC with Matrix Authorization, audit logs, HTTPS
- Backup: Jenkins home directory, job configs, credentials
- Performance: master-agent architecture, parallel builds

## Certifications
- **Certified Jenkins Engineer (CJE)** — CloudBees certification

## Jobs After Jenkins Mastery
CI/CD Engineer · DevOps Engineer · Build Engineer · Release Engineer

## Resources
- **jenkins.io/doc** — official pipeline syntax reference
- **KodeKloud Jenkins course** — practical labs
