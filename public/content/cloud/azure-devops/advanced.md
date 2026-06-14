# Azure DevOps — Advanced

## Pipeline Templates and Library

```yaml
# Reusable template — store in shared repo
# templates/deploy-to-aks.yaml
parameters:
  - name: environment
    type: string
  - name: imageTag
    type: string
  - name: namespace
    type: string
    default: default

steps:
  - task: KubernetesManifest@1
    inputs:
      action: deploy
      kubernetesServiceConnection: aks-$(parameters.environment)
      namespace: $(parameters.namespace)
      manifests: k8s/
      containers: myregistry.azurecr.io/myapp:$(parameters.imageTag)

# Main pipeline using the template
stages:
  - stage: Deploy
    jobs:
      - deployment: DeployProd
        environment: production
        strategy:
          runOnce:
            deploy:
              steps:
                - template: templates/deploy-to-aks.yaml@shared-templates
                  parameters:
                    environment: prod
                    imageTag: $(Build.BuildId)
```

## Azure Boards Integration

```yaml
# Automatically close work items when PR merges
# In PR description or commit message:
Fixes #1234    # Closes work item 1234 on merge
Resolves AB#1234  # Azure Boards work item

# Pipeline: create work item on failure
- task: CreateWorkItem@1
  condition: failed()
  inputs:
    workItemType: Bug
    title: "Pipeline failed: $(Build.DefinitionName) #$(Build.BuildNumber)"
    assignedTo: $(Build.RequestedFor)
    areaPath: MyProject\Engineering
    iterationPath: MyProject\Sprint 1
```

## Pipeline Security

```yaml
# Service connections: NEVER put credentials in pipelines
# Use service connections: Project Settings → Service connections

# Pipeline permissions: restrict which pipelines can use a connection
# Resource: Settings → Pipelines → select allowed pipelines

# Secrets from Azure Key Vault
variables:
  - group: prod-secrets   # Variable group linked to Key Vault

# Or directly in pipeline
- task: AzureKeyVault@2
  inputs:
    azureSubscription: prod-service-connection
    KeyVaultName: prod-vault
    SecretsFilter: DB_PASSWORD,API_KEY
    RunAsPreJob: true
# Secrets now available as $(DB_PASSWORD)
```
