# Terraform Overview (Infrastructure)

**Before you start:** basic cloud concepts (what a virtual machine or a network is, conceptually) and command-line comfort are assumed. No prior Infrastructure-as-Code experience is needed.

## Terraform in the Infrastructure Context

**Infrastructure as Code (IaC)** means describing servers, networks, and other infrastructure in a text file instead of creating them by hand through a cloud provider's web console — the file becomes the record of what should exist, and re-running it reproduces (or corrects) that exact setup. Terraform is the de facto standard tool for this in DevOps and cloud engineering. It enables teams to define, provision (actually create the described infrastructure), and version infrastructure the same way developers version application code — enabling repeatable, auditable, and consistent environments, instead of undocumented manual changes that are hard to reproduce or review.

**Analogy** — Think of Terraform like an architect's blueprint versus a contractor building by memory. Building by memory (clicking through a cloud console) means no two builds are ever quite identical, and nobody can point to a single document and say "this is exactly what should exist." A blueprint (a `.tf` file) is different: it's a precise, written description that anyone can read, review, hand to a different contractor, or re-run to rebuild the exact same structure if it's ever torn down. `terraform plan` is like a contractor saying "here's exactly what I'm about to change before I touch anything" — you approve the plan before any real work happens, rather than discovering the changes after the fact.

```
.tf files (the blueprint)  --terraform plan-->  a preview of exact changes
                            --terraform apply--> the real infrastructure,
                                                   matching the blueprint
```

## Why Terraform Over Alternatives

```
vs CloudFormation (AWS only):
  Terraform: multi-cloud, 1000+ providers, cleaner HCL syntax
  CloudFormation: AWS-native, no state file management needed, native AWS integration
  
vs Ansible:
  Terraform: declarative (define end state), better for provisioning
  Ansible: imperative (define steps), better for configuration management
  Best practice: Terraform to provision, Ansible to configure
  
vs Pulumi:
  Terraform: HCL domain-specific language, larger community
  Pulumi: use general-purpose languages (Python, TypeScript, Go)
  Choose Pulumi if: team prefers code, complex logic needed in IaC

vs CDK (Cloud Development Kit):
  CDK (AWS): generates CloudFormation; TypeScript/Python/Java/Go
  CDK for Terraform (CDKTF): generates Terraform; use general-purpose languages
```

## Core Workflow

```bash
# Project structure (recommended)
my-infrastructure/
├── main.tf           # main resources
├── variables.tf      # input variables
├── outputs.tf        # output values
├── providers.tf      # provider configuration
├── terraform.tfvars  # variable values (not in Git if has secrets)
├── versions.tf       # required versions
└── modules/          # reusable modules
    └── vpc/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

# Workflow
terraform init        # download providers, configure backend
terraform plan        # show what will change
terraform apply       # make the changes
terraform destroy     # destroy all resources

# State operations
terraform state list                    # list all managed resources
terraform state show aws_s3_bucket.main # inspect a resource
terraform state mv old_name new_name    # rename resource in state
terraform import aws_s3_bucket.main mybucket  # import existing resource
terraform state rm aws_instance.old     # remove from state (NOT from cloud)
```

## Remote State and Collaboration

```hcl
# terraform/providers.tf
terraform {
  required_version = ">= 1.6.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # Remote state — REQUIRED for teams
  backend "s3" {
    bucket         = "my-company-terraform-state"
    key            = "prod/us-east-1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"  # prevents concurrent applies
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  
  default_tags {  # apply to all resources
    tags = {
      ManagedBy   = "Terraform"
      Environment = var.environment
      Repository  = "github.com/company/infrastructure"
    }
  }
}
```

## Security Best Practices

```
SECRETS IN TERRAFORM:
  Never: hardcode secrets in .tf files
  Use: environment variables (TF_VAR_db_password)
  Use: AWS Secrets Manager / Azure Key Vault data sources
  Use: HashiCorp Vault provider
  Use: .tfvars files marked in .gitignore

STATE FILE SECURITY:
  Contains sensitive values (passwords, keys may be in outputs)
  Encrypt backend: enable S3 encryption, use KMS key
  Control access: only CI/CD pipeline and senior engineers
  Audit: CloudTrail logs all S3 state file access

IAM FOR TERRAFORM:
  CI/CD: use OIDC federation (GitHub Actions → AWS, no static keys)
  Local: use IAM roles with SSO / short-lived credentials
  Never: use root account for Terraform
```

## Try It (2 Minutes)

No cloud account needed — Terraform can manage a fake "local" resource just to show you the plan/apply cycle itself:

1. Create a file `main.tf`:
   ```hcl
   terraform {
     required_providers {
       local = { source = "hashicorp/local" }
     }
   }
   resource "local_file" "demo" {
     filename = "hello.txt"
     content  = "hello from terraform"
   }
   ```
2. Run `terraform init` (downloads the `local` provider), then `terraform plan` — notice it tells you exactly what it's *about* to do (`+ create` a file) without doing it yet.
3. Run `terraform apply` (type `yes` to confirm) — now `hello.txt` exists. Run `terraform plan` again — it reports "no changes," because the real world already matches the blueprint. Delete `hello.txt` manually with `rm hello.txt`, then run `terraform plan` once more — it detects the drift and offers to recreate the file, exactly like the architect's blueprint being used to rebuild something that was torn down.

## Study Resources
- **Terraform: Up and Running** (Yevgeniy Brikman) — best book, covers real patterns
- **HashiCorp Learn** (developer.hashicorp.com/terraform/tutorials) — free official tutorials
- **Terraform Associate (004)** — entry-level certification; practical exam
- **Gruntwork IaC Library** — production-grade Terraform modules, patterns guide free online
- **awesome-terraform** (github.com/shuaibiyy/awesome-terraform) — curated resource list
