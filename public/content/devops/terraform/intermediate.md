# Terraform — Modules, State & Production Patterns

ariable "node_vm_size"        { type = string; default = "Standard_D2s_v3" }
variable "enable_auto_scaling" { type = bool;   default = false }
variable "min_node_count"      { type = number; default = 1 }
variable "max_node_count"      { type = number; default = 10 }
variable "subnet_id"           { type = string }  # from networking module output
variable "tags"                { type = map(string); default = {} }

# Feature flag — optional extra node pool
variable "enable_spot_pool" {
  description = "Add a spot instance node pool for cost savings"
  type        = bool
  default     = false
}
```

```hcl
# modules/aks-cluster/main.tf
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  tags                = var.tags

  default_node_pool {
    name                 = "system"
    node_count           = var.enable_auto_scaling ? null : var.node_count
    vm_size              = var.node_vm_size
    vnet_subnet_id       = var.subnet_id
    enable_auto_scaling  = var.enable_auto_scaling
    min_count            = var.enable_auto_scaling ? var.min_node_count : null
    max_count            = var.enable_auto_scaling ? var.max_node_count : null
  }

  identity { type = "SystemAssigned" }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}

# Dynamic block — optional spot pool, only created if feature flag is true
resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  count                 = var.enable_spot_pool ? 1 : 0
  name                  = "spot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_D4s_v3"
  priority              = "Spot"
  eviction_policy       = "Delete"
  spot_max_price        = -1
  min_count             = 0
  max_count             = 20
  enable_auto_scaling   = true
}
```

### Calling Module from Environment
```hcl
# environments/prod/main.tf
module "networking" {
  source              = "../../modules/networking"
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.name
  vnet_cidr           = var.vnet_cidr
  aks_subnet_cidr     = var.aks_subnet_cidr
  tags                = local.common_tags
}

module "aks" {
  source              = "../../modules/aks-cluster"
  cluster_name        = "aks-telecom-${var.environment}"
  resource_group_name = module.rg.name
  location            = var.location
  kubernetes_version  = "1.28"
  node_count          = 5                # prod: 5 nodes
  node_vm_size        = "Standard_D8s_v3" # prod: larger VMs
  enable_auto_scaling = true
  min_node_count      = 3
  max_node_count      = 10
  subnet_id           = module.networking.aks_subnet_id  # output from networking module
  enable_spot_pool    = true   # prod: add spot pool for cost savings
  tags                = local.common_tags
}
```

### Module Versioning
```hcl
# Pin module version — critical for production stability
module "aks" {
  source  = "git::https://github.com/company/terraform-modules.git//aks-cluster?ref=v2.1.0"
  # or for Terraform Registry:
  source  = "hashicorp/kubernetes/azurerm"
  version = "~> 2.0"
}
```

---

## Topic 5 — CLI Commands (Complete Reference)

```bash
# ── INITIALISE ───────────────────────────────────────────
# Download providers, set up backend, download modules
terraform init

# Upgrade providers to latest allowed by version constraints
terraform init -upgrade

# ── VALIDATE & FORMAT ────────────────────────────────────
# Check syntax
terraform validate

# Format code to standard style (in-place)
terraform fmt
terraform fmt -recursive    # also format modules

# Check formatting without changing (for CI pipeline)
terraform fmt -check -recursive && echo "Format OK" || exit 1

# ── PLAN ─────────────────────────────────────────────────
# Show what would change (dry run)
terraform plan

# Plan for specific environment
terraform plan -var-file=environments/prod/terraform.tfvars

# Save plan to file (use in CI — apply the exact reviewed plan)
terraform plan -out=tfplan.out -var-file=prod.tfvars

# Plan with specific var override
terraform plan -var="node_count=5" -var="environment=prod"

# Plan symbols: + create  ~ update  - destroy  -/+ replace
# RED -/+ means resource will be DESTROYED and recreated — always review carefully

# Detect drift only (compare state vs real infra, no .tf changes)
terraform plan -refresh-only

# ── APPLY ────────────────────────────────────────────────
# Apply with prompt
terraform apply

# Apply saved plan (no drift since plan was created)
terraform apply tfplan.out

# Auto-approve (for CI/CD pipelines)
terraform apply -auto-approve -var-file=prod.tfvars

