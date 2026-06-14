# Azure VNets — Fundamentals

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

# Create VNet with two subnets
az network vnet create --resource-group myRG --name myVNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name web-subnet \
  --subnet-prefix 10.0.1.0/24

# Add a second subnet
az network vnet subnet create \
  --resource-group myRG \
  --vnet-name myVNet \
  --name app-subnet \
  --address-prefix 10.0.2.0/24

# Verify
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
