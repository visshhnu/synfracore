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
