# Terraform Advanced — Production Patterns

## Modules — Reusable Infrastructure

Modules are the most important Terraform concept for production. They let you package infrastructure patterns and reuse them across environments and teams.

```hcl
# modules/vpc/main.tf — Reusable VPC module

variable "name" { type = string }
variable "cidr" { type = string }
variable "azs" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "enable_nat_gateway" { type = bool; default = true }
variable "tags" { type = map(string); default = {} }

resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(var.tags, { Name = var.name })
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.name}-public-${count.index + 1}" })
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(var.tags, { Name = "${var.name}-private-${count.index + 1}" })
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
```

```hcl
# environments/prod/main.tf — Using the module

module "vpc" {
  source  = "../../modules/vpc"   # Local module
  # OR
  source  = "terraform-aws-modules/vpc/aws"  # Registry module
  version = "~> 5.0"

  name = "prod-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = false  # One per AZ for HA

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
    Team        = "platform"
  }
}
```

## Workspaces — Environment Management

```bash
# Create workspaces for environments
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod

# List workspaces
terraform workspace list

# Switch workspace
terraform workspace select prod

# Use in configuration
variable "instance_type" {
  default = {
    dev     = "t3.micro"
    staging = "t3.medium"
    prod    = "m5.xlarge"
  }
}

resource "aws_instance" "web" {
  instance_type = var.instance_type[terraform.workspace]
}
```

## Remote State & State Locking

```hcl
# Backend configuration — S3 with DynamoDB locking
terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "prod/infrastructure/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:us-east-1:123456789:key/..."

    # State locking — prevents concurrent applies
    dynamodb_table = "terraform-state-locks"
  }
}

# Create the S3 bucket and DynamoDB table (bootstrap)
resource "aws_s3_bucket" "terraform_state" {
  bucket = "mycompany-terraform-state"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"   # Keeps history of all state versions!
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
```

## Dynamic Blocks & For Expressions

```hcl
# Dynamic block — avoid repetition
variable "ingress_rules" {
  default = [
    { port = 80,  protocol = "tcp", cidr = "0.0.0.0/0" },
    { port = 443, protocol = "tcp", cidr = "0.0.0.0/0" },
    { port = 22,  protocol = "tcp", cidr = "10.0.0.0/8" },
  ]
}

resource "aws_security_group" "web" {
  name   = "web-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# For expressions
variable "subnet_ids" {
  default = ["subnet-a", "subnet-b", "subnet-c"]
}

locals {
  # Create a map from subnet id to index
  subnet_map = { for idx, id in var.subnet_ids : id => idx }

  # Filter only prod resources
  prod_instances = { for k, v in var.instances : k => v if v.environment == "prod" }
}
```

## Terraform CI/CD Pipeline

```yaml
# .github/workflows/terraform.yml
name: Terraform

on:
  pull_request:
    paths: ['terraform/**']
  push:
    branches: [main]
    paths: ['terraform/**']

jobs:
  terraform:
    runs-on: ubuntu-latest
    permissions:
      id-token: write   # For OIDC auth to AWS
      contents: read
      pull-requests: write

    steps:
    - uses: actions/checkout@v4

    - name: Configure AWS credentials (OIDC — no stored keys!)
      uses: aws-actions/configure-aws-credentials@v4
      with:
        role-to-assume: arn:aws:iam::123456789:role/github-actions-terraform
        aws-region: us-east-1

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: 1.7.0

    - name: Terraform Format Check
      run: terraform fmt -check -recursive
      working-directory: terraform

    - name: Terraform Init
      run: terraform init
      working-directory: terraform/environments/prod

    - name: Terraform Validate
      run: terraform validate
      working-directory: terraform/environments/prod

    - name: Terraform Plan
      id: plan
      run: terraform plan -out=tfplan -no-color
      working-directory: terraform/environments/prod

    - name: Comment PR with plan
      uses: actions/github-script@v7
      if: github.event_name == 'pull_request'
      with:
        script: |
          const plan = `${{ steps.plan.outputs.stdout }}`
          github.rest.issues.createComment({
            issue_number: context.issue.number,
            owner: context.repo.owner,
            repo: context.repo.repo,
            body: `## Terraform Plan\n\`\`\`\n${plan}\n\`\`\``
          })

    - name: Terraform Apply
      if: github.ref == 'refs/heads/main'
      run: terraform apply -auto-approve tfplan
      working-directory: terraform/environments/prod
```

## Troubleshooting

```bash
# State lock issue (previous apply interrupted)
terraform force-unlock <lock-id>

# Drift — real infra doesn't match state
terraform plan    # Shows diff between state and real infra
terraform refresh # Update state to match real infra (use carefully)

# Import existing resource into state
terraform import aws_s3_bucket.main my-existing-bucket
terraform import aws_instance.web i-1234567890abcdef0

# Remove resource from state WITHOUT destroying it
terraform state rm aws_instance.web

# Debug logging
TF_LOG=DEBUG terraform apply 2>&1 | tee debug.log
TF_LOG=TRACE terraform plan  # Even more verbose

# Targeted apply (dangerous — use sparingly)
terraform apply -target=aws_instance.web
terraform apply -target=module.vpc

# Check what's in state
terraform state list
terraform state show aws_vpc.main
```

## Interview Questions

**What is Terraform state and why is it important?**
State is the mapping between your Terraform configuration and real infrastructure. It stores all resource IDs, attributes, and metadata. Without state, Terraform doesn't know what it previously created. Losing state means Terraform treats everything as new — it would try to create all resources again, causing duplicates or failures. Always store state remotely (S3, GCS, Terraform Cloud) with versioning enabled so you can recover from state corruption.

**How do you handle secrets in Terraform?**
Never store secrets in `.tf` files or state files in plaintext. Options: use `var` with `sensitive = true` and pass via environment variables (`TF_VAR_db_password`), fetch secrets from AWS Secrets Manager or HashiCorp Vault using data sources at apply time, use SOPS to encrypt `.tfvars` files, or use Terraform Cloud/Enterprise which encrypts sensitive variables.

**Explain the difference between `terraform plan` and `terraform apply`.**
`plan` is a dry run — it shows what changes WOULD be made (creates, updates, destroys) without making any changes. Always review the plan before applying. `apply` executes the plan and makes real changes. In CI/CD, always save the plan (`-out=tfplan`) and apply the exact saved plan to prevent race conditions between plan and apply.
