# Azure DevOps Pipelines — Quick Reference

## Minimal YAML pipeline

```yaml
trigger:
  branches: { include: [main] }

pool: { vmImage: ubuntu-latest }

steps:
- script: npm ci && npm test
  displayName: Install and Test
```

## Stages, jobs, and dependency ordering

```yaml
stages:
- stage: Build
  jobs:
  - job: Test
    steps: [ { script: npm test } ]

- stage: Deploy
  dependsOn: Build
  condition: succeeded()
  jobs:
  - deployment: DeployProd
    environment: production   # approval gates configured here
    strategy:
      runOnce:
        deploy:
          steps: [ { script: ./deploy.sh } ]
```

## Variables and variable groups

```yaml
variables:
  - group: production-secrets   # shared, can hold secret values
  - name: imageTag
    value: $(Build.BuildId)
```

## Caching dependencies

```yaml
- task: Cache@2
  inputs:
    key: npm | $(Agent.OS) | package-lock.json
    path: $(Pipeline.Workspace)/.npm
    restoreKeys: npm | $(Agent.OS)
```

## Common predefined variables

| Variable | Meaning |
|---|---|
| `$(Build.BuildId)` | Unique build number |
| `$(Build.SourceBranchName)` | Branch name |
| `$(Agent.OS)` | Linux, Windows, Darwin |
| `$(Pipeline.Workspace)` | Workspace directory path |
| `$(Build.ArtifactStagingDirectory)` | Where to put build outputs |

## Common tasks reference

| Task | Purpose |
|---|---|
| `Docker@2` | Build/push a container image |
| `Cache@2` | Dependency caching |
| `PublishBuildArtifacts@1` | Publish build outputs |
| `KubernetesManifest@0` | Apply K8s manifests |
| `HelmDeploy@0` | Deploy a Helm chart |
| `AzureCLI@2` | Run an `az` CLI command |
| `AzureKeyVault@2` | Fetch secrets from Key Vault at runtime |

## ARM vs. Bicep vs. Terraform — quick decision guide

| Scenario | Choice |
|---|---|
| Multi-cloud | Terraform (only real option) |
| Azure-only, long-term | Terraform (mature state management, larger community) |
| Azure-only, quick single resource | Bicep (cleaner than ARM, native Azure support) |
| Legacy ARM template | Convert with `az bicep decompile`, don't hand-write new ARM JSON |

## Service connections (how pipelines authenticate to external systems)

| Connection type | Used for |
|---|---|
| Azure Resource Manager | Deploying to Azure resources |
| Docker Registry | Pushing to ACR/Docker Hub |
| Kubernetes | Deploying to AKS |
| GitHub | Checking out a GitHub-hosted repo |

Configured once under Project Settings → Service Connections, referenced by name from pipeline YAML — never as inline credentials.
