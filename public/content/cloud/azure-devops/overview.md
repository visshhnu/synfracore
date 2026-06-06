# Azure DevOps — Complete CI/CD Platform

Azure DevOps is Microsoft's end-to-end DevOps platform. It combines source control (Repos), CI/CD pipelines, agile planning (Boards), artifact management (Artifacts), and test management in one integrated suite.

## Azure DevOps Services

| Service | Purpose | Alternative |
|---------|---------|-------------|
| **Azure Repos** | Git source control | GitHub |
| **Azure Pipelines** | CI/CD automation | Jenkins, GitHub Actions |
| **Azure Boards** | Agile planning, work items | Jira |
| **Azure Artifacts** | Package registry (npm, pip, NuGet, Maven) | JFrog Artifactory |
| **Azure Test Plans** | Test case management | Manual testing tools |

## Azure Pipelines — YAML Pipeline

```yaml
# azure-pipelines.yml
trigger:
  branches:
    include:
    - main
    - release/*
  paths:
    exclude:
    - docs/*
    - README.md

pr:
  branches:
    include:
    - main

variables:
  dockerRegistry: 'myregistry.azurecr.io'
  imageName: 'myapp'
  tag: '$(Build.BuildId)'
  azureSubscription: 'Production-Service-Connection'

stages:
# ─── Stage 1: Build & Test ───────────────────────
- stage: Build
  displayName: 'Build and Test'
  jobs:
  - job: BuildJob
    displayName: 'Build, Test, Scan'
    pool:
      vmImage: 'ubuntu-latest'

    steps:
    - task: UsePythonVersion@0
      inputs:
        versionSpec: '3.12'

    - script: |
        pip install -r requirements.txt
        pytest tests/ -v --junit-xml=test-results.xml --cov=src --cov-report=xml
      displayName: 'Run Tests'

    - task: PublishTestResults@2
      inputs:
        testResultsFormat: 'JUnit'
        testResultsFiles: 'test-results.xml'
      condition: always()

    - task: PublishCodeCoverageResults@1
      inputs:
        codeCoverageTool: 'Cobertura'
        summaryFileLocation: 'coverage.xml'

    - task: Docker@2
      displayName: 'Build Docker image'
      inputs:
        command: 'build'
        repository: '$(dockerRegistry)/$(imageName)'
        tags: |
          $(tag)
          latest

    - task: AzureContainerRegistry@0
      displayName: 'Push to ACR'
      inputs:
        azureSubscriptionEndpoint: '$(azureSubscription)'
        azureContainerRegistry: '$(dockerRegistry)'
        action: 'Push an image'
        imageName: '$(imageName):$(tag)'

    - task: trivy@0
      displayName: 'Security scan'
      inputs:
        image: '$(dockerRegistry)/$(imageName):$(tag)'
        severities: 'HIGH,CRITICAL'
        exitCode: '1'

# ─── Stage 2: Deploy to Staging ──────────────────
- stage: DeployStaging
  displayName: 'Deploy to Staging'
  dependsOn: Build
  condition: succeeded()
  jobs:
  - deployment: DeployToStaging
    displayName: 'Deploy to AKS Staging'
    environment: 'staging'                  # Links to Environments for approvals
    strategy:
      runOnce:
        deploy:
          steps:
          - task: AzureCLI@2
            inputs:
              azureSubscription: '$(azureSubscription)'
              scriptType: 'bash'
              scriptLocation: 'inlineScript'
              inlineScript: |
                az aks get-credentials \
                  --resource-group my-rg \
                  --name staging-aks

                helm upgrade --install myapp ./helm \
                  --namespace staging \
                  --create-namespace \
                  --set image.tag=$(tag) \
                  --values helm/values-staging.yaml \
                  --wait --timeout 5m --atomic

          - script: |
              sleep 15
              curl -f https://staging.myapp.com/health
            displayName: 'Smoke test'

# ─── Stage 3: Deploy to Production ───────────────
- stage: DeployProduction
  displayName: 'Deploy to Production'
  dependsOn: DeployStaging
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: DeployToProd
    displayName: 'Deploy to AKS Production'
    environment: 'production'              # Requires manual approval in Azure portal
    strategy:
      runOnce:
        deploy:
          steps:
          - task: AzureCLI@2
            inputs:
              azureSubscription: '$(azureSubscription)'
              scriptType: 'bash'
              scriptLocation: 'inlineScript'
              inlineScript: |
                az aks get-credentials \
                  --resource-group my-rg \
                  --name prod-aks

                helm upgrade --install myapp ./helm \
                  --namespace production \
                  --set image.tag=$(tag) \
                  --values helm/values-prod.yaml \
                  --wait --timeout 10m --atomic

          - task: CreateWorkItem@1
            inputs:
              workItemType: 'Task'
              title: 'Deployment $(tag) to production completed'
              areaPath: 'MyProject\Platform'
```

