# Terraform Cheatsheet

## CLI Commands

```bash
# Init and setup
terraform init                    # init providers + modules
terraform init -upgrade           # upgrade providers
terraform init -backend-config=backend.hcl

# Plan and apply
terraform plan                    # preview changes
terraform plan -out=plan.tfplan   # save plan
terraform apply                   # apply (prompts confirmation)
terraform apply -auto-approve     # CI/CD (no prompt)
terraform apply plan.tfplan       # apply saved plan
terraform apply -target=aws_instance.web  # only one resource

# State
terraform state list              # list all resources
terraform state show aws_s3_bucket.main  # inspect resource
terraform state mv old_name new_name     # rename resource
terraform state rm aws_s3_bucket.temp   # remove from state (doesn't delete resource)
terraform import aws_s3_bucket.existing my-bucket-name

# Destroy
terraform destroy                 # destroy everything
terraform destroy -target=aws_instance.old  # specific resource

# Workspace
terraform workspace list
terraform workspace new staging
terraform workspace select prod

# Utility
terraform fmt                     # format code
terraform validate                # check syntax
terraform output db_endpoint      # show output value
terraform console                 # interactive REPL
terraform show                    # show current state
terraform graph | dot -Tsvg > graph.svg  # visualize
```

## HCL Patterns

```hcl
# Variables
variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
  validation {
    condition     = contains(["dev","staging","prod"], var.environment)
    error_message = "Must be dev, staging, or prod."
  }
}

variable "instance_config" {
  type = object({
    instance_type = string
    min_size      = number
    max_size      = number
  })
  default = {
    instance_type = "t3.micro"
    min_size      = 1
    max_size      = 3
  }
}

# Locals
locals {
  common_tags = {
    Environment = var.environment
    Project     = "synfracore"
    ManagedBy   = "terraform"
  }
  is_prod = var.environment == "prod"
}

# Count and for_each
resource "aws_instance" "web" {
  count         = var.environment == "prod" ? 3 : 1
  instance_type = "t3.micro"
  tags = merge(local.common_tags, {
    Name = "web-${count.index + 1}"
  })
}

resource "aws_iam_user" "team" {
  for_each = toset(["alice", "bob", "carol"])
  name     = each.value
  tags     = { User = each.key }
}

# Dynamic blocks
resource "aws_security_group" "app" {
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# Conditionals
instance_type = var.environment == "prod" ? "m5.large" : "t3.micro"
count         = var.create_resource ? 1 : 0

# Data sources
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Outputs
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The VPC ID"
}

output "db_password" {
  value     = random_password.db.result
  sensitive = true  # Won't show in console output
}
```

## Remote State (S3 Backend)

```hcl
# backend.tf
terraform {
  required_version = ">= 1.5"
  
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/vpc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:..."
    dynamodb_table = "terraform-state-locks"  # State locking
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = local.common_tags
  }
}
```
