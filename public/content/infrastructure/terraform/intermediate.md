# Terraform — Intermediate

## Modules

```hcl
# modules/vpc/main.tf
variable "cidr"        { type = string }
variable "environment" { type = string }
variable "azs"         { type = list(string) }

locals {
  public_cidrs  = [for i, az in var.azs : cidrsubnet(var.cidr, 8, i)]
  private_cidrs = [for i, az in var.azs : cidrsubnet(var.cidr, 8, i + 10)]
}

resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  tags = { Name = "${var.environment}-vpc" }
}

resource "aws_subnet" "public" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "${var.environment}-public-${count.index+1}", Tier = "public" }
}

output "vpc_id"          { value = aws_vpc.this.id }
output "public_subnets"  { value = aws_subnet.public[*].id }
output "private_subnets" { value = aws_subnet.private[*].id }

# Use the module
module "vpc" {
  source      = "./modules/vpc"
  cidr        = "10.0.0.0/16"
  environment = var.environment
  azs         = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_instance" "app" {
  subnet_id = module.vpc.private_subnets[0]  # Use module output
}
```

## Workspaces and Environments

```bash
# Workspaces = separate state per environment
terraform workspace new staging
terraform workspace new production
terraform workspace list
terraform workspace select staging

# Reference workspace in config
variable "instance_type" {
  default = {
    dev        = "t3.micro"
    staging    = "t3.medium"
    production = "m5.large"
  }
}

resource "aws_instance" "app" {
  instance_type = var.instance_type[terraform.workspace]
}
```

## Dynamic Blocks

```hcl
# Instead of repeating blocks, use dynamic
variable "ingress_rules" {
  default = [
    { port = 80,  cidr = "0.0.0.0/0",     desc = "HTTP" },
    { port = 443, cidr = "0.0.0.0/0",     desc = "HTTPS" },
    { port = 22,  cidr = "10.0.0.0/8",    desc = "SSH internal" },
  ]
}

resource "aws_security_group" "app" {
  name   = "app-sg"
  vpc_id = module.vpc.vpc_id

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

## Lifecycle Rules

```hcl
resource "aws_instance" "app" {
  ami           = data.aws_ami.latest.id
  instance_type = "t3.medium"

  lifecycle {
    create_before_destroy = true   # New resource before destroying old
    prevent_destroy       = true   # Error if trying to destroy (production safety)
    ignore_changes        = [
      ami,                         # Don't replace if AMI changes
      tags["LastUpdated"],         # Ignore tag changes made by other tools
    ]
    replace_triggered_by  = [
      aws_launch_template.app.latest_version  # Replace when LT version changes
    ]
  }
}

# Null resource for running scripts
resource "null_resource" "db_migration" {
  triggers = {
    schema_hash = filesha256("migrations/schema.sql")  # Re-run when SQL changes
  }

  provisioner "local-exec" {
    command = "psql $DB_URL < migrations/schema.sql"
  }

  depends_on = [aws_db_instance.main]
}
```

## Data Sources and Locals

```hcl
# Read existing resources (not managed by this Terraform)
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Local values — computed values used multiple times
locals {
  account_id  = data.aws_caller_identity.current.account_id
  region      = data.aws_region.current.name
  name_prefix = "${var.environment}-${var.app_name}"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Project     = var.app_name
    Owner       = var.team
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${local.name_prefix}-logs-${local.account_id}"
  tags   = local.common_tags
}
```

## Remote State and State Locking

```hcl
# backend.tf — store state in S3, lock with DynamoDB
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:us-east-1:123456789:key/mrk-..."
    dynamodb_table = "terraform-state-lock"
  }
}

# Share state between configurations
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "app" {
  subnet_id = data.terraform_remote_state.vpc.outputs.private_subnets[0]
}
```
