# Azure DevOps

CI/CD & GitOps › Azure DevOps
🔷**Azure DevOps**
BeginnerEngineerArchitectRepos, Pipelines, Environments, Approvals, Variable Groups, Templates — complete guide
[What is Azure DevOps](#sec-what)[YAML Pipeline](#sec-yaml-pipeline)[Environments](#sec-environments)[Variables & Secrets](#sec-variables)[Templates](#sec-templates)[Interview Q&A](#sec-interview)


## 🔷 What is Azure DevOps?›


#### What is Azure DevOps?

Azure DevOps is **Microsoft's complete DevOps platform** — a suite of integrated services covering the entire software development lifecycle from planning to deployment. It is a cloud-based service (dev.azure.com) that you can also self-host as Azure DevOps Server (formerly TFS).


You can use all services together as a complete platform, or independently — for example, use only Azure Pipelines for CI/CD while keeping your code in GitHub and work items in Jira.


#### The five services inside Azure DevOps

| Service | What it does | Alternative |
|---|---|---|
| Azure Repos | Managed Git repositories with branch policies, PR reviews, and code review workflows | GitHub, GitLab |
| Azure Pipelines | CI/CD platform — build, test, and deploy using YAML or classic UI. Supports any language, any platform, any cloud. | Jenkins, GitHub Actions |
| Azure Boards | Agile project management — work items, sprints, Kanban boards, backlogs, velocity charts | Jira, Trello |
| Azure Artifacts | Package management — host npm, Maven, NuGet, Python, and Docker packages with versioning | Nexus, Artifactory |
| Azure Test Plans | Manual and automated test management, exploratory testing, test case tracking | TestRail, Zephyr |


#### Why Azure DevOps over alternatives?

Azure DevOps integrates deeply with the Microsoft ecosystem — Azure, Office 365, Active Directory, Teams. If your organisation uses Azure cloud, AKS, and Microsoft 365, Azure DevOps gives you single sign-on via Azure AD, tight AKS integration, Key Vault integration for pipeline secrets, and native connections to Azure resources. This is why it is common in enterprise environments running on Azure — including at PACE Hospitals where you used it for CI/CD automation.


#### How a pipeline connects to your infrastructure


Developer pushes code to Azure Repos or GitHub

↓ trigger: push to main branch

Azure Pipeline starts — runs on Microsoft-hosted or self-hosted agent

↓

Build → Test → Docker build → Push image to ACR

↓

Deploy to AKS dev (automatic) → Deploy to staging (automatic)

↓

Production: manual approval required from release manager

↓

Production deployment proceeds → smoke tests → monitoring


## 📄 YAML Pipeline — Complete Structure›


#### Everything you need to know about Azure DevOps YAML pipelines

```
trigger:
branches:
include: [main, release/*]
paths:
exclude: [docs/*, README.md]   # don't trigger on doc changes

pr:
branches:
include: [main]

variables:
- group: production-secrets        # Variable Group from Library
- name: imageTag
value: $(Build.BuildNumber)
- name: containerRegistry
value: myacr.azurecr.io

stages:
- stage: Build
displayName: Build and Scan
jobs:
- job: BuildJob
pool:
vmImage: ubuntu-latest         # Microsoft-hosted agent
steps:
- task: Docker@2
displayName: Build image
inputs:
command: build
repository: myapp
dockerfile: Dockerfile
tags: $(imageTag)

- task: trivy@1
displayName: Scan for CVEs
inputs:
image: myapp:$(imageTag)
exitCode: 1
severity: HIGH,CRITICAL

- task: Docker@2
displayName: Push to ACR
inputs:
command: push
containerRegistry: acr-service-connection
repository: myapp
tags: $(imageTag)

- publish: $(Build.ArtifactStagingDirectory)
artifact: manifests

- stage: DeployDev
displayName: Deploy to Development
dependsOn: Build
condition: succeeded()
jobs:
- deployment: DeployDev
pool:
vmImage: ubuntu-latest
environment: development         # Environment with approval gates
strategy:
runOnce:
deploy:
steps:
- task: HelmDeploy@0
inputs:
connectionType: Kubernetes Service Connection
kubernetesServiceEndpoint: aks-dev-connection
namespace: dev
command: upgrade
chartPath: charts/myapp
releaseName: myapp
overrideValues: image.tag=$(imageTag)
waitForExecution: true

- stage: DeployProd
displayName: Deploy to Production
dependsOn: DeployDev
condition: succeeded()
jobs:
- deployment: DeployProd
environment: production          # Requires approval — configured in Environments UI
strategy:
runOnce:
deploy:
steps:
- task: HelmDeploy@0
inputs:
namespace: prod
overrideValues: image.tag=$(imageTag),replicaCount=5
```


## 🌍 Environments, Approvals and Gates›


#### Environments are where you control deployment safety

An Environment in Azure DevOps represents a deployment target (development, staging, production). You configure approvals, checks, and gates on the Environment — not in the YAML. This separates deployment logic from deployment safety.


#### Types of checks on Environments

| Check type | What it does |
|---|---|
| Manual approval | Specific people or groups must approve before the stage proceeds. Used for production deployments. |
| Invoke REST API | Calls an external endpoint — passes if it returns 200. Used for quality gates: SonarQube, ServiceNow ITSM approval. |
| Business Hours | Only allows deployments during defined hours — prevents weekend production deploys. |
| Evaluate artifact | Checks whether the artifact being deployed meets policies (signed, scanned, from approved branch). |
| Query Azure Monitor alerts | Pauses deployment if active alerts exist in the target environment. |


#### Environment resources — track Kubernetes namespaces

```
# Add a Kubernetes namespace to an Environment for deployment tracking
# Go to: Environments → production → Add resource → Kubernetes → AKS
# After adding: every deployment to that namespace is tracked in Azure DevOps
# You can see: which build deployed, when, who approved, pod health status
```


## 🔐 Variables, Variable Groups and Key Vault›


#### Three ways to manage configuration in Azure DevOps pipelines

##### 1. Inline variables (non-sensitive)

```
variables:
appName: payment-service
imageTag: $(Build.BuildNumber)
environment: production
```


##### 2. Variable Groups (shared across pipelines)

Pipelines → Library → Variable Groups. Define once, reference in many pipelines. Can mark variables as secret (value hidden in logs). Link a group to a Key Vault to sync secrets automatically.


```
variables:
- group: production-config    # all variables from this group are available
- group: production-secrets   # linked to Azure Key Vault
```


##### 3. Azure Key Vault integration (recommended for secrets)

Link a Variable Group directly to Azure Key Vault. Every secret in the vault becomes a pipeline variable. Rotates automatically when Key Vault secret changes. No manual copy-paste of secrets.


```
# Variable Group linked to Key Vault
# In the pipeline, reference Key Vault secrets as normal variables:
- task: AzureCLI@2
inputs:
azureSubscription: production-connection
scriptType: bash
script: |
echo "Deploying with DB password: $(database-password)"
# $(database-password) comes from Key Vault via Variable Group
# value is masked in logs
```


#### Service connections — secure links to external systems

| Service connection type | Used for |
|---|---|
| Azure Resource Manager | Deploy to Azure, run az CLI commands |
| Kubernetes | Run kubectl, helm against AKS cluster |
| Docker Registry | Push/pull images to ACR or Docker Hub |
| GitHub | Checkout code from GitHub repos |


## 📐 YAML Templates — Reuse Pipeline Code›


#### Templates eliminate duplication across 50 pipeline
