# Terraform Interview Questions

## Core Concepts

**Q: What is Terraform and how does it work?**
Terraform is an Infrastructure as Code (IaC) tool by HashiCorp that lets you define, provision, and manage infrastructure across cloud providers using a declarative language (HCL — HashiCorp Configuration Language).

**How it works — 3-step workflow:**
1. `terraform init` — initialises working directory, downloads providers and modules
2. `terraform plan` — compares desired state (config files) with current state (state file) → shows what will be created/changed/destroyed
3. `terraform apply` — executes the plan, updates real infrastructure, updates state file

**Core files:**
- `*.tf` — configuration files (resources, variables, outputs, providers)
- `terraform.tfstate` — state file (maps config to real resources)
- `.terraform.lock.hcl` — provider version lock file

---

**Q: What is Terraform state? Why is it important? How do you manage it in a team?**

State file (`terraform.tfstate`) maps Terraform resources to real infrastructure. Without it, Terraform can't know what already exists.

**Problems with local state in teams:**
- Race conditions (two people apply simultaneously)
- State file not shared (each person has different view)
- No state locking

**Remote state (best practice):**
```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"  # For state locking
    encrypt        = true
  }
}
```
S3 stores state, DynamoDB provides locking (prevents simultaneous applies).
Alternatives: Terraform Cloud, GCS (GCP), Azure Blob Storage.

---

**Q: Explain Terraform modules.**

Modules are reusable, encapsulated sets of Terraform configurations. Every Terraform configuration is a module — the working directory is the "root module."

```hcl
# Calling a module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
```

Benefits: DRY code, tested configurations, team-wide standards, versioning.

---

**Q: What are Terraform workspaces?**

Workspaces allow multiple state files in a single configuration. Good for managing multiple environments (dev, staging, prod) with same code.

```bash
terraform workspace new dev
terraform workspace select prod
terraform workspace list
```

```hcl
# Use workspace in config
resource "aws_instance" "app" {
  instance_type = terraform.workspace == "prod" ? "t3.large" : "t3.micro"
}
```

**Limitation**: All workspaces share same backend bucket — one compromise affects all. Many prefer separate directories or separate backends for strict environment isolation.

---

**Q: Difference between `terraform taint`, `terraform import`, `terraform refresh`?**

`terraform taint <resource>` (deprecated, use `-replace`): Marks resource for destruction and recreation on next apply. Used when resource is in bad state.
```bash
terraform apply -replace="aws_instance.app"
```

`terraform import <resource_address> <real_resource_id>`: Brings existing infrastructure under Terraform management WITHOUT recreating it. Adds to state file only — does NOT generate config.
```bash
terraform import aws_instance.web i-1234567890abcdef0
```

`terraform refresh` (deprecated): Updates state file to match real infrastructure. Now incorporated into `plan/apply` with `-refresh-only` flag.

---

**Q: Explain count, for_each, and dynamic blocks.**

**count**: Creates N copies of a resource (indexed 0,1,2...).
```hcl
resource "aws_instance" "server" {
  count         = 3
  instance_type = "t3.micro"
  tags = { Name = "server-${count.index}" }
}
```

**for_each**: Creates one resource per map key or set element (named, not indexed).
```hcl
resource "aws_iam_user" "user" {
  for_each = toset(["alice", "bob", "charlie"])
  name     = each.key
}
```
Prefer `for_each` over `count` — removing middle item from count list shifts indices and destroys/recreates resources.

**dynamic blocks**: Generate repeated nested blocks.
```hcl
resource "aws_security_group" "example" {
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

---

**Q: What are data sources in Terraform?**

Data sources let Terraform read existing infrastructure (not managed by this Terraform config) to use in your configuration.

```hcl
# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "app" {
  ami = data.aws_ami.amazon_linux.id  # Use data source
}
```

Common data sources: aws_ami, aws_vpc, aws_subnet, aws_route53_zone, aws_caller_identity.

---

**Q: What is `terraform plan -out` and why should you use it?**

```bash
terraform plan -out=tfplan   # Save plan to file
terraform apply tfplan        # Apply exactly that saved plan (no new plan generated)
```

Why: In CI/CD pipelines, you want the exact plan that was reviewed to be what gets applied — not a new plan that might differ if infrastructure changed between plan and apply.

---

**Q: How do you handle sensitive values in Terraform?**

```hcl
variable "db_password" {
  type      = string
  sensitive = true  # Won't appear in logs or plan output
}

output "db_connection" {
  value     = aws_db_instance.main.endpoint
  sensitive = true
}
```

Best practices:
- Use `sensitive = true` on variables/outputs
- Don't hardcode secrets in `.tf` files
- Use AWS Secrets Manager / HashiCorp Vault data sources to retrieve secrets at apply time
- Store state file encrypted (S3 with SSE)
- Use `.gitignore` to exclude `terraform.tfvars` with sensitive values

---

**Q: Explain Terraform lifecycle meta-arguments.**

```hcl
resource "aws_instance" "app" {
  # ...
  lifecycle {
    create_before_destroy = true   # Create new before destroying old (zero-downtime replace)
    prevent_destroy       = true   # Terraform errors if you try to destroy this resource
    ignore_changes        = [tags] # Ignore external changes to these attributes
    replace_triggered_by  = [aws_security_group.app.id]  # Force replace when SG changes
  }
}
```

`prevent_destroy = true` is excellent for protecting production databases.

---

**Q: How do you structure a large Terraform codebase?**

Flat structure (small projects):
```
main.tf, variables.tf, outputs.tf, terraform.tfvars
```

Directory-per-environment:
```
environments/
  dev/
    main.tf, terraform.tfvars
  prod/
    main.tf, terraform.tfvars
modules/
  vpc/, eks/, rds/
```

Terragrunt for DRY: Reduces repetition when same module used across environments with different variables.

---

**Q: What's the difference between `depends_on` and implicit dependencies?**

**Implicit** (preferred): Terraform automatically detects dependencies when you reference resource attributes.
```hcl
resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id  # Implicit: subnet depends on VPC
}
```

**Explicit** (`depends_on`): When there's a hidden dependency not expressed in attributes.
```hcl
resource "aws_iam_role_policy" "app" {
  # ...
  depends_on = [aws_iam_role.app]  # If role isn't referenced in attributes
}
```

Only use `depends_on` when implicit dependencies can't capture the relationship.

## Revision Notes
```
WORKFLOW: init → plan → apply → destroy
STATE: maps config to real resources. Remote state in S3+DynamoDB.

MODULES: reusable configs. source + version + inputs.
WORKSPACES: multiple states, same config. Good for dev/prod. Prefer separate dirs for strict isolation.

count: N copies (indexed) | for_each: named copies (map/set)
dynamic: generate nested blocks programmatically
data sources: read existing infra (not managed by this config)

LIFECYCLE:
create_before_destroy: zero-downtime replace
prevent_destroy: protect prod resources
ignore_changes: skip drift on specified attributes

SENSITIVE: sensitive=true on vars/outputs → hidden from logs
State encryption: S3 SSE + state file contains all resource attributes

DEBUG:
terraform plan -refresh-only: see drift
terraform state list / show: inspect state
terraform console: test expressions interactively
```
