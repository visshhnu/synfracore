# Azure DevOps Pipelines

> **Azure Pipelines YAML, agents, environments, ARM vs Bicep vs Terraform**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Azure DevOps Pipelines?

Azure DevOps is Microsoft's all-in-one DevOps platform — SCM (Repos), CI/CD (Pipelines), project tracking (Boards), package management (Artifacts) and test management (Test Plans). Unlike GitHub Actions which focuses on CI/CD, Azure DevOps has the full project lifecycle. Heavily used in enterprise Microsoft shops. Pipelines support YAML (recommended) and classic visual editor.

## Why Azure DevOps Pipelines?

Modern Azure Pipelines use YAML — stored in the repo alongside code (Pipeline as Code). Stages run sequentially. Jobs within a stage run in parallel. Templates are reusable YAML files — equivalent to Jenkins Shared Libraries or GitHub Actions reusable workflows. Variable Groups store shared variables and secrets across pipelines.

---

## Learning Modules

### Module 01 — Azure DevOps Overview
*Boards, Repos, Pipelines, Artifacts, Test Plans*

Azure DevOps is Microsoft's all-in-one DevOps platform — SCM (Repos), CI/CD (Pipelines), project tracking (Boards), package management (Artifacts) and test management (Test Plans). Unlike GitHub Actions which focuses on CI/CD, Azure DevOps has the full project lifecycle. Heavily used in enterprise Microsoft shops. Pipelines support YAML (recommended) and classic visual editor.

**Topics covered:**

- Azure DevOps vs GitHub Actions — 🟢 Beginner
- Boards — Agile project management — 🟢 Beginner
- Repos — Git hosting — 🟢 Beginner
- Pipelines — CI/CD — 🟡 Intermediate
- Artifacts — package registry — 🟡 Intermediate

```bash
# Azure DevOps vs GitHub Actions vs GitLab CI
# Azure DevOps: all-in-one, deep Azure integration, enterprise RBAC
# GitHub Actions: SaaS, marketplace, best for open source, simpler
# GitLab CI:  all-in-one, built-in security scanning, self-hosted option

# CHOOSE AZURE DEVOPS WHEN:
# - Already using Microsoft 365 / Azure
# - Need deep Azure integration (AKS, ACR, Key Vault)
# - Enterprise RBAC and audit requirements
# - Team uses Boards for project management
# - On-premises or hybrid (Azure DevOps Server)

# Azure DevOps URL structure:
# https://dev.azure.com/{organisation}/{project}/_pipelines

# Pipeline YAML goes in root of repo:
# azure-pipelines.yml
# or
# .azure/pipeline.yml  (custom path configured in pipeline settings)
```

### Module 02 — YAML Pipelines
*Stages, jobs, steps, templates, variables*

Modern Azure Pipelines use YAML — stored in the repo alongside code (Pipeline as Code). Stages run sequentially. Jobs within a stage run in parallel. Templates are reusable YAML files — equivalent to Jenkins Shared Libraries or GitHub Actions reusable workflows. Variable Groups store shared variables and secrets across pipelines.

**Topics covered:**

- Pipeline YAML structure — 🟢 Beginner
- Stages, jobs, steps — 🟢 Beginner
- Variables and variable groups — 🟡 Intermediate
- Pipeline templates — reusable YAML — 🟡 Intermediate
- Environments with approval gates — 🟡 Intermediate
- Optimising slow pipelines — 🔴 Advanced

