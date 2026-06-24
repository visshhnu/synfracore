# Terraform Overview (Infrastructure)

## Terraform in the Infrastructure Context

Terraform is the de facto standard for Infrastructure as Code (IaC) in DevOps and cloud engineering. It enables teams to define, provision, and version infrastructure the same way developers version application code — enabling repeatable, auditable, and consistent environments.

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

## Study Resources
- **Terraform: Up and Running** (Yevgeniy Brikman) — best book, covers real patterns
- **HashiCorp Learn** (developer.hashicorp.com/terraform/tutorials) — free official tutorials
- **Terraform Associate (003)** — entry-level certification; practical exam
- **Gruntwork IaC Library** — production-grade Terraform modules, patterns guide free online
- **awesome-terraform** (github.com/shuaibiyy/awesome-terraform) — curated resource list