# Apply only specific resource
terraform apply -target=azurerm_kubernetes_cluster.aks

# ── INSPECT STATE ────────────────────────────────────────
terraform show                          # current state
terraform output                        # show all outputs
terraform output aks_cluster_id         # specific output
terraform state list                    # list all managed resources
terraform state show azurerm_resource_group.telecom

# ── DESTROY ──────────────────────────────────────────────
terraform destroy                       # destroy all (prompts)
terraform destroy -auto-approve         # CI cleanup
terraform destroy -target=azurerm_resource_group.dev  # specific resource

# ── UTILITY ──────────────────────────────────────────────
terraform graph | dot -Tpng > graph.png  # visualise dependency graph
terraform version                        # show Terraform + provider versions
terraform providers                      # list providers in current config
```

---

## Topic 6 — Azure Resources Reference

```hcl
# ── RESOURCE GROUP ───────────────────────────────────────
resource "azurerm_resource_group" "main" {
  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.common_tags
}

# ── VIRTUAL NETWORK ──────────────────────────────────────
resource "azurerm_virtual_network" "main" {
  name                = "vnet-${local.name_prefix}"
  address_space       = [var.vnet_cidr]          # "10.0.0.0/16"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.common_tags
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.aks_subnet_cidr]   # "10.0.1.0/24"
  service_endpoints    = ["Microsoft.KeyVault", "Microsoft.ContainerRegistry"]
}

# ── NSG — NETWORK SECURITY GROUP ─────────────────────────
resource "azurerm_network_security_group" "aks" {
  name                = "nsg-aks-${local.name_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  # Dynamic block — rules from variable list (extensible module pattern)
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = security_rule.value.source
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id                 = azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}

# ── PRIVATE ENDPOINT ─────────────────────────────────────
resource "azurerm_private_endpoint" "acr" {
  name                = "pe-acr-${local.name_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "psc-acr"
    private_connection_resource_id = azurerm_container_registry.main.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
}

# ── AKS CLUSTER ──────────────────────────────────────────
resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${local.name_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = local.name_prefix
  kubernetes_version  = var.kubernetes_version
  tags                = local.common_tags

  default_node_pool {
    name                 = "system"
    node_count           = var.system_node_count
    vm_size              = var.system_vm_size
    vnet_subnet_id       = azurerm_subnet.aks.id
    os_disk_size_gb      = 128
    type                 = "VirtualMachineScaleSets"
    enable_auto_scaling  = var.enable_auto_scaling
    min_count            = var.enable_auto_scaling ? var.min_nodes : null
    max_count            = var.enable_auto_scaling ? var.max_nodes : null
  }

  identity { type = "SystemAssigned" }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  addon_profile {
    oms_agent {
      enabled                    = var.enable_monitoring
      log_analytics_workspace_id = var.enable_monitoring ? azurerm_log_analytics_workspace.main[0].id : null
    }
    azure_policy { enabled = true }
  }
}

# ── KEY VAULT ────────────────────────────────────────────
resource "azurerm_key_vault" "main" {
  name                       = "kv-${local.name_prefix}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 90

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  }
}
```

---

## Topic 7 — Drift Management (Berribot Question #6)

### What is Drift?
Drift occurs when someone modifies infrastructure directly (Azure portal, `az cli`, manual changes) **without going through Terraform** — now the real state differs from what Terraform's `.tfstate` file records.

### Detection
```bash
# Method 1: Scheduled plan in Jenkins (nightly)
terraform plan -refresh-only -var-file=prod.tfvars -out=drift-check.plan
# If output shows changes → drift detected → alert to Slack

# Method 2: terraform plan on every PR (catches drift in existing resources)
terraform plan -var-file=${ENV}.tfvars

# Method 3: Infracost drift detection (commercial)
```

### Remediation Decision Tree
```
Drift detected (terraform plan shows unexpected changes)
         │
         ▼
Was the manual change intentional?
         │
    ┌────┴────┐
   YES        NO
    │          │
    ▼          ▼
Option A:  Option B:
terraform  terraform
import     apply     ← reverts to desired state
    │
    ▼
Update .tf
files to
match
    │
    ▼