```bash
# azure-pipelines.yml — production CI/CD pipeline
trigger:
  branches:
    include: [main]
  paths:
    exclude: [docs/*]

variables:
  - group: production-secrets    # Variable Group with ACR credentials
  - name: imageTag
    value: $(Build.BuildId)

stages:

# ── CI Stage ─────────────────────────────────────────
- stage: Build
  jobs:
  - job: Test
    pool:
      vmImage: ubuntu-latest
    steps:
    - task: Cache@2
      inputs:
        key: npm | $(Agent.OS) | package-lock.json
        path: node_modules    # Cache npm deps — saves ~5min
    - script: npm ci && npm test
      displayName: Install and Test
    - task: PublishTestResults@2
      inputs:
        testResultsFiles: coverage/junit.xml

  - job: SecurityScan
    pool:
      vmImage: ubuntu-latest
    steps:
    - script: |
        docker run --rm \\
          -v $(pwd):/workspace \\
          aquasec/trivy fs --exit-code 1 --severity CRITICAL /workspace

  - job: BuildImage
    dependsOn: [Test, SecurityScan]
    steps:
    - task: Docker@2
      inputs:
        containerRegistry: acr-service-connection
        repository: myapp
        command: buildAndPush
        tags: $(imageTag)

# ── CD Stage: Staging ────────────────────────────────
- stage: DeployStaging
  dependsOn: Build
  jobs:
  - deployment: Deploy
    environment: staging          # Links to Azure DevOps Environment
    strategy:
      runOnce:
        deploy:
          steps:
          - template: templates/deploy-aks.yml  # Reusable template
            parameters:
              namespace: staging
              imageTag: $(imageTag)

# ── CD Stage: Production ─────────────────────────────
- stage: DeployProd
  dependsOn: DeployStaging
  jobs:
  - deployment: Deploy
    environment: production       # Has approval gate configured
    strategy:
      runOnce:
        deploy:
          steps:
          - template: templates/deploy-aks.yml
            parameters:
              namespace: production
              imageTag: $(imageTag)
```

### Module 03 — Pipeline Optimisation
*From 45 minutes to under 15 minutes*

Most slow pipelines have the same problems: sequential stages that could be parallel, no dependency caching, Microsoft-hosted agents spinning up fresh every time. Typical improvements: cache npm/pip saves 5-10 minutes, parallelise test + security scan saves the longer of those two, self-hosted agents save 3-5 minute spin-up time. Together: 45 minutes to under 15 is realistic.

**Topics covered:**

- Parallelise independent jobs — 🟡 Intermediate
- Cache npm/pip/maven dependencies — 🟢 Beginner
- Self-hosted agents — pre-installed tools — 🟡 Intermediate
- Docker layer caching with BuildKit — 🟡 Intermediate
- Skip unchanged services in monorepo — 🔴 Advanced

```bash
# BEFORE: Sequential, no cache = 45 minutes
# test (15min) → security (10min) → build (12min) → deploy (8min)

# AFTER: Parallel + cache = 12 minutes
# [test + security + lint] parallel = 15min
#         ↓
#      build = 12min (with layer cache)
#         ↓
#      deploy = 8min

# 1. Cache dependencies
- task: Cache@2
  inputs:
    key: npm | $(Agent.OS) | package-lock.json
    path: $(Pipeline.Workspace)/.npm
    restoreKeys: npm | $(Agent.OS)

# 2. Docker BuildKit layer caching
- script: |
    docker buildx build \\
      --cache-from type=registry,ref=$(ACR_LOGIN_SERVER)/myapp:cache \\
      --cache-to   type=registry,ref=$(ACR_LOGIN_SERVER)/myapp:cache,mode=max \\
      -t $(ACR_LOGIN_SERVER)/myapp:$(imageTag) \\
      --push .
  env:
    DOCKER_BUILDKIT: "1"

# 3. Self-hosted agent pool (pre-installed tools)
- job: Build
  pool:
    name: self-hosted-linux    # Your own VMs with tools pre-installed
    demands:
    - docker
    - kubectl
  # Saves: 3-5 min agent startup + tool installation time

# 4. Only build changed services in monorepo
- script: |
    CHANGED=$(git diff --name-only HEAD~1 HEAD)
    if echo "$CHANGED" | grep -q "services/payment/"; then
      echo "##vso[task.setvariable variable=buildPayment]true"
    fi
- job: BuildPayment
  condition: eq(variables['buildPayment'], 'true')
```

