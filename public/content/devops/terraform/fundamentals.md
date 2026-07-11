# Terraform — Fundamentals

## Providers, resources, and the declarative model, precisely

A **provider** is a plugin that knows how to talk to a specific API (AWS, Azure, GCP, Kubernetes, even non-cloud APIs like GitHub or Datadog). A **resource** is a specific infrastructure object you want Terraform to manage — one resource block, one real thing created. Terraform is declarative: you write what you want the end state to look like, and Terraform computes the sequence of API calls needed to get there — you never write "create this, then that."

```hcl
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" { region = "us-east-1" }

resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
  tags          = { Name = "web-server" }
}
```

## The core workflow: init, plan, apply

```bash
terraform init      # downloads providers, sets up the backend
terraform plan      # shows what WOULD change, without changing anything
terraform apply     # actually makes the change, after confirmation
terraform destroy   # tears down everything Terraform manages in this config
```

`terraform plan` is not optional ceremony — it's the single most important safety habit in Terraform. Always read the plan output before applying: a plan showing more resources destroyed/replaced than you expected is the earliest, cheapest point to catch a mistake, before it's actually happened to real infrastructure.

## State: the file that makes Terraform work

Terraform's state file tracks the mapping between your configuration and the real infrastructure it created — without it, Terraform has no way to know what already exists or what changed. This is why state is treated as critical, sensitive data, not a disposable artifact:

- **Never commit state to Git** — it often contains sensitive values (database passwords, private keys) in plain text.
- **Use a remote backend for any team work** — S3 with DynamoDB locking, Azure Blob, Terraform Cloud. A local state file means only one person can safely run Terraform at a time, and losing that file means losing Terraform's entire memory of what it manages.
- **State locking prevents concurrent modification** — two people running `apply` at the same time against the same state, without locking, can corrupt it or produce conflicting infrastructure changes.

## Variables, locals, and outputs

```hcl
variable "environment" {
  type    = string
  default = "staging"
  validation {
    condition     = contains(["staging", "production"], var.environment)
    error_message = "environment must be staging or production."
  }
}

locals {
  name_prefix = "myapp-${var.environment}"
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
```

`variable` blocks make configuration reusable across environments (via `.tfvars` files, one per environment) rather than duplicating near-identical `.tf` files. `locals` compute derived values used repeatedly within a config, avoiding repetition. `output` exposes values other configs (or humans running `terraform output`) can consume — the standard way to pass a value from one Terraform-managed layer to another.

## Never hardcode secrets in `.tf` files

A hardcoded password or API key in a `.tf` file ends up in state (in plain text) and in version control history, permanently, even if you remove it in a later commit. The correct pattern: environment variables (`TF_VAR_db_password`), a secrets manager integration, or a dedicated secrets tool (Vault) — never a literal string in a resource block for anything sensitive.
