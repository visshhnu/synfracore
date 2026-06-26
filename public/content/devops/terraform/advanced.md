# Terraform — Enterprise IaC, Testing & Security

[Terraform — content pending]

## Terraform Security Scanning

```bash
# tfsec — static security analysis
tfsec . --format json | jq '.results[] | .description'

# Checkov — CIS benchmark checks
checkov -d . --framework terraform

# Terraform Sentinel — policy as code (Terraform Cloud/Enterprise)
# Enforce: no public S3 buckets, require tags, restrict instance types
```

## Terraform Cloud / Remote State

```hcl
# Remote state in Azure Blob
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate123"
    container_name       = "tfstate"
    key                  = "production.terraform.tfstate"
  }
}

# Remote state in AWS S3
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
```

## Drift Detection in CI/CD

```bash
# In Jenkins/Azure DevOps — detect drift
terraform plan -detailed-exitcode
# Exit code: 0 = no changes, 1 = error, 2 = changes (drift)

if [ $? -eq 2 ]; then
  echo "DRIFT DETECTED — sending alert"
  # Send to Slack/PagerDuty
fi
```

## Quick Reference — Terraform

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