### Module 04 — ARM vs Bicep vs Terraform
*When to use which on Azure*

Honest comparison for Azure: Terraform is the default choice for anything that needs to last — multi-cloud support, large community, mature state management. Bicep is Microsoft's answer — Azure-only but cleaner than ARM JSON, first-class Azure support. ARM JSON: never write by hand, legacy only. Most enterprise teams use Terraform for infrastructure and Bicep for quick Azure-specific resources.

**Topics covered:**

- ARM templates — JSON, verbose, avoid — 🟢 Beginner
- Bicep — Azure-native HCL alternative — 🟡 Intermediate
- Terraform — multi-cloud, community, state management — 🟡 Intermediate
- Decision matrix for Azure projects — 🟡 Intermediate

```bash
# Bicep example (Azure-native, cleaner than ARM)
// main.bicep
param location string = resourceGroup().location
param aksClusterName string
param nodeCount int = 3

resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-01-01' = {
  name: aksClusterName
  location: location
  identity: {
    type: 'SystemAssigned'    // Managed Identity — no credentials
  }
  properties: {
    kubernetesVersion: '1.28'
    agentPoolProfiles: [
      {
        name: 'default'
        count: nodeCount
        minCount: 3
        maxCount: 10
        enableAutoScaling: true
        vmSize: 'Standard_D4s_v3'
        mode: 'System'
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      networkPolicy: 'calico'
    }
  }
}

output aksResourceId string = aksCluster.id

# Deploy Bicep
az deployment group create \\
  --resource-group prod-rg \\
  --template-file main.bicep \\
  --parameters aksClusterName=prod-aks nodeCount=5

# DECISION MATRIX:
# Multi-cloud?                 → Terraform (only option)
# Azure-only, long-term?       → Terraform (better community, state mgmt)
# Azure-only, quick resource?  → Bicep (faster, native)
# Legacy existing ARM?         → Convert to Bicep: az bicep decompile
# Never write raw ARM JSON.    → Export from portal if you need ARM
```

---

## Production Example

```bash
# Azure DevOps — Key Predefined Variables

# Build variables (available in all pipelines):
# $(Build.BuildId)           — unique build number
# $(Build.SourceBranchName)  — branch name (main, feature/login)
# $(Build.Repository.Name)   — repo name
# $(Agent.OS)                — Linux, Windows, Darwin
# $(Pipeline.Workspace)      — workspace directory path
# $(Build.ArtifactStagingDirectory) — where to put build outputs

# Release / Deployment variables:
# $(Release.EnvironmentName) — environment name (staging, prod)
# $(Release.ReleaseName)     — release name

# COMMON TASKS REFERENCE:
# Checkout code:      checkout: self
# Run script:         script: echo hello
# Cache deps:         task: Cache@2
# Docker build/push:  task: Docker@2
# Publish artifacts:  task: PublishBuildArtifacts@1
# Download artifacts: task: DownloadBuildArtifacts@0
# Kubectl apply:      task: KubernetesManifest@0
# Helm deploy:        task: HelmDeploy@0
# Azure CLI:          task: AzureCLI@2
# Azure Key Vault:    task: AzureKeyVault@2  (fetch secrets at runtime)

# SERVICE CONNECTIONS (how pipelines authenticate):
# Azure Resource Manager → deploy to Azure
# Docker Registry         → push to ACR
# Kubernetes              → deploy to AKS
# GitHub                  → checkout from GitHub repo
# All created in: Project Settings → Service Connections
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Azure DevOps Pipelines and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Azure DevOps Pipelines work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Azure DevOps Pipelines?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Azure DevOps Pipelines?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Azure DevOps Pipelines?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Azure DevOps Pipelines in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Azure DevOps Pipelines?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Azure DevOps Pipelines compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Azure DevOps Overview in Azure DevOps Pipelines."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain YAML Pipelines in Azure DevOps Pipelines."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Azure Pipelines YAML Reference](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/)
- [Azure Pipelines Tasks Reference](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*