## Variable Groups & Secrets

```bash
# Create variable group
az pipelines variable-group create \
  --name "production-secrets" \
  --variables \
    DB_HOST=prod-db.postgres.database.azure.com \
    APP_ENV=production

# Add secret (masked in logs)
az pipelines variable-group variable create \
  --group-id 1 \
  --name DB_PASSWORD \
  --value "SuperSecret123" \
  --secret true

# Use in pipeline
variables:
- group: production-secrets

steps:
- script: echo "DB_HOST=$(DB_HOST)"     # Shows value
- script: echo "$(DB_PASSWORD)"         # Shows ***
```

## Service Connections

```yaml
# Connect Azure DevOps to Azure subscription
# Settings → Service connections → New → Azure Resource Manager

# Use in pipeline
- task: AzureCLI@2
  inputs:
    azureSubscription: 'My-Azure-Subscription'  # Service connection name
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: az group list

# Connect to Kubernetes cluster
- task: KubernetesManifest@0
  inputs:
    action: deploy
    kubernetesServiceConnection: 'prod-aks-connection'
    namespace: production
    manifests: k8s/deployment.yaml
```

## Multi-Stage Pipeline with Templates

```yaml
# templates/deploy-to-aks.yml (reusable template)
parameters:
- name: environment
  type: string
- name: aksCluster
  type: string
- name: namespace
  type: string
- name: helmValues
  type: string

steps:
- task: AzureCLI@2
  displayName: 'Deploy to ${{ parameters.environment }}'
  inputs:
    azureSubscription: $(azureSubscription)
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      az aks get-credentials -g my-rg -n ${{ parameters.aksCluster }}
      helm upgrade --install myapp ./helm \
        --namespace ${{ parameters.namespace }} \
        --values ${{ parameters.helmValues }} \
        --set image.tag=$(tag) \
        --wait --atomic

# Main pipeline using template
- stage: DeployDev
  jobs:
  - deployment: Deploy
    environment: dev
    strategy:
      runOnce:
        deploy:
          steps:
          - template: templates/deploy-to-aks.yml
            parameters:
              environment: dev
              aksCluster: dev-aks
              namespace: development
              helmValues: helm/values-dev.yaml
```

## Azure Boards — Work Item Types

```
Epic
  └── Feature
        └── User Story
              └── Task
              └── Bug

# Work item states:
New → Active → Resolved → Closed

# Linking commits to work items
git commit -m "Fix login timeout #1234"
# AB#1234 in commit message auto-links to work item
```

## Azure Artifacts — Package Feed

```bash
# Publish Python package to Azure Artifacts
pip install twine
twine upload \
  --repository-url https://pkgs.dev.azure.com/myorg/myproject/_packaging/myfeed/pypi/upload \
  --username feed \
  --password $(System.AccessToken) \
  dist/*

# Consume from Azure Artifacts in pip
pip install \
  --index-url https://pkgs.dev.azure.com/myorg/myproject/_packaging/myfeed/pypi/simple \
  mypackage

# In requirements.txt with auth
--index-url https://myorg:$(PAT)@pkgs.dev.azure.com/.../pypi/simple
```

## Interview Questions

**What is the difference between Azure Pipelines Classic and YAML pipelines?**
Classic pipelines use a visual editor in the Azure DevOps web UI — drag and drop tasks, configure via forms. YAML pipelines define the pipeline as code in a `azure-pipelines.yml` file committed to your repo. YAML is strongly preferred: it's version-controlled, reviewable in PRs, reusable as templates, and supports multi-stage pipelines. Classic is being deprecated. If starting fresh, always use YAML.

**How do you implement approvals in Azure DevOps?**
Create an Environment (Pipelines → Environments) for each stage requiring approval. In the Environment settings, add Approvals and Checks — specify who must approve and a timeout. In your pipeline, reference the environment in a `deployment` job's `environment:` field. When the pipeline reaches that stage, it pauses and sends notifications to approvers. Only after approval does the deployment proceed. Approvals are audited and stored for compliance.

**How do you securely pass secrets to pipeline steps?**
Use Azure KeyVault (link via Variable Groups with "Link secrets from Azure Key Vault") or Secret Variable Groups. Secrets are masked in logs — they appear as `***`. Access in pipeline with `$(secretName)`. Never echo secrets directly. For Kubernetes deployments, use Azure Key Vault + CSI Secret Store Driver so secrets never touch pipeline variables. Don't store secrets in `azure-pipelines.yml` — it's committed to Git.
