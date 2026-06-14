# Azure DevOps — Cheatsheet

```yaml
# ── BASIC PIPELINE STRUCTURE ─────────────────────────────
trigger: [main, release/*]
pr: [main]

variables:
  DOCKER_REGISTRY: myregistry.azurecr.io
  IMAGE_TAG: $(Build.BuildId)

pool:
  vmImage: ubuntu-latest   # or: windows-latest, macOS-latest

stages:
  - stage: Build
    jobs:
      - job: BuildAndTest
        steps:
          - checkout: self
          - task: NodeTool@0
            inputs: {versionSpec: '20.x'}
          - script: npm ci && npm test
          - task: Docker@2
            inputs:
              containerRegistry: ACR-ServiceConnection
              repository: myapp
              command: buildAndPush
              tags: $(IMAGE_TAG)

  - stage: Deploy
    dependsOn: Build
    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
    jobs:
      - deployment: DeployProd
        environment: production       # Requires approval in Environments
        strategy:
          runOnce:
            deploy:
              steps:
                - task: HelmDeploy@0
                  inputs:
                    connectionType: Kubernetes Service Connection
                    kubernetesServiceEndpoint: aks-prod
                    command: upgrade
                    chartName: myapp
                    releaseName: myapp
                    overrideValues: image.tag=$(IMAGE_TAG)

# ── COMMON TASKS ──────────────────────────────────────────
# Publish test results
- task: PublishTestResults@2
  inputs: {testResultsFiles: '**/junit.xml'}

# Publish code coverage
- task: PublishCodeCoverageResults@1
  inputs: {codeCoverageTool: Cobertura, summaryFileLocation: coverage/cobertura-coverage.xml}

# Azure CLI
- task: AzureCLI@2
  inputs:
    azureSubscription: prod-service-connection
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      az aks get-credentials --name prod-aks --resource-group prod-rg

# Copy files to artifact staging
- task: CopyFiles@2
  inputs: {Contents: '**/*.yaml', TargetFolder: $(Build.ArtifactStagingDirectory)}
- task: PublishBuildArtifacts@1
  inputs: {PathtoPublish: $(Build.ArtifactStagingDirectory), ArtifactName: manifests}

# ── BUILT-IN VARIABLES ────────────────────────────────────
# $(Build.BuildId)         — unique build number
# $(Build.BuildNumber)     — formatted build number
# $(Build.SourceBranch)    — refs/heads/main
# $(Build.SourceVersion)   — commit SHA
# $(System.TeamProject)    — project name
# $(Agent.BuildDirectory)  — agent working directory
# $(Build.ArtifactStagingDirectory) — artifact staging dir
```
