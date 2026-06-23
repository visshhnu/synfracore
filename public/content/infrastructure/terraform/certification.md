# Terraform Certification Guide

## Certifications Available

**HashiCorp Certified: Terraform Associate (003)** — the primary Terraform cert.

| Detail | Info |
|--------|------|
| Format | Multiple choice + true/false (no hands-on) |
| Questions | 57 questions |
| Time | 60 minutes |
| Passing Score | 70% |
| Cost | $70.50 USD |
| Validity | 2 years |

---

## Exam Objectives by Domain

| Domain | Weight |
|--------|--------|
| Understand IaC concepts | 9% |
| Understand Terraform's purpose | 9% |
| Understand Terraform basics (providers, configuration) | 19% |
| Use Terraform outside of core workflow | 12% |
| Interact with Terraform modules | 12% |
| Use the core Terraform workflow | 11% |
| Implement and maintain state | 15% |
| Read, generate, and modify configuration | 7% |
| Understand Terraform Cloud capabilities | 6% |

---

## Critical Concepts to Know

```hcl
# HCL syntax — must know for exam
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy to"
  validation {
    condition     = contains(["us-east-1", "us-west-2"], var.region)
    error_message = "Region must be us-east-1 or us-west-2."
  }
}

output "instance_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of web server"
  sensitive   = false
}

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Meta-arguments (VERY commonly tested)
resource "aws_instance" "web" {
  count         = 3                         # count: create multiple
  ami           = "ami-12345"
  instance_type = "t3.micro"
  tags          = merge(local.common_tags, { Name = "web-${count.index}" })

  depends_on = [aws_security_group.web_sg]  # explicit dependency

  lifecycle {
    create_before_destroy = true            # Zero-downtime replace
    prevent_destroy       = true            # Protect critical resources
    ignore_changes        = [tags]          # Ignore external changes
  }
}

# for_each (preferred over count for maps/sets)
resource "aws_s3_bucket" "buckets" {
  for_each = toset(["logs", "data", "backup"])
  bucket   = "${var.prefix}-${each.key}"
}
```

---

## State Management (15% — highest weight practical area)

```bash
# Remote state backends (critical topic)
terraform {
  backend "s3" {
    bucket         = "my-tfstate"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"      # State locking
    encrypt        = true
  }
}

# State commands (must know all)
terraform state list                        # List all resources in state
terraform state show aws_instance.web       # Show specific resource
terraform state mv aws_instance.old aws_instance.new  # Rename/move
terraform state rm aws_instance.web         # Remove from state (doesn't destroy)
terraform import aws_instance.web i-1234567890  # Import existing resource
terraform plan -refresh-only               # Refresh state without changes
terraform force-unlock LOCK_ID             # Release stuck lock

# Workspaces
terraform workspace new staging
terraform workspace select staging
terraform workspace list
terraform workspace delete staging
```

---

## Modules (12% of exam)

```hcl
# Calling a module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"    # Registry module
  version = "~> 5.0"                           # Version constraint

  name            = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Version constraints syntax
version = "= 5.0"      # Exact
version = ">= 5.0"     # Minimum
version = "~> 5.0"     # Pessimistic: 5.x (not 6.x)
version = "~> 5.0.0"   # Patch only: 5.0.x
```

---

## Exam Day Tips

```
COMMANDS to memorise (theoretical knowledge, no hands-on):
  init → plan → apply → destroy (core workflow)
  fmt, validate, show, output, graph, state
  workspace, import, taint (deprecated → use -replace)

TERRAFORM CLOUD:
  Remote execution, state storage, variable management
  Sentinel policies for governance
  Cost estimation
  Private module registry
  Teams and permissions model

COMMON EXAM TRAPS:
  terraform.tfvars loaded automatically (also *.auto.tfvars)
  -var-file flag for other filenames
  Count vs for_each: count = list index, for_each = map key
  Implicit vs explicit dependencies (depends_on rarely needed)
  Resource targeting: terraform apply -target=aws_instance.web
```

---

## Study Resources

- **HashiCorp Learn** (developer.hashicorp.com/terraform/tutorials) — official, free
- **Udemy: HashiCorp Certified Terraform Associate** (Zeal Vora or Andrew Brown)
- **FreeCodeCamp** — free full-length Terraform course (YouTube)
- **ExamTopics** — community practice questions

## Revision Notes
```
EXAM FORMAT: 57 MCQ, 60 min, 70% pass, $70.50, no hands-on

MOST TESTED:
  State: remote backends, locking, state commands, import
  HCL: variables, outputs, locals, meta-args (count/for_each/depends_on/lifecycle)
  Modules: source, version constraints (~> syntax)
  Workflow: init/plan/apply/destroy and what each does

LIFECYCLE:
  create_before_destroy | prevent_destroy | ignore_changes

WORKSPACES: separate state per workspace (dev/staging/prod)
NOT for: team separation (use separate backends/directories instead)
```
