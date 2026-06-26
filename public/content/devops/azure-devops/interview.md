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

              manifests: k8s/deployment.yaml

              containers: $(containerRegistry)/$(imageRepository):$(tag)

**TIP: **From your OCP experience: Azure Pipelines stages map directly to OpenShift pipeline stages. The main difference is YAML syntax and Azure service connections instead of OpenShift secrets.

**Q2: ****Explain Blue-Green vs Canary deployments. When would you use each?**

**Answer:**

**Blue-Green Deployment:**

Two identical production environments. Traffic switches 100% from blue (current) to green (new) via load balancer/ingress update.

- Use when: Zero-downtime releases, easy rollback required, database schema changes

- Risk: Full traffic switch — if green has issues, ALL users are affected

- AKS implementation: Swap Kubernetes Service selectors between blue/green deployments

**Canary Deployment:**

Gradual traffic shift to new version — e.g., 5% > 25% > 50% > 100%.

- Use when: Validating new features with real traffic, A/B testing, risk-averse releases

- AKS implementation: Use NGINX Ingress weight annotations or Azure Front Door

# Canary with NGINX Ingress

apiVersion: networking.k8s.io/v1

kind: Ingress

metadata:

  name: myapp-canary

  annotations:

    nginx.ingress.kubernetes.io/canary: 'true'

    nginx.ingress.kubernetes.io/canary-weight: '20'  # 20% traffic

spec:

  rules:

  - host: myapp.example.com

    http:

      paths:

      - path: /

        pathType: Prefix

        backend:

          service: { name: myapp-canary, port: { number: 80 } }

**TIP: **In Wipro AKS projects, Canary is preferred for microservices — it limits blast radius. Blue-Green suits stateful apps like your Oracle/Kafka stack.

**Q3: ****How do you handle secrets management in a CI/CD pipeline?**

**Answer:**

Never store secrets in code or pipeline YAML. The hierarchy of approaches:

**1. Azure Key Vault (Recommended for AKS):**

# Pipeline variable group linked to Key Vault

variables:

- group: production-secrets  # Linked to Azure Key Vault

# Access in AKS via CSI driver
