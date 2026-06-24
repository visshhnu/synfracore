# Terraform Overview

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool by HashiCorp that lets you define, provision, and manage cloud infrastructure using a declarative configuration language (HCL — HashiCorp Configuration Language). It supports 1,000+ providers including AWS, Azure, GCP, Kubernetes, and more.

## Core Concepts

```
PROVIDERS:
  Plugin that interacts with a cloud/service API
  terraform {
    required_providers {
      aws = { source = "hashicorp/aws", version = "~> 5.0" }
    }
  }
  provider "aws" { region = "us-east-1" }

RESOURCES:
  Infrastructure objects (EC2 instance, S3 bucket, VPC, etc.)
  resource "aws_instance" "web" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t3.micro"
    tags = { Name = "WebServer" }
  }

DATA SOURCES:
  Read existing infrastructure (not managed by Terraform)
  data "aws_ami" "amazon_linux" {
    most_recent = true
    owners      = ["amazon"]
    filter { name = "name", values = ["amzn2-ami-hvm-*-x86_64-gp2"] }
  }

VARIABLES:
  Input variables for reusability
  variable "instance_type" {
    type    = string
    default = "t3.micro"
    description = "EC2 instance type"
  }

OUTPUTS:
  Expose values from configuration
  output "instance_ip" {
    value = aws_instance.web.public_ip
  }

MODULES:
  Reusable packages of Terraform configuration
  module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.0"
    name    = "my-vpc"
    cidr    = "10.0.0.0/16"
  }

STATE:
  terraform.tfstate: tracks real infrastructure
  Remote state: S3 + DynamoDB (AWS) or Terraform Cloud
  terraform {
    backend "s3" {
      bucket         = "my-tfstate"
      key            = "prod/terraform.tfstate"
      region         = "us-east-1"
      dynamodb_table = "terraform-locks"
    }
  }
```

## Core Workflow

```bash
# Initialize (download providers, configure backend)
terraform init

# Preview changes (dry run)
terraform plan
terraform plan -out=tfplan  # save plan

# Apply changes
terraform apply
terraform apply tfplan  # apply saved plan

# Destroy infrastructure
terraform destroy
terraform destroy -target aws_instance.web  # destroy specific resource

# State management
terraform show             # show current state
terraform state list       # list all resources in state
terraform state show aws_instance.web  # show specific resource
terraform import aws_instance.web i-1234567890  # import existing resource
terraform refresh          # sync state with real infrastructure

# Formatting and validation
terraform fmt              # format HCL files
terraform validate         # validate configuration syntax
```

## Study Resources
- **HashiCorp Terraform Documentation** (developer.hashicorp.com/terraform) — official, comprehensive
- **Terraform: Up and Running** (Yevgeniy Brikman) — best book for learning Terraform
- **HashiCorp Certified: Terraform Associate (003)** — entry-level certification
- **Gruntwork Terragrunt** — DRY Terraform configurations for large teams
- **Terraform Registry** (registry.terraform.io) — modules and providers repository
