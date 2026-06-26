# Jenkins — Pipeline as Code & Advanced Patterns

rary: One `buildAndPush.groovy` function in a central Git repo. All 50 services call it. Update once, all 50 pipelines get the change automatically. No coordination required. This is how senior DevOps engineers solve scale.


Shared Library structure + microservice Jenkinsfile using itCopy

```

```


## 🔒 Credentials — Zero Secrets in Jenkinsfile›


#### The absolute rule: no secrets in code

A Jenkinsfile is in Git. Secrets in Git are in Git history forever — even after deletion. Every team member with repo access can see them. Jenkins Credentials store uses AES-128 encryption. Credentials are injected at runtime and automatically masked in all log output as `****`.


For production-grade security: integrate with HashiCorp Vault. Jenkins fetches secrets from Vault at pipeline runtime. When a secret rotates in Vault, all pipelines automatically get the new value on next run — zero manual credential updates in Jenkins.


All credential types + HashiCorp Vault integrationCopy

```

```


## 🌿 Multibranch Pipeline›


#### One Jenkinsfile, automatic pipeline per branch

Multibranch Pipeline discovers all branches in your Git repository and creates a pipeline for each automatically. Feature branches get dev deployment. Main branch triggers staging. Main branch + approval triggers production. When a branch is deleted in Git, its pipeline disappears automatically. Zero manual pipeline management.


Combined with `when` blocks in your Jenkinsfile: one file, one Jenkinsfile, handles all branches with the appropriate deployment target for each.


**Production Pattern**Branch protection: configure GitHub/GitLab to require the Jenkins CI check to pass before any merge to main. Jenkins posts commit status via GitHub Checks API — red X on PR means no merge. Quality is enforced automatically without anyone policing manually.


## 🔍 Troubleshooting — Every Real Issue›


7 most common Jenkins problems with exact diagnosis stepsCopy

```

```


## ☸️ Kubernetes Agents — Dynamic Builds at Scale›


#### Why Kubernetes agents over static agents

Traditional Jenkins: permanent agents sit idle between builds, wasting resources. With Kubernetes agents: each build spins up a fresh pod, runs the build, terminates. Zero idle cost. Each build gets a clean environment. Scale to hundreds of parallel builds automatically.


#### How it works


Jenkins Controller (permanent pod)

↓ triggers build

Kubernetes Plugin creates Agent Pod (temporary)

↓ agent connects to controller via JNLP

Build runs inside agent pod containers

↓ build completes

Agent pod terminated automatically


#### Jenkinsfile with Kubernetes agent

```
pipeline {
agent {
kubernetes {
yaml """
apiVersion: v1
kind: Pod
spec:
containers:
- name: maven
image: maven:3.9-eclipse-temurin-17
command: [cat]
tty: true
resources:
requests:
cpu: "500m"
memory: "512Mi"
limits:
cpu: "1"
memory: "1Gi"
- name: docker
image: docker:24-dind
securityContext:
privileged: true
"""
}
}
stages {
stage('Build') {
steps {
container('maven') {
sh 'mvn clean package -DskipTests'
}
}
}
stage('Docker Build') {
steps {
container('docker') {
sh 'docker build -t myapp:${BUILD_NUMBER} .'
}
}
}
}
}
```


#### Key Kubernetes plugin settings


- **Jenkins URL** — the URL agents use to connect back to the controller

- **Namespace** — where agent pods are created (typically `jenkins`)

- **Pod retention** — Never (always clean) or On Failure (keep for debugging)

- **Service Account** — needs permissions to create/delete pods in namespace


## 🔒 Jenkins High Availability and Backup›


#### Jenkins HA options


| Approach | How | Best for |
|---|---|---|
| Single controller + backup | Regular JENKINS_HOME backups to S3/blob. Fast restore from backup. | Most teams — simple, cost-effective |
| Jenkins on Kubernetes | Controller as a Deployment with PVC. K8s restarts pod if it crashes. PVC preserves data. | Cloud-native teams |
| CloudBees CI HA | Active-Active setup. Commercial product. | Enterprise with zero downtime requirement |


