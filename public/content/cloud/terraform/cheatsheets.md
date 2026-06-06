# Terraform Cheat Sheet

## Core Commands

```bash
terraform init              # Initialize, download providers & modules
terraform init -upgrade     # Upgrade providers to latest allowed version
terraform validate          # Check syntax and configuration validity
terraform fmt               # Format all .tf files (run before every commit)
terraform fmt -recursive    # Format all subdirectories too

terraform plan              # Preview changes (no real changes made)
terraform plan -out=tfplan  # Save plan to file
terraform plan -var="env=prod"              # Override variable
terraform plan -var-file="prod.tfvars"     # Use var file

terraform apply             # Apply changes (prompts for confirmation)
terraform apply tfplan      # Apply saved plan (no prompt)
terraform apply -auto-approve               # Skip confirmation (CI/CD)
terraform apply -target=aws_instance.web   # Apply only specific resource

terraform destroy           # Destroy all resources
terraform destroy -target=module.vpc       # Destroy specific resource

# State operations
terraform state list        # List all resources in state
terraform state show aws_vpc.main          # Show resource details
terraform state rm aws_instance.old        # Remove from state (don't destroy)
terraform state mv aws_instance.web aws_instance.app  # Rename in state
terraform import aws_s3_bucket.main my-bucket-name    # Import existing resource

# Outputs
terraform output            # Show all outputs
terraform output vpc_id     # Show specific output
terraform output -json      # JSON format (for scripting)

# Debugging
TF_LOG=DEBUG terraform apply    # Full debug logs
TF_LOG=ERROR terraform plan     # Errors only
terraform console               # Interactive expression evaluator

# Workspace
terraform workspace list
terraform workspace new staging
terraform workspace select prod
terraform workspace show        # Current workspace
```

## HCL Quick Reference

```hcl
# Variables
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-west-2"], var.region)
    error_message = "Region must be us-east-1 or us-west-2."
  }
}

# Locals
locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Team        = var.team
  }
  name_prefix = "${var.project}-${var.environment}"
}

# Data source
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
}

# Resource with all common meta-arguments
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-web" })

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [ami]
  }

  depends_on = [aws_internet_gateway.main]
}

# Output
output "instance_ip" {
  description = "Public IP of web instance"
  value       = aws_instance.web.public_ip
  sensitive   = false
}
```

## Loops and Conditions

```hcl
# count — create N similar resources
resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = { Name = "public-subnet-${count.index + 1}" }
}
# Reference: aws_subnet.public[0].id, aws_subnet.public[*].id

# for_each — create from map/set
variable "buckets" {
  default = {
    logs    = "us-east-1"
    backups = "us-west-2"
    assets  = "us-east-1"
  }
}

resource "aws_s3_bucket" "this" {
  for_each = var.buckets
  bucket   = "${local.name_prefix}-${each.key}"
  # each.key = "logs", each.value = "us-east-1"
}
# Reference: aws_s3_bucket.this["logs"].arn

# Conditional expression
resource "aws_eip" "nat" {
  count  = var.enable_nat_gateway ? 1 : 0
  domain = "vpc"
}

# For expression
locals {
  subnet_ids = [for s in aws_subnet.public : s.id]
  subnet_map = { for s in aws_subnet.public : s.availability_zone => s.id }
  prod_sg_ids = [for sg in var.security_groups : sg.id if sg.env == "prod"]
}

# Dynamic block
resource "aws_security_group" "web" {
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidrs
    }
  }
}
```

## Backend Configuration

```hcl
# S3 backend with locking
terraform {
  backend "s3" {
    bucket         = "company-terraform-state"
    key            = "prod/vpc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}
```

## Common Patterns

```hcl
# Get current AWS account ID
data "aws_caller_identity" "current" {}
output "account_id" { value = data.aws_caller_identity.current.account_id }

# Get available AZs
data "aws_availability_zones" "available" { state = "available" }

# Read from SSM Parameter Store
data "aws_ssm_parameter" "db_password" {
  name            = "/prod/myapp/db_password"
  with_decryption = true
}

# Pass to resource
resource "aws_db_instance" "main" {
  password = data.aws_ssm_parameter.db_password.value
}
```

## Provider Configuration

```hcl
# AWS with assume role (cross-account)
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::123456789:role/terraform-role"
  }
}

# Multiple providers (multi-region)
provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "eu_west"
  region = "eu-west-1"
}

resource "aws_instance" "eu" {
  provider = aws.eu_west
  ami      = "ami-xxx"
}
```

## Sensitive Variables

```bash
# Pass via env var (never in .tf files)
export TF_VAR_db_password="SecurePass123"
terraform apply

# Or via var file (add to .gitignore!)
# secrets.tfvars:
# db_password = "SecurePass123"
terraform apply -var-file="secrets.tfvars"
```
