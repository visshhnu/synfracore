# Terraform Quick Reference

```bash
# Workflow
terraform init              # Initialize, download providers
terraform plan              # Preview changes
terraform apply             # Apply changes
terraform destroy           # Destroy all resources
terraform apply -auto-approve  # Skip confirmation (CI only)
terraform plan -out=plan.tfplan  # Save plan
terraform apply plan.tfplan  # Apply saved plan

# State management
terraform state list                    # List all resources in state
terraform state show aws_instance.web   # Show specific resource
terraform state mv                      # Move resource in state
terraform state rm                      # Remove from state (doesn't destroy)
terraform import azurerm_rg.main <id>   # Import existing resource

# Debugging
terraform plan -detailed-exitcode  # Exit 2 = changes exist
TF_LOG=DEBUG terraform plan        # Verbose debug output
terraform console                  # Interactive expression evaluation
terraform fmt                      # Format code
terraform validate                 # Validate syntax

# Workspaces
terraform workspace list
terraform workspace new staging
terraform workspace select production
terraform workspace show

# Modules
terraform get                      # Download module sources
```

## File Structure (Best Practice)

```
project/
├── main.tf          # Main resources
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── versions.tf      # Provider + terraform version constraints
├── backend.tf       # Remote state configuration
├── terraform.tfvars # Variable values (don't commit secrets!)
└── modules/
    └── aks/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```
