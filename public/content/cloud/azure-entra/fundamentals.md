# Azure Entra ID (formerly Azure AD) — Identity Platform

## The hook: the credential that isn't there

The most common real mistake Azure beginners make is putting a Key Vault connection string, a storage account key, or a database password directly into application config or a `.env` file "just to get it working," meaning to move it somewhere safer later. Managed Identity exists specifically to remove the need for that first step entirely — an Azure resource can be granted access to another Azure service without your code ever holding a credential to leak in the first place. This section is about that pattern, and the RBAC model that controls what a granted identity can actually reach.

## Analogy

A stored service-principal password is like a spare house key hidden under the doormat — convenient, but anyone who finds the doormat has it too, and it doesn't expire or know who used it. A Managed Identity is like a smart lock tied to a specific person's phone: it's issued automatically, it only works for that one person, it can be revoked the instant the resource is deleted, and there's no physical key ever sitting somewhere it could be copied or found.

## What is Azure Entra ID

Azure Entra ID is Microsoft's cloud identity platform — the equivalent of AWS IAM + AWS Organizations + AWS SSO, combined. It manages users, groups, app registrations, and conditional access for all Microsoft and Azure services.

## Core Concepts

```
Tenant:         Your organization's dedicated instance of Entra ID
User:           Person with credentials (work account or guest)
Group:          Collection of users for access management
Service Principal: App identity (like AWS IAM Role for applications)
Managed Identity: Azure service identity (like IAM Instance Profile for VMs)
App Registration: Register your application to use Microsoft identity
```

## Managed Identity (Keyless Authentication)

```bash
# Give Azure VM access to Key Vault without secrets or keys

# 1. Enable system-assigned managed identity on VM
az vm identity assign \
    --resource-group prod-rg \
    --name my-vm

# 2. Get the identity's object ID
PRINCIPAL_ID=$(az vm identity show \
    --resource-group prod-rg \
    --name my-vm \
    --query principalId --output tsv)

# 3. Grant Key Vault access to the VM identity
# (this uses Key Vault's legacy vault-access-policy model; Azure's
# newer recommended approach is an Azure RBAC role assignment instead
# -- e.g. "Key Vault Secrets User" -- scoped to the vault
# *(needs verification -- confirm current Microsoft-recommended default)*
az keyvault set-policy \
    --name prod-vault \
    --object-id $PRINCIPAL_ID \
    --secret-permissions get list

# 4. In application code — Azure SDK auto-uses managed identity
from azure.identity import ManagedIdentityCredential
from azure.keyvault.secrets import SecretClient

credential = ManagedIdentityCredential()
client = SecretClient(vault_url="https://prod-vault.vault.azure.net/", credential=credential)
secret = client.get_secret("db-password").value
```

## RBAC in Azure

```bash
# Azure RBAC — built-in and custom roles
# Built-in roles: Owner, Contributor, Reader + service-specific

# Assign role
az role assignment create \
    --assignee user@company.com \
    --role "Contributor" \
    --scope "/subscriptions/SUB-ID/resourceGroups/prod-rg"

# Scope levels: subscription, resource group, resource
# Lower scope = less access

# Create custom role
az role definition create --role-definition '{
    "Name": "VM Operator",
    "Description": "Can start and stop VMs",
    "Actions": [
        "Microsoft.Compute/virtualMachines/start/action",
        "Microsoft.Compute/virtualMachines/restart/action",
        "Microsoft.Compute/virtualMachines/deallocate/action",
        "Microsoft.Compute/virtualMachines/read"
    ],
    "AssignableScopes": ["/subscriptions/SUB-ID"]
}'
```

## How it fits together (diagram)

```
 VM "my-vm"  ── system-assigned Managed Identity enabled ──►  Identity
      │                                                    (Object ID)
      │  az keyvault set-policy --object-id <that ID> --secret-permissions get
      ▼
 Key Vault "prod-vault"
      │
      └── VM's app code calls ManagedIdentityCredential()
            → gets a short-lived token for THIS identity only
            → reads the secret, no password/key ever stored in code
```

## Try it yourself (2 minutes)

If you have access to an Azure sandbox: create a VM (or use an existing one), run `az vm identity assign --resource-group <rg> --name <vm-name>`, then immediately run `az vm identity show --resource-group <rg> --name <vm-name> --query principalId`. You now have an Object ID that exists purely because you flipped a switch on the VM — no password was set, no secret was generated for you to copy anywhere. That absence is the entire point: compare this to any tutorial you've seen that has you paste an API key into a config file, and notice this workflow has no equivalent step.
