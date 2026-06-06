# Terraform Interview Questions & Answers

## Beginner Questions

**What is Terraform and what problem does it solve?**
Terraform is an Infrastructure as Code (IaC) tool that lets you define cloud infrastructure in human-readable configuration files and manage it through a consistent lifecycle (create, update, destroy). It solves the problem of manual, undocumented, inconsistent infrastructure — before IaC, teams would click around in cloud consoles with no audit trail, inconsistent environments, and no easy way to recreate infrastructure.

---

**What is the difference between Terraform and Ansible?**
Terraform is **declarative** and designed for **provisioning infrastructure** — creating VPCs, EC2 instances, databases, DNS records. You describe the desired end state and Terraform figures out how to reach it. Ansible is **procedural** and designed for **configuration management** — installing software, configuring files, managing services on existing servers. They complement each other: Terraform creates the server, Ansible configures it.

---

**What is Terraform state?**
State is a JSON file (`terraform.tfstate`) that maps your Terraform configuration to real infrastructure resources. It stores the IDs and attributes of every resource Terraform manages. Without state, Terraform doesn't know what it previously created and would try to create everything again. State must be stored remotely (S3 + DynamoDB) in teams to prevent conflicts and enable collaboration.

---

**Explain `terraform plan` and `terraform apply`.**
`terraform plan` compares your configuration to the current state and shows exactly what changes WILL be made — creates, modifies, or destroys. It makes no actual changes. `terraform apply` executes the plan and makes real infrastructure changes. Always review the plan before applying. In CI/CD, save the plan with `-out=tfplan` and apply the exact saved plan.

---

## Intermediate Questions

**What are Terraform modules and why use them?**
Modules are reusable packages of Terraform configuration. Instead of copying VPC code into every environment, you write a VPC module once and call it with different variables:

```hcl
module "prod_vpc" {
  source = "./modules/vpc"
  name   = "production"
  cidr   = "10.0.0.0/16"
}

module "staging_vpc" {
  source = "./modules/vpc"
  name   = "staging"
  cidr   = "10.1.0.0/16"
}
```

Benefits: DRY (Don't Repeat Yourself), tested and versioned, shared across teams, encapsulates complexity.

---

**How do you handle secrets in Terraform?**
Never put secrets in `.tf` files — they end up in Git and state files. Options:
1. Environment variables: `TF_VAR_db_password=$SECRET` — Terraform reads automatically
2. `sensitive = true` on variable — masks in plan output but still in state
3. Fetch from Vault/Secrets Manager at apply time using data sources
4. Use SOPS to encrypt `.tfvars` files stored in Git
5. Terraform Cloud/Enterprise — encrypts all sensitive variables

The state file stores all values including secrets. Always encrypt state (S3 with SSE-KMS).

---

**What is `terraform import` and when would you use it?**
`terraform import` brings existing infrastructure that wasn't created by Terraform into Terraform's state. Use it when: adopting Terraform for existing infrastructure, recovering from deleted state, or importing resources created outside Terraform.

```bash
terraform import aws_s3_bucket.my_bucket existing-bucket-name
terraform import aws_instance.web i-1234567890abcdef0
```

After importing, you must write the matching configuration manually — `import` only updates state, not config.

---

**Explain Terraform's dependency graph.**
Terraform builds a dependency graph from resource references. `aws_subnet.public` that references `aws_vpc.main.id` automatically depends on the VPC — Terraform creates the VPC first. Independent resources are created in parallel. Use `depends_on` only when implicit dependencies don't work (rare).

```hcl
resource "aws_instance" "web" {
  depends_on = [aws_internet_gateway.main]  # Explicit dependency
}
```

---

**What is the `lifecycle` block?**

```hcl
resource "aws_instance" "web" {
  lifecycle {
    create_before_destroy = true   # Create replacement before destroying old
    prevent_destroy       = true   # Block terraform destroy (production DBs)
    ignore_changes        = [ami]  # Don't update if AMI changes (auto-scaling uses new AMIs)
  }
}
```

Most important: `prevent_destroy = true` on production databases prevents accidental deletion.

---

## Advanced Questions

**How do you structure Terraform for multiple environments?**

```
# Approach 1: Workspaces (simple, same config)
terraform workspace new prod
terraform workspace select prod
terraform apply  # Uses workspace-specific state

# Approach 2: Directory per environment (recommended for complex cases)
environments/
├── dev/
│   ├── main.tf         # Calls modules with dev values
│   ├── variables.tf
│   └── terraform.tfvars
├── staging/
│   ├── main.tf
│   └── terraform.tfvars
└── prod/
    ├── main.tf
    └── terraform.tfvars
modules/
├── vpc/
├── eks/
└── rds/
```

Directory per environment is better for prod because: separate state files mean a `terraform apply` in dev cannot affect prod, different IAM roles per environment, clearer blast radius.

---

**How do you handle Terraform state locking and what happens if a lock gets stuck?**
DynamoDB provides state locking — when someone runs `terraform apply`, it creates a lock record in DynamoDB. Other applies fail with a lock error until the lock is released. If an apply crashes mid-run, the lock stays. Fix:

```bash
# Check who holds the lock
aws dynamodb get-item \
  --table-name terraform-state-locks \
  --key '{"LockID": {"S": "my-bucket/prod/terraform.tfstate"}}'

# Force unlock (verify the apply actually failed first!)
terraform force-unlock <LOCK_ID>
```

Never force-unlock if you're unsure whether an apply is still running — it could cause state corruption.

---

**What is Terragrunt and when would you use it?**
Terragrunt is a wrapper around Terraform that adds: DRY backend configuration (define S3 bucket/DynamoDB once, not in every module), automatic remote state generation, dependency management between modules, and `run-all` commands to apply multiple modules at once. Use it when you have many modules with duplicated backend config or need orchestrated multi-module deployments. Not needed for simple setups.

---

**Architect Question: A `terraform apply` deleted a production database. What do you do and how do you prevent it in the future?**

**Immediate response:**
1. Don't panic — check if backups exist (RDS automated backups, manual snapshots)
2. Restore from the most recent snapshot
3. Assess data loss window
4. Communicate with stakeholders

**Investigation:**
1. Check state file history (S3 versioning) — what was the state before?
2. Check Git history — who changed what in the Terraform config?
3. Review CI/CD logs — what triggered the apply?

**Prevention:**
```hcl
# 1. Add prevent_destroy to all databases
resource "aws_db_instance" "production" {
  lifecycle {
    prevent_destroy = true
  }
}

# 2. Require plan approval in CI/CD before apply
# 3. Separate state for databases from application infrastructure
# 4. Use AWS Backup with retention policies
# 5. Enable deletion protection at AWS level
resource "aws_db_instance" "production" {
  deletion_protection = true
}

# 6. Restrict who can run terraform destroy in production
# IAM policy denying rds:DeleteDBInstance for CI role
```
