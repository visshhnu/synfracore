# Microsoft Azure — Fundamentals

## The resource hierarchy: Management Groups → Subscriptions → Resource Groups → Resources

Every Azure resource sits inside exactly this four-level hierarchy. **Management Groups** let large organizations apply policy/RBAC across many subscriptions at once. **Subscriptions** are the billing and quota boundary — most permission and cost decisions are made at this level. **Resource Groups** are logical containers you define — the standard convention is grouping resources by *lifecycle*: things created and deleted together (an app's VM, its database, its storage account) belong in the same Resource Group, since deleting a Resource Group deletes everything inside it. Everything else is an individual **Resource**.

```bash
az group create --name myapp-prod-rg --location eastus
az vm create --resource-group myapp-prod-rg --name myapp-vm ...
```

## ARM: the API underneath everything

The Azure Resource Manager (ARM) API is what every Azure interaction — the Portal, the CLI, Terraform, Bicep — ultimately calls. Understanding this explains a lot of Azure's behavior: any two tools that both go through ARM will always agree on the actual state of a resource, since there's exactly one source of truth underneath all of them, not one per tool.

## Entra ID: identity, and why Managed Identity beats service principal passwords

Entra ID (formerly Azure AD) is Azure's identity platform — every human and workload identity in Azure ultimately resolves through it. For workload authentication specifically (a VM or app needing to call another Azure service), **Managed Identity is the correct default over a service principal with a stored password/secret**: Azure manages the underlying credential automatically (creation, rotation), and there's no secret value that can leak from a config file or repository, because there's no secret value for your code to hold at all — the identity is tied directly to the resource's own lifecycle.

```bash
az vm identity assign --name myapp-vm --resource-group myapp-prod-rg
# grant that identity a role
az role assignment create --assignee <principal-id> --role "Storage Blob Data Reader" --scope <storage-account-id>
```

## RBAC: subscription-level vs. resource-level

Role assignments can be scoped at any level of the hierarchy — a role granted at the subscription level applies to every resource within it; a role granted at a specific resource applies only there. The general guidance: broad roles (Owner, Contributor) at narrow scope (a single resource group, not a whole subscription), and reserve subscription-level broad access for genuinely subscription-wide operational needs — over-scoping a role assignment is a common, real source of unintended access.

## Regions and availability zones

An Azure **region** is a geographic area with one or more physical data centers. **Availability Zones** within a region are physically separate, independently-powered facilities — deploying across multiple zones (not just multiple VMs in one zone) is what actually protects against a single data-center-level failure. Not every Azure region has availability zones; check before assuming zone-redundant deployment is available in your target region.

## Resource tags — the low-effort habit that pays off constantly later

```bash
az resource tag --tags Environment=production Team=payments CostCenter=eng-42 --ids <resource-id>
```
Tags aren't just labels — they're the practical mechanism for cost allocation reporting, automated policy enforcement (e.g., "every resource must have an Environment tag"), and filtering resources at scale in the Portal, CLI, or ARM queries. Establishing a tagging convention *before* resources sprawl across a subscription is far cheaper than retrofitting tags onto hundreds of untagged resources later.
