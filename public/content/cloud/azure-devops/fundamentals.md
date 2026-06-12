# Azure DevOps — Fundamentals

## Core Services

```
Azure Boards:    Work tracking — sprints, backlogs, Kanban boards
Azure Repos:     Git repositories (unlimited private repos)
Azure Pipelines: CI/CD — builds, tests, deployments
Azure Artifacts: Package registry — npm, NuGet, PyPI, Maven
Azure Test Plans: Manual and exploratory testing
```

## Azure Pipelines — YAML

```yaml
# azure-pipelines.yml
trigger:
  branches:
    include: [main, develop]
  paths:
    exclude: [docs/*, '*.md']

pr:
  branches:
    include: [main]

variables:
  dockerRegistry: 'prodregistry.azurecr.io'
  imageName: 'myapp'
  tag: '$(Build.BuildId)'

stages:
- stage: CI
  displayName: 'Build and Test'
  jobs:
  - job: Build
    pool:
      vmImage: ubuntu-latest
    steps:
    - task: NodeTool@0
      inputs:
        versionSpec: '20.x'

    - script: |
        npm ci
        npm run test -- --coverage
      displayName: 'Install and Test'

    - task: PublishTestResults@2
      inputs:
        testResultsFormat: 'JUnit'
        testResultsFiles: '**/test-results.xml'

    - task: PublishCodeCoverageResults@1
      inputs:
        codeCoverageTool: Cobertura
        summaryFileLocation: coverage/cobertura-coverage.xml

    - task: Docker@2
      displayName: 'Build and push to ACR'
      inputs:
        containerRegistry: 'AzureContainerRegistry'
        repository: '$(imageName)'
        command: 'buildAndPush'
        tags: |
          $(tag)
          latest

- stage: Deploy_Staging
  dependsOn: CI
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: DeployToStaging
    environment: 'staging'        # Requires approval if configured
    pool:
      vmImage: ubuntu-latest
    strategy:
      runOnce:
        deploy:
          steps:
          - task: KubernetesManifest@0
            inputs:
              action: 'deploy'
              kubernetesServiceConnection: 'aks-staging'
              manifests: 'k8s/*.yml'
              containers: '$(dockerRegistry)/$(imageName):$(tag)'

- stage: Deploy_Production
  dependsOn: Deploy_Staging
  jobs:
  - deployment: DeployToProd
    environment: 'production'     # Configured with required approvals
    strategy:
      canary:
        increments: [10, 25, 100]  # Deploy to 10%, 25%, then 100%
        deploy:
          steps:
          - task: KubernetesManifest@0
            inputs:
              action: 'deploy'
              kubernetesServiceConnection: 'aks-prod'
              manifests: 'k8s/*.yml'
```

## Service Connections

```bash
# Service connections = credentials for external services
# Stored securely, referenced by name in pipelines

# Types:
# Azure Resource Manager: Deploy to Azure subscriptions
# Kubernetes: Deploy to any Kubernetes cluster
# Docker Registry: Push to ACR, Docker Hub, etc.
# GitHub: Checkout code, trigger builds
# Generic: Any REST service with username/password

# Create via: Project Settings → Service Connections → New
```

## Variable Groups and Secrets

```yaml
# Reference variable group in pipeline
variables:
- group: 'production-secrets'    # Created in Library → Variable Groups
- name: 'myVar'
  value: 'myValue'

# In steps
steps:
- script: echo $(db-password)    # Secret variables are masked in logs
  env:
    DB_PASSWORD: $(db-password)  # Pass as env var to script
```
