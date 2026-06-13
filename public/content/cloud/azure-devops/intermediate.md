# Azure DevOps — Intermediate

## Advanced Pipeline Patterns

```yaml
# Multi-stage pipeline with environments and approvals
stages:
- stage: Build
  jobs:
  - job: BuildTest
    pool: { vmImage: ubuntu-latest }
    steps:
    - task: NodeTool@0
      inputs: { versionSpec: '20.x' }
    - script: npm ci && npm test
    - task: PublishTestResults@2
      inputs: { testResultsFiles: '**/junit.xml' }
    - task: Docker@2
      inputs:
        containerRegistry: 'ACR-Connection'
        repository: myapp
        command: buildAndPush
        tags: $(Build.BuildId)

- stage: DeployStaging
  dependsOn: Build
  jobs:
  - deployment: DeployStaging
    environment: staging          # Configure approvals in Environments UI
    strategy:
      runOnce:
        deploy:
          steps:
          - task: HelmDeploy@0
            inputs:
              connectionType: Kubernetes Service Connection
              kubernetesServiceEndpoint: aks-staging
              command: upgrade
              chartName: myapp
              releaseName: myapp
              valueFile: helm/values-staging.yaml
              overrideValues: image.tag=$(Build.BuildId)

- stage: DeployProd
  dependsOn: DeployStaging
  jobs:
  - deployment: DeployProd
    environment: production        # Requires 2 approvers configured
    strategy:
      canary:
        increments: [10, 25, 100]
        deploy:
          steps:
          - task: HelmDeploy@0
            inputs:
              kubernetesServiceEndpoint: aks-prod
              command: upgrade
              chartName: myapp
              releaseName: myapp
              valueFile: helm/values-prod.yaml
              overrideValues: image.tag=$(Build.BuildId),canary.weight=$(System.StageAttempt)
```

## Azure Boards and Work Items

```bash
# Create work items via API
curl -u :$PAT -X POST \
    "https://dev.azure.com/myorg/myproject/_apis/wit/workitems/\$Bug?api-version=7.0" \
    -H "Content-Type: application/json-patch+json" \
    -d '[
        {"op":"add","path":"/fields/System.Title","value":"Login page broken"},
        {"op":"add","path":"/fields/System.Description","value":"Users cannot log in"},
        {"op":"add","path":"/fields/Microsoft.VSTS.Common.Priority","value":1},
        {"op":"add","path":"/fields/System.AreaPath","value":"MyProject\\Backend"}
    ]'
```
