# Terraform — Core Concepts & First Infrastructure

# Terraform — Complete Study Guide
**Wipro Berribot Interview Prep | B. Vishnu**
> Level: Concepts to Production Patterns | Focus: IaC Design, Modules, Azure, AWS

---

## Why Terraform Matters for This Role

The JD lists **Terraform Design and Delivery** as Mandatory #1. Your Berribot session confirmed they test deep Terraform knowledge: module design, extensibility, repo standards, drift management, upgrades, and Azure networking IaC. You have real HPE experience — this guide helps you articulate it at a senior level.

---

## Topic 1 — What is Terraform and Why IaC

### Key Concept
Terraform is an **Infrastructure as Code (IaC)** tool by HashiCorp. You write code in **HCL (HashiCorp Configuration Language)** to define cloud infrastructure, and Terraform creates and manages it automatically. It is **declarative** — you describe what you want, Terraform figures out how to get there.

### IaC vs Manual Provisioning

| Aspect | Manual (Portal/CLI) | Terraform IaC |
|---|---|---|
| Consistency | Different every time | Identical every time |
| Speed | Hours/days | Minutes |
| Auditability | None | Git history = full audit trail |
| Repeatability | Impossible to guarantee | Guaranteed — same code = same infra |
| Rollback | Manual, risky | `terraform apply` of previous version |
| Review | No review process | PR review of infrastructure changes |
| Drift detection | None | `terraform plan` shows drift |

### Interview Tip
> "The business value of Terraform is not just speed — it is consistency and auditability. At HPE, every infrastructure change for the DU/Vodafone platform went through a Git PR with `terraform plan` output. This meant production infrastructure had the same governance as application code."

---

## Topic 2 — Core Concepts

### Provider
```hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"    # allows 3.80.x, blocks 4.x
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "aws" {
  region = var.aws_region
}
```

### Resource
```hcl
# Format: resource "<provider>_<type>" "<local_name>" { }
resource "azurerm_resource_group" "telecom" {
  name     = "rg-telecom-${var.environment}"
  location = var.location

  tags = {
    environment = var.environment
    team        = "devops"
    project     = "telecom-platform"
    cost_centre = var.cost_centre
  }
}

# Reference another resource
resource "azurerm_virtual_network" "main" {
  name                = "vnet-telecom-${var.environment}"
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.telecom.location  # reference
  resource_group_name = azurerm_resource_group.telecom.name      # reference
  # Terraform auto-detects the dependency — creates RG first
}
```

### Variables
```hcl
# variables.tf — declare all variables here
variable "environment" {
  description = "Deployment environment (dev/test/prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vm_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "enable_monitoring" {
  description = "Enable Azure Monitor integration"
  type        = bool
  default     = true
}

variable "allowed_ips" {
  description = "List of IPs allowed to access management endpoints"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

# Sensitive variable — never shown in plan output or logs
variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
```

### Outputs
```hcl
# outputs.tf
output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.telecom.name
}

output "aks_cluster_id" {
  description = "AKS cluster resource ID"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_kube_config" {
  description = "Kubeconfig for AKS access"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true    # not shown in terraform output
}
```

### Locals
```hcl
# locals.tf — computed values, avoid repetition
locals {
  name_prefix    = "${var.project}-${var.environment}"
  common_tags    = merge(var.tags, {
    environment  = var.environment
    managed_by   = "terraform"
    last_updated = timestamp()
  })
  is_production  = var.environment == "prod"
  aks_node_count = local.is_production ? 5 : 2
}

resource "azurerm_resource_group" "main" {
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.common_tags
}
```

---

## Topic 3 — State Management

### Key Concept
Terraform **state** (`.tfstate`) is Terraform's memory — it records everything it has created. On every `plan` and `apply`, Terraform compares your `.tf` files against state to know what needs to change.

### Remote Backend (Required for Teams)
```hcl
# backend.tf — MUST use remote state in teams
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate${var.project}"
    container_name       = "tfstate"
    key                  = "${var.environment}.terraform.tfstate"
    # State locking: Azure Storage uses blob leases automatically
  }
}

# AWS S3 backend equivalent
terraform {
  backend "s3" {
    bucket         = "company-terraform-state"
    key            = "telecom/${var.environment}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"    # for locking
    encrypt        = true
  }
}
```

### State Commands
```bash
# List all resources in state
terraform state list

# Show details of one resource
terraform state show azurerm_kubernetes_cluster.aks

# Move resource (rename without destroying)
terraform state mv azurerm_resource_group.old azurerm_resource_group.new

# Remove from state (stop managing, don't destroy)
terraform state rm azurerm_resource_group.legacy

# Import existing resource into state
terraform import azurerm_resource_group.main /subscriptions/.../resourceGroups/rg-existing

# Refresh state from real infra (detect drift)
terraform refresh    # deprecated in newer versions — use plan -refresh-only
terraform plan -refresh-only
```

---

## Topic 4 — Module Design (Berribot Question #1 and #4)

### Key Concept
A **module** is a reusable package of `.tf` files — like a function in programming. Modules enable DRY (Don't Repeat Yourself) infrastructure — write once, use in every environment.

### Module Directory Structure
```
modules/
├── networking/
│   ├── main.tf          # VNet, subnets, NSGs
│   ├── variables.tf     # all input variables
│   ├── outputs.tf       # all outputs (subnet IDs, VNet ID)
│   └── README.md
├── aks-cluster/
│   ├── main.tf          # AKS cluster, node pools
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
└── iam/
    ├── main.tf          # Service principals, role assignments
    ├── variables.tf
    └── outputs.tf

environments/
├── dev/
│   ├── main.tf          # calls modules
│   ├── terraform.tfvars # dev-specific values
│   └── backend.tf
├── test/
│   ├── main.tf
│   ├── terraform.tfvars
│   └── backend.tf
└── prod/
    ├── main.tf
    ├── terraform.tfvars
    └── backend.tf
```

### Module Definition
```hcl
# modules/aks-cluster/variables.tf
variable "cluster_name"        { type = string }
variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "kubernetes_version"  { type = string; default = "1.28" }
variable "node_count"          { type = number; default = 2 }
v
