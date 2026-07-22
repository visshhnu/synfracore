# Azure VNets — Fundamentals

## The hook: the subnet you can't shrink back down

A very common early mistake: creating a VNet with a `/16` and one giant `/16` subnet, then later wanting to add a second subnet — only to find there's no address space left, because the first subnet already claimed the entire VNet. Subnets can be resized larger in some cases, but you can't retroactively carve a second subnet out of space the first one is already using without recreating it (and anything deployed into it). Planning subnet sizes before deployment, not after, is one of the cheapest habits to build in networking.

## Analogy

A VNet is like buying a plot of land before you've decided how many buildings go on it. The subnets are the individual building plots you mark out on that land. If you draw one building's plot across the entire property, there's no room left to add a second building later — you'd have to demolish and re-survey. Deciding the plot layout (subnet plan) before pouring any foundations (deploying resources) avoids that rework entirely.

## What is Azure Virtual Network?

Azure Virtual Network (VNet) is the fundamental building block for your private network in Azure. VNets enable Azure resources to securely communicate with each other, the internet, and on-premises networks.

## Core Concepts

**VNet**: An isolated virtual network in Azure. You define the address space (CIDR block like 10.0.0.0/16).

**Subnet**: Subdivisions within a VNet. Resources are deployed into subnets. Each subnet gets a portion of the VNet address space.

**Network Interface Card (NIC)**: Virtual NIC attached to VMs. A VM can have multiple NICs.

**Public IP**: An IP address accessible from the internet. Can be static or dynamic.

**Private IP**: IP within the VNet address space. Not reachable from internet.

## Create Your First VNet

```bash
# Create resource group
az group create --name myRG --location eastus

# Create VNet with a /16 address space (65,536 IPs) and one /24 subnet inside it
# (10.0.1.0/24 only uses 256 of those 65,536 addresses — plenty of room left for more subnets)
az network vnet create --resource-group myRG --name myVNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name web-subnet \
  --subnet-prefix 10.0.1.0/24

# Add a second subnet carved from the SAME VNet's unused address space
az network vnet subnet create \
  --resource-group myRG \
  --vnet-name myVNet \
  --name app-subnet \
  --address-prefix 10.0.2.0/24

# Verify — shows both subnets as children of the one VNet, each with its own address range
az network vnet show --resource-group myRG --name myVNet
```

## Azure Reserved IPs in Each Subnet

Azure reserves 5 IP addresses in every subnet:
- x.x.x.0: Network address
- x.x.x.1: Default gateway
- x.x.x.2 and x.x.x.3: Azure DNS
- x.x.x.255: Broadcast

So a /24 subnet has 256 - 5 = **251 usable IPs**.

## Network Security Groups (NSG)

NSGs are stateful firewalls applied to subnets or NICs:

```bash
# Create NSG
az network nsg create --resource-group myRG --name web-nsg

# Allow HTTPS inbound from internet
az network nsg rule create \
  --resource-group myRG --nsg-name web-nsg \
  --name allow-https --priority 100 \
  --protocol Tcp --direction Inbound --access Allow \
  --source-address-prefixes Internet --destination-port-ranges 443

# Deny all other inbound (default rules already do this)
# Attach NSG to subnet
az network vnet subnet update \
  --resource-group myRG --vnet-name myVNet \
  --name web-subnet --network-security-group web-nsg
```

## Try it yourself (2 minutes)

If you have an Azure sandbox available, create the VNet and two subnets from the example above, then run `az network vnet subnet create` a third time with `--address-prefix 10.0.1.0/25` (a range that overlaps `web-subnet`'s existing `10.0.1.0/24`). Azure will reject it with an address-space conflict error — that's the platform enforcing the same non-overlapping rule described in the hook above, and seeing the actual error message makes the "plan your subnets first" advice concrete instead of abstract.
