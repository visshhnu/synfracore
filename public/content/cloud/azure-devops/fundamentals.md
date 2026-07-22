# Azure DevOps — Fundamentals

## The hook: a pipeline that passes locally can still fail in Azure Pipelines

A very common early confusion: a script works fine on a developer's machine, then fails the moment it runs as an Azure Pipelines step — usually because the pipeline's hosted agent (`vmImage: ubuntu-latest`) is a clean, ephemeral VM with none of the tools, caches, or environment variables a developer's own machine has built up over time. Every dependency the script needs has to be installed explicitly in the pipeline (via a task like `NodeTool@0` or a `script` step) — nothing is assumed to already be there.

## Analogy

Running a step on a hosted Azure Pipelines agent is like cooking in a hotel kitchen instead of your own. Your home kitchen (your laptop) has every spice, tool, and leftover ingredient already in place from months of use. The hotel kitchen (the hosted agent) is professionally cleaned and reset before you arrive — nothing is there except what's built into the base image, so if your recipe (script) needs a specific ingredient (a CLI tool, a language runtime version), you have to bring it or explicitly ask for it (a setup task) instead of assuming it'll be sitting in the cupboard.

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

## Try it yourself (2 minutes)

If you have an Azure DevOps organization available, create a pipeline with a single step: `- script: which node || echo "node not found"`, and run it on `vmImage: ubuntu-latest` with no `NodeTool@0` task beforehand. Depending on the image version, this may or may not find a pre-installed Node — then add the `NodeTool@0` task with `versionSpec: '20.x'` before it and re-run. Comparing the two runs makes the hook above concrete: never assume a tool is present just because it's common: pin the version you actually need with an explicit setup task.