#### Backup strategy — what to backup

```
# JENKINS_HOME critical directories:
$JENKINS_HOME/
├── config.xml              # Main Jenkins config
├── credentials.xml         # All credentials
├── jobs/                   # All job definitions and build history
│   └── my-pipeline/
│       └── config.xml      # Jenkinsfile path, branch config
├── plugins/                # Installed plugins
├── secrets/                # Encryption keys — CRITICAL
│   └── master.key          # Without this, credentials cannot be decrypted
└── users/                  # User accounts

# Backup script (run via cron):
tar -czf jenkins-backup-$(date +%Y%m%d).tar.gz   $JENKINS_HOME/config.xml   $JENKINS_HOME/credentials.xml   $JENKINS_HOME/jobs/   $JENKINS_HOME/secrets/

# Upload to cloud storage
aws s3 cp jenkins-backup-$(date +%Y%m%d).tar.gz s3://my-backups/jenkins/
```


#### Jenkins on Kubernetes with persistent storage

```
apiVersion: apps/v1
kind: Deployment
metadata:
name: jenkins
namespace: jenkins
spec:
replicas: 1   # Jenkins controller is NOT horizontally scalable
template:
spec:
containers:
- name: jenkins
image: jenkins/jenkins:lts
volumeMounts:
- name: jenkins-home
mountPath: /var/jenkins_home
volumes:
- name: jenkins-home
persistentVolumeClaim:
claimName: jenkins-pvc   # PVC survives pod restarts
```


## 🔌 Key Plugins Every DevOps Engineer Should Know›


#### Essential plugins — what they do and why you need them


| Plugin | What it does | When you need it |
|---|---|---|
| Kubernetes | Run builds as Kubernetes pods — dynamic agents | Jenkins on K8s |
| Pipeline | Core Declarative and Scripted Pipeline support | Always |
| Git / GitHub | Checkout code, webhook triggers, GitHub PR integration | Always |
| Docker Pipeline | docker.build(), docker.push(), docker.withRegistry() in Jenkinsfile | Docker CI/CD |
| Credentials Binding | Inject credentials as env vars: withCredentials([usernamePassword()]) | Secret management |
| Blue Ocean | Modern pipeline visualisation UI — see each stage graphically | Team visibility |
| SonarQube Scanner | Run SonarQube analysis from pipeline stage | Code quality gates |
| Slack Notification | slackSend() — notify on success/failure | Team notifications |
| Email Extension | Rich HTML email notifications with build details | Stakeholder notifications |
| Parameterized Trigger | Trigger downstream jobs with parameters | Multi-job pipelines |
| Throttle Concurrent | Limit parallel builds — prevent resource starvation | Resource management |
| Artifact Manager S3/Azure | Store build artifacts in cloud storage | Large artifact management |


## 🎯 Interview Questions — 7 Critical Q&As›


All
Architect
Engineer
Production


JENKINS · ARCHITECT
How do you design Jenkins for 50 microservices without code duplication?
Shared Library — this is the answer that separates senior engineers. Create a Git repo for shared library with vars/ folder containing Groovy functions: buildAndPush.groovy, deployToK8s.groovy, runTests.groovy, slackNotify.groovy. Register in Jenkins: Manage Jenkins → Global Pipeline Libraries. Each microservice Jenkinsfile pins to a version: @Library('jenkins-shared-library@v2.1.0'). Entire service Jenkinsfile is 25 lines — just calls shared functions. When you add Trivy scanning: update buildAndPush.groovy once, tag v2.2.0, update one line in each service. Done in 30 minutes. Without this: 50 Jenkinsfiles to edit, 3 days minimum, inevitable inconsistency. At HPE: 15 services, one shared library. Pipeline change that took 3 days now takes 30 minutes.


