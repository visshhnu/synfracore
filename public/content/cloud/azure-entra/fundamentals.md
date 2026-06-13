# Azure Entra ID (formerly Azure AD) — Identity Platform

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
