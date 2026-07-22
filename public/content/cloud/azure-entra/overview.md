# Azure Entra ID — Identity and Access Management

Azure Entra ID (formerly Azure Active Directory) is Microsoft's cloud identity platform. It handles authentication for Microsoft 365, Azure, and thousands of SaaS applications.

## Why this exists (the hook)

Every single thing that happens in Azure — a human opening the Portal, a script calling the CLI, a VM reading a secret from Key Vault — starts with the same unavoidable question: "who or what is making this request, and are they actually allowed to?" Entra ID is the service that answers that question, for every request, across every Azure subscription and Microsoft 365 tenant an organization has. Get Entra ID wrong (an over-permissioned service principal, a stale standing admin assignment, no MFA on an admin account) and it doesn't matter how well-architected the rest of your Azure estate is — that's the door everything else walks through.

## Analogy

Think of Entra ID as a company's badge office and security desk combined, not just a login page. The **Tenant** is the company itself. **Users** and **Groups** are employees and departments. A **Service Principal** or **Managed Identity** is a badge issued to a piece of automation rather than a person — a robot courier that still has to badge through the same doors. **Conditional Access** is the security guard who doesn't just check the badge is real, but also asks "why are you here at 2am from a country we don't operate in?" before deciding whether to wave you through, demand a second ID (MFA), or turn you away. **PIM** is the difference between a badge that opens the server room forever versus one that only works for the one hour you actually requested access, with a manager's sign-off logged.

## How it fits together (diagram)

```
   Human user / Application / Azure resource
                    │
                    ▼
      Entra ID  (authenticates: "who is this?")
       │  Users, Groups, Service Principals,
       │  Managed Identities, App Registrations
       ▼
   Conditional Access  ("under what conditions
   is this authentication even allowed to succeed?")
       │  location, device compliance, sign-in risk
       ▼
   Azure RBAC  (authorizes: "what can this
   authenticated identity actually do, and where?")
       │  Role Assignment = Principal + Role + Scope
       ▼
   Resource (VM, Key Vault secret, Resource Group, ...)
```

## Try it yourself (2 minutes)

If you have a free/trial Azure account, run `az ad signed-in-user show` in the CLI — this shows the Entra ID user object behind your current session: its Object ID, User Principal Name, and tenant. Then run `az role assignment list --assignee <your-email> --output table`. Notice these are two genuinely separate questions being answered: the first command tells you *who Entra ID thinks you are*; the second tells you *what Azure RBAC has decided you're allowed to do*. Authentication and authorization are two different services working together, not one combined check — which is exactly why a valid, authenticated user can still get a "Forbidden" error on a specific resource.

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
