# Terraform Fundamentals

## Core Syntax (HCL)

\`\`\`hcl
# terraform/main.tf

# Configure the required provider
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # Remote state (use this in teams!)
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Configure the provider
provider "aws" {
  region = var.aws_region
}

# Variable declaration
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 2
}

variable "allowed_cidr" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

# Local values (computed/reusable)
locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Team        = "Platform"
  }
}

# Resource definition
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = merge(local.common_tags, {
    Name = "main-vpc"
  })
}

# Output values
output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main.id
}
\`\`\`

## Data Sources

Data sources let you fetch existing infrastructure:

\`\`\`hcl
# Get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Reference it
resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id  # Use the fetched AMI
  instance_type = "t3.micro"
}

# Fetch existing VPC
data "aws_vpc" "existing" {
  tags = {
    Name = "production-vpc"
  }
}
\`\`\`

## Complete AWS VPC Example

\`\`\`hcl
# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "main-vpc" }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "main-igw" }
}

# Public Subnets (2 AZs)
resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  
  tags = { Name = "public-subnet-${count.index + 1}" }
}

# Private Subnets (2 AZs)
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = { Name = "private-subnet-${count.index + 1}" }
}

# NAT Gateway (allows private subnets to reach internet)
resource "aws_eip" "nat" {
  count  = 1
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id
  depends_on    = [aws_internet_gateway.main]
  tags          = { Name = "main-nat-gw" }
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = { Name = "public-rt" }
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

data "aws_availability_zones" "available" {
  state = "available"
}
\`\`\`

## Terraform Commands

\`\`\`bash
terraform init              # Initialize, download providers
terraform init -upgrade     # Upgrade providers
terraform validate          # Check syntax
terraform fmt               # Format code
terraform fmt -recursive    # Format all .tf files

terraform plan              # Preview changes
terraform plan -out=tfplan  # Save plan to file
terraform apply             # Apply changes
terraform apply tfplan      # Apply saved plan
terraform apply -auto-approve  # Skip confirmation (CI/CD)

terraform destroy           # Destroy all resources
terraform destroy -target=aws_instance.web  # Destroy specific

terraform state list        # List resources in state
terraform state show aws_instance.web  # Show resource state
terraform state rm resource.name       # Remove from state
terraform import aws_s3_bucket.main my-bucket  # Import existing

terraform output            # Show all outputs
terraform output vpc_id     # Show specific output
terraform refresh           # Sync state with real infra
\`\`\`