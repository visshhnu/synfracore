# Terraform Interview Q&A

**Q: What is Terraform state and why does it matter?**
State file (terraform.tfstate) maps your HCL code to real infrastructure. Without it, Terraform can't know what exists. In teams: ALWAYS use remote state (Azure Blob/S3) with state locking to prevent concurrent applies from corrupting state.

**Q: What happens during terraform plan?**
Terraform reads current state + cloud API → compares with your HCL → shows what will be created/modified/destroyed. Critical for reviewing before apply. `-detailed-exitcode` returns exit 2 if changes exist (useful in CI for drift detection).

**Q: How do you handle secrets in Terraform?**
Never hardcode secrets in HCL. Options:
1. Environment variables: `export TF_VAR_password=...`
2. Azure Key Vault data source: `data "azurerm_key_vault_secret" "db_pw" ...`
3. HashiCorp Vault provider: `data "vault_generic_secret" "db" ...`
4. Mark variables as sensitive: `variable "password" { sensitive = true }`

**Q: Terraform import vs refresh?**
- `terraform import` — bring existing cloud resource under Terraform management. Write config first, then import resource into state.
- `terraform refresh` — sync state file with real cloud state (deprecated in 0.15+; use `terraform apply -refresh-only`).

**Q: What is the difference between count and for_each?**
- `count`: creates N identical resources. Resources addressed as `resource.name[0]`, `resource.name[1]`. Problem: insert at beginning shifts indices.
- `for_each`: creates resources keyed by map/set. Resources addressed as `resource.name["key"]`. Better for named resources — inserting doesn't affect others.

**Q: How do modules work?**
Modules encapsulate reusable infrastructure. Call with `module "name" { source = "./modules/aks" ... }`. Use versioned sources from Terraform Registry for shared modules. Module inputs are variables, outputs are returned values.

**Q: state lock error — what happened and how to fix?**
Another apply is running or previous crashed mid-apply. Fix: `terraform force-unlock <lock-id>`. Get lock ID from error message. Check if any apply is actually running first — forced unlock while an apply is running corrupts state.

[Terraform — content pending]
