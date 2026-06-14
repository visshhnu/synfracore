# Azure Entra ID — Cheatsheet

```bash
# ── USERS ─────────────────────────────────────────────────
az ad user list --output table
az ad user show --id user@company.com
az ad user create --display-name "Alice Smith" --user-principal-name alice@company.com \
  --password "Temp@123!" --force-change-password-next-sign-in true
az ad user delete --id alice@company.com

# ── GROUPS ────────────────────────────────────────────────
az ad group list --display-name "Devs" --output table
az ad group create --display-name "Engineering" --mail-nickname "engineering"
az ad group member add --group engineering --member-id $USER_OBJECT_ID
az ad group member list --group engineering --output table

# ── APP REGISTRATIONS ─────────────────────────────────────
az ad app list --display-name "myapp" --output table
az ad app create --display-name "my-api" --sign-in-audience AzureADMyOrg
az ad app credential reset --id $APP_ID          # Create/reset client secret
az ad sp create --id $APP_ID                     # Create service principal

# ── RBAC ASSIGNMENTS ──────────────────────────────────────
az role assignment list --assignee user@company.com --all --output table
az role assignment create \
  --assignee user@company.com \
  --role "Contributor" \
  --scope "/subscriptions/$SUB_ID/resourceGroups/prod-rg"
az role assignment delete \
  --assignee user@company.com --role "Contributor" \
  --scope "/subscriptions/$SUB_ID"

# ── CUSTOM ROLES ──────────────────────────────────────────
az role definition create --role-definition '{
  "Name": "VM Operator",
  "Description": "Start/stop/restart VMs only",
  "Actions": ["Microsoft.Compute/virtualMachines/start/action","Microsoft.Compute/virtualMachines/restart/action","Microsoft.Compute/virtualMachines/deallocate/action","Microsoft.Compute/virtualMachines/read"],
  "AssignableScopes": ["/subscriptions/$SUB_ID"]
}'

# ── MANAGED IDENTITY ──────────────────────────────────────
az vm identity assign --resource-group rg --name vm-name   # System-assigned
az identity create --name my-identity --resource-group rg  # User-assigned
az vm identity assign --resource-group rg --name vm-name --identities $IDENTITY_ID

# Built-in roles:
# Owner: full access + manage access
# Contributor: full access, no access management
# Reader: view only
# User Access Administrator: manage access only
```
