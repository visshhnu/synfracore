# Terraform — Intermediate

## Variables and Type Constraints

```hcl
# variables.tf
variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "allowed_ports" {
  type    = list(number)
  default = [80, 443]
}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "synfracore"
  }
}
```

## For Expressions and Dynamic Blocks

```hcl
# for_each on a map
variable "buckets" {
  default = {
    logs    = "ap-south-1"
    backups = "us-east-1"
  }
}

resource "aws_s3_bucket" "buckets" {
  for_each = var.buckets
  bucket   = "${var.environment}-${each.key}-${data.aws_caller_identity.current.account_id}"

  tags = merge(var.tags, { Purpose = each.key, Region = each.value })
}

# Dynamic blocks (avoid hardcoding repeated nested blocks)
variable "ingress_rules" {
  default = [
    { port = 443, cidr = "0.0.0.0/0", desc = "HTTPS" },
    { port = 22,  cidr = "10.0.0.0/8", desc = "SSH from VPN" },
  ]
}

resource "aws_security_group" "web" {
  name = "web-sg"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr]
      description = ingress.value.desc
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

## Data Sources

```hcl
# Reference existing resources not managed by Terraform
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_vpc" "existing" {
  tags = { Name = "prod-vpc" }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Use them
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_vpc.existing.id
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

## Locals and Expressions

```hcl
locals {
  # Computed values used multiple times
  name_prefix = "${var.environment}-${var.project}"
  common_tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "terraform"
    UpdatedAt   = timestamp()
  })

  # Conditional
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"

  # Map transformation
  subnet_map = {
    for idx, cidr in var.private_subnet_cidrs :
    "private-${idx}" => cidr
  }
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = local.instance_type
  tags          = merge(local.common_tags, { Name = "${local.name_prefix}-app" })
}
```

## Remote State and Outputs

```hcl
# backend.tf
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "services/api/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# outputs.tf — expose values for other stacks
output "vpc_id" {
  description = "The VPC ID — reference this in other stacks"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

# Reference another stack's outputs
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_instance" "app" {
  subnet_id = data.terraform_remote_state.network.outputs.private_subnet_ids[0]
}
```
