# Terraform — Cheatsheet

```bash
# ── INIT AND SETUP ───────────────────────────────────────────
terraform init                          # Initialize, download providers
terraform init -upgrade                 # Upgrade providers to latest
terraform init -backend-config=backend.hcl  # External backend config
terraform providers                     # Show required providers

# ── PLAN AND APPLY ───────────────────────────────────────────
terraform plan                          # Show what will change
terraform plan -out=plan.tfplan        # Save plan to file
terraform plan -var="env=prod"         # Pass variable
terraform plan -var-file=prod.tfvars   # Use vars file
terraform plan -target=aws_instance.app  # Single resource
terraform apply                         # Apply (asks for confirmation)
terraform apply plan.tfplan            # Apply saved plan (no confirmation)
terraform apply -auto-approve          # Skip confirmation (CI/CD)
terraform apply -destroy               # Destroy everything
terraform destroy -target=module.old   # Destroy single module

# ── STATE MANAGEMENT ─────────────────────────────────────────
terraform state list                    # List all resources in state
terraform state show aws_instance.app   # Show resource attributes
terraform state mv aws_instance.old aws_instance.new  # Rename resource
terraform state rm aws_instance.app    # Remove from state (doesn't destroy)
terraform import aws_instance.app i-1234567890  # Import existing resource
terraform refresh                       # Update state from real infrastructure
terraform force-unlock LOCK_ID         # Release stuck state lock

# ── FORMAT AND VALIDATE ──────────────────────────────────────
terraform fmt                           # Format all .tf files
terraform fmt -recursive               # Format subdirectories
terraform validate                      # Check syntax and logic
terraform version                       # Show Terraform version

# ── WORKSPACES ───────────────────────────────────────────────
terraform workspace list
terraform workspace new staging
terraform workspace select production
terraform workspace show                # Current workspace
terraform workspace delete staging

# ── OUTPUT ───────────────────────────────────────────────────
terraform output                        # Show all outputs
terraform output vpc_id                # Show specific output
terraform output -json                 # JSON format
terraform output -raw vpc_id           # Raw value (no quotes)
```

## HCL Patterns Quick Reference

```hcl
# Variables
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
  validation {
    condition     = contains(["us-east-1", "ap-south-1"], var.region)
    error_message = "Region must be us-east-1 or ap-south-1."
  }
}

# For expressions
resource "aws_subnet" "private" {
  count      = length(var.availability_zones)
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
}

# For_each (preferred over count for named resources)
resource "aws_iam_user" "team" {
  for_each = toset(["alice", "bob", "charlie"])
  name     = each.value
}

# Conditional
resource "aws_nat_gateway" "main" {
  count         = var.environment == "prod" ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id
}

# String interpolation
name = "${var.environment}-${var.app_name}-${random_id.suffix.hex}"

# Functions
max_size  = max(var.min_size, 10)
encrypted = tobool(var.encrypt)
cidrs     = cidrsubnets("10.0.0.0/16", 8, 8, 8)
json_out  = jsonencode({ key = "value" })
file_hash = filesha256("./scripts/init.sh")
```

## Provider Configuration

```hcl
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"    # Any 5.x version
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

# Multiple provider instances (multi-region, multi-account)
provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}
provider "aws" {
  alias  = "ap_south"
  region = "ap-south-1"
}
resource "aws_s3_bucket" "india" {
  provider = aws.ap_south
  bucket   = "india-assets"
}
```
