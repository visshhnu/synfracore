# Terraform — Interview Questions

**What is the difference between terraform plan and terraform apply?**
`terraform plan` reads current state, queries the real infrastructure, compares with the desired configuration, and shows what changes WOULD be made — creates, updates, destroys — without making any changes. It's a dry run. `terraform apply` executes those changes, updating the state file afterward. Best practice: always run plan first, review changes, then apply. In CI/CD, save the plan to a file with `terraform plan -out=plan.tfplan` and apply exactly that plan.

**Explain Terraform state and why it matters.**
State is a JSON file that maps your Terraform resources to real infrastructure. Terraform uses it to know what exists, calculate diffs, and track resource IDs. Without state, Terraform can't determine what to change or delete. Problems arise when state is lost (Terraform thinks resources don't exist and tries to recreate), corrupted, or when two people apply simultaneously without locking (race condition). This is why remote state in S3 with DynamoDB locking is critical for teams.

**What happens if you manually change infrastructure created by Terraform?**
Terraform won't know about it until the next plan/apply. `terraform plan` will show the drift and plan to revert the change back to the configuration. `terraform refresh` updates state without changing infrastructure. `terraform import` brings existing resources under Terraform management. The correct approach is making ALL changes through Terraform — manual changes cause configuration drift and unpredictable behavior.

**How do you handle sensitive values in Terraform?**
Mark output values as `sensitive = true` to prevent them appearing in console output. Use `sensitive` variables. Never hardcode credentials — use environment variables (`TF_VAR_password`), AWS Secrets Manager data sources, or HashiCorp Vault provider. Use `.gitignore` to exclude `terraform.tfvars` files containing secrets. State files contain sensitive values in plaintext — encrypt your S3 state bucket with KMS.

**What are Terraform modules and when should you use them?**
Modules are reusable packages of Terraform configuration. They encapsulate related resources (e.g., a VPC module creates the VPC, subnets, route tables, IGW as one unit). Use modules when: you repeat the same infrastructure pattern (multiple VPCs), you want to enforce organizational standards, or sharing infrastructure code between teams. Child modules accept variables for customization; outputs expose values to the calling module. Public modules available on Terraform Registry (e.g., `terraform-aws-modules/vpc/aws`).

**Explain terraform import vs terraform state mv.**
`terraform import <resource_type.name> <real_resource_id>` brings an existing real resource into Terraform state without creating it. The resource must already be defined in configuration. Used when adopting existing infrastructure.
`terraform state mv <old_name> <new_name>` renames a resource in state without changing real infrastructure. Used when refactoring configuration (e.g., renaming a resource, moving it to a module).