JENKINS · ENGINEER
What is the difference between Declarative and Scripted Jenkins pipelines?
Declarative pipeline has a strict validated structure: pipeline → agent → options → stages → stage → steps. Structure is checked before execution — syntax errors caught immediately, not mid-run. Reads cleanly. Enforces best practices. Use for: 95% of real-world pipelines. Scripted pipeline is pure Groovy in a node block. Full programming language power — any control flow, any data structure, dynamic stage generation. Use for: complex dynamic pipelines, generating stages based on runtime data, iterating over dynamic deployment target lists. Rule: start Declarative. When you hit a genuine limitation, add a script block inside Declarative. Only go full Scripted for genuinely complex platform engineering pipelines.


JENKINS · ENGINEER
Explain Jenkins agents. What types exist and when do you use each?
Agents are where builds run — master only orchestrates. Four types: Permanent SSH agent — dedicated VM, Jenkins SSHes in. Always available, zero startup time. Downside: idle cost 24/7, environment drift as packages accumulate. Good for simple setups. Docker agent — each build in a fresh container. Clean and reproducible. Requires Docker daemon. Kubernetes pod agent — pod created per build, destroyed after. Zero idle cost, unlimited scale, Kubernetes handles scheduling. 10-30 second startup overhead. Production standard for cloud-native teams. Multi-container pod — specialist containers in one pod: Maven for compilation, Docker-in-Docker for image building, Trivy for scanning, all sharing the same workspace volume. My recommendation: Kubernetes agents for any team running on K8s. Zero idle cost, perfect reproducibility, auto-scaling. Combined with KEDA: agent pool scales to zero overnight.


JENKINS · PRODUCTION
Jenkins build is queued and never starts. How do you debug it?
Systematic approach. Step 1: check if agents are online. Manage Jenkins → Nodes. Any agent showing offline means builds for that label queue indefinitely. Step 2: click the queued build → Why is this blocked? Jenkins tells you exactly: label mismatch (pipeline says linux-k8s but agent has label linux), all agents busy (increase executor count or add more agents). Step 3: if Kubernetes agents, check pods. kubectl get pods -n jenkins shows pending agent pods. kubectl describe pod shows why: Insufficient CPU, insufficient memory, image pull error, node selector constraints. Step 4: check resource quotas: kubectl describe resourcequota -n jenkins — namespace may have hit CPU ceiling. Step 5: check Jenkins logs: Manage Jenkins → System Log for provisioning errors. Most common causes in order: label mismatch between pipeline and agent, all agents at executor limit, K8s pod stuck due to resource constraints, agent VM rebooted and disconnected.


JENKINS · ARCHITECT
How do you secure Jenkins credentials in a production environment?
Multiple layers. Layer 1: Jenkins Credentials store (AES-128 encrypted). Use withCredentials() block — value automatically masked as **** in all log output. Organize credentials with meaningful IDs: staging-acr-credentials, production-db-password. Set credential scope to Global (not System — System scope is invisible to pipelines). Layer 2: Vault integration. For enterprises: Jenkins authenticates to HashiCorp Vault via AppRole. Pipeline fetches secret at runtime. When secret rotates in Vault, all pipelines get new value automatically — no manual Jenkins credential updates. No production secrets stored in Jenkins at all. Layer 3: Cloud-native IRSA/Workload Identity. For K8s agents on AWS/Azure: pod authenticates as a Kubernetes service account mapped to an IAM role. Zero stored credentials. Perfect for Kubernetes-native pipelines. The anti-patterns to avoid: env variables set directly in shell (visible in process list), echoing credentials even to masked logs, storing credentials as plain text files in workspace.


