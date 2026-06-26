Azure DevOps with AKS (Azure Kubernetes Service)

- Learning Ansible and Datadog — covered in depth in this guide

**Document Structure**

- PART 1: 25 Core Interview Questions (CI/CD, Terraform, Kubernetes, Azure)

- PART 2: 10 Ansible Troubleshooting Questions (Real Production Scenarios)

- PART 3: 10 Datadog Monitoring Questions (Setup, Dashboards, Log Correlation)

- PART 4: 5 Production Incident Scenarios (Step-by-Step Resolution)

- PART 5: Code Reference (Ansible Playbooks, Datadog Configs, kubectl Commands)

**  PART 1: 25 CORE INTERVIEW QUESTIONS  **

# Section 1: CI/CD Pipeline

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

              manifests: k8s/depl
