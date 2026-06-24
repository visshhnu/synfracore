# Azure Entra ID Cheatsheet

## Core CLI Commands
```bash
# Users
az ad user create --display-name "Alice Smith" \
  --user-principal-name alice@contoso.com --password "Passw0rd!" --force-change-password-next-sign-in
az ad user list --filter "displayName eq 'Alice'"
az ad user show --id alice@contoso.com
az ad user delete --id alice@contoso.com

# Groups
az ad group create --display-name "DevTeam" --mail-nickname "devteam"
az ad group member add --group DevTeam --member-id <user-object-id>
az ad group member list --group DevTeam

# Service Principal
az ad sp create-for-rbac --name myApp --role Contributor \
  --scopes /subscriptions/<sub-id>
az ad sp list --display-name myApp
az ad sp delete --id <app-id>

# App Registration
az ad app create --display-name "MyWebApp" \
  --sign-in-audience AzureADMyOrg
az ad app list --display-name "MyWebApp"
az ad app update --id <app-id> \
  --web-redirect-uris "https://myapp.com/callback"
```

## RBAC Quick Reference
```bash
# Assign role
az role assignment create \
  --assignee alice@contoso.com \
  --role "Contributor" \
  --scope /subscriptions/<sub-id>/resourceGroups/myRG

# List assignments
az role assignment list --assignee alice@contoso.com
az role assignment list --scope /subscriptions/<sub-id>

# Custom role
az role definition create --role-definition '{
  "Name": "VM Starter",
  "Actions": ["Microsoft.Compute/virtualMachines/start/action"],
  "AssignableScopes": ["/subscriptions/<sub-id>"]
}'
```

## Key Concepts Quick Reference
| Concept | Description |
|---------|-------------|
| Tenant | Azure AD organisation (e.g., contoso.onmicrosoft.com) |
| User Principal Name | user@domain.com format |
| Object ID | GUID uniquely identifying any object in Entra |
| App Registration | Identity definition for an app |
| Service Principal | Instance of app registration in a tenant |
| Managed Identity | Auto-managed credential for Azure resources |
| System-assigned MI | Tied to resource lifecycle |
| User-assigned MI | Independent, shareable across resources |

## Conditional Access Quick Rules
```
Block legacy auth:     all users, all apps, Exchange ActiveSync + other clients → Block
Require MFA admins:    directory roles (all admin roles) → Require MFA
Require MFA all:       all users, all apps, except trusted IPs → Require MFA
Compliant device:      sensitive apps → require compliant OR Entra hybrid joined device
Risky sign-in:         sign-in risk High → Block OR require MFA + password change
```
