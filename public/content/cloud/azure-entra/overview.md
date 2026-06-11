# Azure Entra ID — Identity and Access Management

Azure Entra ID (formerly Azure Active Directory) is Microsoft's cloud identity platform. It handles authentication for Microsoft 365, Azure, and thousands of SaaS applications.

## Core Concepts

```
Tenant: An organisation's dedicated instance of Entra ID
User: Person with an identity in the directory
Group: Collection of users for easier permission management
Service Principal: Identity for an application (like a service account)
Managed Identity: Automatic identity for Azure resources (no credentials)
App Registration: Register applications to use Entra ID for auth
```

## Authentication Flows

```
Single Sign-On (SSO):
  User signs into Entra ID once
  Access all connected apps without re-authenticating
  Supports: SAML 2.0, OAuth 2.0, OpenID Connect, WS-Federation

Multi-Factor Authentication (MFA):
  Required for all privileged accounts (non-negotiable)
  Methods: Authenticator app, SMS, FIDO2 key, Windows Hello
  Conditional Access: Require MFA based on risk signals

Conditional Access Policies:
  "Require MFA when signing in from outside corporate network"
  "Block access from countries we don't operate in"
  "Require compliant device for accessing sensitive apps"
  "Allow only specific IP ranges for admin accounts"
```

## RBAC — Role-Based Access Control

```bash
# Assign built-in role to user
az role assignment create \
  --assignee user@company.com \
  --role "Contributor" \
  --scope /subscriptions/SUBSCRIPTION_ID/resourceGroups/my-rg

# Custom role — least privilege principle
az role definition create --role-definition '{
  "Name": "VM Restart Operator",
  "Description": "Can restart VMs only",
  "Actions": [
    "Microsoft.Compute/virtualMachines/restart/action",
    "Microsoft.Compute/virtualMachines/read"
  ],
  "AssignableScopes": ["/subscriptions/SUBSCRIPTION_ID"]
}'
```

## Managed Identity — The Right Way for Azure Resources

```hcl
# System-assigned managed identity on VM
resource "azurerm_linux_virtual_machine" "main" {
  identity {
    type = "SystemAssigned"  # Azure creates and manages the identity
  }
}

# Grant the VM permission to read from Key Vault
resource "azurerm_key_vault_access_policy" "vm" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_linux_virtual_machine.main.identity[0].principal_id

  secret_permissions = ["Get", "List"]
}
# VM can now read secrets from Key Vault without any stored credentials
```

## Privileged Identity Management (PIM)

Just-in-time privileged access — users don't have standing admin rights. They request elevation, approve (or auto-approve with MFA), use it, and the privilege expires.

```
Benefits:
  Reduces attack surface (no standing admin access)
  Audit trail of who elevated and when
  Approval workflow for sensitive roles
  Time-bound access (1 hour, 8 hours, etc.)
  
Configure for: Global Admin, Privileged Role Admin, all subscription Owner roles
```