terraform
apply
```

### Prevention
```hcl
# Azure Policy — block direct changes to prod resource groups
# (Requires Azure Policy — enforced via Terraform)
resource "azurerm_policy_assignment" "no_manual_changes" {
  name                 = "deny-direct-rg-changes"
  scope                = azurerm_resource_group.prod.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/..."
  description          = "All changes must go through Terraform"
}
```

---

## Topic 8 — Infrastructure Testing (Berribot Question #17)

```bash
# ── STATIC ANALYSIS (every PR) ───────────────────────────
# Syntax check
terraform validate

# Format check
terraform fmt -check -recursive

# Security scanning — Checkov
pip install checkov
checkov -d . --framework terraform
# Blocks: public S3 buckets, unencrypted resources, unrestricted SGs

# Security scanning — tfsec
tfsec .

# Cost estimation — Infracost
infracost breakdown --path .
infracost diff --path . --compare-to=main  # show cost change in PR

# ── UNIT TESTING — Terratest (Go) ────────────────────────
# Provisions real infra, runs assertions, destroys
# Example test (Go):
func TestAKSModule(t *testing.T) {
    opts := &terraform.Options{
        TerraformDir: "../modules/aks-cluster",
        Vars: map[string]interface{}{
            "environment": "test",
            "node_count":  2,
        },
    }
    defer terraform.Destroy(t, opts)
    terraform.InitAndApply(t, opts)

    clusterName := terraform.Output(t, opts, "cluster_name")
    assert.Equal(t, "aks-telecom-test", clusterName)
}

# ── CI/CD PIPELINE INTEGRATION ───────────────────────────
# Jenkins stage order for Terraform:
# 1. terraform fmt --check         (fail fast on formatting)
# 2. terraform validate            (syntax check)
# 3. checkov + tfsec               (security scan)
# 4. infracost diff                (post cost to PR comment)
# 5. terraform plan -out=plan.out  (human reviews plan)
# 6. [approval gate]               (for prod)
# 7. terraform apply plan.out      (apply exact reviewed plan)
```

---

## Berribot Questions — Complete Answers

**Q: How do you manage Terraform across dev, test, and prod environments?**
> A: Separate directory per environment (`environments/dev`, `environments/test`, `environments/prod`), each with its own `backend.tf` (separate state file) and `terraform.tfvars` (environment-specific values like node count, VM size). All environments call the same modules from `modules/` — ensuring identical infrastructure topology with size differences only. This means if it works in test, the same code goes to prod with confidence. State files are in Azure Storage with separate containers per environment, with state locking enabled.

**Q: What is Terraform module versioning and why is it critical?**
> A: Module versioning pins the exact version of a module a caller uses — `source = "git::github.com/modules.git//aks?ref=v2.1.0"`. Without versioning, all environments always use the latest module code — a breaking module change would simultaneously break dev, test, AND prod. With versioning: dev upgrades to `v2.2.0` first, validates, then test and prod follow. Semantic versioning: `v1.x.x` = backwards-compatible, `v2.0.0` = breaking change requires consumer updates.

---

## Quick Reference

| Command | Purpose |
|---|---|
| `terraform init` | Download providers, set up backend |
| `terraform validate` | Check syntax |
| `terraform fmt -check` | Check formatting (CI use) |
| `terraform plan -out=plan.out` | Dry run, save to file |
| `terraform apply plan.out` | Apply exact saved plan |
| `terraform plan -refresh-only` | Detect drift |
| `terraform state list` | List managed resources |
| `terraform import` | Import existing resource |
| `terraform destroy -target=X` | Destroy specific resource |
| `checkov -d .` | Security scan |
| `infracost diff` | Cost impact of changes |

---

*End of Terraform Study Guide | B. Vishnu | Wipro Berribot Prep*


## Production Terraform Patterns (from Wipro/Azure deployments)

Terraform | Kubernetes | Azure | Ansible | Datadog

Prepared for: Senior DevOps Engineer (7+ Years)  |  May 2026

**Your Profile ****at a Glance**

- 7+ years DevOps experience

- Currently managing OCP (OpenShift) with Kafka, Oracle, Grafana, Graylog, Kibana

- Transitioning to Azure DevOps with AKS (Azure Kubernetes Service)

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

**An