JENKINS · PRODUCTION
Jenkins master is running out of memory. How do you fix it and prevent it?
Diagnosis: Manage Jenkins → System Information → Memory shows heap usage. When heap is >80% consistently, builds slow down, then OOM errors start. Immediate fix: increase JVM heap. In Jenkins startup configuration (Dockerfile, systemd, or JENKINS_HOME): JAVA_OPTS=-Xmx4g -Xms2g -XX:+UseG1GC. 4GB heap handles 50-100 concurrent builds comfortably. Structural fixes: configure build log rotation (Manage Jenkins → System → # builds to keep per project → set 20). Without rotation, Jenkins stores logs for every build forever — master fills up. Configure workspace cleanup — add cleanWs() to post always block of every pipeline. Enable build discard: buildDiscarder(logRotator(numToKeepStr: 20)) option in pipeline. Root cause prevention: Jenkins master should ONLY orchestrate. If you moved builds to agents correctly, master memory usage is minimal — it only stores logs and schedules. If master is starved, it usually means some builds are still running on master — check Manage Jenkins → Nodes → Built-In Node → Executors → set to 0.


JENKINS · ENGINEER
What is Jenkins Multibranch Pipeline and how does branch strategy work with it?
Multibranch Pipeline automatically discovers all branches in a Git repository and creates a Jenkins pipeline for each. When you push a new branch, Jenkins detects it (via webhook or polling) and creates a pipeline. When you delete the branch, Jenkins deletes the pipeline. No manual pipeline creation or cleanup. The power comes from combining it with when conditions in Jenkinsfile. One Jenkinsfile, different behaviour per branch: feature/* branches deploy to a feature namespace in dev. The develop branch deploys to staging automatically. The main branch requires human approval then deploys to production. Branch protection integration: configure GitHub to require the Jenkins status check to pass before merge. Jenkins posts commit status via GitHub Checks API. Red circle on PR = failed build = merge blocked. This enforces quality automatically without anyone policing it manually. PR approval gates your code review. Jenkins gates your quality. Neither is optional.


JENKINS · ENGINEER
How do Kubernetes agents work in Jenkins and what are the benefits over static agents?
Kubernetes agents work through the Jenkins Kubernetes Plugin. When a build triggers, the plugin creates a Pod in Kubernetes for that build. The pod contains one or more containers — typically your build tool (Maven, Node.js) plus any other tools needed (Docker, kubectl). The agent container connects back to the Jenkins controller via JNLP protocol. When the build completes, the pod is deleted. Benefits over static agents: no idle cost (pods only exist during builds), clean environment for every build (no state contamination), horizontal scalability (Kubernetes can schedule hundreds of agent pods in parallel), different container images per job (Maven job uses Maven image, Node.js job uses Node image), resource limits per build (prevent one build consuming all CPU). The main challenge: pod startup time (10-30 seconds) adds to build time. Mitigate with pod templates cached by Kubernetes or by using pod disruption budgets to keep warm agent pods ready. At HPE, we ran all Jenkins builds as Kubernetes pods on OpenShift — each microservice build spun up, compiled, built the Docker image, pushed to the registry, and terminated. Zero idle agents.


JENKINS · ENGINEER
What is a Jenkins Shared Library and how do you structure it for a large organisation?
A Shared Library is a common Groovy codebase loaded into Jenkins and available to all pipelines. Without it: every team writes their own docker build, push, deploy steps in their Jenkinsfile — duplication, inconsistency, and maintenance nightmare. With it: common steps are in the library, Jenkinsfiles become thin orchestration files. Structure: the library lives in a Git repository with this structure: src/ (Groovy classes), vars/ (global variables — these are the functions pipelines call), resources/ (static files). Example: vars/dockerBuild.groovy defines a dockerBuild(image, tag) function. Any Jenkinsfile can call dockerBuild("myapp", "v1.2") and it runs the standardised build. Configuration: in Jenkins → Manage Jenkins → Configure System → Global Pipeline Libraries, point to the Git repo and give it a name. In Jenkinsfile: @Library("shared-library") import _ at the top. Production use at HPE: one shared library for all microservice pipelines. Steps for build, test, security scan, deploy to OpenShift, and notification were all in the library. When we added SonarQube, we added it once to the library and all 50 pipelines got it automatically on next run.


JENKINS · PRODUCTION
Jenkins build is queued but never starts. What do you investigate?
Builds queue when no agent is available to run them. Investigation steps: 1. Check build queue item — click the stuck build, it shows why it is waiting: "No agents are online", "All agents are busy", or the label expression is not matched. 2. Check agents: Manage Jenkins → Nodes. Are agents online? If offline: click the agent, see the disconnect reason. Reconnect manually or check the agent process. 3. For Kubernetes agents: check pod creation. kubectl get pods -n jenkins — are agent pods being created? kubectl describe pod for pending pods — might be scheduling failure (insufficient CPU/memory, node selector mismatch, PVC issues). 4. Label mismatch: the pipeline has agent { label "linux" } but no agent has that label. Check agent labels in Manage Jenkins → Nodes → agent configuration. 5. Executor count: agent is online but all executors are busy. Check how many concurrent builds are running. 6. Resource limits on Kubernetes: the namespace has a ResourceQuota — no more pods can be created. kubectl describe resourcequota -n jenkins. 7. Plugin issue: Kubernetes plugin cannot authenticate to cluster. Check Jenkins logs: tail -f /var/log/jenkins/jenkins.log | grep -i error.


JENKINS · ARCHITECT
How do you secure Jenkins in a production environment?
Security in layers. Authentication: enable security (not anonymous access). Integrate with LDAP/Active Directory or OAuth (GitHub, Google) using the LDAP plugin or GitHub Authentication plugin — developers use their existing credentials. Authorisation: use Matrix-Based Security or Role Strategy plugin. Principle of least privilege: most users get Job/Read and Job/Build for their team folders. Only DevOps team gets Administer. Never give everyone Administer. Credentials: never put passwords, tokens, or keys in Jenkinsfile or build parameters. Store all secrets in Jenkins Credentials Store (encrypted using master.key). Reference with withCredentials() or credentials() binding. Better: integrate with HashiCorp Vault or Azure Key Vault. Agent isolation: Kubernetes agents run in isolated pods. Each job gets a clean environment. Prevent agents from having access to controller filesystem. Network: Jenkins controller behind a VPN or internal load balancer — not publicly accessible. Webhook validation: validate GitHub webhook signatures using the Jenkins GitHub plugin. Audit: install the Audit Trail plugin — logs all Jenkins actions with user and timestamp. Regular updates: Jenkins and plugins have frequent security patches. Set up automated update notifications.


id="sec-roadmap">

## 🗺️ Learning Roadmap›





Week 1
First Pipeline



Install Jenkins: docker run -p 8080:8080 jenkins/jenkins:lts

Create Freestyle job — runs a shell script on commit

Create Pipeline job — write first Jenkinsfile

Connect to GitHub via webhook — auto-trigger on push





Week 2
Real Pipeline



Write full Declarative: checkout → test → build → deploy

Add parallel stages — tests run simultaneously

Add credentials — no hardcoded passwords

Add Slack notification on failure





Week 3
Agents & Scale



Configure Docker agent — builds in containers

Configure K8s agent — zero idle cost pods

Multibranch Pipeline — auto-discover branches

SonarQube integration with quality gate





Month 2
Architect Level



Create Shared Library — 3 reusable functions

Full pipeline: test→scan→build→Trivy→Helm deploy

Production approval gate with input()

Role-based access: developer vs admin vs viewer




Continue Learning
[⚡ GitHub Actions](/devops/github-actions.html)[🔵 GitLab CI](/cicd/gitlab-ci.html)[🐙 ArgoCD](/cicd/argocd.html)[⛵ Helm](/devops/helm.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤

## Jenkins in Real Production (from Wipro/Azure deployments)

CI/CD Pipeline

**Q1: ****How would you design a CI/CD pipeline for a microservices application migrating to AKS?**

**Answer:**

Given your OCP background, the migration to AKS CI/CD will feel familiar but uses Azure-native tooling. Here is the architecture I recommend for Wipro engagements:

**Pipeline Architecture:**

- Source Control: Azure Repos (Git) or GitHub

- CI: Azure Pipelines with YAML-based pipelines (azure-pipelines.yml)

- Artifact Registry: Azure Container Registry (ACR)

- CD: Azure Pipelines Release or GitOps with ArgoCD/Flux

- Secrets: Azure Key Vault integration

**YAML Pipeline skeleton:**

trigger:

  branches:

    include: [main, release/*]

variables:

  imageRepository: 'myapp'

  containerRegistry: 'myregistry.azurecr.io'

  tag: '$(Build.BuildId)'

stages:

- stage: Build

  jobs:

  - job: BuildAndPush

    pool: { vmImage: ubuntu-latest }

    steps:

    - task: Docker@2

      inputs:

        command: buildAndPush

        repository: $(imageRepository)

        containerRegistry: myACRServiceConnection

        tags: $(tag)

- stage: Deploy_Dev

  dependsOn: Build

  jobs:

  - deployment: DeployToAKS

    environment: dev

    strategy:

      runOnce:

        deploy:

          steps:

          - task: KubernetesManifest@0

            inputs:

              action: deploy

              kubernetesServiceConnection: aks-dev

              manifests: k8s/deployment.yaml

              containers: $(containerRegistry)/$(imageRepository):$(tag)

**TIP: **From your OCP experience: Azure Pipelines stages map directly to OpenShift pipeline stages. The main difference is YAML syntax and Azure service connections instead of OpenShift secrets.

**Q2: ****Explain Blue-Green vs Canary deployments. When would you use each?**

**Answer:**

**Blue-Green Deployment:**

Two identical production environments. Traffic switches 100% from blue (current) to green (new) via load balancer/ingress update.

- Use when: Zero-downtime releases, easy rollback required, database schema changes

- Risk: Full traffic switch — if green has issues, ALL users are affected

- AKS implementation: Swap Kubernetes Service selectors between blue/green deployments

**Canary Deployment:**

Gradual traffic shift to new version — e.g., 5% > 25% > 50% > 100%.

- Use when: Validating new features with real traffic, A/B testing, risk-averse releases

- AKS implementation: Use NGINX Ingress weight annotations or Azure Front Door

# Canary with NGINX Ingress

apiVersion: networking.k8s.io/v1

kind: Ingress

metadata:

  name: myapp-canary

  annotations:

    nginx.ingress.kubernetes.io/canary: 'true'

    nginx.ingress.kubernetes.io/canary-weight: '20'  # 20% traffic

spec:

  rules:

  - host: myapp.example.com

    http:

      paths:

      - path: /

        pathType: Prefix

        backend:

          service: { name: myapp-canary, port: { number: 80 } }

**TIP: **In Wipro AKS projects, Canary is preferred for microservices — it limits blast radius. Blue-Green suits stateful apps like your Oracle/Kafka stack.

**Q3: ****How do you handle secrets management in a CI/CD pipeline?**

**Answer:**

Never store secrets in code or pipeline YAML. The hierarchy of approaches:

**1. Azure Key Vault (Recommended for AKS):**

# Pipeline variable group linked to Key Vault

variables:

- group: production-secrets  # Linked to Azure Key Vault

# Access in AKS via CSI driver

apiVersion: secrets-store.csi.x-k8s.io/v1

kind: SecretProviderClass

metadata:

  name: azure-kvname

spec:

  provider: azure

  parameters:

    usePodIdentity: 'false'

    keyvaultName: 'myKeyVault'

    objects: |

      array:

        - |

          objectName: db-password

          objectType: secret

    tenantId: '<tenant-id>'

**2. Kubernetes Secrets (with encryption at rest):**

kubectl create secret generic db-creds \

  --from-literal=username=admin \

  --from-literal=password=SuperSecure123 \

  --namespace=production

**TIP: **From your Graylog/Kibana ex
